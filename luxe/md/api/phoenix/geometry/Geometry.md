
[![Logo](../../../images/logo.png)](../../../api/index.html)

---


<h1>Geometry</h1>
<small>`phoenix.geometry.Geometry`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="added"><a class="lift" href="#added">added</a></a><div class="clear"></div>
                <code class="signature apipage">added : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="batchers"><a class="lift" href="#batchers">batchers</a></a><div class="clear"></div>
                <code class="signature apipage">batchers : [Array](http://api.haxe.org/Array.html)&lt;[phoenix.Batcher](../../../api/phoenix/Batcher.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="dropped"><a class="lift" href="#dropped">dropped</a></a><div class="clear"></div>
                <code class="signature apipage">dropped : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><div class="clear"></div>
                <code class="signature apipage">immediate : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="key"><a class="lift" href="#key">key</a></a><div class="clear"></div>
                <code class="signature apipage">key : [phoenix.geometry.GeometryKey](../../../api/phoenix/geometry/GeometryKey.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div>
                <code class="signature apipage">state : [phoenix.geometry.GeometryState](../../../api/phoenix/geometry/GeometryState.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_normal_buffer"><a class="lift" href="#static_normal_buffer">static\_normal\_buffer</a></a><div class="clear"></div>
                <code class="signature apipage">static\_normal\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_tcoord_buffer"><a class="lift" href="#static_tcoord_buffer">static\_tcoord\_buffer</a></a><div class="clear"></div>
                <code class="signature apipage">static\_tcoord\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_vcolor_buffer"><a class="lift" href="#static_vcolor_buffer">static\_vcolor\_buffer</a></a><div class="clear"></div>
                <code class="signature apipage">static\_vcolor\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_vertex_buffer"><a class="lift" href="#static_vertex_buffer">static\_vertex\_buffer</a></a><div class="clear"></div>
                <code class="signature apipage">static\_vertex\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="submitted"><a class="lift" href="#submitted">submitted</a></a><div class="clear"></div>
                <code class="signature apipage">submitted : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div>
                <code class="signature apipage">transform : [phoenix.Transform](../../../api/phoenix/Transform.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="uuid"><a class="lift" href="#uuid">uuid</a></a><div class="clear"></div>
                <code class="signature apipage">uuid : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><div class="clear"></div>
                <code class="signature apipage">vertices : [Array](http://api.haxe.org/Array.html)&lt;[phoenix.geometry.Vertex](../../../api/phoenix/geometry/Vertex.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><div class="clear"></div>
                <code class="signature apipage">clip\_rect : [phoenix.Rectangle](../../../api/phoenix/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><div class="clear"></div>
                <code class="signature apipage">color : [phoenix.Color](../../../api/phoenix/Color.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
                <code class="signature apipage">depth : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty"><a class="lift" href="#dirty">dirty</a></a><div class="clear"></div>
                <code class="signature apipage">dirty : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><div class="clear"></div>
                <code class="signature apipage">group : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="locked"><a class="lift" href="#locked">locked</a></a><div class="clear"></div>
                <code class="signature apipage">locked : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="primitive_type"><a class="lift" href="#primitive_type">primitive\_type</a></a><div class="clear"></div>
                <code class="signature apipage">primitive\_type : [phoenix.PrimitiveType](../../../api/phoenix/PrimitiveType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [phoenix.Shader](../../../api/phoenix/Shader.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](../../../api/phoenix/Texture.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div>
                <code class="signature apipage">visible : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add(v:[phoenix.geometry.Vertex](../../../api/phoenix/geometry/Vertex.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="batch"><a class="lift" href="#batch">batch</a></a><div class="clear"></div>
            <code class="signature apipage">batch(vert\_index:[Int](http://api.haxe.org/Int.html)<span></span>, tcoord\_index:[Int](http://api.haxe.org/Int.html)<span></span>, color\_index:[Int](http://api.haxe.org/Int.html)<span></span>, normal\_index:[Int](http://api.haxe.org/Int.html)<span></span>, vertlist:[snow.utils.Float32Array](#)<span></span>, tcoordlist:[snow.utils.Float32Array](#)<span></span>, colorlist:[snow.utils.Float32Array](#)<span></span>, normallist:[snow.utils.Float32Array](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="batch_into_arrays"><a class="lift" href="#batch_into_arrays">batch\_into\_arrays</a></a><div class="clear"></div>
            <code class="signature apipage">batch\_into\_arrays(vertlist:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>, tcoordlist:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>, colorlist:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>, normallist:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><div class="clear"></div>
            <code class="signature apipage">drop(remove:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="key_string"><a class="lift" href="#key_string">key\_string</a></a><div class="clear"></div>
            <code class="signature apipage">key\_string() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(options:[luxe.options.GeometryOptions](../../../api/luxe/options/GeometryOptions.html)<span>=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="refresh_key"><a class="lift" href="#refresh_key">refresh\_key</a></a><div class="clear"></div>
            <code class="signature apipage">refresh\_key() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><div class="clear"></div>
            <code class="signature apipage">remove(v:[phoenix.geometry.Vertex](../../../api/phoenix/geometry/Vertex.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="short_id"><a class="lift" href="#short_id">short\_id</a></a><div class="clear"></div>
            <code class="signature apipage">short\_id() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="str"><a class="lift" href="#str">str</a></a><div class="clear"></div>
            <code class="signature apipage">str() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="translate"><a class="lift" href="#translate">translate</a></a><div class="clear"></div>
            <code class="signature apipage">translate(\_offset:[phoenix.Vector](../../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;