
import MIControl;

class MIButton extends MIControl {
	
	public var label : MILabel;

	public function new(_options:Dynamic) {
			
			//create the base control
		super(_options);
			//buttons can be clicked
		mouse_enabled = true;
			//create the label
		label = new MILabel(_options);
		label.name = name+'.label';
		
		if(_options.onclick != null) {
			mousedown = _options.onclick;
		}
		
	}

	public override function onmousedown(e) {
		super.onmousedown(e);
	}
	public override function onmouseup(e) {
		super.onmouseup(e);
	}
}