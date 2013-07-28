
import MIControl;

class MIButton extends MIControl {
	
	public var label : MILabel;

	public function new(_options:Dynamic) {
			
			//create the base control
		super(_options);
			//create the label
		label = new MILabel(_options);
		label.name = name+'.label';
		
	}

}