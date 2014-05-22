
var marked      = require('marked'),
    mustache    = require('mustache'),
    path        = require('path'),
    fs          = require('graceful-fs'),
    hljs        = require('highlight.js'),
    wrench      = require('wrench'),
    util        = require('util'),
    colorize    = require('pygments').colorize,
    jsonic      = require('jsonic'),
    helper      = require('./generate_helper'),
    api         = require('./generate_api');
    git         = require('./generate_git');



    var _marked_options = {
        gfm: true,
        highlight: function (code, _lang, callback) {
            colorize(code, 'hx', 'html', function(data) {
                callback(null, data);
            });
        },
        tables: true,
        breaks: false,
        pedantic: false,
        sanitize: false,
        smartLists: true,
        smartypants: true
    };


    var _filter_unmodified = function(config, _list) {
        return _list;
    } //_filter_unmodified

    var _md_files = {};
    var _read_md_files = function(config, _the_list) {

        var _count = _the_list.length;
        for(var i = 0; i < _count; ++i) {
            var _path = _the_list[i];
                //log
            helper.verbose("\t - read md file " + _path);
                //swap out the input path
            var _file_path = _path.replace( config.md_path, '' );
                //fetch file data
            _md_files[_file_path] = helper.read_file( _path );
        }

    } //_read_md_files

    var _html_files = {};
    var _generate_html = function( config, _path, _done ) {

        var _file_content = _md_files[ _path ];        
        
        marked( _file_content, _marked_options, function(err, _parsed_markdown) {

            helper.verbose('\t - md > html ' + _path);
                //store in the cache
            _html_files[_path] = _parsed_markdown;
                //
            _done();

        }); //marked

    } //_generate_html

    var _final_html = {};
    var _style_template;
    var _template_html = function( config, _path ) {

        var _html_content = _html_files[ _path ];

        if(!_style_template) {
            _style_template = helper.read_file( config.template_path + config.template_index );
        }

        helper.verbose('\t - html > mustache+html ' + _path );

        var relative = helper.get_rel_path_count(_path);

            //render the content first with the relative path information
        var _template_content = mustache.render(_html_content, { rel_path:relative });
            //then render it into the style template as well, with relative and content
        var _html = mustache.render( _style_template , { rel_path:relative, doc_content: _template_content } );
            //store for writing out
        _final_html[_path] = _html;

    } //template_html

    var _write_doc_out = function( config, _path ) {

        var _path_key = _path;

            //remove the md extension
        _path = _path.replace( '.md', '.html' );

            //append the destination
        _path = path.join(config.output_path, _path);

            //work out where the folders lie        
        var file_path = path.dirname(_path);
            //debugging
        helper.verbose('\t - html > file ' + _path + ' / ' + file_path);
            //create the paths if necessary
        helper.create_folder_path( file_path );
            //write the file out
        helper.write_file(_path, _final_html[_path_key]);

    } //_write_doc_out


    var do_write = function(config, _the_list, _done) {

        if(_the_list.length > 0) {

            var _path = _the_list[0];
                //do the writing
            _write_doc_out(config, _path);
                //remove processed item
            _the_list.shift();
                //keep reading
            process.nextTick(function(){
                do_write( config, _the_list, _done );
            });

        } else {
            _done();
        }

    } //do_write

    var do_md_to_html = function(config, _the_list, _done) {

        if(_the_list.length > 0) {

            var _path = _the_list[0];

                //do the writing
            _generate_html(config, _path, function(){
                
                    //remove processed item
                _the_list.shift();

                process.nextTick(function(){                    
                    do_md_to_html( config, _the_list, _done );
                });

            });

        } else {
            _done();
        }


    } //do_md_to_html

    var do_html_templating = function(config, _the_list, _done) {

        if(_the_list.length > 0) {

            var _path = _the_list[0];
                //do the writing
            _template_html(config, _path);
                //remove processed item
            _the_list.shift();
                //keep reading
            process.nextTick(function(){
                do_html_templating( config, _the_list, _done );
            });

        } else {
            _done();
        }

    } //do_html_templating


    var generate_docs = function( config, _done ) {        
            
        helper.verbose('  - fetch md files');

            //fetch list of md files
        var _list = helper.glob_list( config.md_path + config.md_input );
            //but don't process ones that haven't changed according to the cache
        _list = _filter_unmodified(config, _list);

            //we read the md files into a big list
        _read_md_files(config, _list);
            //fetch the list of paths to generate
        var _paths = Object.getOwnPropertyNames(_md_files);

        do_md_to_html( config, _paths.slice(), function(){
            do_html_templating( config, _paths.slice(), function(){
                do_write( config, _paths.slice(), function() {
                    _done();
                });
            });
        });

    } //generate_docs

    helper._verbose = false;

        helper.log('- fetching ./documentator.json');
        
    var config = require('./documentator.json');

        helper.log('- copying images');

    helper.copy_folder_recursively( config.images_path, config.output_path + config.images_output_path, true );

    if(config.samples_path) {

            helper.log('- copying samples');

        helper.copy_folder_recursively( config.samples_path, config.output_path + config.samples_output_path, true );

    } //if samples path

        helper.log('- copying style template');

    helper.copy_folder_recursively( config.style_path, config.output_path );

        helper.log('- generating api files');

    api.generate( config );

        helper.log('- generating docs');

    git.generate_changes( config, function(){

        generate_docs( config, function(){

            helper.log('- done generating docs at ' + config.output_path);

        });

    }); //changes

