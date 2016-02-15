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
        public var letter_spacing (get,set) : Float;
            function get_letter_spacing() return geom.letter_spacing;
            function set_letter_spacing(_s) return geom.letter_spacing = _s;
        public var line_spacing (get,set) : Float;
            function get_line_spacing() return geom.line_spacing;
            function set_line_spacing(_s) return geom.line_spacing = _s;

        public var bounds (get,set) : Rectangle;
            function get_bounds() return geom.bounds;
            function set_bounds(_b) return geom.bounds = _b;
        public var bounds_wrap (get,set) : Bool;
            function get_bounds_wrap() return geom.bounds_wrap;
            function set_bounds_wrap(_b) return geom.bounds_wrap = _b;

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

    public function new( _options : TextOptions #if luxe_text_pos, ?_pos_info:haxe.PosInfos #end ) {

            //store for later
        text_options = _options;
        text_bounds = new Rectangle();

    	var _batcher : Batcher = null;
    	if(_options.no_batcher_add == null || _options.no_batcher_add == false) {
    		if(_options.batcher != null) {
    			_batcher = _options.batcher;
    		} else {
    			_batcher = Luxe.renderer.batcher;
    		}
    	}

            //create the text geometry
        geom = new TextGeometry({

                //render properties
            batcher: _batcher,
            depth : _options.depth,
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
            line_spacing: _options.line_spacing,
            letter_spacing: _options.letter_spacing,

            bounds : _options.bounds,
            bounds_wrap : _options.bounds_wrap,
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

        geom.emitter.on(EvTextGeometry.update_text, on_geom_text_update);

        _options.geometry = geom;
        _options.shader = geom.shader;

            //create the visual
        super(_options #if luxe_text_pos, _pos_info #end);
            //flush
        _update_bounds();

    } //new

//Public API

    public function point_inside( p:Vector ) {

        _update_bounds();
        return text_bounds.point_inside(p);

    } //point_inside

//Internal

    override function set_pos_from_transform( _p:Vector ) {

        super.set_pos_from_transform(_p);
        _update_bounds();
        text_options.pos = pos;

    } //set_pos_from_transform

//

        //:todo: This is being considered overall, for the best fit.
        //for now, for basic behavior that was there before, it'll do.
    @:noCompletion
    public var text_bounds : Rectangle;

    function on_geom_text_update(_) {
        _update_bounds();
    }

    @:noCompletion
    inline function _update_bounds() {

        var _x = pos.x;
        var _y = pos.y;
        var _tw = geom.text_width;
        var _th = geom.text_height;
        var _bw = geom.text_width;
        var _bh = geom.text_height;

        if(bounds != null) {
            _bh = bounds.h;
            _bw = bounds.w;
            _x = bounds.x;
            _y = bounds.y;

            _x += switch(align) {
                case center: _tw/2;
                case right: _tw;
                case _: 0.0;
            }

            _y += switch(align_vertical) {
                case center: (_bh/2)-(_th/2);
                case bottom: _bh - _th;
                case _: 0.0;
            }

        } else {

            _x -= switch(align) {
                case center: _tw/2;
                case right: _tw;
                case _: 0.0;
            }

            _y -= switch(align_vertical) {
                case center: _th/2;
                case bottom: _th;
                case _: 0.0;
            }

        } //bounds based

        text_bounds.set( _x, _y, _tw, _th );

    } //_update_bounds


    override public function ondestroy() {

        geom = null;
        text_options = null;
        text_bounds = null;
        
        super.ondestroy();

    }

} //Text
