
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>RectangleGeometryOptions</h1>
<small>`luxe.options.RectangleGeometryOptions`</small>

Options for drawing or creating rectangle based geometry, phoenix.geometry.RectangleGeometry

---

`typedef`


---


&nbsp;
&nbsp;







<h3>Members</h3> <hr/><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">y position</span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">x position</span><span class="member apipage">
                <a name="w"><a class="lift" href="#w">w</a></a><div class="clear"></div>
                <code class="signature apipage">w : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">width</span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div>
                <code class="signature apipage">visible : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the visibility</span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [phoenix.Shader](#)</code><br/></span>
            <span class="small_desc_flat">the shader for the geometry</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">the transform scale</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat">the transform rotation</span><span class="member apipage">
                <a name="primitive_type"><a class="lift" href="#primitive_type">primitive\_type</a></a><div class="clear"></div>
                <code class="signature apipage">primitive\_type : [phoenix.PrimitiveType](#)</code><br/></span>
            <span class="small_desc_flat">the primitive type of the geometry. lines, triangles, point etc</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">the transform position</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">the transform origin</span><span class="member apipage">
                <a name="no_batcher_add"><a class="lift" href="#no_batcher_add">no\_batcher\_add</a></a><div class="clear"></div>
                <code class="signature apipage">no\_batcher\_add : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, the geometry will not be added to any batcher.</span><span class="member apipage">
                <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><div class="clear"></div>
                <code class="signature apipage">immediate : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if immediate, this geometry is dropped from the batcher at the end of the frame.</span><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div>
                <code class="signature apipage">id : [String](#)</code><br/></span>
            <span class="small_desc_flat">The geometry id. if none given, a unique id is generated.</span><span class="member apipage">
                <a name="h"><a class="lift" href="#h">h</a></a><div class="clear"></div>
                <code class="signature apipage">h : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">height</span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><div class="clear"></div>
                <code class="signature apipage">group : [Null](#)&lt;[Int](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry group id (see guides)</span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
                <code class="signature apipage">depth : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><div class="clear"></div>
                <code class="signature apipage">color : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat">the base color</span><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><div class="clear"></div>
                <code class="signature apipage">clip\_rect : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat">If specified, the geometry will be clipped to this rectangle region (in world space).</span><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div>
                <code class="signature apipage">batcher : [phoenix.Batcher](#)</code><br/></span>
            <span class="small_desc_flat">the batcher to add this geometry to (unless no_batcher_add). If not specified, the default batcher is used.</span>








---

&nbsp;
&nbsp;
&nbsp;
&nbsp;