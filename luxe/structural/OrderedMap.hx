package luxe.structural;

/**
    Copyright 2014-2016 Sven Bergström

    A simple ordered map implementation using a keys array

    Part of the structural library for haxe
    http://github.com/underscorediscovery/structural

    MIT License
*/

import Map;

@:generic
class OrderedMapIterator<K,V> {

    var map : OrderedMap<K,V>;
    var index : Int = 0;

    public inline function new(omap:OrderedMap<K,V>)
        map = omap;
    public inline function hasNext() : Bool
        return index < map._keys.length;
    public inline function next() : V
        return map.get( map._keys[index++] );

} //OrderedMapIterator

@:generic
class OrderedMap<K, V> implements IMap<K, V> {

    @:noCompletion public var map:Map<K, V>;
    var idx = 0;

    @:allow(luxe.structural.OrderedMapIterator)
    var _keys:Array<K>;

    public inline function new(_map) {
       _keys = [];
       map = _map;
    }

    public inline function set(key:K, value:V) {
        if (!map.exists(key)) _keys.push(key);
        map[key] = value;
    }

    public inline function toString() {
        var _ret = ''; var _cnt = 0; var _len = _keys.length;
        for(k in _keys) _ret += '$k => ${map.get(k)}${(_cnt++<_len-1?", ":"")}';
        return '{$_ret}';
    }

    public inline function iterator()          return new OrderedMapIterator<K,V>(this);
    public inline function remove(key)         return map.remove(key) && _keys.remove(key);
    public inline function exists(key)         return map.exists(key);
    public inline function get(key)            return map.get(key);
    public inline function keys()              return _keys.iterator();

} //OrderedMap
