
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#Heap

* Copyright (c) 2008 Chase Kernan, Laurence Taylor\n* chase.kernan@gmail.com, polysemantic@gmail.com\n* Based off of Michael Baczynski's as3ds project, http://www.polygonal.de.\n*\n* Permission is hereby granted, free of charge, to any person\n* obtaining a copy of this software and associated documentation\n* files (the "Software"), to deal in the Software without\n* restriction, including without limitation the rights to use,\n* copy, modify, merge, publish, distribute, sublicense, and/or sell\n* copies of the Software, and to permit persons to whom the\n* Software is furnished to do so, subject to the following\n* conditions:\n* \n* The above copyright notice and this permission notice shall be\n* included in all copies or substantial portions of the Software.\n* \n* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,\n* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES\n* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND\n* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT\n* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,\n* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING\n* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR\n* OTHER DEALINGS IN THE SOFTWARE.

---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><code class="signature apipage">clear() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="contains"><a class="lift" href="#contains">contains</a></a><code class="signature apipage">contains(obj:<span>[Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.Heap.T](#luxe.structural.Heap.T)&gt;</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Checks if a given item exists in the heap</span>
        </span>
    <span class="method apipage">
            <a name="dequeue"><a class="lift" href="#dequeue">dequeue</a></a><code class="signature apipage">dequeue() : [Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.Heap.T](#luxe.structural.Heap.T)&gt;</code><br/><span class="small_desc_flat">Dequeues and returns the front item. If the hash is empty, this returns\n        null.</span>
        </span>
    <span class="method apipage">
            <a name="dump"><a class="lift" href="#dump">dump</a></a><code class="signature apipage">dump() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Prints out all elements (for debug/demo purposes).</span>
        </span>
    <span class="method apipage">
            <a name="enqueue"><a class="lift" href="#enqueue">enqueue</a></a><code class="signature apipage">enqueue(obj:<span>[Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.Heap.T](#luxe.structural.Heap.T)&gt;</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Enqueues an object. Returns false if the hash is full, otherwise true.</span>
        </span>
    <span class="method apipage">
            <a name="getFront"><a class="lift" href="#getFront">getFront</a></a><code class="signature apipage">getFront() : [Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.Heap.T](#luxe.structural.Heap.T)&gt;</code><br/><span class="small_desc_flat">The heap's front item.</span>
        </span>
    <span class="method apipage">
            <a name="getMaxSize"><a class="lift" href="#getMaxSize">getMaxSize</a></a><code class="signature apipage">getMaxSize() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">The heap's maximum capacity.</span>
        </span>
    <span class="method apipage">
            <a name="isEmpty"><a class="lift" href="#isEmpty">isEmpty</a></a><code class="signature apipage">isEmpty() : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a><code class="signature apipage">iterator() : [Iterator]()&lt;[Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.Heap.T](#luxe.structural.Heap.T)&gt;&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_size:<span>[Int](http://api.haxe.org/Int.html)</span>, \_compare:<span>[Null-&gt;Null-&gt;Float]()</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Initializes a new heap. \n        [size] is the heap's maximum capacity.\n        [compare] is a comparison function for sorting the heap's data.</span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><code class="signature apipage">reset() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><code class="signature apipage">toArray() : [Array](http://api.haxe.org/Array.html)&lt;[Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.Heap.T](#luxe.structural.Heap.T)&gt;&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Prints out a string representing the current object.\n        Example: "[Heap, max_size=4]"</span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="length"><a class="lift" href="#length">length</a></a><code class="signature apipage">length : [Int]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;