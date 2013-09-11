package luxe;

import phoenix.geometry.LineGeometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.RectangleGeometry;
import phoenix.geometry.CircleGeometry;
import phoenix.Batcher;
import phoenix.geometry.RingGeometry;

class Draw {

    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    private function default_options(options:Dynamic) {

        options.font = (options.font == null) ? Luxe.renderer.default_font : options.font;
        options.color = (options.color == null) ? new Color() : options.color;
        options.depth = (options.depth == null) ? 0 : options.depth;
        options.group = (options.group == null) ? 0 : options.group;
        options.immediate = (options.immediate == null) ? false : options.immediate;
        options.batcher = (options.batcher == null)  ? Luxe.renderer.default_batcher : options.batcher;
        options.pos = (options.pos == null)  ? new Vector() : options.pos;

            //return
        return options;
    }

    public function line(options:Dynamic) {

    	if(options.p0 == null) throw "draw.line requires p0:Vector, and p1:Vector";
    	if(options.p1 == null) throw "draw.line requires p0:Vector, and p1:Vector";
    	
    	options = default_options(options);

    	var _line = new LineGeometry(options);

    	options.batcher.add(_line);

    	return _line;

    } // line

    public function box(options:Dynamic) {
        
        options = default_options(options);

        var _box = new QuadGeometry(options);

           options.batcher.add(_box);

        return _box;

    } //box

    public function rectangle(options:Dynamic) {

        options = default_options(options);

    	var _rect = new RectangleGeometry(options);

    	   options.batcher.add(_rect);

    	return _rect;
    	
    } //rectangle

    public function text(options:Dynamic) {

        options = default_options(options);

        var _text = options.font.draw_text(options);  

        return _text;
    } //text


    public function ring(options:Dynamic) {

        options = default_options(options);

        var _ring = new RingGeometry(options);

            options.batcher.add(_ring);

        return _ring;

    } //ring

    public function circle(options:Dynamic) {

        options = default_options(options);

        var _circle = new CircleGeometry(options);

            options.batcher.add(_circle);

        return _circle;
    } //circle

}

