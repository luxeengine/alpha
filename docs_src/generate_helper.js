

var helper      = {};
var path        = require('path'),
    glob        = require('glob'),
    fs          = require('graceful-fs'),
    wrench      = require('wrench');


    helper._verbose = true;
    helper.verbose = function(s){ if(helper._verbose) { console.log(s); } }
    helper.log = function(s){ console.log(s); }

    helper.create_folder_path = function(_dest, _clean) {

            //create folders at the destination recursively, as needed
        var _dest_path_items = _dest.split('/');

        if(_dest_path_items.length) {
                //for each folder in the dest path
            var _current = _dest_path_items[0] + '/';
            
                // helper.log('-    starting at ' + _current);
            for(var j = 1; j < _dest_path_items.length; ++j) {
                
                if(_dest_path_items[j] != '') {

                    _current += _dest_path_items[j] + '/';
                    var _exists = fs.existsSync(_current);

                        // helper.log('-     next: ' + _current);
                    if(!_exists) {
                            // helper.log("-     creating new dir " + _current);
                        fs.mkdirSync(_current);
                    } //if !exists

                } //!=''

            } //for
        } //if any paths exist

    } //create_folder_path

    helper.copy_file = function(_source, _dest, _overwrite) {

            //don't copy if it exists, and overwrite isn't set
        var _do_copy = false;
        if(!fs.existsSync(_dest) || _overwrite) {
            _do_copy = true;
        }

        if(_do_copy) {
            fs.createReadStream( _source ).pipe( fs.createWriteStream( _dest ), { autoClose:true } );
        }
        
    } //copy_file

    helper.read_file = function(_source) {

        return String(fs.readFileSync( _source ));

    } //read_file

    helper.json = function(_source) {

        return JSON.parse( helper.read_file(_source) );

    } //json

    helper.write_file = function(_dest, _content) {

        fs.writeFileSync( _dest , _content );

    } //write_file

    helper.glob_list = function( _glob ) {

        var _list = [];
        glob( _glob , { sync:true, nonull:true }, function(er, files) {
            _list = _list.concat( files );
        });
        return _list;
    
    } //glob_list

    helper.get_rel_path_count = function(_path) {

        var _cnt = _path.split('/');
        var amount = _cnt.length - 1;
        
        var _result = './';

        for(var i = 0; i < amount; ++i ) {
            _result = path.join('../', _result);
        }   

        return _result;
        
    } //count_paths_to

    helper.copy_folder_recursively = function(_source, _dest, _clean, _overwrite) {

        helper.log('-    copying ' + _source + ' to ' + _dest );//+ ' clean:' + _clean + ' overwrite:' + _overwrite);

        if(_overwrite == undefined) _overwrite = true;

            //remove the destination if try
        if(_clean) {
            wrench.rmdirSyncRecursive(_dest, true);
        }

            //make sure the destination exists
            //before copying any files to the location
        helper.create_folder_path(_dest);

            //obtain a list of items from the source
        var _source_list = wrench.readdirSyncRecursive(_source);

            //for each source item, check if it's a directory
        var _source_file_list = [];

        for(var i = 0; i < _source_list.length; ++i) {
            var _is_dir = fs.statSync( path.join(_source, _source_list[i]) ).isDirectory();
            if(_is_dir) {
                helper.create_folder_path( path.join(_dest,_source_list[i] ) ); 
            } else {
                _source_file_list.push(_source_list[i]);
            }
        }

            //for each file only, copy it across
        for(var i = 0; i < _source_file_list.length; ++i) {
            helper.copy_file( path.join(_source, _source_file_list[i]), path.join(_dest,_source_file_list[i]), _overwrite);
        }

    } //copy_folder_recursively


module.exports = helper;
