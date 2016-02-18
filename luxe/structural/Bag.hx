package luxe.structural;


/**
    Copyright 2014-2016 Sven Bergström
    A simple generic linked list based Bag.

    Part of the structural library for haxe
    http://github.com/underscorediscovery/structural

    MIT license
*/

@:generic
class Bag<T> {

        /** The length of this stack. If 0, the stack is empty */
    @:isVar public var length (default, null) : Int = 0;

        /** The first node in the bag, or null if empty */
    public var root : BagNode<T>;

        /** construct a new bag */
    public function new() {

        root = null;
        length = 0;

    } //new

        /** Add an item to this bag */
    public function add( item:T ) : Void {

        var oldroot : BagNode<T> = root;

            root = new BagNode<T>();
            root.value = item;
            root.next = oldroot;

        ++length;

    } //add

        /** Convert the items in the bag to an array */
    public function toArray() : Array<T> {

        if(length == 0) {
            return [];
        }

            //start at the top of the bag
        var a : Array<T> = [];
        var current = root;

            while(current != null) {
                a.push( current.value );
                current = current.next;
            }

        return a;

    } //toArray

        /** create an iterator for the bag. Usable as `for(item in bag)` */
    public function iterator() : Iterator<T> {

        return toArray().iterator();

    } //iterator

} //Bag

private class BagNode<T> {

        /** the node value */
    public var value : T;
        /** The next node in the linked list */
    public var next : BagNode<T>;

    public function new() {}

} //BagNode
