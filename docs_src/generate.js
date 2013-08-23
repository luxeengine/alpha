
var marked      = require('marked');
var glob        = require('glob');
var mustache    = require('mustache');
var path        = require('path');
var fs          = require('fs');
var hljs        = require('highlight.js');
// var pygmentize  = require('pygmentize-bundled');
var pygmentize   = require('pygments').colorize;

    //Look for the local config
var config = require('./luxe.docs.json');

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


    var _style_path = './styles/' + config.style;

    var _fetch_file_list = function( _paths ) {

        var _list = [];

            if(_paths == undefined) {
                _paths = ['./**/*.md'];
            }

            for(var i = 0; i < _paths.length; ++i) {

                glob( _paths[i] , { sync:true, nonull:true }, function (er, files) {
                    _list = _list.concat( files );
                })

            } //for each path glob

        return _list;

    } //_fetch_file_list

    var _generate_doc_html = function( _path ) {

       
        marked( String(fs.readFileSync( _path )), _marked_options, function(err, _parsed_markdown) {

                //work out where the template is
            var _style_template = _style_path + '/index.html';
                //include any mustache stuff
            var _parsed_template = mustache.render( String(fs.readFileSync( _style_template )), { doc_content:_parsed_markdown } );
            
                //write the file into the output directory
            var _output_path = config.output + path.basename(_path, '.md') + '.html';
                
            console.log( '\t output ' + _output_path );

                //write the fule
            fs.writeFileSync( _output_path, _parsed_template );

        } ); //marked

    } //_generate_doc_html

    if(config != undefined) {

        var _list = _fetch_file_list( config.glob );

        for (var i = 0; i < _list.length; ++i) {
            _generate_doc_html( _list[i] );
        }

            //copy template files

        fs.createReadStream( _style_path + '/jquery-2.0.3.min.js').pipe(fs.createWriteStream( config.output + 'jquery-2.0.3.min.js'));
        fs.createReadStream( _style_path + '/style.css').pipe(fs.createWriteStream( config.output + 'style.css'));
        fs.createReadStream( _style_path + '/code.css').pipe(fs.createWriteStream( config.output + 'code.css'));
        fs.createReadStream( _style_path + '/font.css').pipe(fs.createWriteStream( config.output + 'font.css'));
        fs.createReadStream( _style_path + '/font.eot').pipe(fs.createWriteStream( config.output + 'font.eot'));
        fs.createReadStream( _style_path + '/font.woff').pipe(fs.createWriteStream( config.output + 'font.woff'));
        fs.createReadStream( _style_path + '/font.ttf').pipe(fs.createWriteStream( config.output + 'font.ttf'));


    } //config != undefined