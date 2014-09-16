
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>Text</h1>
<small>`luxe.Text`</small>



<hr/>

`class`extends <code><span>luxe.Visual</span></code><br/><span class="meta">
meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="composite_geometry"><a class="lift" href="#composite_geometry">composite\_geometry</a></a><div class="clear"></div>
                <code class="signature apipage">composite\_geometry : [phoenix.geometry.CompositeGeometry](../../api/phoenix/geometry/CompositeGeometry.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="font"><a class="lift" href="#font">font</a></a><div class="clear"></div>
                <code class="signature apipage">font : [phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="ready"><a class="lift" href="#ready">ready</a></a><div class="clear"></div>
                <code class="signature apipage">ready : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="text_options"><a class="lift" href="#text_options">text\_options</a></a><div class="clear"></div>
                <code class="signature apipage">text\_options : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">clip\_rect : [luxe.Rectangle](../../api/luxe/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat">If note null, the geometry will be clipped to this rectangle region (in world space).</span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">color : [luxe.Color](../../api/luxe/Color.html)</code><br/></span>
            <span class="small_desc_flat">the base color</span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">depth : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">geometry : [phoenix.geometry.Geometry](../../api/phoenix/geometry/Geometry.html)</code><br/></span>
            <span class="small_desc_flat">the geometry this visual contains</span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">group : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">the geometry group id (see guides)</span><span class="member apipage">
                <a name="locked"><a class="lift" href="#locked">locked</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">locked : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">the geometry static flag. This is a hint on how to render the geometry for performance</span><span class="member apipage">
                <a name="radians"><a class="lift" href="#radians">radians</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">radians : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">convenience: controls the rotation around the z axis, in radians.</span><span class="member apipage">
                <a name="rotation_z"><a class="lift" href="#rotation_z">rotation\_z</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation\_z : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">convenience: controls the rotation around the z axis, in degrees.</span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">shader : [phoenix.Shader](../../api/phoenix/Shader.html)</code><br/></span>
            <span class="small_desc_flat">the shader for the geometry</span><span class="member apipage">
                <a name="size"><a class="lift" href="#size">size</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">size : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">the size of this geometry (only makes sense for QuadGeometry)</span><span class="member apipage">
                <a name="text"><a class="lift" href="#text">text</a></a><div class="clear"></div>
                <code class="signature apipage">text : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="textsize"><a class="lift" href="#textsize">textsize</a></a><div class="clear"></div>
                <code class="signature apipage">textsize : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](../../api/phoenix/Texture.html)</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">visible : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">the visibility</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a title="inherited from luxe.Visual" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="point_inside"><a class="lift" href="#point_inside">point\_inside</a></a><div class="clear"></div>
            <code class="signature apipage">point\_inside(p:[luxe.Vector](../../api/luxe/Vector.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;