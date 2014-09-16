
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>NineSliceOptions</h1>
<small>`luxe.options.NineSliceOptions`</small>

Options for a Nineslice scaled entity, extending from `Sprite` allowing scaleable graphics to be drawn from a small image. See the guide for examples.

---

`typedef`


---


&nbsp;
&nbsp;







<h3>Members</h3> <hr/><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div>
                <code class="signature apipage">visible : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the visibility</span><span class="member apipage">
                <a name="uv"><a class="lift" href="#uv">uv</a></a><div class="clear"></div>
                <code class="signature apipage">uv : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat">specify the uv rectangle inside the texture, in texture space (pixels)</span><span class="member apipage">
                <a name="top"><a class="lift" href="#top">top</a></a><div class="clear"></div>
                <code class="signature apipage">top : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the top size of the nineslice, in the texture (pixels)</span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><span class="member apipage">
                <a name="source_y"><a class="lift" href="#source_y">source\_y</a></a><div class="clear"></div>
                <code class="signature apipage">source\_y : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The source y position within the texture. used for atlas based nineslice images</span><span class="member apipage">
                <a name="source_x"><a class="lift" href="#source_x">source\_x</a></a><div class="clear"></div>
                <code class="signature apipage">source\_x : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The source x position within the texture. used for atlas based nineslice images</span><span class="member apipage">
                <a name="source_w"><a class="lift" href="#source_w">source\_w</a></a><div class="clear"></div>
                <code class="signature apipage">source\_w : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The source width, within the texture. used for atlas based nineslice images</span><span class="member apipage">
                <a name="source_h"><a class="lift" href="#source_h">source\_h</a></a><div class="clear"></div>
                <code class="signature apipage">source\_h : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The source height, within the texture. used for atlas based nineslice images</span><span class="member apipage">
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
                <a name="right"><a class="lift" href="#right">right</a></a><div class="clear"></div>
                <code class="signature apipage">right : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the right size of the nineslice, in the texture (pixels)</span><span class="member apipage">
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
                <a name="left"><a class="lift" href="#left">left</a></a><div class="clear"></div>
                <code class="signature apipage">left : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the left size of the nineslice, in the texture (pixels)</span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><div class="clear"></div>
                <code class="signature apipage">group : [Null](#)&lt;[Int](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry group id (see guides)</span><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><div class="clear"></div>
                <code class="signature apipage">geometry : [phoenix.geometry.Geometry](#)</code><br/></span>
            <span class="small_desc_flat">if specified, this geometry will be used instead.</span><span class="member apipage">
                <a name="flipy"><a class="lift" href="#flipy">flipy</a></a><div class="clear"></div>
                <code class="signature apipage">flipy : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, the sprite will be flipped vertically</span><span class="member apipage">
                <a name="flipx"><a class="lift" href="#flipx">flipx</a></a><div class="clear"></div>
                <code class="signature apipage">flipx : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, the sprite will be flipped horizontally</span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
                <code class="signature apipage">depth : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><div class="clear"></div>
                <code class="signature apipage">color : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat">the base color for the geometry</span><span class="member apipage">
                <a name="centered"><a class="lift" href="#centered">centered</a></a><div class="clear"></div>
                <code class="signature apipage">centered : [Null](#)&lt;[Bool](#)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, the sprite will be centered</span><span class="member apipage">
                <a name="bottom"><a class="lift" href="#bottom">bottom</a></a><div class="clear"></div>
                <code class="signature apipage">bottom : [Null](#)&lt;[Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat">the bottom size of the nineslice, in the texture (pixels)</span><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div>
                <code class="signature apipage">batcher : [phoenix.Batcher](#)</code><br/></span>
            <span class="small_desc_flat">the batcher to add this geometry to (unless no_batcher_add). If not specified, the default batcher is used.</span>








---

&nbsp;
&nbsp;
&nbsp;
&nbsp;