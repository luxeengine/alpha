
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Geometry</h1>
<small>`phoenix.geometry.Geometry`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><code class="signature apipage">transform : [phoenix.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><code class="signature apipage">vertices : [Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="submitted"><a class="lift" href="#submitted">submitted</a></a><code class="signature apipage">submitted : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_vertex_buffer"><a class="lift" href="#static_vertex_buffer">static\_vertex\_buffer</a></a><code class="signature apipage">static\_vertex\_buffer : [lime.gl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_tcoord_buffer"><a class="lift" href="#static_tcoord_buffer">static\_tcoord\_buffer</a></a><code class="signature apipage">static\_tcoord\_buffer : [lime.gl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_vcolor_buffer"><a class="lift" href="#static_vcolor_buffer">static\_vcolor\_buffer</a></a><code class="signature apipage">static\_vcolor\_buffer : [lime.gl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_normal_buffer"><a class="lift" href="#static_normal_buffer">static\_normal\_buffer</a></a><code class="signature apipage">static\_normal\_buffer : [lime.gl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="added"><a class="lift" href="#added">added</a></a><code class="signature apipage">added : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="batchers"><a class="lift" href="#batchers">batchers</a></a><code class="signature apipage">batchers : [Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><code class="signature apipage">state : [phoenix.geometry.GeometryState](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dropped"><a class="lift" href="#dropped">dropped</a></a><code class="signature apipage">dropped : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="uuid"><a class="lift" href="#uuid">uuid</a></a><code class="signature apipage">uuid : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><code class="signature apipage">id : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><code class="signature apipage">immediate : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="key"><a class="lift" href="#key">key</a></a><code class="signature apipage">key : [phoenix.geometry.GeometryKey](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="primitive_type"><a class="lift" href="#primitive_type">primitive\_type</a></a><code class="signature apipage">primitive\_type : [phoenix.PrimitiveType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><code class="signature apipage">texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><code class="signature apipage">shader : [phoenix.Shader](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><code class="signature apipage">depth : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><code class="signature apipage">group : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><code class="signature apipage">clip\_rect : [phoenix.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><code class="signature apipage">visible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="locked"><a class="lift" href="#locked">locked</a></a><code class="signature apipage">locked : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty"><a class="lift" href="#dirty">dirty</a></a><code class="signature apipage">dirty : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><code class="signature apipage">color : [phoenix.Color](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="key_string"><a class="lift" href="#key_string">key\_string</a></a><code class="signature apipage">key\_string() : String</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="refresh_key"><a class="lift" href="#refresh_key">refresh\_key</a></a><code class="signature apipage">refresh\_key() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="short_id"><a class="lift" href="#short_id">short\_id</a></a><code class="signature apipage">short\_id() : String</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="str"><a class="lift" href="#str">str</a></a><code class="signature apipage">str() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><code class="signature apipage">drop(remove:Bool<span>=true</span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><code class="signature apipage">add(v:phoenix.geometry.Vertex<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><code class="signature apipage">remove(v:phoenix.geometry.Vertex<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch"><a class="lift" href="#batch">batch</a></a><code class="signature apipage">batch(vert\_index:Int<span></span>, tcoord\_index:Int<span></span>, color\_index:Int<span></span>, normal\_index:Int<span></span>, vertlist:lime.utils.Float32Array<span></span>, tcoordlist:lime.utils.Float32Array<span></span>, colorlist:lime.utils.Float32Array<span></span>, normallist:lime.utils.Float32Array<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch_into_arrays"><a class="lift" href="#batch_into_arrays">batch\_into\_arrays</a></a><code class="signature apipage">batch\_into\_arrays(vertlist:Array<span></span>, tcoordlist:Array<span></span>, colorlist:Array<span></span>, normallist:Array<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="translate"><a class="lift" href="#translate">translate</a></a><code class="signature apipage">translate(\_offset:phoenix.Vector<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(options:luxe.options.GeometryOptions<span>=null</span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;