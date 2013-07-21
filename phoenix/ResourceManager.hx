package phoenix;

import phoenix.Resource;

class ResourceStats {
    public function new(){}
    public var resources : Int = 0;
    public var fonts : Int = 0;
    public var textures : Int = 0;
    public var shaders : Int = 0;
    public var unknown : Int = 0;
    public function toString() {
        return 
        	'Resource Statistics\n' + 
            '\ttotal resources : ' + resources + '\n' +
            '\ttextures : ' + textures + ' \n' + '' +
            '\tfonts : ' + fonts + '\n' +
            '\tshaders : ' + shaders + '\n' +
            '\tunknown : ' + unknown;
    }

    public function reset() {
		resources = 0;
    	fonts = 0;
    	textures = 0;
    	shaders = 0;
    	unknown = 0;
    }
}

class ResourceManager {
	
	public var resourcelist : Array<Resource>;
	public var stats : ResourceStats;

	public function new() {
		resourcelist = new Array<Resource>();
		stats = new ResourceStats();
	}

	public function add( res:Resource ) {
		resourcelist.push(res);
		switch (res.type) {
			case ResourceType.texture:
				stats.textures++;
			case ResourceType.font:
				stats.fonts++;
			case ResourceType.shader:
				stats.shaders++;
			case ResourceType.unknown:
				stats.unknown++;
		}
		stats.resources++;
	}

	public function remove( res:Resource ) {
		resourcelist.push(res);
		switch (res.type) {
			case ResourceType.texture:
				stats.textures--;
			case ResourceType.font:
				stats.fonts--;
			case ResourceType.shader:
				stats.shaders--;
			case ResourceType.unknown:
				stats.unknown--;
		}
		stats.resources--;
	}

	public function clear( ?and_persistent : Bool = false ) {
		
		var keep = [];
		for(res in resourcelist) {
			if(!res.persistent || and_persistent) {
				res.drop();		
			} else {
				keep.push(res);
			}
		}

			//kill everything, and readd them
			//will reset the counters for internal data
		resourcelist.splice(0,resourcelist.length);
		resourcelist = new Array<Resource>();
		stats.reset();

			//readd
		for(res in keep) {
			add(res);
		}

		keep = null;
	}

	public function find( id : String ) : Resource {
		for(resource in resourcelist) {
			if(resource.id == id) {
				return resource;
			}
		}
		return null;
	}

	
}