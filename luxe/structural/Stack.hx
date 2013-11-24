package luxe.structural;

class Stack<T> {

        //only editable by this class, gettable anywhere
	@:isVar public var length (default, null) : Int = 0;

	public var first : StackNode<T>;

	public function new() {
		first = null;
		length = 0;
	} //new

	public function empty() {
		return first == null;
	} //empty

	public function push( element:T ) {

		if(element==null) throw "This Stack does not hold null elements.";

		var oldfirst : StackNode<T> = first;

        first = new StackNode<T>();

        	first.item = element;
        	first.next = oldfirst;

        length++;

	} //push

	public function pop() : T {
        if (empty()) throw "Stack underflow";
        
        var element : T = first.item;
        	first = first.next;
        
        length--;

        return element;
    } //pop

    public function top() : T {
        if (empty()) return null;
        return first.item;
    } //top

    public function iterator() : Iterator<T> {
    	return toArray().iterator();
    } //iterator

    public function toArray() : Array<T> {
    	
    	if(empty()) return [];
    		//start at the top of the stack
    	var a : Array<T> = [];
    	var current = first;
    	while(current != null) {
    		a.push( current.item );
    		current = current.next;
    	}

    	return a;

    } //toArray

}


class StackNode<T> {
	public var item : T;
	public var next : StackNode<T>;
    public function new() {}
}