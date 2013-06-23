package phoenix;

import phoenix.Resource;

class ResourceManager extends AbstractGarbageCollector {
	
	public var recyclelist : Array<Resource>;
	public var resourcelist : Array<Resource>;

	public function new() {
		resourcelist = new Array<Resource>();
		recyclelist = new Array<Resource>();
	}

	public function add( res:Resource ) {
		resourcelist.push(res);
	}

	public function remove( res:Resource ) {
		recyclelist.push(res);
	}

	public function clear( and_drop : Bool ) {
		if( and_drop ) {
			for(res in recyclelist) {
				res.drop();
			}
		}

		recyclelist.splice(0, recyclelist.length);
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

	public override function clean() {

			//no point if there are no recycled objects
		if(recyclelist.length < 1) return;

			//work out how many based on collection rate
		var multiplier : Int = Std.int(recyclelist.length / collect_rate);
    	if( multiplier < collect_rate ) {
    		multiplier = collect_rate;
    	}
		
			//for each in the collection
		for( i in 0 ... multiplier ) {

				//if there is anything left to recycle
			if( recyclelist.length > 0  ) {
					
					//get the back item
				var r : Resource = recyclelist[recyclelist.length-1];
					//check if it exists
				if( r != null ) {
						//remove it from the resources list
					resourcelist.remove( r );
				}

					//remove it from the recycle list
				recyclelist.pop();

			} else {
					//nothing to do, so jump out
				break;
			}
		}

	} //clean

}