
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#QuadGeometry



---

`class`extends <code><span>[phoenix.geometry.Geometry]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="added"><a class="lift" href="#added">added</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">added : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="batchers"><a class="lift" href="#batchers">batchers</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">batchers : [Array](http://api.haxe.org/Array.html)&lt;[phoenix.Batcher](#phoenix.Batcher)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="dropped"><a class="lift" href="#dropped">dropped</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">dropped : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">immediate : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="key"><a class="lift" href="#key">key</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">key : [phoenix.geometry.GeometryKey](#phoenix.geometry.GeometryKey)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="state"><a class="lift" href="#state">state</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">state : [phoenix.geometry.GeometryState](#phoenix.geometry.GeometryState)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_normal_buffer"><a class="lift" href="#static_normal_buffer">static\_normal\_buffer</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">static\_normal\_buffer : [lime.gl.GLBuffer]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_tcoord_buffer"><a class="lift" href="#static_tcoord_buffer">static\_tcoord\_buffer</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">static\_tcoord\_buffer : [lime.gl.GLBuffer]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_vcolor_buffer"><a class="lift" href="#static_vcolor_buffer">static\_vcolor\_buffer</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">static\_vcolor\_buffer : [lime.gl.GLBuffer]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_vertex_buffer"><a class="lift" href="#static_vertex_buffer">static\_vertex\_buffer</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">static\_vertex\_buffer : [lime.gl.GLBuffer]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="submitted"><a class="lift" href="#submitted">submitted</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">submitted : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="transform"><a class="lift" href="#transform">transform</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">transform : [phoenix.Transform](#phoenix.Transform)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="uuid"><a class="lift" href="#uuid">uuid</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">uuid : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">vertices : [Array](http://api.haxe.org/Array.html)&lt;[phoenix.geometry.Vertex](#phoenix.geometry.Vertex)&gt;</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">new(?options:<span>[luxe.options.QuadGeometryOptions](#luxe.options.QuadGeometryOptions)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="resize"><a class="lift" href="#resize">resize</a></a><code class="signature apipage">resize(quad:<span>[luxe.Vector](#luxe.Vector)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><code class="signature apipage">set(quad:<span>[luxe.Rectangle](#luxe.Rectangle)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_flipx"><a class="lift" href="#set_flipx">set\_flipx</a></a><code class="signature apipage">set\_flipx(\_val:<span>[Bool](http://api.haxe.org/Bool.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_flipy"><a class="lift" href="#set_flipy">set\_flipy</a></a><code class="signature apipage">set\_flipy(\_val:<span>[Bool](http://api.haxe.org/Bool.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="uv"><a class="lift" href="#uv">uv</a></a><code class="signature apipage">uv(\_rect:<span>[luxe.Rectangle](#luxe.Rectangle)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="uv_space"><a class="lift" href="#uv_space">uv\_space</a></a><code class="signature apipage">uv\_space(\_rect:<span>[luxe.Rectangle](#luxe.Rectangle)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">add(v:<span>[phoenix.geometry.Vertex](#phoenix.geometry.Vertex)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch"><a class="lift" href="#batch">batch</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">batch(vert\_index:<span>[Int](http://api.haxe.org/Int.html)</span>, tcoord\_index:<span>[Int](http://api.haxe.org/Int.html)</span>, color\_index:<span>[Int](http://api.haxe.org/Int.html)</span>, normal\_index:<span>[Int](http://api.haxe.org/Int.html)</span>, vertlist:<span>[lime.utils.Float32Array]()</span>, tcoordlist:<span>[lime.utils.Float32Array]()</span>, colorlist:<span>[lime.utils.Float32Array]()</span>, normallist:<span>[lime.utils.Float32Array]()</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch_into_arrays"><a class="lift" href="#batch_into_arrays">batch\_into\_arrays</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">batch\_into\_arrays(vertlist:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>, tcoordlist:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>, colorlist:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>, normallist:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">drop(?remove:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="key_string"><a class="lift" href="#key_string">key\_string</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">key\_string() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="refresh_key"><a class="lift" href="#refresh_key">refresh\_key</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">refresh\_key() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">remove(v:<span>[phoenix.geometry.Vertex](#phoenix.geometry.Vertex)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="short_id"><a class="lift" href="#short_id">short\_id</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">short\_id() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="str"><a class="lift" href="#str">str</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">str() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="translate"><a class="lift" href="#translate">translate</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">translate(\_offset:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="flipx"><a class="lift" href="#flipx">flipx</a></a><code class="signature apipage">flipx : [Bool]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="flipy"><a class="lift" href="#flipy">flipy</a></a><code class="signature apipage">flipy : [Bool]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">clip\_rect : [phoenix.Rectangle]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="color"><a class="lift" href="#color">color</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">color : [phoenix.Color]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="depth"><a class="lift" href="#depth">depth</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">depth : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="dirty"><a class="lift" href="#dirty">dirty</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">dirty : [Bool]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="group"><a class="lift" href="#group">group</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">group : [Int]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="locked"><a class="lift" href="#locked">locked</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">locked : [Bool]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="primitive_type"><a class="lift" href="#primitive_type">primitive\_type</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">primitive\_type : [phoenix.PrimitiveType]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="shader"><a class="lift" href="#shader">shader</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">shader : [phoenix.Shader]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="texture"><a class="lift" href="#texture">texture</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">texture : [phoenix.Texture]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="visible"><a class="lift" href="#visible">visible</a></a><a title="inherited from phoenix.geometry.Geometry" class="tooltip inherited">&gt;</a><code class="signature apipage">visible : [Bool]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;