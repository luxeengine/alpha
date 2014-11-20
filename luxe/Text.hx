package luxe;

import luxe.Rectangle;
import luxe.Vector;
import luxe.Visual;
import luxe.options.VisualOptions;
import luxe.options.TextOptions;

import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.geometry.TextGeometry;

typedef TextAlign = phoenix.BitmapFont.TextAlign;

class Text extends Visual {

        public var geom : TextGeometry;

    //regular font stuff

        public var text (get,set) : String;
            function get_text() return geom.text;
            function set_text(_s) return geom.text = _s;
        public var font (get,set) : BitmapFont;
            function get_font() return geom.font;
            function set_font(_f) return geom.font = _f;
        public var point_size (get,set) : Float;
            function get_point_size() return geom.point_size;
            function set_point_size(_s) return geom.point_size = _s;
        public var align (get,set) : TextAlign;
            function get_align() return geom.align;
            function set_align(_a) return geom.align = _a;
        public var align_vertical (get,set) : TextAlign;
            function get_align_vertical() return geom.align_vertical;
            function set_align_vertical(_a) return geom.align_vertical = _a;

    //distance field specific

        public var sdf (get,set) : Bool;
            function get_sdf() return geom.sdf;
            function set_sdf(_s) return geom.sdf = _s;

        public var smoothness (get,set) : Float;
            function get_smoothness() return geom.smoothness;
            function set_smoothness(_s) return geom.smoothness = _s;
        public var thickness (get,set) : Float;
            function get_thickness() return geom.thickness;
            function set_thickness(_t) return geom.thickness = _t;

        public var outline (get,set) : Float;
            function get_outline() return geom.outline;
            function set_outline(_o) return geom.outline = _o;
        public var outline_color (get,set) : Color;
            function get_outline_color() return geom.outline_color;
            function set_outline_color(_c) return geom.outline_color = _c;

        public var glow_threshold (get,set) : Float;
            function get_glow_threshold() return geom.glow_threshold;
            function set_glow_threshold(_s) return geom.glow_threshold = _s;
        public var glow_amount (get,set) : Float;
            function get_glow_amount() return geom.glow_amount;
            function set_glow_amount(_e) return geom.glow_amount = _e;
        public var glow_color (get,set) : Color;
            function get_glow_color() return geom.glow_color;
            function set_glow_color(_c) return geom.glow_color = _c;

    public var text_options : TextOptions;

    public function new( _options : TextOptions ) {

            //store for later
        text_options = _options;

        var _batcher = (_options.batcher == null) ? Luxe.renderer.batcher : _options.batcher;

            //create the text geometry
        geom = new TextGeometry({

                //render properties
            batcher: _batcher,
            depth : _options.depth,
            group : _options.group,
            visible : _options.visible,
            immediate : _options.immediate,
                //transform properties
            // pos : _options.pos,
            // rotation : _options.rotation,
            // scale : _options.scale,
            // origin : _options.origin,
                //geometry specific
            color : _options.color,
            shader : _options.shader,
            texture : _options.texture,
                //text geometry specific
            text: _options.text,
            font: _options.font,
            point_size: _options.point_size,

            bounds : _options.bounds,
            align : _options.align,
            align_vertical : _options.align_vertical,

            sdf: _options.sdf,
            smoothness: _options.smoothness,
            thickness: _options.thickness,

            outline: _options.outline,
            outline_color: _options.outline_color,

            glow_threshold: _options.glow_threshold,
            glow_amount: _options.glow_amount,
            glow_color: _options.glow_color

        });


        _options.geometry = geom;
        _options.shader = geom.shader;

            //create the visual
        super(_options);

        // trace(shader);
        // trace(geom.shader);

    } //new

    public function point_inside( p:Vector ) {

        return false;

    } //point_inside

    override function set_pos_from_transform( _p:Vector ) {

        super.set_pos_from_transform(_p);
        text_options.pos = pos;

    } //set_pos_from_transform

} //Text
