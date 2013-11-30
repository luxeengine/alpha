
var marked      = require('marked');
var glob        = require('glob');
var mustache    = require('mustache');
var path        = require('path');
var fs          = require('graceful-fs');
var hljs        = require('highlight.js');
var wrench      = require('wrench');
var util        = require('util');
var pygmentize  = require('pygments').colorize;
var jsonic      = require('jsonic');

    //Look for the local config, todo: command line
var config = require('./documentator.json');

    var _marked_options = {
        gfm: true,
        highlight: function (code, lang, callback) {
            pygmentize(code, 'hx', 'html', function(data) {
                callback(null, data);
            });
        },
        lang : 'hx',
        langPrefix : 'lang-',
        tables: true,
        breaks: false,
        pedantic: false,
        smartLists: true,
        smartypants: true
    };

    var _parse_code_api = function() {

        console.log('- parsing code api files');

        var _api_template = String( fs.readFileSync( config.api_template ) );

        var _list = [];
            glob( config.api_input , { sync:true, nonull:true }, function (er, files) {
                _list = _list.concat( files );
            });

        for(i = 0; i < _list.length; ++i) {            
            console.log("\t- attempting api file .. " + _list[i]);
            var _api_details_string = String(fs.readFileSync( _list[i] ));
            var _api_details = JSON.parse( _api_details_string );

            if(_api_details.file && _api_details.sections) {

                var _context = {
                    toplinks : '',
                    links : '',
                    content : ''
                }; 

                    //for each top link, add it
                for(_j = 0; _j < _api_details.toplinks.length; ++_j) {
                    _link = _api_details.toplinks[_j];
                    _context.toplinks += '###[' + _link.name + '](' + _link.link + ')   \n';
                }

                    //for each link, add it
                for(_j = 0; _j < _api_details.links.length; ++_j) {
                    _link = _api_details.links[_j];
                    _context.links += '[' + _link.name + '](' + _link.link + ')   \n';
                }
                    
                    //for each section
                for(_j = 0; _j < _api_details.sections.length; ++_j) {
                    var _section = _api_details.sections[_j];     

                    _context.content += '&nbsp;   \n\n';
                    if(_section.link){
                        _context.content += '<a class="lift" name="'+_section.link+'" ></a>\n';
                    }
                    _context.content += '###' + _section.name + '   \n---\n';
                    
                        //now for each section value
                    for(_k = 0; _k < _section.values.length; ++_k) {
                        var _value = _section.values[_k];

                        _context.content += '<a class="lift" name="'+_value.link+'" href="#'+_value.link+'">'+_value.name+'</a>\n\n';
                        _context.content += '```' + _value.code + '```\n';
                        _context.content += '<span class="small_desc_flat"> ' + _value.desc + ' </span>   \n\n';

                    } //each section value

                } //each section

                var _template_out = mustache.render( _api_template, _context );
                fs.writeFileSync( config.api_output_path + _api_details.file , _template_out );
                console.log("\t - generating file " + config.api_output_path + _api_details.file);
            } //if valid
        } //list.length
            
        console.log("- generated api files complete");

    };


    var _style_path = config.style_path + config.style_name + '/';
        //work out where the template is
    var _style_template = _style_path + 'index.html';
    var _style_template_cache = String( fs.readFileSync( _style_template ) );    

    var _fetch_file_list = function( _paths, ignore_time_cache ) {

        var _list = [];

            if(_paths == undefined) {
                _paths = ['./**/*.md'];
            }

            for(var i = 0; i < _paths.length; ++i) {

                glob( _paths[i] , { sync:true, nonull:true }, function (er, files) {
                    _list = _list.concat( files );
                });

            } //for each path glob

            //now go through and prune any that didn't change yet
        var _last_cache_file = './.last_changed_cache.json';
        var _last = {};

        if(fs.existsSync(_last_cache_file)) {
            _last = require(_last_cache_file);
        } 

        var _final_list = [];       
        
        if(ignore_time_cache) {

            console.log("- Ignoring last modified date cache! (config.force_full == true)");
            _final_list = _list;

        } else {
            for(var i = 0; i < _list.length; ++i) {
                    //first check if this is already in the list, and compare it
                var _last_changed = _last[_list[i]];
                var _stat = fs.statSync(_list[i]);

                if(_last_changed) {
                    if(_stat.mtime.getTime() > _last_changed) {
                        _final_list.push(_list[i]);
                    } 
                } else {
                    _final_list.push(_list[i]);
                }            
            }
        } //ignore time cache
            
            //now for the final list, make sure we cache it
        for(var i = 0; i < _final_list.length; ++i) {
            var _stat = fs.statSync(_list[i]);
            _last[_final_list[i]] = _stat.mtime.getTime();
        }

            //save the cache
        fs.writeFileSync(_last_cache_file, JSON.stringify(_last) );

        return _final_list;

    } //_fetch_file_list


    var _copy_samples = function(_done) {

        var _source_path = config.samples_input;
        var _dest_path = config.output_path + config.samples_output_path;

        console.log("copying samples from " + _source_path + ' to ' + _dest_path);
        
        wrench.copyDirSyncRecursive(_source_path, _dest_path, {forceDelete: true});

    }

    var _copy_images = function(_done) {
        
        var _source_path = config.images_input;
        var _dest_path = config.output_path + config.images_output_path;

        wrench.copyDirSyncRecursive(_source_path, _dest_path, {forceDelete: true});

        console.log("copying images from " + _source_path + ' to ' + _dest_path);

        _copy_samples();

        _done();
    }


    var _api_replacement = function( _content ) {
        
        var _replacements = config.replacements;

        var _count = _replacements.length;
        var _output = _content;

        for(var i = 0; i < _count; i++) {
            var _item = _replacements[i];
            var _replace = new RegExp( "\\b("+_item.key+")\\b", 'gm');
            
            _output = _output.replace( _replace, '<a href="'+_item.link+'">'+_item.key+'</a>' );
        } //each replacement

        return _output;

    } //_api_replacement


    var _template_files = config.template_files;

    var _file_cache = {};
    var _html_cache = {};  
    var _templated_cache = {};

    var _write_doc_file_from_cache = function(_path ) {

            //write the file into the output directory
        var _output_path = config.output_path + path.basename(_path, '.md') + '.html';

            //some details
        console.log( '\t - output ' + _output_path + ' from ' + _path );

                //write the file
        fs.writeFileSync( _output_path, _templated_cache[_path] );

    } //_write_doc_file_from_cache

    var _do_output = function(_the_list, _done) {

        if(_the_list.length > 0) {
            
            _write_doc_file_from_cache(_the_list[0]);

                //remove the one we just did
            _the_list.shift();

                //send the next one
            process.nextTick(function(){
                _do_output( _the_list, _done );
            });

        } else {
            _done();
        }

    } //_do_output

    var _generate_templated_from_html = function( _path ) {

            var _parsed_template = mustache.render( _style_template_cache , { doc_content: _html_cache[_path] } );
                
                //replace the links to the API pages
            var _linked_output = _api_replacement( _parsed_template );

                //store in cache for later
            _templated_cache[_path] = _linked_output;


    } //_generate_templated_from_html

    var _generate_doc_html_from_markdown = function( _path, _done ) {

        var _file_content = _file_cache[ _path ];  

        _verbose('\t - processing ' + _path + ' : ' + _file_content.length );
    
        marked( _file_content, _marked_options, function(err, _parsed_markdown) {
                //store in the cache
            _html_cache[_path] = _parsed_markdown;
                //tell the next one to go
            _done();

        } ); //marked

    } //_generate_doc_html


    var _do_generation = function(_the_list, _done) {

        if(_the_list.length > 0) {

            var _path = _the_list[0];
                //run the generation
            _generate_doc_html_from_markdown( _path, function(){

                    //template the html
                _generate_templated_from_html(_path);
                    //remove the one we just processed
                _the_list.shift();
                    // now, we can defer to next tick again
                process.nextTick(function(){
                    _do_generation( _the_list, _done );
                });

            } );

        } else {//list length > 0
            _done( _html_cache );
        }

    } //_do_generation

    var _cache_files = function(_the_list, _done) {

        if(_the_list.length > 0) {

            var _path = _the_list[0];
                //log
            _verbose("\t - cache file " + _path);
                //fetch file data
            _file_cache[_path] = String( fs.readFileSync( _path ) );
                //remove processed item
            _the_list.shift();
                //queue up next loop
            process.nextTick(function(){
                _cache_files( _the_list, _done );
            });

        } else {

            _done(_file_cache);

        }

    } //_cache_files

    var _copy_template_files = function(_the_list, _done) {

        if(_the_list.length > 0) {

            var _path = _the_list[0];

                //copy file
            fs.createReadStream( _style_path + _path).pipe( fs.createWriteStream( config.output_path + _path ), { autoClose:true } );
                //remove processed
            _the_list.shift();

                //schedule next item
            process.nextTick(function(){
                _copy_template_files(_the_list, _done);
            });

        } else {
            _done();
        }

    } //_copy_template_files

    var verbose = false;
    var _verbose = function(s){
        if(verbose) {
            console.log(s);
        }
    }

    if(config != undefined) {

        console.log('- documentator 0.1 - Reading ' + './documentator.json');

        _parse_code_api();

        var _list = _fetch_file_list( config.input_files, config.force_full );

        if(_list.length == 0) {

            if(config.force_copy_template) {
                console.log("Force copy template files!");
                _verbose("- copying template files. ");
                _copy_template_files([].concat(_template_files), function(){
                    console.log("- copied template files. ");
                }); //copy template files
            }

            console.log('- ok. All files up to date.');

        } else {        

            console.log('- starting generation ... ');

            _cache_files( [].concat(_list), function(){
                console.log("- cached files. ");
                console.log("- generating html ... ");
                _do_generation( [].concat(_list), function(){
                    console.log("- generated html.");
                    _verbose("- saving output : ");
                    _do_output( [].concat(_list), function(){
                        console.log("- saved output.");
                        _verbose("- copying template files. ");
                        _copy_template_files([].concat(_template_files), function(){
                            console.log("- copied template files. ");
                            _verbose("- copying images ");
                            _copy_images(function() {
                                console.log("- copied images.");
                                console.log("- ok - generated docs in " + config.output_path );
                            });
                        }); //copy template files
                    }); //do output
                } );  //do generation
            } ); // cache files

        } //!list.length

    } else { //config != undefined
        console.log("- NOT ok - No configuration found. Stopping.");
    }