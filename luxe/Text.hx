package luxe;

import luxe.Rectangle;
import luxe.Vector;
import luxe.Visual;

import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.geometry.CompositeGeometry;

typedef TextAlign = phoenix.BitmapFont.TextAlign;

class Text extends Visual {

    public var font : BitmapFont;
    var _batcher : Batcher;

    public var composite_geometry : CompositeGeometry;

    @:isVar public var text     (default,set) : String = '';
    @:isVar public var textsize (default,set) : Float = 32;

    public var ready : Bool = false;
    public var text_options : Dynamic;


    public function new( _options : Dynamic ) {

        _batcher = (_options.batcher == null) ? Luxe.renderer.batcher : _options.batcher;

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

        if(_options.visible == null) {
            _options.visible = true;
        }

        text_options = _options;

        super({
            name : _options.name,
            no_scene : _options.no_scene,
            batcher : _batcher,
            color : _options.color,
            parent : _options.parent,
            visible : _options.visible,
            // pos : _options.pos,
            depth : _options.depth,
            group : _options.group,
            no_geometry : true
        });

    //font
        var _font : Dynamic = (_options.font == null) ? null : _options.font;

        if(_font == null) _font = Luxe.renderer.font;

        textsize = (_options.size == null) ? 24 : _options.size;

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

    var size_rect_cache : Rectangle;
    var dim_cache : Vector;

    public function point_inside( p:Vector ) {

        if(font == null) {
            return false;
        }

        if(!ready) {
            return false;
        }

        if(size_rect_cache == null) {
            dim_cache = new Vector();
            size_rect_cache = new Rectangle();
        }

        font.dimensions(text, text_options.size, dim_cache);

            size_rect_cache.x = pos.x-(dim_cache.x / 2);
            size_rect_cache.y = pos.y;
            size_rect_cache.w = dim_cache.x;
            size_rect_cache.h = dim_cache.y;

        return size_rect_cache.point_inside(p);

    } //point_inside

    @:noCompletion public function onloaded( font:BitmapFont ) {

        ready = true;
        text = text + '';

    } //onloaded

    override function set_pos_from_transform( _p:Vector ) {

        super.set_pos_from_transform(_p);
        text_options.pos = pos;

    } //set_pos_from_transform


    function set_textsize(v:Float) : Float {

        if(text_options != null) {
            textsize = v;
            text_options.size = textsize;
            text = text+'';
        }

        return textsize;

    } //set_textsize

    override function set_color(c:Color) : Color {

        super.set_color(c);

        text_options.color = color;

        return color;

    } //set_color

    override function set_visible(b:Bool) : Bool {

        super.set_visible(b);

        text_options.visible = visible;

        return visible;

    } //set_visible


    override function set_locked(l:Bool) : Bool {

        super.set_locked(l);

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
            composite_geometry = null;

                //now recreate the new text
            composite_geometry = font.draw_text(text_options);

                //now we apply the new info to the visual first
            origin  = composite_geometry.transform.origin.clone();
            pos     = composite_geometry.transform.pos.clone();
            locked  = composite_geometry.locked;
            visible = composite_geometry.visible;

                // since the transform of the visual manages the position, origin
                // the geometry cannot have it as well, this would apply it twice
            composite_geometry.transform.origin = new Vector();
            composite_geometry.transform.pos = new Vector();

                //and then assign it
            ignore_texture_on_geometry_change = true;

                geometry = composite_geometry;

            ignore_texture_on_geometry_change = false;

        }

        return text;

    } //set_text



} //Text
