package luxe.structural;

class Pool<T> {

	public var length : Int = 0;
	public var items : Array<T>;
	public var index : Int = 0;

	var precache : Bool = true;
	var _create : Int -> Int -> T;

	public function new( pool_size:Int, create_callback:Int->Int->T, _precache:Bool = true ){

		length = pool_size;	
		precache = _precache;
		items = [];
		_create = create_callback;

		if(precache) {
			for(i in 0 ... length) {
		 		items.push( _create(i, length) );
			}
		} //if precache

	} //new

	public function get() : T {		
		
		// trace("fetching " + index);

			//we want to make sure that we are creating items that don't exist to the max
		if(!precache && items.length < length) {
				//need to add a new one, so request it
			items.push( _create(index, length) );
		}

		var _item = items[index];
			
			//after, increase the index, so that the index is always
			//on the next free one. In other words list[index] is the next one, not the last used one
		index++;
		if(index > length-1) {
			index = 0;
		}

		// trace("now at " + index);

		return _item;

	} //get


} //Pool