package phoenix;

import phoenix.Droppable;
import phoenix.ResourceManager;
	

enum ResourceType {
	unknown;
	texture;
	render_texture;
	font;
	shader;
}

class Resource extends Droppable {
	
	public var manager : ResourceManager;
	public var type : ResourceType;
	public var id : String;
	public var persistent : Bool = false;
	public var time_to_load : Float = 0;
	public var time_created : Float = 0;

	public function new( _manager : ResourceManager, _type:ResourceType, ?_load_time:Float ) {
		manager = _manager == null ? Luxe.resources : _manager;
		type = _type;
		
		time_to_load = _load_time;
		time_created = haxe.Timer.stamp();

		manager.add( this );
	}

	public override function drop() {
		if(!dropped) {
			super.drop();
			manager.remove( this );
		}
	}

}