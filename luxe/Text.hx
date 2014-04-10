package luxe;

import luxe.Vector;
import luxe.Visual;

import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.geometry.CompositeGeometry;

typedef TextAlign = phoenix.BitmapFont.TextAlign;

class Text extends Visual {
    

    public var font : BitmapFont;
    private var _batcher : Batcher;

    public var composite_geometry : CompositeGeometry;

    @:isVar public var text     (default,set) : String = '';
    @:isVar public var textsize (default,set) : Float = 32;

    public var ready : Bool = false;
    public var text_options : Dynamic;


    public function new( _options : Dynamic ) {

            //pass off geometry properties up to super first
        _batcher = (_options.batcher == null) ? Luxe.renderer.default_batcher : _options.batcher;        

        if(_options.pos == null) {
            _options.pos = new Vector();
        }

        if(_options.color == null) {
            _options.color = new Color();
        }

        if(_options.depth == null) {
            _options.depth = 0;
        }

        if(_options.group == null) {
            _options.group = 0;
        }

        if(_options.enabled == null) {
            _options.enabled = true;
        }

        if(_options.visible != null) {
            _options.enabled = _options.visible;
        }

        text_options = _options;

        super({
            name : _options.name,
            no_scene : _options.no_scene,
            batcher : _batcher,
            color : _options.color,
            visible : _options.visible,
            pos : _options.pos,
            depth : _options.depth,
            group : _options.group,
            no_geometry : true
        });
             
    //font   
        var _font : Dynamic = (_options.font == null) ? null : _options.font;
            
        if(_font == null) _font = Luxe.renderer.default_font;

        textsize = (_options.size == null) ? 32 : _options.size;

        if(Std.is(_font, String)) {

                //fetch font path directly from the same path
            var _folder = haxe.io.Path.directory(_font) + '/';
                //create the font from the path + file name
            font = Luxe.loadFont( _font, _folder, onloaded );

        } else {

                //supplied a precreated font?            
            font = _font;
            ready = true;

        }
        
        text_options.size = textsize;

            //Apply the setter, which will draw the geometry
        text = _options.text;

    } //new

    @:noCompletion public function onloaded( font:BitmapFont ) {

        ready = true;
        text = text + '';

    } //onloaded

    override function set_pos(v:Vector) : Vector {
        
        pos = v.clone();
        text_options.pos = pos;
        
        super.set_pos(pos);     
        
        return pos;

    } //set_pos

    function set_textsize(v:Float) : Float {
        
        if(text_options != null) {
            textsize = v;        
            text_options.size = textsize;
            text = text+'';
        }
        
        return textsize;

    } //set_textsize

    override function set_color(c:Color) : Color {

        color = c;

        super.set_color(color);

        text_options.color = color;

        return color;

    } //set_color

    override function set_visible(b:Bool) : Bool {

        super.set_visible(b);

        text_options.enabled = visible;
        text_options.visible = visible;

        return visible;

    } //set_visible


    override function set_locked(l:Bool) : Bool {
        
        locked = l;
        
        super.set_locked(locked);

        text_options.locked = locked;

        return locked;

    } //set_locked

    function set_text( t:String ) {

        text = t;

        if(ready && text_options != null) {

            text_options.text = t;

                //clean up first
            if(geometry != null) {
                geometry.drop();
            }

                //make sure its cleared
            geometry = null;

                //now recreate the new text
            composite_geometry = font.draw_text(text_options);

                //now we apply the new info to the visual first
            origin  = composite_geometry.origin;
            pos     = composite_geometry.pos;
            locked  = composite_geometry.locked;
            visible = composite_geometry.enabled;

                //and then assign it
            ignore_texture_on_geometry_change = true;
                
                geometry = composite_geometry;

            ignore_texture_on_geometry_change = false;
            
        }

        return text;

    } //set_text



} //Text
