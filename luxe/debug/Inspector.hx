package luxe.debug;

import luxe.Text;
import phoenix.Texture;
import luxe.NineSlice;
import phoenix.Batcher;
import phoenix.BitmapFont;

typedef DebugInspectorOptions = {
    ? title : String,
    ? font : BitmapFont,
    ? pos  : Vector,
    ? size : Vector,
    ? batcher : Batcher
}

@:noCompletion class Inspector {

    public var title:String;
    public var font : BitmapFont;
    public var pos:Vector;
    @:isVar public var size (default,set): Vector;

        //pieces
    public var _title_text : Text;
    public var _version_text : Text;

    public var uitexture : Texture;
    public var uibutton : Texture;

    public var _window : NineSlice;
    public var onrefresh : Void->Void;

    var _batcher : Batcher;

    public function new( _options:DebugInspectorOptions ) {

        title = 'Inspector';
        font = Luxe.renderer.font;
        size = new Vector( Std.int(Luxe.screen.w*0.2), Std.int(Luxe.screen.h*0.6) );
        pos = new Vector((Luxe.screen.w/2) - (size.x/2), (Luxe.screen.h/2) - (size.y/2));

            //load the images
        uitexture = Texture.load_from_resource('tiny.ui.png');
        uibutton =  Texture.load_from_resource('tiny.button.png');

            //default to the internal batcher
        _batcher = Luxe.renderer.batcher;

        if(_options != null) {

            if(_options.title != null) title = _options.title;
            if(_options.font != null) font = _options.font;
            if(_options.pos != null) pos = _options.pos;
            if(_options.size != null) size = _options.size;
            if(_options.batcher != null) _batcher = _options.batcher;

        } //_options != null

    } //new

    public function refresh() {
        if(_window == null) {
            _create_window();
        }

        if(onrefresh != null) {
            onrefresh();
        }
    }

    public function show() {
        refresh();
        _window.visible = true;
        _title_text.visible = true;
        _version_text.visible = true;
    }
    public function hide() {
        _window.visible = false;
        _title_text.visible = false;
        _version_text.visible = false;
    }

    function set_size(_size:Vector) {

        if(size != null && _window != null) {
            _window.size = _size;
        }

        return size = _size;
    }

    function _create_window() {

            //if already exists, clean up
        if(_window != null) {
            _window.destroy();
        }

        _window = new NineSlice({
            depth : 999.1,
            texture : uitexture,
            batcher : _batcher
        });

        _window.create( pos, size.x, size.y );
        _window._geometry.id = 'debug.Inspector';

            //static batch
        _window.lock();

        _title_text = new Text({
            name : 'debug.title',
            batcher : _batcher,
            no_scene : true,
            depth : 999.2,
            color : new Color().rgb(0xf6007b),
            pos : new Vector( pos.x+14, pos.y+9 ),
            align : TextAlign.left,
            font : font,
            text : title,
            point_size : 15,
            visible : false
        });

        _version_text = new Text({
            name : 'debug.version',
            batcher : _batcher,
            no_scene : true,
            depth : 999.2,
            color : new Color().rgb(0x333333),
            pos : new Vector( pos.x+(size.x-14), pos.y+9 ),
            align : TextAlign.right,
            font : font,
            text : '${Luxe.build}',
            point_size : 16,
            visible : false
        });

        if(_title_text.geometry != null) {
            _title_text.geometry.id = 'debug.title.text';
        }

        if(_version_text.geometry != null) {
            _version_text.geometry.id = 'debug.version.text';
        }

    }
}
