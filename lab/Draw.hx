package lab;

import phoenix.geometry.LineGeometry;
import phoenix.geometry.RectangleGeometry;
import phoenix.Batcher;

class Draw {

    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public function line(options:Dynamic) {

    	if(options.p0 == null) throw "draw.line requires p0:Vector, and p1:Vector";
    	if(options.p1 == null) throw "draw.line requires p0:Vector, and p1:Vector";
    	
    	options.color = 	(options.color == null) 	? new Color() : options.color;
    	options.depth = 	(options.depth == null) 	? 0 : options.depth;
    	options.group = 	(options.group == null) 	? 0 : options.group;
    		//the batcher
    	var _batcher : Batcher = (options.batcher == null) 	? Lab.renderer.default_batcher : options.batcher;

    	var _line = new LineGeometry(options);
    	_batcher.add(_line);

    	return _line;

    } // line

    public function rectangle(options:Dynamic) {

    	options.color = (options.color == null) ? new Color() : options.color;
    	options.depth = (options.depth == null) ? 0 : options.depth;
    	options.group = (options.group == null) ? 0 : options.group;
    	options.immediate = (options.immediate == null) ? false : options.immediate;

    		//the batcher
    	var _batcher : Batcher = (options.batcher == null) 	? Lab.renderer.default_batcher : options.batcher;

    	var _rect = new RectangleGeometry(options);
    	_batcher.add(_rect);

    	return _rect;
    	
    } //rectangle

}

