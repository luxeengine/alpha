
import MIControl;
import luxe.Rectangle;
import luxe.Color;

class MIList extends MIControl {
	
	public var view : MIScrollArea;
	public var items : Array<MIControl>;

	public function new(_options:Dynamic) {
			
			//create the base control
		super(_options);
		view = new MIScrollArea({
			parent : this,
			bounds : _options.bounds.clone().set(0,0),
			name : name + '.view'
		});


	}

	public function add_item( _item:String ) {

		var _childbounds = view.children_bounds();

		var l = new MILabel({
			text : _item,
			bounds : new Rectangle(0, _childbounds.h, bounds.w, 30),			
			parent : view,
			color : new Color().rgb(0x999999),
			text_size : 18,
		});
		
	} //add_item

	public function add_items( _items:Array<String> ) {
		for(_item in _items) {
			add_item(_item);
		}
	} //add_items

	public override function onmousedown(e) {
		super.onmousedown(e);
	}
	public override function onmouseup(e) {
		super.onmouseup(e);
	}
}