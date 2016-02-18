package luxe.structural;


/**
    Copyright 2014-2016 Sven Bergström
    A simple generic linked list based Stack.

    Part of the structural library for haxe
    http://github.com/underscorediscovery/structural

    MIT license
*/

@:generic
class Stack<T> {

        /** The length of this stack. If 0, the stack is empty */
    @:isVar public var length (default, null) : Int = 0;
        /** The first node in the stack, or null if empty */
    public var root : StackNode<T>;

    public function new() {

        root = null;
        length = 0;

    } //new

        /** Push a node onto the back of the queue. node cannot be null */
    public function push( node:Null<T> ) {

        if(node == null) {
            throw "This Stack<T> class does not hold null nodes";
        }

        var oldroot = root;

        root = new StackNode<T>();

            root.value = node;
            root.next = oldroot;

        length++;

    } //push

        /** Pop the back item off the stack. If the queue is empty, returns null */
    public function pop() : Null<T> {

        if(length == 0) {
            return null;
        }

        var node = root.value;
            root = root.next;

        --length;

        return node;

    } //pop

        /** Return the top item of the stack, or null if empty */
    public function top() : Null<T> {

        if(length == 0) {
            return null;
        }

        return root.value;

    } //top

        /** Convert the items in the stack to an array */
    public function toArray() : Array<T> {

        if(length == 0) {
            return [];
        }

            //start at the top of the stack
        var a : Array<T> = [];
        var current = root;

            while(current != null) {
                a.push( current.value );
                current = current.next;
            }

        return a;

    } //toArray

        /** create an iterator for the stack. Usable as `for(item in stack)` */
    public function iterator() : Iterator<T> {

        return toArray().iterator();

    } //iterator

} //Stack

    /** A single stack node holding */
class StackNode<T> {

        /** the node value */
    public var value : Null<T>;
        /** The next node in the linked list */
    public var next : StackNode<T>;

    public function new() {}

} //StackNode
