package luxe.structural;


/**
    Copyright 2014-2016 Sven Bergström
    A simple cyclic cache with create callback

    Part of the structural library for haxe
    http://github.com/underscorediscovery/structural

    MIT license
*/

@:generic
class Cache<T> {

        /** The size of the cache. */
    public var length : Int = 0;
        /** The items in the cache. */
    public var items : Array<T>;
        /** The current index in the cache. */
    public var index : Int = 0;

    var precache : Bool = true;
    var _create : Int -> Int -> T;

        /** Create a new cache with fixed size,
            on_create callback and cache flag.
            By default pre_create is true. */
    public function new( cache_size:Int, create_callback:Int->Int->T, pre_create:Bool = true ){

        items = [];
        length = cache_size;
        precache = pre_create;
        _create = create_callback;

        if(precache) {
            for(i in 0 ... length) {
                items.push( _create(i, length) );
            }
        } //if precache

    } //new

        /** Get the next available item from the cache.
            It will be created if needed, or returned from the cache.
            If the cache max has been reached the cache will wrap around to the oldest item in the cache. */
    public function get() : T {

            //we want to make sure that we are creating items that don't exist to the max
        if(!precache && items.length < length) {
            items.push( _create(index, length) );
        }

        var _item = items[index];

            //after, increase the index, so that the index is always
            //on the next free one. In other words list[index]
            //is the next one, not the last used one
        index++;
        if(index > length-1) {
            index = 0;
        }

        return _item;

    } //get


} //Cache
