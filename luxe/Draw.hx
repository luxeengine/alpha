package luxe;

import phoenix.geometry.LineGeometry;
import phoenix.geometry.RectangleGeometry;
import phoenix.Batcher;

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

    public function rectangle(options:Dynamic) {

        options = default_options(options);

    		//the batcher

    	var _rect = new RectangleGeometry(options);

    	options.batcher.add(_rect);

    	return _rect;
    	
    } //rectangle

    public function text(options:Dynamic) {

        options = default_options(options);

        var _text = options.font.draw_text(options);        

        return _text;
    }

}

