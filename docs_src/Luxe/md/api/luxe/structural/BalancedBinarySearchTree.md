
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>BalancedBinarySearchTree</h1>
<small>`luxe.structural.BalancedBinarySearchTree`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="root"><a class="lift" href="#root">root</a></a><div class="clear"></div><code class="signature apipage">root : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="compare"><a class="lift" href="#compare">compare</a></a><div class="clear"></div><code class="signature apipage">compare : [luxe.structural.BalancedBinarySearchTree.K](#)&nbsp; -&gt; [luxe.structural.BalancedBinarySearchTree.K](#)&nbsp;-&gt; [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a> <div class="clear"></div><code class="signature apipage">toString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="empty"><a class="lift" href="#empty">empty</a></a> <div class="clear"></div><code class="signature apipage">empty() : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="size"><a class="lift" href="#size">size</a></a> <div class="clear"></div><code class="signature apipage">size() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="height"><a class="lift" href="#height">height</a></a> <div class="clear"></div><code class="signature apipage">height() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_height"><a class="lift" href="#_height">\_height</a></a> <div class="clear"></div><code class="signature apipage">\_height(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_size"><a class="lift" href="#_size">\_size</a></a> <div class="clear"></div><code class="signature apipage">\_size(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="insert"><a class="lift" href="#insert">insert</a></a> <div class="clear"></div><code class="signature apipage">insert(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>, \_value:[luxe.structural.BalancedBinarySearchTree.T](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_insert"><a class="lift" href="#_insert">\_insert</a></a> <div class="clear"></div><code class="signature apipage">\_insert(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>, \_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>, \_value:[luxe.structural.BalancedBinarySearchTree.T](#)<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="contains"><a class="lift" href="#contains">contains</a></a> <div class="clear"></div><code class="signature apipage">contains(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find"><a class="lift" href="#find">find</a></a> <div class="clear"></div><code class="signature apipage">find(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [luxe.structural.BalancedBinarySearchTree.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_find"><a class="lift" href="#_find">\_find</a></a> <div class="clear"></div><code class="signature apipage">\_find(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>, \_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [luxe.structural.BalancedBinarySearchTree.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="rank"><a class="lift" href="#rank">rank</a></a> <div class="clear"></div><code class="signature apipage">rank(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_rank"><a class="lift" href="#_rank">\_rank</a></a> <div class="clear"></div><code class="signature apipage">\_rank(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>, \_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="select"><a class="lift" href="#select">select</a></a> <div class="clear"></div><code class="signature apipage">select(\_rank:[Int](#)<span></span>) : [luxe.structural.BalancedBinarySearchTree.K](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_select"><a class="lift" href="#_select">\_select</a></a> <div class="clear"></div><code class="signature apipage">\_select(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>, \_rank:[Int](#)<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="min"><a class="lift" href="#min">min</a></a> <div class="clear"></div><code class="signature apipage">min() : [luxe.structural.BalancedBinarySearchTree.K](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_min"><a class="lift" href="#_min">\_min</a></a> <div class="clear"></div><code class="signature apipage">\_min(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="max"><a class="lift" href="#max">max</a></a> <div class="clear"></div><code class="signature apipage">max() : [luxe.structural.BalancedBinarySearchTree.K](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_max"><a class="lift" href="#_max">\_max</a></a> <div class="clear"></div><code class="signature apipage">\_max(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="floor"><a class="lift" href="#floor">floor</a></a> <div class="clear"></div><code class="signature apipage">floor(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [Null](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_floor"><a class="lift" href="#_floor">\_floor</a></a> <div class="clear"></div><code class="signature apipage">\_floor(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>, \_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ceil"><a class="lift" href="#ceil">ceil</a></a> <div class="clear"></div><code class="signature apipage">ceil(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [Null](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_ceil"><a class="lift" href="#_ceil">\_ceil</a></a> <div class="clear"></div><code class="signature apipage">\_ceil(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>, \_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deleteMin"><a class="lift" href="#deleteMin">deleteMin</a></a> <div class="clear"></div><code class="signature apipage">deleteMin() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_deleteMin"><a class="lift" href="#_deleteMin">\_deleteMin</a></a> <div class="clear"></div><code class="signature apipage">\_deleteMin(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deleteMax"><a class="lift" href="#deleteMax">deleteMax</a></a> <div class="clear"></div><code class="signature apipage">deleteMax() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_deleteMax"><a class="lift" href="#_deleteMax">\_deleteMax</a></a> <div class="clear"></div><code class="signature apipage">\_deleteMax(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a> <div class="clear"></div><code class="signature apipage">remove(\_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_remove"><a class="lift" href="#_remove">\_remove</a></a> <div class="clear"></div><code class="signature apipage">\_remove(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>, \_key:[luxe.structural.BalancedBinarySearchTree.K](#)<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="is_red"><a class="lift" href="#is_red">is\_red</a></a> <div class="clear"></div><code class="signature apipage">is\_red(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="move_red_left"><a class="lift" href="#move_red_left">move\_red\_left</a></a> <div class="clear"></div><code class="signature apipage">move\_red\_left(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="move_red_right"><a class="lift" href="#move_red_right">move\_red\_right</a></a> <div class="clear"></div><code class="signature apipage">move\_red\_right(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="balance"><a class="lift" href="#balance">balance</a></a> <div class="clear"></div><code class="signature apipage">balance(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>) : [luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a> <div class="clear"></div><code class="signature apipage">toArray() : [Array](#)&lt;[luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="keys"><a class="lift" href="#keys">keys</a></a> <div class="clear"></div><code class="signature apipage">keys() : [Array](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a> <div class="clear"></div><code class="signature apipage">iterator() : [Iterator](#)&lt;[luxe.structural.BalancedBinarySearchTree.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="traverse"><a class="lift" href="#traverse">traverse</a></a> <div class="clear"></div><code class="signature apipage">traverse(\_node:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[luxe.structural.BalancedBinarySearchTree.K](#), [luxe.structural.BalancedBinarySearchTree.T](#)&gt;<span></span>, \_traverse\_method:[luxe.structural.BalancedBinarySearchTraverseMethod](#)<span></span>, \_process\_node\_function:[luxe.structural.BalancedBinarySearchTreeNode](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(compare\_function:[luxe.structural.BalancedBinarySearchTree.K](#)&nbsp; -&gt; [luxe.structural.BalancedBinarySearchTree.K](#)&nbsp;-&gt; [Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;