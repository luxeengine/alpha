
package luxe.structural;

//This class is part of the haxe Structural library,
//https://github.com/underscorediscovery/structural

// See http://algs4.cs.princeton.edu/home/

// A generic bag or multiset, implemented using a linked list.
//      A bag is a collection where removing items is not supported.
//      Its purpose is to provide the ability to collect items and
//      then to iterate through the collected items.

class Bag<T> {

    @:isVar public var length (default, null) : Int = 0;
    @:isVar public var empty (get, null) : Bool = true;

    var first : BagNode<T>;

    public function new() {
        first = null;
        empty = true;
        length = 0;
    } //new

        //getter
    function get_empty() {
        return first == null;
    } //empty

    public function size() : Int {
        return length;
    } //size

    public function add( item:T ) : Void {

        var oldfirst : BagNode<T> = first;

            first = new BagNode<T>();
            first.item = item;
            first.next = oldfirst;

        ++length;
    } //add

    public function iterator() : Iterator<T> {
        return toArray().iterator();
    } //iterator

    public function toArray() : Array<T> {

        if(empty) return [];
            //start at the top of the bag
        var a : Array<T> = [];
        var current = first;
        while(current != null) {
            a.push( current.item );
            current = current.next;
        }

        return a;

    } //toArray

} //Bag

private class BagNode<T> {
    public var item : T;
    public var next : BagNode<T>;
    public function new() {}
}