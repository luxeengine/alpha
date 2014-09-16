
[![Logo](../../../images/logo.png)](../../../api/index.html)

---


<h1>BatcherDebugView</h1>
<small>`luxe.debug.BatcherDebugView`</small>



<hr/>

`class`extends <code><span>luxe.debug.DebugView</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the id</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the name</span><br/><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">visible : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="clear_batcher_tree"><a class="lift" href="#clear_batcher_tree">clear\_batcher\_tree</a></a><div class="clear"></div>
            <code class="signature apipage">clear\_batcher\_tree() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">create() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="draw_batcher_tree"><a class="lift" href="#draw_batcher_tree">draw\_batcher\_tree</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_batcher\_tree() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="draw_geom_leaf"><a class="lift" href="#draw_geom_leaf">draw\_geom\_leaf</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_geom\_leaf(L:[Bool](http://api.haxe.org/Bool.html)<span></span>, \_leaf:[luxe.structural.BalancedBinarySearchTreeNode](../../../api/luxe/structural/BalancedBinarySearchTreeNode.html)&lt;[phoenix.geometry.GeometryKey](../../../api/phoenix/geometry/GeometryKey.html), [phoenix.geometry.Geometry](../../../api/phoenix/geometry/Geometry.html)&gt;<span></span>, \_p:[luxe.Vector](../../../api/luxe/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="draw_geom_node"><a class="lift" href="#draw_geom_node">draw\_geom\_node</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_geom\_node(l:[Bool](http://api.haxe.org/Bool.html)<span></span>, \_leaf:[luxe.structural.BalancedBinarySearchTreeNode](../../../api/luxe/structural/BalancedBinarySearchTreeNode.html)&lt;[phoenix.geometry.GeometryKey](../../../api/phoenix/geometry/GeometryKey.html), [phoenix.geometry.Geometry](../../../api/phoenix/geometry/Geometry.html)&gt;<span></span>, \_p:[luxe.Vector](../../../api/luxe/Vector.html)<span></span>, \_bbw:[Float](http://api.haxe.org/Float.html)<span>=20</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="hide"><a class="lift" href="#hide">hide</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">hide() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeydown(e:[luxe.KeyEvent](../../../api/luxe/KeyEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeyup(e:[luxe.KeyEvent](../../../api/luxe/KeyEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousedown(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousemove(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmouseup(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">process() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="refresh"><a class="lift" href="#refresh">refresh</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">refresh() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="show"><a class="lift" href="#show">show</a></a><a title="inherited from luxe.debug.DebugView" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">show() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;