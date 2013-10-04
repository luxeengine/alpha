package luxe;

import luxe.Vector;
import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.geometry.CompositeGeometry;

typedef TextAlign = phoenix.BitmapFont.TextAlign;

class Text {
    
    public var font : BitmapFont;
    public var geometry : CompositeGeometry;
    
    private var _batcher : Batcher;

    @:isVar public var text (default,set) : String = '';
    @:isVar public var pos (default,set) : Vector;
    @:isVar public var size (default,set) : Float = 32;
    @:isVar public var color (default,set) : Color;
    @:isVar public var visible (default,set) : Bool;

    public var ready : Bool = false;
    public var text_options : Dynamic;

    public function new( _options : Dynamic ) {
                

        var _font : Dynamic = (_options.font == null) ? null : _options.font;
        _batcher = (_options.batcher == null) ? Luxe.renderer.default_batcher : _options.batcher;
        size = (_options.size == null) ? 32 : _options.size;

        if(_font == null) _font = Luxe.renderer.default_font;

        if(Std.is(_font, String)) {
                //supplied a font name
            font = new BitmapFont(Luxe.resources);
                //fetch font
            var _folder = haxe.io.Path.directory(_font) + '/';
            font.load_from_string( Luxe.loadText(_font), _folder, onloaded );

        } else {
                //supplied a precreated font?            
            font = _font;
            ready = true;
        }

        text_options = _options;
        text_options.size = size;
            
        if(_options.pos != null) {
            pos = _options.pos;
        } else {
            pos = new Vector();
        }

        if(_options.color != null) {
            color = _options.color;
        }

            //Apply the setter, which will draw the geometry
        text = _options.text;
    }

    @:noCompletion public function onloaded() {
        ready = true;
        text = text + '';
    }

    public function destroy() {
        if(geometry != null) {
            geometry.drop();
            geometry = null;
        }
    }

    function set_pos(v:Vector) : Vector {
        
        pos = v.clone();
        text_options.pos = pos;
        
        if(geometry != null) {        
            geometry.pos = v;
        }        
        
        return pos;
    }

    function set_size(v:Float) : Float {
        if(text_options == null) return size = v;
        size = v;        
        text_options.size = size;
        text = text+'';
        return v;
    }
    function set_color(c:Color) : Color {
        color = c;

        if(geometry != null) {
            geometry.color = c;
        }

        text_options.color = c;
        return c;
    }
    function set_visible(b:Bool) : Bool {
        visible = b;
        
        if(geometry != null) {
            geometry.enabled = visible;
        }

        text_options.enabled = visible;
        return b;
    }

    function set_text(v:String) {

        if(!ready) return text = v;
        if(text_options == null) return v;  

        text_options.text = v;

        destroy();

        geometry = font.draw_text(text_options);

        return text = v;
    }

}


