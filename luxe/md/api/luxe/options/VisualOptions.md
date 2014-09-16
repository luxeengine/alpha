
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>VisualOptions</h1>
<small>`luxe.options.VisualOptions`</small>



---

`typedef`


---


&nbsp;
&nbsp;







<h3>Members</h3> <hr/><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div>
                <code class="signature apipage">visible : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the visibility</span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><span class="member apipage">
                <a name="size"><a class="lift" href="#size">size</a></a><div class="clear"></div>
                <code class="signature apipage">size : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">the size of the geometry to create</span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [phoenix.Shader](#)</code><br/></span>
            <span class="small_desc_flat">the shader for the geometry</span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat">if set, add to given scene. If not set, will add to default scene (unless no_scene)</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">the transform scale</span><span class="member apipage">
                <a name="rotation_z"><a class="lift" href="#rotation_z">rotation\_z</a></a><div class="clear"></div>
                <code class="signature apipage">rotation\_z : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the rotation around the z access, in degrees. convenience.</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">the transform position</span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><div class="clear"></div>
                <code class="signature apipage">parent : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat">if set, set parent to given entity</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">the transform origin.</span><span class="member apipage">
                <a name="no_scene"><a class="lift" href="#no_scene">no\_scene</a></a><div class="clear"></div>
                <code class="signature apipage">no\_scene : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if true, do not add to any scene</span><span class="member apipage">
                <a name="no_geometry"><a class="lift" href="#no_geometry">no\_geometry</a></a><div class="clear"></div>
                <code class="signature apipage">no\_geometry : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, no geometry will be created.</span><span class="member apipage">
                <a name="no_batcher_add"><a class="lift" href="#no_batcher_add">no\_batcher\_add</a></a><div class="clear"></div>
                <code class="signature apipage">no\_batcher\_add : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, the geometry will not be added to any batcher.</span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat">the entity name. highly recommended you set this.</span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><div class="clear"></div>
                <code class="signature apipage">group : [Null](#)&lt;[Int](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry group id (see guides)</span><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><div class="clear"></div>
                <code class="signature apipage">geometry : [phoenix.geometry.Geometry](#)</code><br/></span>
            <span class="small_desc_flat">if specified, this geometry will be used instead.</span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
                <code class="signature apipage">depth : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><div class="clear"></div>
                <code class="signature apipage">color : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat">the base color for the geometry</span><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div>
                <code class="signature apipage">batcher : [phoenix.Batcher](#)</code><br/></span>
            <span class="small_desc_flat">the batcher to add this geometry to (unless no_batcher_add). If not specified, the default batcher is used.</span>








---

&nbsp;
&nbsp;
&nbsp;
&nbsp;