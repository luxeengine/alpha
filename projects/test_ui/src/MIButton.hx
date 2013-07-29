
import MIControl;

class MIButton extends MIControl {
	
	public var label : MILabel;

	public function new(_options:Dynamic) {
			
			//create the base control
		super(_options);
			//buttons can be clicked
		mouse_enabled = true;
			//create the label
		label = new MILabel({
			parent : this,
			bounds : _options.bounds.clone().set(0,0),
			text:_options.text,
			text_size:_options.text_size,
			name : name + '.label'
		});

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