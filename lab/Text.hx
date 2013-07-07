package lab;

import phoenix.BitmapFont;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.CompositeGeometry ;


class Text {
    
    public var font : BitmapFont;
    public var geometry : CompositeGeometry;

    @:isVar public var text(default,set) : String = '';
    @:isVar public var pos(default,set) : Vector;
    @:isVar public var size(default,set) : Float;
    @:isVar public var color(default,set) : Color;
    @:isVar public var visible(default,set) : Bool;

    public var ready : Bool = false;
    public var text_options : Dynamic;

    public function new( _options : Dynamic ) {

        var _font : Dynamic = (_options.font == null) ? null : _options.font;        

        if(_font == null) return;

        if(Std.is(_font, String)) {
                //supplied a font name
            font = new BitmapFont(Lab.resources);
                //fetch font
            var _folder = haxe.io.Path.directory(_font) + '/';
            font.load_from_string( Lab.loadText(_font), _folder, onloaded );

        } else {
                //supplied a precreated font?
            font = _font;
        }

        text_options = _options;
            //Apply the setter, which will draw the geometry
        text = _options.text;
    }

    public function onloaded() {
        ready = true;
        text = text + '';
    }

    public function set_pos(v:Vector) : Vector {
        pos = v.clone();
        text_options.pos = pos;
        
        if(geometry != null) {        
            geometry.pos = pos;
        }
        
        return pos;
    }

    public function set_size(v:Float) : Float {
        size = v;
        text_options.size = size;
        text = text+'';
        return v;
    }
    public function set_color(c:Color) : Color {
        color = c;

        if(geometry != null) {
            geometry.color = c;
        }

        text_options.color = c;
        return c;
    }
    public function set_visible(b:Bool) : Bool {
        visible = b;
        
        if(geometry != null) {
            geometry.enabled = false;
        }

        return b;
    }

    public function set_text(v:String) {
        if(!ready) return text = v;
        if(text_options == null) return v;

        text_options.text = v;
        
        if(geometry != null) {
            geometry.drop();
            geometry = null;
        }

        geometry = font.draw_text(text_options);

        return text = v;
    }

}


