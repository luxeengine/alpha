
[![Logo](../../../images/logo.png)](../../../api/index.html)

---


<h1>DrawBoxOptions</h1>
<small>`luxe.options.DrawBoxOptions`</small>



<hr/>

`typedef`&nbsp;alias of `luxe.options.QuadGeometryOptions`   

<hr/>


&nbsp;
&nbsp;





<h3>Members</h3> <hr/><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">y position</span><br/><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">x position</span><br/><span class="member apipage">
                <a name="w"><a class="lift" href="#w">w</a></a><div class="clear"></div>
                <code class="signature apipage">w : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">width</span><br/><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div>
                <code class="signature apipage">visible : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the visibility</span><br/><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](../../../api/phoenix/Texture.html)</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><br/><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [phoenix.Shader](../../../api/phoenix/Shader.html)</code><br/></span>
            <span class="small_desc_flat">the shader for the geometry</span><br/><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">the transform scale</span><br/><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](../../../api/luxe/Quaternion.html)</code><br/></span>
            <span class="small_desc_flat">the transform rotation</span><br/><span class="member apipage">
                <a name="primitive_type"><a class="lift" href="#primitive_type">primitive\_type</a></a><div class="clear"></div>
                <code class="signature apipage">primitive\_type : [phoenix.PrimitiveType](../../../api/phoenix/PrimitiveType.html)</code><br/></span>
            <span class="small_desc_flat">the primitive type of the geometry. lines, triangles, point etc</span><br/><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">the transform position</span><br/><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">the transform origin</span><br/><span class="member apipage">
                <a name="no_batcher_add"><a class="lift" href="#no_batcher_add">no\_batcher\_add</a></a><div class="clear"></div>
                <code class="signature apipage">no\_batcher\_add : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, the geometry will not be added to any batcher.</span><br/><span class="member apipage">
                <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><div class="clear"></div>
                <code class="signature apipage">immediate : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if immediate, this geometry is dropped from the batcher at the end of the frame.</span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The geometry id. if none given, a unique id is generated.</span><br/><span class="member apipage">
                <a name="h"><a class="lift" href="#h">h</a></a><div class="clear"></div>
                <code class="signature apipage">h : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">height</span><br/><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><div class="clear"></div>
                <code class="signature apipage">group : [Null](http://api.haxe.org/Null.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry group id (see guides)</span><br/><span class="member apipage">
                <a name="flipy"><a class="lift" href="#flipy">flipy</a></a><div class="clear"></div>
                <code class="signature apipage">flipy : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">Whether or not the quad is flipped vertically</span><br/><span class="member apipage">
                <a name="flipx"><a class="lift" href="#flipx">flipx</a></a><div class="clear"></div>
                <code class="signature apipage">flipx : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">Whether or not the quad is flipped horizontally</span><br/><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
                <code class="signature apipage">depth : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><br/><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><div class="clear"></div>
                <code class="signature apipage">color : [luxe.Color](../../../api/luxe/Color.html)</code><br/></span>
            <span class="small_desc_flat">the base color</span><br/><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><div class="clear"></div>
                <code class="signature apipage">clip\_rect : [luxe.Rectangle](../../../api/luxe/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat">If specified, the geometry will be clipped to this rectangle region (in world space).</span><br/><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div>
                <code class="signature apipage">batcher : [phoenix.Batcher](../../../api/phoenix/Batcher.html)</code><br/></span>
            <span class="small_desc_flat">the batcher to add this geometry to (unless no_batcher_add). If not specified, the default batcher is used.</span><br/>






<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;