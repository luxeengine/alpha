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
            'total resources : ' + resources + '\n' +
            'textures : ' + textures + '\n' +
            'fonts : ' + fonts + '\n' +
            'shaders : ' + shaders + '\n' +
            'unknown : ' + unknown;
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

	public function clear( and_drop : Bool ) {
		if( and_drop ) {
			for(res in resourcelist) {
				res.drop();
			}
		}

		resourcelist.splice(0, resourcelist.length );
		stats.reset();
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