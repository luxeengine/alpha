
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Heap</h1>
<small>`luxe.structural.Heap`</small>

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

---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="length"><a class="lift" href="#length">length</a></a><code class="signature apipage">length : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="getFront"><a class="lift" href="#getFront">getFront</a></a><code class="signature apipage">getFront() : Null</code><br/><span class="small_desc_flat">The heap's front item.</span>
        </span>
    <span class="method apipage">
            <a name="getMaxSize"><a class="lift" href="#getMaxSize">getMaxSize</a></a><code class="signature apipage">getMaxSize() : Int</code><br/><span class="small_desc_flat">The heap's maximum capacity.</span>
        </span>
    <span class="method apipage">
            <a name="enqueue"><a class="lift" href="#enqueue">enqueue</a></a><code class="signature apipage">enqueue(obj:Null<span></span>) : Bool</code><br/><span class="small_desc_flat">Enqueues an object. Returns false if the hash is full, otherwise true.</span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><code class="signature apipage">reset() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dequeue"><a class="lift" href="#dequeue">dequeue</a></a><code class="signature apipage">dequeue() : Null</code><br/><span class="small_desc_flat">Dequeues and returns the front item. If the hash is empty, this returns
        null.</span>
        </span>
    <span class="method apipage">
            <a name="contains"><a class="lift" href="#contains">contains</a></a><code class="signature apipage">contains(obj:Null<span></span>) : Bool</code><br/><span class="small_desc_flat">Checks if a given item exists in the heap</span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><code class="signature apipage">clear() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a><code class="signature apipage">iterator() : Iterator</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="isEmpty"><a class="lift" href="#isEmpty">isEmpty</a></a><code class="signature apipage">isEmpty() : Bool</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><code class="signature apipage">toArray() : Array</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : String</code><br/><span class="small_desc_flat">Prints out a string representing the current object.
        Example: "[Heap, max_size=4]"</span>
        </span>
    <span class="method apipage">
            <a name="dump"><a class="lift" href="#dump">dump</a></a><code class="signature apipage">dump() : String</code><br/><span class="small_desc_flat">Prints out all elements (for debug/demo purposes).</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_size:Int<span></span>, \_compare:<span></span>) : Void</code><br/><span class="small_desc_flat">Initializes a new heap.
        [size] is the heap's maximum capacity.
        [compare] is a comparison function for sorting the heap's data.</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;