package phoenix;

import phoenix.Resource;

class ResourceManager {
	
	public var resourcelist : Array<Resource>;

	public function new() {
		resourcelist = new Array<Resource>();
	}

	public function add( res:Resource ) {
		resourcelist.push(res);
	}

	public function remove( res:Resource ) {
		resourcelist.push(res);
	}

	public function clear( and_drop : Bool ) {
		if( and_drop ) {
			for(res in resourcelist) {
				res.drop();
			}
		}

		resourcelist.splice(0, resourcelist.length );
	}

	public function find( id : String ) : Resource {
		for(resource in resourcelist) {
			if(resource.id == id) {
				return resource.grab();
			}
		}
		return null;
	}

	
}