package luxe.debug;

import luxe.Text;
import luxe.NineSlice;
import phoenix.Batcher;

typedef DebugInspectorOptions = {
    ? batcher : Batcher,
    ? pos : Vector,
    ? size : Vector,
}

@:noCompletion class Inspector {

    @:isVar public var pos (default,set): Vector;
    @:isVar public var size (default,set): Vector;

    public var title : Text;
    public var version : Text;
    public var window : Sprite;
    public var batcher : Batcher;

    public var onrefresh : Void->Void;

    public function new( _options:DebugInspectorOptions ) {

        size = new Vector(Std.int(Luxe.screen.w*0.2), Std.int(Luxe.screen.h*0.6));
        pos = new Vector((Luxe.screen.w/2) - (size.x/2), (Luxe.screen.h/2) - (size.y/2));

            //default to the internal batcher
        batcher = Luxe.renderer.batcher;

        if(_options != null) {

            if(_options.batcher != null) batcher = _options.batcher;
            if(_options.size != null) size = _options.size;
            if(_options.pos != null) pos = _options.pos;

        } //_options != null

    } //new

    public function refresh() {

        if(window == null) {
            create_window();
        }

        if(onrefresh != null) {
            onrefresh();
        }

    } //refresh

    public function show() {
        refresh();
        window.visible = true;
        title.visible = true;
        version.visible = true;
    }

    public function hide() {
        window.visible = false;
        title.visible = false;
        version.visible = false;
    }

    function set_size(_size:Vector) {

        if(_size != null && window != null) {
            window.size = _size;
            window.geometry.dirty = true;
        }

        if(version != null) {
            version.pos = new Vector( pos.x+(_size.x-14), pos.y+6 );
        }

        return size = _size;

    } //set_size

    function set_pos(_pos:Vector) {

        if(_pos != null && window != null) {
            window.pos = _pos;
            window.geometry.dirty = true;
        }

        if(title != null) {
            title.pos = new Vector( _pos.x+14, _pos.y+6 );
        }

        if(version != null) {
            version.pos = new Vector( _pos.x+(size.x-14), _pos.y+6 );
        }

        return pos = _pos;
    
    } //set_pos

    function create_window() {

        window = new Sprite({
            name: 'debug.window',
            batcher: batcher,
            no_scene: true,
            depth: 999.1,
            visible: false,
            color: new Color().rgb(0x161619),
            centered: false,
            size: size,
            pos: pos,
        });

        title = new Text({
            name: 'debug.title',
            batcher: batcher,
            no_scene: true,
            depth: 999.2,
            visible: false,
            color: new Color().rgb(0xf6007b),
            pos: new Vector( pos.x+14, pos.y+6 ),

            text: 'Inspector',
            point_size: 15,
            align: TextAlign.left
        });

        version = new Text({
            name: 'debug.version',
            batcher: batcher,
            no_scene: true,
            depth: 999.2,
            visible: false,
            color: new Color().rgb(0x545459),
            pos: new Vector( pos.x+(size.x-14), pos.y+6 ),

            text: '${Luxe.core.runtime_info()}',
            point_size: 13,
            align: TextAlign.right,
        });

        window.locked = true;
        window.geometry.id = 'debug.Inspector';
        title.geometry.id = 'debug.title.text';
        version.geometry.id = 'debug.version.text';

    }

}
