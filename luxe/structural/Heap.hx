package luxe.structural;

/**
* Copyright (c) 2008 Chase Kernan, Laurence Taylor
* chase.kernan@gmail.com, polysemantic@gmail.com
* Based off of Michael Baczynski's as3ds project, http://www.polygonal.de.
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
**/

/**
    A heap is a special kind of binary tree in which every node is greater
    than all of its children. The implementation is based on an arrayed
    binary tree. It can be used as an efficient priority queue.
**/

class Heap<T> {
    
    public var length(get, never) : Int;
    
    private var heap : Array<Null<T>>;
    private var size : Int;
    private var count : Int;
    private var compare : Null<T> -> Null<T> -> Float;
    
    /**
        Initializes a new heap. 
        [size] is the heap's maximum capacity.
        [compare] is a comparison function for sorting the heap's data. 
    **/
    public function new( _size : Int, _compare : Null<T> -> Null<T> -> Float ) {

        size = _size + 1;
        count = 0;
        heap = [];

        for( i in 0 ... size ) {
            heap.push( null );
        }
                        
        compare = _compare;

    } //new

    /**
        The heap's front item.
    **/
    public function getFront(): Null<T> {
        return heap[1];
    }
    
    /**
        The heap's maximum capacity.
    **/
    public function getMaxSize() : Int {
        return size;
    }
    
    /**
        Enqueues an object. Returns false if the hash is full, otherwise true.
    **/
    public function enqueue(obj : Null<T>) : Bool {

        if (count + 1 < size) {
            heap[++count] = obj;
                                
            var i = count;
            var parent = i >> 1;
            var tmp = heap[i];
                                
            while (parent > 0) {
                var v = heap[parent];
                
                if (compare(tmp, v) > 0) {
                    heap[i] = v;
                    i = parent;
                    parent >>= 1;
                } else {
                    break;
                }
            }
            
            heap[i] = tmp;
            return true;
        } else {
            return false;
        }

    }
        
        //re enqueue existing items (update all)
    public function reset() {
        
        var items = toArray();
        
            clear();

        for(n in items) {
            enqueue(n);
        }

    }
    /**
        Dequeues and returns the front item. If the hash is empty, this returns
        null.
    **/
    public function dequeue() : Null<T> {
        if (count >= 1) {
            var o = heap[1];
                                
            heap[1] = heap[count];
            heap[count] = null;
                                
            var i = 1;
            var child = i << 1;
            var tmp = heap[i];
                                
            while (child < count) {
                if (child < count - 1) {
                    if (compare(heap[child], heap[child + 1]) < 0) child++;
                }
                
                var v = heap[child];
                if (compare(tmp, v) < 0) {
                    heap[i] = v;
                    i = child;
                    child <<= 1;
                } else {
                    break;
                }
            }
            
            heap[i] = tmp;
                                
            count--;
            return o;
        }
        
        return null;
    }
    
    /**
        Checks if a given item exists in the heap
    **/
    public function contains(obj : Null<T>) : Bool {
        for (i in 1...(count + 1)) {
            if (heap[i] == obj) return true;
        }
        
        return false;
    }
                
    public function clear() {
        heap = new Array();
        for (i in 0...size) heap.push(null);
        count = 0;
    }
                
    public function iterator() : Iterator<Null<T>> {
        return toArray().iterator();
    }
    
    private function get_length() : Int {
        return count;
    }
    

    public function isEmpty() : Bool {
        return count == 0;
    }
                
    public function toArray() : Array<Null<T>> {
        return heap.slice(1, count + 1);
    }
                
    /**
        Prints out a string representing the current object.
        Example: "[Heap, max_size=4]"
    **/
    public function toString() : String {
        return "[Heap, max_size=" + Std.string(size) +"]";
    }
                
    /**
        Prints out all elements (for debug/demo purposes).
    **/
    public function dump() : String {
        var s = "Heap\n{\n";
        
        for (i in 1...(count + 1)) s += "\t" + heap[i] + "\n";
        
        s += "}";
        return s;
    }
}