
var marked      = require('marked');
var glob        = require('glob');
var mustache    = require('mustache');
var path        = require('path');
var fs          = require('graceful-fs');
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

    var _copy_images = function() {

        var _list = [];

        _paths = ['./Luxe/images/*'];

        for(var i = 0; i < _paths.length; ++i) {

            glob( _paths[i] , { sync:true, nonull:true }, function (er, files) {
                _list = _list.concat( files );
            })

        } //for each path glob

        for(var i = 0; i < _list.length; ++i) {
                //copy each file across
            var _filename = path.basename(_list[i]) ;
            fs.createReadStream(_list[i]).pipe(fs.createWriteStream( config.output + 'images/' + _filename));
        }

    }

    var _api_replacement = function( _content ) {
        
        var _replacements = [
            { key:'Luxe',           link:'api.html'             },
            { key:'Texture',        link:'luxe.Texture.html'    },

            { key:'Entity',         link:'luxe.Entity.html'     },
            { key:'Sprite',         link:'luxe.Sprite.html'     },
            { key:'Camera',         link:'luxe.Camera.html'     },
            { key:'Text',           link:'luxe.Text.html'       },

            { key:'Rectangle',      link:'luxe.Rectangle.html'  },
            { key:'Color',          link:'luxe.Color.html'      },
            { key:'Vector',         link:'luxe.Vector.html'     }
        ];

        var _count = _replacements.length;
        var _output = _content;

        for(var i = 0; i < _count; i++) {
            var _item = _replacements[i];
            var _replace = new RegExp( "\\b("+_item.key+")\\b", 'gm');
            
            _output = _output.replace( _replace, '<a href="'+_item.link+'">'+_item.key+'</a>' );
        } //each replacement

        return _output;

    } //_api_replacement

    var _generate_doc_html = function( _path ) {

            //parse the links to specific API        
        var _file_content = String(fs.readFileSync( _path ));        

        marked( _file_content, _marked_options, function(err, _parsed_markdown) {

                //work out where the template is
            var _style_template = _style_path + '/index.html';
                //include any mustache stuff
            var _parsed_template = mustache.render( String(fs.readFileSync( _style_template )), { doc_content:_parsed_markdown } );
                
                //replace the links to the API pages
            var _linked_output = _api_replacement( _parsed_template );

                //write the file into the output directory
            var _output_path = config.output + path.basename(_path, '.md') + '.html';            

                //some details
            console.log( '\t output ' + _output_path );

                //write the file
            fs.writeFileSync( _output_path, _linked_output );

        } ); //marked

    } //_generate_doc_html

    if(config != undefined) {

        var _list = _fetch_file_list( config.glob );

        for (var i = 0; i < _list.length; ++i) {
            _generate_doc_html( _list[i] );
        }

            //copy template files

        fs.createReadStream( _style_path + '/more.png').pipe(fs.createWriteStream( config.output + 'more.png'));
        fs.createReadStream( _style_path + '/favicon.png').pipe(fs.createWriteStream( config.output + 'favicon.png'));
        fs.createReadStream( _style_path + '/jquery-2.0.3.min.js').pipe(fs.createWriteStream( config.output + 'jquery-2.0.3.min.js'));
        fs.createReadStream( _style_path + '/style.css').pipe(fs.createWriteStream( config.output + 'style.css'));
        fs.createReadStream( _style_path + '/code.css').pipe(fs.createWriteStream( config.output + 'code.css'));
        fs.createReadStream( _style_path + '/font.css').pipe(fs.createWriteStream( config.output + 'font.css'));
        fs.createReadStream( _style_path + '/font.eot').pipe(fs.createWriteStream( config.output + 'font.eot'));
        fs.createReadStream( _style_path + '/font.woff').pipe(fs.createWriteStream( config.output + 'font.woff'));
        fs.createReadStream( _style_path + '/font.ttf').pipe(fs.createWriteStream( config.output + 'font.ttf'));

            //copy image folder

        _copy_images();


    } //config != undefined