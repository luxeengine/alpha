
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>BatcherDebugView</h1>
<small>`luxe.debug.BatcherDebugView`</small>



---

`class`extends <code><span>luxe.debug.DebugView</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div><code class="signature apipage">batcher : [phoenix.Batcher](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dragging"><a class="lift" href="#dragging">dragging</a></a><div class="clear"></div><code class="signature apipage">dragging : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dragstart"><a class="lift" href="#dragstart">dragstart</a></a><div class="clear"></div><code class="signature apipage">dragstart : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dragmstart"><a class="lift" href="#dragmstart">dragmstart</a></a><div class="clear"></div><code class="signature apipage">dragmstart : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_tree_geom"><a class="lift" href="#_tree_geom">\_tree\_geom</a></a><div class="clear"></div><code class="signature apipage">\_tree\_geom : [phoenix.geometry.CompositeGeometry](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="as_immediate"><a class="lift" href="#as_immediate">as\_immediate</a></a><div class="clear"></div><code class="signature apipage">as\_immediate : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a> <div class="clear"></div><code class="signature apipage">create() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="refresh"><a class="lift" href="#refresh">refresh</a></a> <div class="clear"></div><code class="signature apipage">refresh() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a> <div class="clear"></div><code class="signature apipage">onmousedown(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a> <div class="clear"></div><code class="signature apipage">onmouseup(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a> <div class="clear"></div><code class="signature apipage">onmousemove(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a> <div class="clear"></div><code class="signature apipage">onmousewheel(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear_batcher_tree"><a class="lift" href="#clear_batcher_tree">clear\_batcher\_tree</a></a> <div class="clear"></div><code class="signature apipage">clear\_batcher\_tree() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="keystr"><a class="lift" href="#keystr">keystr</a></a> <div class="clear"></div><code class="signature apipage">keystr(key:[phoenix.geometry.GeometryKey](#)<span></span>, key2:[phoenix.geometry.GeometryKey](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="draw_geom_node"><a class="lift" href="#draw_geom_node">draw\_geom\_node</a></a> <div class="clear"></div><code class="signature apipage">draw\_geom\_node(l:[Bool](#)<span></span>, \_leaf:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[phoenix.geometry.GeometryKey](#), [phoenix.geometry.Geometry](#)&gt;<span></span>, \_p:[luxe.Vector](#)<span></span>, \_bbw:[Float](#)<span>=20</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="draw_geom_leaf"><a class="lift" href="#draw_geom_leaf">draw\_geom\_leaf</a></a> <div class="clear"></div><code class="signature apipage">draw\_geom\_leaf(L:[Bool](#)<span></span>, \_leaf:[luxe.structural.BalancedBinarySearchTreeNode](#)&lt;[phoenix.geometry.GeometryKey](#), [phoenix.geometry.Geometry](#)&gt;<span></span>, \_p:[luxe.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="draw_batcher_tree"><a class="lift" href="#draw_batcher_tree">draw\_batcher\_tree</a></a> <div class="clear"></div><code class="signature apipage">draw\_batcher\_tree() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a> <div class="clear"></div><code class="signature apipage">process() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="show"><a class="lift" href="#show">show</a></a> <div class="clear"></div><code class="signature apipage">show() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="hide"><a class="lift" href="#hide">hide</a></a> <div class="clear"></div><code class="signature apipage">hide() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;