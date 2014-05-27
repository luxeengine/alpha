
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Batcher



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="buffer_count"><a class="lift" href="#buffer_count">buffer\_count</a></a><code class="signature apipage">buffer\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="buffer_index"><a class="lift" href="#buffer_index">buffer\_index</a></a><code class="signature apipage">buffer\_index : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="color_attribute"><a class="lift" href="#color_attribute">color\_attribute</a></a><code class="signature apipage">color\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="colorlist"><a class="lift" href="#colorlist">colorlist</a></a><code class="signature apipage">colorlist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="colors"><a class="lift" href="#colors">colors</a></a><code class="signature apipage">colors : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="draw_calls"><a class="lift" href="#draw_calls">draw\_calls</a></a><code class="signature apipage">draw\_calls : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="dynamic_batched_count"><a class="lift" href="#dynamic_batched_count">dynamic\_batched\_count</a></a><code class="signature apipage">dynamic\_batched\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="enabled"><a class="lift" href="#enabled">enabled</a></a><code class="signature apipage">enabled : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><code class="signature apipage">geometry : [luxe.structural.BalancedBinarySearchTree](#luxe.structural.BalancedBinarySearchTree)&lt;[phoenix.geometry.GeometryKey](#phoenix.geometry.GeometryKey), [phoenix.geometry.Geometry](#phoenix.geometry.Geometry)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="groups"><a class="lift" href="#groups">groups</a></a><code class="signature apipage">groups : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [Array](http://api.haxe.org/Array.html)&lt;[phoenix.BatchGroup](#phoenix.BatchGroup)&gt;&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="id"><a class="lift" href="#id">id</a></a><code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="log"><a class="lift" href="#log">log</a></a><code class="signature apipage">log : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="modelviewmatrix_attribute"><a class="lift" href="#modelviewmatrix_attribute">modelviewmatrix\_attribute</a></a><code class="signature apipage">modelviewmatrix\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="normal_attribute"><a class="lift" href="#normal_attribute">normal\_attribute</a></a><code class="signature apipage">normal\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="normalBuffers"><a class="lift" href="#normalBuffers">normalBuffers</a></a><code class="signature apipage">normalBuffers : [Array](http://api.haxe.org/Array.html)&lt;[lime.gl.GLBuffer]()&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="normallist"><a class="lift" href="#normallist">normallist</a></a><code class="signature apipage">normallist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="normals"><a class="lift" href="#normals">normals</a></a><code class="signature apipage">normals : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="projectionmatrix_attribute"><a class="lift" href="#projectionmatrix_attribute">projectionmatrix\_attribute</a></a><code class="signature apipage">projectionmatrix\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><code class="signature apipage">renderer : [phoenix.Renderer](#phoenix.Renderer)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_batched_count"><a class="lift" href="#static_batched_count">static\_batched\_count</a></a><code class="signature apipage">static\_batched\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_colorlist"><a class="lift" href="#static_colorlist">static\_colorlist</a></a><code class="signature apipage">static\_colorlist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_colors"><a class="lift" href="#static_colors">static\_colors</a></a><code class="signature apipage">static\_colors : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_normallist"><a class="lift" href="#static_normallist">static\_normallist</a></a><code class="signature apipage">static\_normallist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_normals"><a class="lift" href="#static_normals">static\_normals</a></a><code class="signature apipage">static\_normals : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_tcoordlist"><a class="lift" href="#static_tcoordlist">static\_tcoordlist</a></a><code class="signature apipage">static\_tcoordlist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_tcoords"><a class="lift" href="#static_tcoords">static\_tcoords</a></a><code class="signature apipage">static\_tcoords : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_vertlist"><a class="lift" href="#static_vertlist">static\_vertlist</a></a><code class="signature apipage">static\_vertlist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="static_verts"><a class="lift" href="#static_verts">static\_verts</a></a><code class="signature apipage">static\_verts : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tcoord_attribute"><a class="lift" href="#tcoord_attribute">tcoord\_attribute</a></a><code class="signature apipage">tcoord\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tcoordBuffers"><a class="lift" href="#tcoordBuffers">tcoordBuffers</a></a><code class="signature apipage">tcoordBuffers : [Array](http://api.haxe.org/Array.html)&lt;[lime.gl.GLBuffer]()&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tcoordlist"><a class="lift" href="#tcoordlist">tcoordlist</a></a><code class="signature apipage">tcoordlist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tcoords"><a class="lift" href="#tcoords">tcoords</a></a><code class="signature apipage">tcoords : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex0_attribute"><a class="lift" href="#tex0_attribute">tex0\_attribute</a></a><code class="signature apipage">tex0\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex1_attribute"><a class="lift" href="#tex1_attribute">tex1\_attribute</a></a><code class="signature apipage">tex1\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex2_attribute"><a class="lift" href="#tex2_attribute">tex2\_attribute</a></a><code class="signature apipage">tex2\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex3_attribute"><a class="lift" href="#tex3_attribute">tex3\_attribute</a></a><code class="signature apipage">tex3\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex4_attribute"><a class="lift" href="#tex4_attribute">tex4\_attribute</a></a><code class="signature apipage">tex4\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex5_attribute"><a class="lift" href="#tex5_attribute">tex5\_attribute</a></a><code class="signature apipage">tex5\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex6_attribute"><a class="lift" href="#tex6_attribute">tex6\_attribute</a></a><code class="signature apipage">tex6\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tex7_attribute"><a class="lift" href="#tex7_attribute">tex7\_attribute</a></a><code class="signature apipage">tex7\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tree_changed"><a class="lift" href="#tree_changed">tree\_changed</a></a><code class="signature apipage">tree\_changed : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vcolorBuffers"><a class="lift" href="#vcolorBuffers">vcolorBuffers</a></a><code class="signature apipage">vcolorBuffers : [Array](http://api.haxe.org/Array.html)&lt;[lime.gl.GLBuffer]()&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vert_attribute"><a class="lift" href="#vert_attribute">vert\_attribute</a></a><code class="signature apipage">vert\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vertexBuffers"><a class="lift" href="#vertexBuffers">vertexBuffers</a></a><code class="signature apipage">vertexBuffers : [Array](http://api.haxe.org/Array.html)&lt;[lime.gl.GLBuffer]()&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vertlist"><a class="lift" href="#vertlist">vertlist</a></a><code class="signature apipage">vertlist : [lime.utils.Float32Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="verts"><a class="lift" href="#verts">verts</a></a><code class="signature apipage">verts : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="view"><a class="lift" href="#view">view</a></a><code class="signature apipage">view : [phoenix.Camera](#phoenix.Camera)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="visible_count"><a class="lift" href="#visible_count">visible\_count</a></a><code class="signature apipage">visible\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><code class="signature apipage">add(\_geom:<span>[phoenix.geometry.Geometry](#phoenix.geometry.Geometry)</span>, ?\_force\_add:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_group"><a class="lift" href="#add_group">add\_group</a></a><code class="signature apipage">add\_group(\_group:<span>[Int](http://api.haxe.org/Int.html)</span>, \_pre\_render:<span>[phoenix.Batcher-&gt;Void](#phoenix.Batcher->Void)</span>, \_post\_render:<span>[phoenix.Batcher-&gt;Void](#phoenix.Batcher->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch"><a class="lift" href="#batch">batch</a></a><code class="signature apipage">batch(?persist\_immediate:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="blend_mode"><a class="lift" href="#blend_mode">blend\_mode</a></a><code class="signature apipage">blend\_mode(?\_src\_mode:<span>[phoenix.BlendMode](#phoenix.BlendMode)=null</span>, ?\_dst\_mode:<span>[phoenix.BlendMode](#phoenix.BlendMode)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compare"><a class="lift" href="#compare">compare</a></a><code class="signature apipage">compare(other:<span>[phoenix.Batcher](#phoenix.Batcher)</span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compare_rule"><a class="lift" href="#compare_rule">compare\_rule</a></a><code class="signature apipage">compare\_rule(a:<span>[phoenix.geometry.GeometryKey](#phoenix.geometry.GeometryKey)</span>, b:<span>[phoenix.geometry.GeometryKey](#phoenix.geometry.GeometryKey)</span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compare_rule_to_string"><a class="lift" href="#compare_rule_to_string">compare\_rule\_to\_string</a></a><code class="signature apipage">compare\_rule\_to\_string(r:<span>[Int](http://api.haxe.org/Int.html)</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="draw"><a class="lift" href="#draw">draw</a></a><code class="signature apipage">draw(?persist\_immediate:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="geometry_compare"><a class="lift" href="#geometry_compare">geometry\_compare</a></a><code class="signature apipage">geometry\_compare(a:<span>[phoenix.geometry.GeometryKey](#phoenix.geometry.GeometryKey)</span>, b:<span>[phoenix.geometry.GeometryKey](#phoenix.geometry.GeometryKey)</span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_r:<span>[phoenix.Renderer](#phoenix.Renderer)</span>, ?\_name:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><code class="signature apipage">remove(\_geom:<span>[phoenix.geometry.Geometry](#phoenix.geometry.Geometry)</span>, ?\_remove\_batcher\_from\_geometry:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_layer"><a class="lift" href="#set_layer">set\_layer</a></a><code class="signature apipage">set\_layer(\_layer:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shader_activate"><a class="lift" href="#shader_activate">shader\_activate</a></a><code class="signature apipage">shader\_activate(\_shader:<span>[phoenix.Shader](#phoenix.Shader)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="submit_current_vertex_list"><a class="lift" href="#submit_current_vertex_list">submit\_current\_vertex\_list</a></a><code class="signature apipage">submit\_current\_vertex\_list(type:<span>[phoenix.PrimitiveType](#phoenix.PrimitiveType)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="submit_static_geometry"><a class="lift" href="#submit_static_geometry">submit\_static\_geometry</a></a><code class="signature apipage">submit\_static\_geometry(geom:<span>[phoenix.geometry.Geometry](#phoenix.geometry.Geometry)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="layer"><a class="lift" href="#layer">layer</a></a><code class="signature apipage">layer : [Int]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;