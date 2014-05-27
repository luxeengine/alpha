
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#BinarySearchTree



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="compare"><a class="lift" href="#compare">compare</a></a><code class="signature apipage">compare : [luxe.structural.BinarySearchTree.K-&gt;luxe.structural.BinarySearchTree.K-&gt;Int](#luxe.structural.BinarySearchTree.K->luxe.structural.BinarySearchTree.K->Int)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="root"><a class="lift" href="#root">root</a></a><code class="signature apipage">root : [luxe.structural.BinarySearchTreeNode](#luxe.structural.BinarySearchTreeNode)&lt;[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K), [luxe.structural.BinarySearchTree.T](#luxe.structural.BinarySearchTree.T)&gt;</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="ceil"><a class="lift" href="#ceil">ceil</a></a><code class="signature apipage">ceil(\_key:<span>[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="contains"><a class="lift" href="#contains">contains</a></a><code class="signature apipage">contains(\_key:<span>[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deleteMax"><a class="lift" href="#deleteMax">deleteMax</a></a><code class="signature apipage">deleteMax() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deleteMin"><a class="lift" href="#deleteMin">deleteMin</a></a><code class="signature apipage">deleteMin() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find"><a class="lift" href="#find">find</a></a><code class="signature apipage">find(\_key:<span>[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</span>) : [luxe.structural.BinarySearchTree.T](#luxe.structural.BinarySearchTree.T)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="floor"><a class="lift" href="#floor">floor</a></a><code class="signature apipage">floor(\_key:<span>[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="insert"><a class="lift" href="#insert">insert</a></a><code class="signature apipage">insert(\_key:<span>[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</span>, \_value:<span>[luxe.structural.BinarySearchTree.T](#luxe.structural.BinarySearchTree.T)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a><code class="signature apipage">iterator() : [Iterator]()&lt;[luxe.structural.BinarySearchTree.T](#luxe.structural.BinarySearchTree.T)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="keys"><a class="lift" href="#keys">keys</a></a><code class="signature apipage">keys() : [Array](http://api.haxe.org/Array.html)&lt;[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="max"><a class="lift" href="#max">max</a></a><code class="signature apipage">max() : [luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="min"><a class="lift" href="#min">min</a></a><code class="signature apipage">min() : [luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(compare\_function:<span>[luxe.structural.BinarySearchTree.K-&gt;luxe.structural.BinarySearchTree.K-&gt;Int](#luxe.structural.BinarySearchTree.K->luxe.structural.BinarySearchTree.K->Int)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="rank"><a class="lift" href="#rank">rank</a></a><code class="signature apipage">rank(\_key:<span>[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><code class="signature apipage">remove(\_key:<span>[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="select"><a class="lift" href="#select">select</a></a><code class="signature apipage">select(\_rank:<span>[Int](http://api.haxe.org/Int.html)</span>) : [luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="size"><a class="lift" href="#size">size</a></a><code class="signature apipage">size() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><code class="signature apipage">toArray() : [Array](http://api.haxe.org/Array.html)&lt;[luxe.structural.BinarySearchTree.T](#luxe.structural.BinarySearchTree.T)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="traverse"><a class="lift" href="#traverse">traverse</a></a><code class="signature apipage">traverse(\_node:<span>[luxe.structural.BinarySearchTreeNode](#luxe.structural.BinarySearchTreeNode)&lt;[luxe.structural.BinarySearchTree.K](#luxe.structural.BinarySearchTree.K), [luxe.structural.BinarySearchTree.T](#luxe.structural.BinarySearchTree.T)&gt;</span>, \_traverse\_method:<span>[luxe.structural.BinarySearchTraverseMethod](#luxe.structural.BinarySearchTraverseMethod)</span>, \_process\_node\_function:<span>[luxe.structural.BinarySearchTreeNode-&gt;Void](#luxe.structural.BinarySearchTreeNode->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;