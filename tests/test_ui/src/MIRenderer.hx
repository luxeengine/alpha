package ;


class MIRenderer {
	
	public var canvas 	: MICanvasRenderer;
	public var label 	: MILabelRenderer;

	public function new() {
		//this should stay blank to not needlessly create instances
	} //new

} //MIRenderer

class MICanvasRenderer {
	public function new(){}
	public function init( _canvas:MICanvas, _options:Dynamic ) { } //init
	public function translate( _canvas:MICanvas, _x:Float, _y:Float ) { } //translate
} //MICanvasRenderer

class MILabelRenderer {
	public function new(){}
	public function init( label:MILabel, _options:Dynamic ) { } //init
	public function translate( label:MILabel, _x:Float, _y:Float ) { } //translate
} //MILabelRenderer

