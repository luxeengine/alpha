
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Batcher</h1>
<small>`phoenix.Batcher`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div><code class="signature apipage">id : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="enabled"><a class="lift" href="#enabled">enabled</a></a><div class="clear"></div><code class="signature apipage">enabled : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><div class="clear"></div><code class="signature apipage">geometry : [luxe.structural.BalancedBinarySearchTree](#)&lt;[phoenix.geometry.GeometryKey](#), [phoenix.geometry.Geometry](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="groups"><a class="lift" href="#groups">groups</a></a><div class="clear"></div><code class="signature apipage">groups : [Map](#)&lt;[Int](#), [Array](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tree_changed"><a class="lift" href="#tree_changed">tree\_changed</a></a><div class="clear"></div><code class="signature apipage">tree\_changed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vertlist"><a class="lift" href="#vertlist">vertlist</a></a><div class="clear"></div><code class="signature apipage">vertlist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tcoordlist"><a class="lift" href="#tcoordlist">tcoordlist</a></a><div class="clear"></div><code class="signature apipage">tcoordlist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="colorlist"><a class="lift" href="#colorlist">colorlist</a></a><div class="clear"></div><code class="signature apipage">colorlist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="normallist"><a class="lift" href="#normallist">normallist</a></a><div class="clear"></div><code class="signature apipage">normallist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_vertlist"><a class="lift" href="#static_vertlist">static\_vertlist</a></a><div class="clear"></div><code class="signature apipage">static\_vertlist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_tcoordlist"><a class="lift" href="#static_tcoordlist">static\_tcoordlist</a></a><div class="clear"></div><code class="signature apipage">static\_tcoordlist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_colorlist"><a class="lift" href="#static_colorlist">static\_colorlist</a></a><div class="clear"></div><code class="signature apipage">static\_colorlist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_normallist"><a class="lift" href="#static_normallist">static\_normallist</a></a><div class="clear"></div><code class="signature apipage">static\_normallist : [snow.utils.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vert_floats"><a class="lift" href="#vert_floats">vert\_floats</a></a><div class="clear"></div><code class="signature apipage">vert\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tcoord_floats"><a class="lift" href="#tcoord_floats">tcoord\_floats</a></a><div class="clear"></div><code class="signature apipage">tcoord\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="color_floats"><a class="lift" href="#color_floats">color\_floats</a></a><div class="clear"></div><code class="signature apipage">color\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="normal_floats"><a class="lift" href="#normal_floats">normal\_floats</a></a><div class="clear"></div><code class="signature apipage">normal\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_vert_floats"><a class="lift" href="#static_vert_floats">static\_vert\_floats</a></a><div class="clear"></div><code class="signature apipage">static\_vert\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_tcoord_floats"><a class="lift" href="#static_tcoord_floats">static\_tcoord\_floats</a></a><div class="clear"></div><code class="signature apipage">static\_tcoord\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_color_floats"><a class="lift" href="#static_color_floats">static\_color\_floats</a></a><div class="clear"></div><code class="signature apipage">static\_color\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_normal_floats"><a class="lift" href="#static_normal_floats">static\_normal\_floats</a></a><div class="clear"></div><code class="signature apipage">static\_normal\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="buffer_count"><a class="lift" href="#buffer_count">buffer\_count</a></a><div class="clear"></div><code class="signature apipage">buffer\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="buffer_index"><a class="lift" href="#buffer_index">buffer\_index</a></a><div class="clear"></div><code class="signature apipage">buffer\_index : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="max_verts"><a class="lift" href="#max_verts">max\_verts</a></a><div class="clear"></div><code class="signature apipage">max\_verts : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="max_floats"><a class="lift" href="#max_floats">max\_floats</a></a><div class="clear"></div><code class="signature apipage">max\_floats : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vert_count"><a class="lift" href="#vert_count">vert\_count</a></a><div class="clear"></div><code class="signature apipage">vert\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vertexBuffers"><a class="lift" href="#vertexBuffers">vertexBuffers</a></a><div class="clear"></div><code class="signature apipage">vertexBuffers : [Array](#)&lt;[snow.render.opengl.GLBuffer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tcoordBuffers"><a class="lift" href="#tcoordBuffers">tcoordBuffers</a></a><div class="clear"></div><code class="signature apipage">tcoordBuffers : [Array](#)&lt;[snow.render.opengl.GLBuffer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vcolorBuffers"><a class="lift" href="#vcolorBuffers">vcolorBuffers</a></a><div class="clear"></div><code class="signature apipage">vcolorBuffers : [Array](#)&lt;[snow.render.opengl.GLBuffer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="normalBuffers"><a class="lift" href="#normalBuffers">normalBuffers</a></a><div class="clear"></div><code class="signature apipage">normalBuffers : [Array](#)&lt;[snow.render.opengl.GLBuffer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="projectionmatrix_attribute"><a class="lift" href="#projectionmatrix_attribute">projectionmatrix\_attribute</a></a><div class="clear"></div><code class="signature apipage">projectionmatrix\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="modelviewmatrix_attribute"><a class="lift" href="#modelviewmatrix_attribute">modelviewmatrix\_attribute</a></a><div class="clear"></div><code class="signature apipage">modelviewmatrix\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vert_attribute"><a class="lift" href="#vert_attribute">vert\_attribute</a></a><div class="clear"></div><code class="signature apipage">vert\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tcoord_attribute"><a class="lift" href="#tcoord_attribute">tcoord\_attribute</a></a><div class="clear"></div><code class="signature apipage">tcoord\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="color_attribute"><a class="lift" href="#color_attribute">color\_attribute</a></a><div class="clear"></div><code class="signature apipage">color\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="normal_attribute"><a class="lift" href="#normal_attribute">normal\_attribute</a></a><div class="clear"></div><code class="signature apipage">normal\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex0_attribute"><a class="lift" href="#tex0_attribute">tex0\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex0\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex1_attribute"><a class="lift" href="#tex1_attribute">tex1\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex1\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex2_attribute"><a class="lift" href="#tex2_attribute">tex2\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex2\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex3_attribute"><a class="lift" href="#tex3_attribute">tex3\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex3\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex4_attribute"><a class="lift" href="#tex4_attribute">tex4\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex4\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex5_attribute"><a class="lift" href="#tex5_attribute">tex5\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex5\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex6_attribute"><a class="lift" href="#tex6_attribute">tex6\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex6\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tex7_attribute"><a class="lift" href="#tex7_attribute">tex7\_attribute</a></a><div class="clear"></div><code class="signature apipage">tex7\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><div class="clear"></div><code class="signature apipage">renderer : [phoenix.Renderer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view"><a class="lift" href="#view">view</a></a><div class="clear"></div><code class="signature apipage">view : [phoenix.Camera](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="draw_calls"><a class="lift" href="#draw_calls">draw\_calls</a></a><div class="clear"></div><code class="signature apipage">draw\_calls : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dynamic_batched_count"><a class="lift" href="#dynamic_batched_count">dynamic\_batched\_count</a></a><div class="clear"></div><code class="signature apipage">dynamic\_batched\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_batched_count"><a class="lift" href="#static_batched_count">static\_batched\_count</a></a><div class="clear"></div><code class="signature apipage">static\_batched\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visible_count"><a class="lift" href="#visible_count">visible\_count</a></a><div class="clear"></div><code class="signature apipage">visible\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="log"><a class="lift" href="#log">log</a></a><div class="clear"></div><code class="signature apipage">log : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div><code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="layer"><a class="lift" href="#layer">layer</a></a> <div class="clear"></div><code class="signature apipage">layer : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="set_layer"><a class="lift" href="#set_layer">set\_layer</a></a> <div class="clear"></div><code class="signature apipage">set\_layer(\_layer:[Int](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a> <div class="clear"></div><code class="signature apipage">toString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compare"><a class="lift" href="#compare">compare</a></a> <div class="clear"></div><code class="signature apipage">compare(other:[phoenix.Batcher](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_group"><a class="lift" href="#add_group">add\_group</a></a> <div class="clear"></div><code class="signature apipage">add\_group(\_group:[Int](#)<span></span>, \_pre\_render:[phoenix.Batcher](#)&nbsp;-&gt; [Void](#)<span>=null</span>, \_post\_render:[phoenix.Batcher](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="blend_mode"><a class="lift" href="#blend_mode">blend\_mode</a></a> <div class="clear"></div><code class="signature apipage">blend\_mode(\_src\_mode:[phoenix.BlendMode](#)<span>=null</span>, \_dst\_mode:[phoenix.BlendMode](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compare_rule_to_string"><a class="lift" href="#compare_rule_to_string">compare\_rule\_to\_string</a></a> <div class="clear"></div><code class="signature apipage">compare\_rule\_to\_string(r:[Int](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compare_rule"><a class="lift" href="#compare_rule">compare\_rule</a></a> <div class="clear"></div><code class="signature apipage">compare\_rule(a:[phoenix.geometry.GeometryKey](#)<span></span>, b:[phoenix.geometry.GeometryKey](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="geometry_compare"><a class="lift" href="#geometry_compare">geometry\_compare</a></a> <div class="clear"></div><code class="signature apipage">geometry\_compare(a:[phoenix.geometry.GeometryKey](#)<span></span>, b:[phoenix.geometry.GeometryKey](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="list_geometry"><a class="lift" href="#list_geometry">list\_geometry</a></a> <div class="clear"></div><code class="signature apipage">list\_geometry() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a> <div class="clear"></div><code class="signature apipage">add(\_geom:[phoenix.geometry.Geometry](#)<span></span>, \_force\_add:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a> <div class="clear"></div><code class="signature apipage">remove(\_geom:[phoenix.geometry.Geometry](#)<span></span>, \_remove\_batcher\_from\_geometry:[Bool](#)<span>=true</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shader_activate"><a class="lift" href="#shader_activate">shader\_activate</a></a> <div class="clear"></div><code class="signature apipage">shader\_activate(\_shader:[phoenix.Shader](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch"><a class="lift" href="#batch">batch</a></a> <div class="clear"></div><code class="signature apipage">batch(persist\_immediate:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="draw"><a class="lift" href="#draw">draw</a></a> <div class="clear"></div><code class="signature apipage">draw(persist\_immediate:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="submit_static_geometry"><a class="lift" href="#submit_static_geometry">submit\_static\_geometry</a></a> <div class="clear"></div><code class="signature apipage">submit\_static\_geometry(geom:[phoenix.geometry.Geometry](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="submit_current_vertex_list"><a class="lift" href="#submit_current_vertex_list">submit\_current\_vertex\_list</a></a> <div class="clear"></div><code class="signature apipage">submit\_current\_vertex\_list(type:[phoenix.PrimitiveType](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="geometry_batch"><a class="lift" href="#geometry_batch">geometry\_batch</a></a> <div class="clear"></div><code class="signature apipage">geometry\_batch(geom:[phoenix.geometry.Geometry](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="geometry_batch_static"><a class="lift" href="#geometry_batch_static">geometry\_batch\_static</a></a> <div class="clear"></div><code class="signature apipage">geometry\_batch\_static(geom:[phoenix.geometry.Geometry](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_enable_attributes"><a class="lift" href="#_enable_attributes">\_enable\_attributes</a></a> <div class="clear"></div><code class="signature apipage">\_enable\_attributes() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_disable_attributes"><a class="lift" href="#_disable_attributes">\_disable\_attributes</a></a> <div class="clear"></div><code class="signature apipage">\_disable\_attributes() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_r:[phoenix.Renderer](#)<span></span>, \_name:[String](#)<span>=&#x27;&#x27;</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;