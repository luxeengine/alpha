
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
var git         = require('nodegit');

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

        console.log('- parsing code doc json, to generate api files');

        var _doc_json = String( fs.readFileSync( config.scribe_source_json ) );
        if(_doc_json) {

            var doc_json = JSON.parse(_doc_json);

            //we parse each top level object from scribe and spit out a template file for 
            //the documentator to take and run with
            if(doc_json) {
                var classes = doc_json.classes;
                for(var i = 0; i < classes.length; ++i) {

                    var theclass = classes[i];
                    var filename = theclass.name + '.md';
                    var output_json = {
                        file : filename,
                        links : [],
                        toplinks : [],
                        sections : []
                    }

                    //now go through and add the sections,
                    //extends, implements, members, properties, methods
                    if(theclass["extends"].length != 0) {
                        output_json.sections.push({
                            name : "Extends",
                            link : "#Extends",
                            values : theclass["extends"]
                        });

                    } //extends != 0

                    if(theclass["implements"].length != 0) {
                         output_json.sections.push({
                            name : "Implements",
                            link : "#Implements",
                            values : theclass["implements"]
                        });

                    }

                    if(theclass["members"].length != 0) {
                         output_json.sections.push({
                            name : "Members",
                            link : "#Members",
                            values : theclass["members"]
                        });

                    }
                    
                    if(theclass["meta"].length != 0) {
                         output_json.sections.push({
                            name : "Meta",
                            link : "#Meta",
                            values : theclass["meta"]
                        });
                    }

                    if(theclass["properties"].length != 0) {
                         output_json.sections.push({
                            name : "Properties",
                            link : "#Properties",
                            values : theclass["properties"]
                        });

                    }

                    if(theclass["methods"].length != 0) {
                        output_json.sections.push({
                            name : "Methods",
                            link : "#Methods",
                            values : theclass["methods"]
                        });

                    }

                    //write out a single file per class, so
                    _verbose("\t- refreshing api file from scribe .. " + config.scribe_api_output_path + theclass.name + ".json");

                    fs.writeFileSync( config.scribe_api_output_path + theclass.name + ".json" , JSON.stringify(output_json) );

                } //for each class
            } //if doc json

        }

        console.log('- parsing code api files');

        var _api_template = String( fs.readFileSync( config.api_template ) );
        var _api_index_template = String( fs.readFileSync( config.api_index_template ) );

        var _list = [];
        var _api_list = [];
            glob( config.api_input , { sync:true, nonull:true }, function (er, files) {
                _list = _list.concat( files );
            });

        for(i = 0; i < _list.length; ++i) {            
            _verbose("\t- attempting api file .. " + _list[i]);
            var _api_details_string = String(fs.readFileSync( _list[i] ));
            var _api_details = JSON.parse( _api_details_string );

            if(_api_details.file && _api_details.sections) {

                _api_list.push({ name:_api_details.file.replace('.md',''), link:_api_details.file.replace('.md','.html') })

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

                    var _section_header_content = '';
                    var _added_section_header = false;

                    if(_section.values.length) {

                        if(_section.link){
                            _section_header_content += '<a class="lift" name="'+_section.name+'" ></a>\n';
                        }

                        _section_header_content += '###' + _section.name + '   \n---\n';
                    
                    } //if section has any values
                    
                        //now for each section value
                    for(_k = 0; _k < _section.values.length; ++_k) {

                        var _value = _section.values[_k];
                        var _skip = false;

                        if( _section.name == 'Methods' || _section.name == 'Members' ) {
                            if( _value["public"] != true) {
                                _skip = true;
                            }
                        }

                        var _meta_exists = _value["meta"];
                        if( _meta_exists ) {
                                //for each of the item in the meta
                            var _meta = _value["meta"];
                            for(var _l = 0; _l < _meta.length; ++_l ) {
                                var _meta_name = _meta[_l].name;
                                var _meta_value = _meta[_l].value;
                                if(_meta_name === ':noCompletion' || _meta_name === ':hide') {
                                    _skip = true;
                                } else if(_meta_name === ':desc') {
                                    _value.desc = _meta_value;
                                }
                            }
                        }

                        if(_section.name == 'Meta') {
                            _skip = true;
                        }


                        if(_skip) {
                            continue;
                        }

                        if(!_added_section_header) {
                                //add the header
                            _context.content += _section_header_content;
                                //and add the links                            
                            _context.links += '[' + _section.name + '](' + _section.link + ')   \n';

                            // console.log("ADDING SECTION LINK TO LIST " + _section.name + " / " + _section.link);
                            // console.log(_context.links);

                            _added_section_header = true;
                        }

                        if(_section.name == 'Extends') {

                            _context.content += '<a class="lift" name="'+_value.name+'" href="'+_value.name+'.html">'+_value.name+'</a>\n\n';

                        } else if(_section.name != 'Meta') {

                            _context.content += '<a class="lift" name="'+_value.name+'" href="#'+_value.name+'">'+_value.name+'</a>\n\n';
                            _context.content += '\n\n    ' + _value.signature +'\n\n';
                            _context.content += '<span class="small_desc_flat"> ' + (_value.desc || "no description")+ ' </span>   \n\n';

                        }

                    } //each section value

                } //each section

                var _template_out = mustache.render( _api_template, _context );
                fs.writeFileSync( config.api_output_path + _api_details.file , _template_out );
                _verbose("\t - generating file " + config.api_output_path + _api_details.file);

            } //if valid
        } //list.length

        var _index_context = { api_list : _api_list };
        var _template_out = mustache.render( _api_index_template, _index_context );
        fs.writeFileSync( config.api_output_path + config.api_index_file , _template_out );
        _verbose("\t - wrote api index file " + config.api_output_path + config.api_index_file);

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
            _last = JSON.parse( String( fs.readFileSync( _last_cache_file ) ) );
            config._last = _last;
        } 

        var _final_list = [];       
        
        if(ignore_time_cache) {

            console.log("- Ignoring last modified date cache! (config.force_full == true)");
            _final_list = _list;

        } else {

            for(var i = 0; i < _list.length; ++i) {
                    //first check if this is already in the list, and compare it
                var _last_changed_info = _last[_list[i]];

                if(_last_changed_info) {
                    var _last_changed_time = _last_changed_info.time;
                    var _last_changed_size = _last_changed_info.size;
                    var _stat = fs.statSync(_list[i]);
                    
                    if(_stat.mtime.getTime() >= _last_changed_time && _stat.size != _last_changed_size) {
                        _final_list.push(_list[i]);
                        _verbose('> added file ' + _list[i] + (_stat.mtime.getTime() ==  _last_changed_time) + ' ' + (_stat.size == _last_changed_size));
                    } else {
                        _verbose('> \tskipped file due to no change ' + _list[i] );
                    }
                } else {
                    _verbose('> forced file, no history ' + _list[i] );
                    _final_list.push(_list[i]);
                }            
            }
        } //ignore time cache
          

        return _final_list;

    } //_fetch_file_list

    var _cache_last_modified = function(_final_list) {

        var _last = config._last;
        var _last_cache_file = './.last_changed_cache.json';

            //now for the final list, make sure we cache it
        for(var i = 0; i < _final_list.length; ++i) {            
            var _stat = fs.statSync(_final_list[i]);
            var info = {};
             info.time = _stat.mtime.getTime();
             info.size = _stat.size;
             _last[_final_list[i]] = info;
        }

            //save the cache
        fs.writeFileSync(_last_cache_file, JSON.stringify(_last) );

    }


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
            var _replace = new RegExp( "(\\b" + _item.key + "\\b)(?!.*</a>)", 'g');

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

    var _write_changes_file = function(_done) {

        git.Repo.open(path.resolve(__dirname, '../.git'), function(error, repo) {
          if (error) throw error;

          repo.getMaster(function(error, branch) {
            if (error) throw error;

            // History returns an event.
            var history = branch.history(git.RevWalk.Sort.Time);

                // History emits 'commit' event for each commit in the branch's history
                // history.on('commit', function(commit) {
                //   console.log('commit ' + commit.sha());
                //   console.log('Author:', commit.author().name() + ' <' + commit.author().email() + '>');
                //   console.log('Date:', commit.date());
                //   console.log('\n    ' + commit.message());
                // });

                history.on('end', function(all){
                    
                    var _final_log = '';

                    var _count = all.length;
                    for(i = 0; i < _count; ++i) {
                        _commit = all[i];

                        _final_log += '&nbsp;   \n';

                        _final_log += '<div class="commit_info">\n\n';
                        _final_log += 'commit ['+ String(_commit.sha()).substr(0,10) +'](http://github.com/underscorediscovery/luxe/commit/'+ _commit.sha() +')   \n';
                        _final_log += 'author: ' + _commit.author().name() + '   \n';
                        _final_log += 'date: ' + _commit.date() + '   \n';
                        _final_log += '</div>\n\n';
                        _final_log += '&nbsp;   \n';                        
                        _final_log += '<div class="commit_message">\n\n<ul>';
                            
                        _items = _commit.message().split('\n');
                        for(var j = 0; j < _items.length; ++j) {
                            if(_items[j].length > 0) {
                                _final_log += '<li>' + _items[j] + '</li>';
                            }
                        }                        

                        _final_log += '</ul>\n</div>\n';
                        _final_log += '&nbsp;   \n';
                    }

                    fs.writeFileSync( './Luxe/changes.md' , _final_log );
                    _done();
                });

            // Don't forget to call `start()`!
            history.start();
          });
        });

    } //_write_log_file

    var verbose = true;
    var _verbose = function(s){
        if(verbose) {
            console.log(s);
        }
    }

    if(config != undefined) {        

        _write_changes_file(function() {

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
                                    _cache_last_modified([].concat(_list));
                                    console.log("- ok - generated docs in " + config.output_path );
                                });
                            }); //copy template files
                        }); //do output
                    } );  //do generation
                } ); // cache files

            } //!list.length

        }); //write changes file

    } else { //config != undefined
        console.log("- NOT ok - No configuration found. Stopping.");
    }
