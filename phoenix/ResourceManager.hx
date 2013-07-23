package phoenix;

import phoenix.BitmapFont;
import phoenix.Resource;
import phoenix.Shader;
import phoenix.Texture;

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
		//cache lists for creating
	public var textures : Map<String,Texture>;
	public var shaders : Map<String,Shader>;
	public var fonts : Map<String,BitmapFont>;

	public var stats : ResourceStats;

	public function new() {
		resourcelist = new Array<Resource>();
		textures = new Map();
		fonts = new Map();
		shaders = new Map();
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
		resourcelist.remove(res);
		uncache(res);

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

	public function uncache(res:Resource) {
		switch (res.type) {
			case ResourceType.texture:
				textures.remove(res.id);
			case ResourceType.font:
				fonts.remove(res.id);
			case ResourceType.shader:
				shaders.remove(res.id);
			case ResourceType.unknown:
		}		
	}

	public function cache(res:Resource) {
		switch (res.type) {
			case ResourceType.texture:
				textures.set(res.id, cast res);
			case ResourceType.font:
				fonts.set(res.id, cast res);
			case ResourceType.shader:
				shaders.set(res.id, cast res);
			case ResourceType.unknown:
		}
	}

	public function find_texture( _name:String ) {
        return textures.get(_name);
    }
	public function find_shader( _name:String ) {
        return shaders.get(_name);
    }
	public function find_font( _name:String ) {
        return fonts.get(_name);
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