
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>BinarySearchTree</h1>
<small>`luxe.structural.BinarySearchTree`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="root"><a class="lift" href="#root">root</a></a><div class="clear"></div><code class="signature apipage">root : [luxe.structural.BinarySearchTreeNode](#)&lt;[luxe.structural.BinarySearchTree.K](#), [luxe.structural.BinarySearchTree.T](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="compare"><a class="lift" href="#compare">compare</a></a><div class="clear"></div><code class="signature apipage">compare : [luxe.structural.BinarySearchTree.K](#)&nbsp; -&gt; [luxe.structural.BinarySearchTree.K](#)&nbsp;-&gt; [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a> <div class="clear"></div><code class="signature apipage">toString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="size"><a class="lift" href="#size">size</a></a> <div class="clear"></div><code class="signature apipage">size() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="insert"><a class="lift" href="#insert">insert</a></a> <div class="clear"></div><code class="signature apipage">insert(\_key:[luxe.structural.BinarySearchTree.K](#)<span></span>, \_value:[luxe.structural.BinarySearchTree.T](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="contains"><a class="lift" href="#contains">contains</a></a> <div class="clear"></div><code class="signature apipage">contains(\_key:[luxe.structural.BinarySearchTree.K](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find"><a class="lift" href="#find">find</a></a> <div class="clear"></div><code class="signature apipage">find(\_key:[luxe.structural.BinarySearchTree.K](#)<span></span>) : [luxe.structural.BinarySearchTree.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="rank"><a class="lift" href="#rank">rank</a></a> <div class="clear"></div><code class="signature apipage">rank(\_key:[luxe.structural.BinarySearchTree.K](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="select"><a class="lift" href="#select">select</a></a> <div class="clear"></div><code class="signature apipage">select(\_rank:[Int](#)<span></span>) : [luxe.structural.BinarySearchTree.K](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="min"><a class="lift" href="#min">min</a></a> <div class="clear"></div><code class="signature apipage">min() : [luxe.structural.BinarySearchTree.K](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="max"><a class="lift" href="#max">max</a></a> <div class="clear"></div><code class="signature apipage">max() : [luxe.structural.BinarySearchTree.K](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="floor"><a class="lift" href="#floor">floor</a></a> <div class="clear"></div><code class="signature apipage">floor(\_key:[luxe.structural.BinarySearchTree.K](#)<span></span>) : [Null](#)&lt;[luxe.structural.BinarySearchTree.K](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ceil"><a class="lift" href="#ceil">ceil</a></a> <div class="clear"></div><code class="signature apipage">ceil(\_key:[luxe.structural.BinarySearchTree.K](#)<span></span>) : [Null](#)&lt;[luxe.structural.BinarySearchTree.K](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deleteMin"><a class="lift" href="#deleteMin">deleteMin</a></a> <div class="clear"></div><code class="signature apipage">deleteMin() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deleteMax"><a class="lift" href="#deleteMax">deleteMax</a></a> <div class="clear"></div><code class="signature apipage">deleteMax() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a> <div class="clear"></div><code class="signature apipage">remove(\_key:[luxe.structural.BinarySearchTree.K](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a> <div class="clear"></div><code class="signature apipage">toArray() : [Array](#)&lt;[luxe.structural.BinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="keys"><a class="lift" href="#keys">keys</a></a> <div class="clear"></div><code class="signature apipage">keys() : [Array](#)&lt;[luxe.structural.BinarySearchTree.K](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a> <div class="clear"></div><code class="signature apipage">iterator() : [Iterator](#)&lt;[luxe.structural.BinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="traverse"><a class="lift" href="#traverse">traverse</a></a> <div class="clear"></div><code class="signature apipage">traverse(\_node:[luxe.structural.BinarySearchTreeNode](#)&lt;[luxe.structural.BinarySearchTree.K](#), [luxe.structural.BinarySearchTree.T](#)&gt;<span></span>, \_traverse\_method:[luxe.structural.BinarySearchTraverseMethod](#)<span></span>, \_process\_node\_function:[luxe.structural.BinarySearchTreeNode](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(compare\_function:[luxe.structural.BinarySearchTree.K](#)&nbsp; -&gt; [luxe.structural.BinarySearchTree.K](#)&nbsp;-&gt; [Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;