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
    @:isVar public var pos (default,set): Vector;
    @:isVar public var size (default,set): Vector;

        //pieces
    public var _title_text : Text;
    public var _version_text : Text;

    public var _window : Sprite;
    public var onrefresh : Void->Void;

    var _batcher : Batcher;

    public function new( _options:DebugInspectorOptions ) {

        title = 'Inspector';
        font = Luxe.renderer.font;
        size = new Vector( Std.int(Luxe.screen.w*0.2), Std.int(Luxe.screen.h*0.6) );
        pos = new Vector((Luxe.screen.w/2) - (size.x/2), (Luxe.screen.h/2) - (size.y/2));

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
            _window.geometry.dirty = true;
        }

        if(_version_text != null) {
            _version_text.pos = new Vector( pos.x+(_size.x-14), pos.y+6 );
        }

        return size = _size;
    }

    function set_pos(_pos:Vector) {

        if(pos != null && _window != null) {
            _window.pos = _pos;
            _window.geometry.dirty = true;
        }

        if(_title_text != null) {
            _title_text.pos = new Vector( _pos.x+14, _pos.y+6 );
        }

        if(_version_text != null) {
            _version_text.pos = new Vector( _pos.x+(size.x-14), _pos.y+6 );
        }

        return pos = _pos;
    }

    function _create_window() {

            //if already exists, clean up
        if(_window != null) {
            _window.destroy();
        }

        _window = new Sprite({
            centered : false,
            depth : 999.1,
            color : new Color().rgb(0x161619),
            size : size,
            pos : pos,
            no_scene : true,
            batcher : _batcher
        });

        _window.geometry.id = 'debug.Inspector';

            //static batch
        _window.locked = true;

        _title_text = new Text({
            name : 'debug.title',
            batcher : _batcher,
            no_scene : true,
            depth : 999.2,
            color : new Color().rgb(0xf6007b),
            pos : new Vector( pos.x+14, pos.y+6 ),
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
            pos : new Vector( pos.x+(size.x-14), pos.y+6 ),
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
