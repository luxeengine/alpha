    
    var api = {};

    var helper   = require('./generate_helper'),
        mustache = require('mustache');
        path     = require('path');

    api.generate = function(config) {

            helper.log('- parsing json api description');

        api.generate_api_sources( config );

            helper.log('- generating api md\'s');

        api.generate_md_files( config );

    } //generate

    api.generate_api_sources = function( config ) {

        var _doc_json = helper.read_file( config.api_source_json );

        if(_doc_json) {

            var doc_json = JSON.parse(_doc_json);

            //we parse each top level object from scribe and spit out a template file for 
            //the documentator to take and run with

        //Classes

            if(doc_json) {
                var classes = doc_json.classes;
                if(classes) {
                    for(var i = 0; i < classes.length; ++i) {

                        var theclass = classes[i];
                        var filename = theclass.name;
                        var _skip = false;

                        if(!theclass.ispublic) {
                            _skip = true;
                        }

                        if(theclass["meta"]) {
                            var _metas = theclass["meta"];
                            for(var j = 0; j < _metas.length; ++j ) {
                                var _meta = _metas[j];
                                if(_meta.name == ':noCompletion') {
                                    _skip = true;
                                }
                            }
                        }

                        if(_skip) {
                            continue;
                        }

                        var output_json = {
                            source : filename,
                            doc : '',
                            links : [],
                            toplinks : [],
                            sections : []
                        }

                        //add the docs if any
                        if(theclass["doc"].length != 0) {
                            output_json.doc = theclass["doc"];
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
                            var _method_list = theclass["methods"];
                            var _static_methods = [];
                            var _normal_methods = [];

                            for(var j = 0; j < _method_list.length; ++j) {
                                var _cur_method = _method_list[j];
                                if(_cur_method.isstatic) {
                                    _static_methods.push(_cur_method);
                                } else {
                                    _normal_methods.push(_cur_method);
                                }
                            }

                            output_json.sections.push({
                                name : "StaticMethods",
                                link : "#StaticMethods",
                                values : _static_methods
                            });

                            output_json.sections.push({
                                name : "Methods",
                                link : "#Methods",
                                values : _normal_methods
                            });
                        }

                            //write out a single file per class, into it's package folder
                        var packages = theclass.name.split('.');
                            //remove the class name from the end
                        var class_name = packages.pop();
                            //find where this file will end up
                        var package_path = config.apis_path + packages.join('/') + '/';
                            //generate the package folders if required
                        helper.create_folder_path( package_path );
                            //work out the final file destination
                        var api_file = package_path + class_name + ".json";
                            //debugging
                        helper.verbose("\t- refreshing api file from scribe .. " + api_file);
                            //write the generated file to the path 
                        helper.write_file( api_file, JSON.stringify(output_json, null, 2) );

                    } //for each class
                }
            
            //Typedefs

                var typedefs = doc_json.typedefs;
                if(typedefs) {
                    for(var i = 0; i < typedefs.length; ++i) {

                        var thetypedef = typedefs[i];
                        var filename = thetypedef.name;
                        var _skip = false;

                        if(!thetypedef.ispublic) {
                            _skip = true;
                        }

                        if(thetypedef["meta"]) {
                            var _metas = thetypedef["meta"];
                            for(var j = 0; j < _metas.length; ++j ) {
                                var _meta = _metas[j];
                                if(_meta.name == ':noCompletion') {
                                    _skip = true;
                                }
                            }
                        }

                        if(_skip) {
                            continue;
                        }

                        var output_json = {
                            source : filename,
                            doc : '',
                            links : [],
                            toplinks : [],
                            sections : []
                        }

                        //add the docs if any
                        if(thetypedef["doc"].length != 0) {
                            output_json.doc = thetypedef["doc"];
                        }

                        if(thetypedef["alias"].length != 0) {
                            output_json.alias = thetypedef["alias"];
                        }

                        if(thetypedef["members"].length != 0) {
                             output_json.sections.push({
                                name : "Members",
                                link : "#Members",
                                values : thetypedef["members"]
                            });
                        }
                        
                        if(thetypedef["meta"].length != 0) {
                             output_json.sections.push({
                                name : "Meta",
                                link : "#Meta",
                                values : thetypedef["meta"]
                            });
                        }

                            //write out a single file per class, into it's package folder
                        var packages = thetypedef.name.split('.');
                            //remove the class name from the end
                        var class_name = packages.pop();
                            //find where this file will end up
                        var package_path = config.apis_path + packages.join('/') + '/';
                            //generate the package folders if required
                        helper.create_folder_path( package_path );
                            //work out the final file destination
                        var api_file = package_path + class_name + ".json";
                            //debugging
                        helper.verbose("\t- refreshing api file from scribe .. " + api_file);
                            //write the generated file to the path 
                        helper.write_file( api_file, JSON.stringify(output_json, null, 2) );

                    } //for each typedef
                }//if typedefs

            //Enums

                var enums = doc_json.enums;
                if(enums) {
                    for(var i = 0; i < enums.length; ++i) {

                        var theenum = enums[i];
                        var filename = theenum.name;
                        var _skip = false;

                        if(!theenum.ispublic) {
                            _skip = true;
                        }

                        if(theenum["meta"]) {
                            var _metas = theenum["meta"];
                            for(var j = 0; j < _metas.length; ++j ) {
                                var _meta = _metas[j];
                                if(_meta.name == ':noCompletion') {
                                    _skip = true;
                                }
                            }
                        }

                        if(_skip) {
                            continue;
                        }

                        var output_json = {
                            source : filename,
                            doc : '',
                            links : [],
                            toplinks : [],
                            sections : []
                        }

                            //add the docs if any
                        if(theenum["doc"].length != 0) {
                            output_json.doc = theenum["doc"];
                        }

                        var _values = [];
                        var __values = theenum["values"];

                        for(var j = 0; j < __values.length; ++j) {
                            var _value = __values[j];
                            _values.push({ 
                                name:_value.name, 
                                signature : theenum["name"] + '.' + _value.name,
                                doc : _value.doc
                            });
                        }

                        if(theenum["values"].length != 0) {
                             output_json.sections.push({
                                name : "Values",
                                link : "#Values",
                                values : _values
                            });
                        }
                        
                        if(theenum["meta"].length != 0) {
                             output_json.sections.push({
                                name : "Meta",
                                link : "#Meta",
                                values : theenum["meta"]
                            });
                        }

                            //write out a single file per class, into it's package folder
                        var packages = theenum.name.split('.');
                            //remove the class name from the end
                        var class_name = packages.pop();
                            //find where this file will end up
                        var package_path = config.apis_path + packages.join('/') + '/';
                            //generate the package folders if required
                        helper.create_folder_path( package_path );
                            //work out the final file destination
                        var api_file = package_path + class_name + ".json";
                            //debugging
                        helper.verbose("\t- refreshing api file from scribe .. " + api_file);
                            //write the generated file to the path 
                        helper.write_file( api_file, JSON.stringify(output_json, null, 2) );

                    } //for each enum
                }//if enums

            } //if doc json

        } //_docs_json

    } //generate_api_sources

    api.generate_md_files = function( config ) {

        helper.log('- parsing code api files from ' + config.apis_path + config.api_input);

        var _api_template = helper.read_file( config.template_path + config.api_template );
        var _api_index_template = helper.read_file( config.template_path + config.api_index_template );

        var _list = helper.glob_list( config.apis_path + config.api_input );
        var _api_list = [];
        var _package_list = [];
        var _package_items = {};

        for(i = 0; i < _list.length; ++i) {
            
            helper.verbose("\t- attempting api file " + _list[i]);

            var _api_details = helper.json( _list[i] );

            if(_api_details && _api_details.source && _api_details.sections) {

                var _link_dest = _api_details.source.replace(/\./gi,'/')+'.html';
                var _name_dest = _api_details.source;

                _api_list.push({
                    name:  _name_dest, 
                    link: _link_dest
                });

                var _package_info = _api_details.source.split('.');
                        //and the class
                    _package_info.pop();
                        //store with the root as well
                    var _root_name = _package_info.join('.');
                        //remove the root package
                    var _root_package = _package_info.shift();
                        //get the major root
                    var _package_root = _package_info[0] ? _root_package+'.'+_package_info[0] : _root_name;
                        //join them again
                    _package_info = _package_info[0];

                    //add if not existing
                if(!_package_items[_package_root]) {
                    _package_items[_package_root] = [];

                    _package_list.push({ name:_package_root, items:_package_items[_package_root]});
                }

                var _api_item = _api_list[_api_list.length-1];
                    _api_item.name = _api_item.name.replace(_package_root+'.','');
                _package_items[_package_root].push(_api_item);

                var _dest_path = _list[i];
                    _dest_path = _dest_path.replace( config.apis_path, '');
                    _dest_path = path.join( config.api_out_md_path, _dest_path );
                
                var _context = {
                    toplinks : '',
                    links : '',
                    doc : '',
                    content : '',
                    rel_path : helper.get_rel_path_count(_dest_path)
                }; 

                    //add the doc if any
                if(_api_details.doc && _api_details.doc.length) {
                    _context.doc = _api_details.doc;
                }

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
                    _section.values.sort(function(a,b){
                        if(a.name < b.name) return -1;
                        if(a.name >= b.name) return 1;
                        return 0;
                    });

                    for(_k = 0; _k < _section.values.length; ++_k) {

                        var _value = _section.values[_k];
                        var _skip = false;

                        if( _section.name == 'Methods' || _section.name == 'Members' || _section.name == 'StaticMethods' ) {
                            if( _value["ispublic"] != true) {
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
                                } 
                            }
                        } //meta_exists

                        if(_section.name == 'Meta') { _skip = true; }

                        if(_skip) {
                            continue;
                        }

                        if(!_added_section_header) {
                                //add the header
                            _context.content += _section_header_content;
                                //and add the links                            
                            _context.links += '[' + _section.name + '](' + _section.link + ')   \n';

                            // helper.log("ADDING SECTION LINK TO LIST " + _section.name + " / " + _section.link);
                            // helper.log(_context.links);

                            _added_section_header = true;
                        }

                        if(_section.name == 'Extends' || _section.name == 'Implements') {

                            var _extends_link = _value.name.replace(/\./gi,'/')+'.html' 
                            _context.content += '<a class="lift" name="'+_value.name+'" href="{{{rel_path}}}api/'+_extends_link+'">'+_value.name+'</a>\n\n';

                        } else if(_section.name != 'Meta') {

                            var _prefix = '';

                            if(_section.name == 'Members') {
                                if(_value.isstatic) {
                                    _prefix = '<span class="inline-block static">static</span>';
                                }
                            }

                            _context.content += '<a class="lift" name="'+_value.name+'" href="#'+_value.name+'">' + _value.name + '</a>\n\n';

                            _context.content += '\n\n'+ _prefix +'`'+_value.signature +'`\n\n';
                            _context.content += '<span class="small_desc_flat"> ' + (_value.doc || "no description")+ ' </span>   \n\n';

                        }

                    } //each section value

                } //each section

                    //add more info for the class output
                var _context_package = _api_details.source.split('.');
                var _context_class = _context_package.pop();
                var _context_package_root = _context_package[0];

                if(_context_package.length > 1) {
                    _context_package_root+='.'+_context_package[1];
                }

                var _context_package_parent = _context_package.slice();
                    _context_package_parent.pop();

                _context.package_parent = _context_package_parent.join('.');
                _context.package = _context_package.join('.');
                _context.class_name = _context_class;
                _context.package_root = _context_package_root;

                    //write out a single file per class, into it's package folder
                var packages = _api_details.source.split('.');
                    //remove the class name from the end
                var class_name = packages.pop();
                    //find the output file name
                var package_path = config.md_path + config.api_out_md_path + packages.join('/') + '/';
                    //create the paths if necessary
                helper.create_folder_path( package_path );
                    //the end resulting file
                var api_file_dest = package_path + class_name + '.md';
                    //complete the generated template md
                var _template_out = mustache.render( _api_template, _context );
                    //log the details
                helper.verbose("\t - generating file " + api_file_dest);
                    //save it
                helper.write_file( api_file_dest , _template_out );

            } //if valid

        } //list.length

            //work out the end file
        var _out_dest = config.api_out_md_path + config.api_index_out;

        var _rel_test = _out_dest.replace('.md','.html');
        
        var _index_context = { package_list:_package_list, api_list : _api_list, rel_path:helper.get_rel_path_count(_rel_test) };

            //template the index file with the list
        var _template_out = mustache.render( _api_index_template, _index_context );
            //write the correct file to the correct location
        _out_dest = config.md_path + config.api_out_md_path + config.api_index_out;        
            //write out to the destination
        helper.write_file( _out_dest , _template_out );
            //debug
        helper.verbose("\t - wrote api index file " + _out_dest);

        helper.log("- generated api files complete");

    } //generate_md_files


    // var _api_replacement = function( _content ) {
        
    //     var _replacements = config.replacements;

    //     var _count = _replacements.length;
    //     var _output = _content;

    //     for(var i = 0; i < _count; i++) {

    //         var _item = _replacements[i];
    //         var _replace = new RegExp( "(\\b" + _item.key + "\\b)(?!.*</a>)", 'g');

    //         _output = _output.replace( _replace, '<a href="'+_item.link+'">'+_item.key+'</a>' );

    //     } //each replacement

    //     return _output;

    // } //_api_replacement


    module.exports = api;

