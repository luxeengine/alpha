
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
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div><code class="signature apipage">transform : [phoenix.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vertices"><a class="lift" href="#vertices">vertices</a></a><div class="clear"></div><code class="signature apipage">vertices : [Array](#)&lt;[phoenix.geometry.Vertex](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="submitted"><a class="lift" href="#submitted">submitted</a></a><div class="clear"></div><code class="signature apipage">submitted : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_vertex_buffer"><a class="lift" href="#static_vertex_buffer">static\_vertex\_buffer</a></a><div class="clear"></div><code class="signature apipage">static\_vertex\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_tcoord_buffer"><a class="lift" href="#static_tcoord_buffer">static\_tcoord\_buffer</a></a><div class="clear"></div><code class="signature apipage">static\_tcoord\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_vcolor_buffer"><a class="lift" href="#static_vcolor_buffer">static\_vcolor\_buffer</a></a><div class="clear"></div><code class="signature apipage">static\_vcolor\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="static_normal_buffer"><a class="lift" href="#static_normal_buffer">static\_normal\_buffer</a></a><div class="clear"></div><code class="signature apipage">static\_normal\_buffer : [snow.render.opengl.GLBuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="added"><a class="lift" href="#added">added</a></a><div class="clear"></div><code class="signature apipage">added : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="batchers"><a class="lift" href="#batchers">batchers</a></a><div class="clear"></div><code class="signature apipage">batchers : [Array](#)&lt;[phoenix.Batcher](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div><code class="signature apipage">state : [phoenix.geometry.GeometryState](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dropped"><a class="lift" href="#dropped">dropped</a></a><div class="clear"></div><code class="signature apipage">dropped : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="uuid"><a class="lift" href="#uuid">uuid</a></a><div class="clear"></div><code class="signature apipage">uuid : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div><code class="signature apipage">id : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shadow_primitive_type"><a class="lift" href="#shadow_primitive_type">shadow\_primitive\_type</a></a><div class="clear"></div><code class="signature apipage">shadow\_primitive\_type : [phoenix.PrimitiveType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shadow_texture"><a class="lift" href="#shadow_texture">shadow\_texture</a></a><div class="clear"></div><code class="signature apipage">shadow\_texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shadow_shader"><a class="lift" href="#shadow_shader">shadow\_shader</a></a><div class="clear"></div><code class="signature apipage">shadow\_shader : [phoenix.Shader](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shadow_group"><a class="lift" href="#shadow_group">shadow\_group</a></a><div class="clear"></div><code class="signature apipage">shadow\_group : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shadow_depth"><a class="lift" href="#shadow_depth">shadow\_depth</a></a><div class="clear"></div><code class="signature apipage">shadow\_depth : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shadow_clip"><a class="lift" href="#shadow_clip">shadow\_clip</a></a><div class="clear"></div><code class="signature apipage">shadow\_clip : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty_primitive_type"><a class="lift" href="#dirty_primitive_type">dirty\_primitive\_type</a></a><div class="clear"></div><code class="signature apipage">dirty\_primitive\_type : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty_texture"><a class="lift" href="#dirty_texture">dirty\_texture</a></a><div class="clear"></div><code class="signature apipage">dirty\_texture : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty_shader"><a class="lift" href="#dirty_shader">dirty\_shader</a></a><div class="clear"></div><code class="signature apipage">dirty\_shader : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty_group"><a class="lift" href="#dirty_group">dirty\_group</a></a><div class="clear"></div><code class="signature apipage">dirty\_group : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty_depth"><a class="lift" href="#dirty_depth">dirty\_depth</a></a><div class="clear"></div><code class="signature apipage">dirty\_depth : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty_clip"><a class="lift" href="#dirty_clip">dirty\_clip</a></a><div class="clear"></div><code class="signature apipage">dirty\_clip : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><div class="clear"></div><code class="signature apipage">immediate : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_final_vert_position"><a class="lift" href="#_final_vert_position">\_final\_vert\_position</a></a><div class="clear"></div><code class="signature apipage">\_final\_vert\_position : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="key"><a class="lift" href="#key">key</a></a><div class="clear"></div><code class="signature apipage">key : [phoenix.geometry.GeometryKey](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_sequence_key"><a class="lift" href="#_sequence_key">\_sequence\_key</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">\_sequence\_key : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="primitive_type"><a class="lift" href="#primitive_type">primitive\_type</a></a> <div class="clear"></div><code class="signature apipage">primitive\_type : [phoenix.PrimitiveType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a> <div class="clear"></div><code class="signature apipage">texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a> <div class="clear"></div><code class="signature apipage">shader : [phoenix.Shader](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a> <div class="clear"></div><code class="signature apipage">depth : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a> <div class="clear"></div><code class="signature apipage">group : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a> <div class="clear"></div><code class="signature apipage">clip\_rect : [phoenix.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a> <div class="clear"></div><code class="signature apipage">visible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="locked"><a class="lift" href="#locked">locked</a></a> <div class="clear"></div><code class="signature apipage">locked : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty"><a class="lift" href="#dirty">dirty</a></a> <div class="clear"></div><code class="signature apipage">dirty : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a> <div class="clear"></div><code class="signature apipage">color : [phoenix.Color](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="key_string"><a class="lift" href="#key_string">key\_string</a></a> <div class="clear"></div><code class="signature apipage">key\_string() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="refresh_key"><a class="lift" href="#refresh_key">refresh\_key</a></a> <div class="clear"></div><code class="signature apipage">refresh\_key() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="short_id"><a class="lift" href="#short_id">short\_id</a></a> <div class="clear"></div><code class="signature apipage">short\_id() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="str"><a class="lift" href="#str">str</a></a> <div class="clear"></div><code class="signature apipage">str() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a> <div class="clear"></div><code class="signature apipage">drop(remove:[Bool](#)<span>=true</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a> <div class="clear"></div><code class="signature apipage">add(v:[phoenix.geometry.Vertex](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a> <div class="clear"></div><code class="signature apipage">remove(v:[phoenix.geometry.Vertex](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch"><a class="lift" href="#batch">batch</a></a> <div class="clear"></div><code class="signature apipage">batch(vert\_index:[Int](#)<span></span>, tcoord\_index:[Int](#)<span></span>, color\_index:[Int](#)<span></span>, normal\_index:[Int](#)<span></span>, vertlist:[snow.utils.Float32Array](#)<span></span>, tcoordlist:[snow.utils.Float32Array](#)<span></span>, colorlist:[snow.utils.Float32Array](#)<span></span>, normallist:[snow.utils.Float32Array](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="batch_into_arrays"><a class="lift" href="#batch_into_arrays">batch\_into\_arrays</a></a> <div class="clear"></div><code class="signature apipage">batch\_into\_arrays(vertlist:[Array](#)&lt;[Float](#)&gt;<span></span>, tcoordlist:[Array](#)&lt;[Float](#)&gt;<span></span>, colorlist:[Array](#)&lt;[Float](#)&gt;<span></span>, normallist:[Array](#)&lt;[Float](#)&gt;<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="translate"><a class="lift" href="#translate">translate</a></a> <div class="clear"></div><code class="signature apipage">translate(\_offset:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_locked"><a class="lift" href="#set_locked">set\_locked</a></a> <div class="clear"></div><code class="signature apipage">set\_locked(\_locked:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_locked"><a class="lift" href="#get_locked">get\_locked</a></a> <div class="clear"></div><code class="signature apipage">get\_locked() : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_dirty"><a class="lift" href="#set_dirty">set\_dirty</a></a> <div class="clear"></div><code class="signature apipage">set\_dirty(\_dirty:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_dirty"><a class="lift" href="#get_dirty">get\_dirty</a></a> <div class="clear"></div><code class="signature apipage">get\_dirty() : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="refresh"><a class="lift" href="#refresh">refresh</a></a> <div class="clear"></div><code class="signature apipage">refresh() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_primitive_type"><a class="lift" href="#get_primitive_type">get\_primitive\_type</a></a> <div class="clear"></div><code class="signature apipage">get\_primitive\_type() : [phoenix.PrimitiveType](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_primitive_type"><a class="lift" href="#set_primitive_type">set\_primitive\_type</a></a> <div class="clear"></div><code class="signature apipage">set\_primitive\_type(val:[phoenix.PrimitiveType](#)<span></span>) : [phoenix.PrimitiveType](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_texture"><a class="lift" href="#get_texture">get\_texture</a></a> <div class="clear"></div><code class="signature apipage">get\_texture() : [phoenix.Texture](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_texture"><a class="lift" href="#set_texture">set\_texture</a></a> <div class="clear"></div><code class="signature apipage">set\_texture(val:[phoenix.Texture](#)<span></span>) : [phoenix.Texture](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_visible"><a class="lift" href="#set_visible">set\_visible</a></a> <div class="clear"></div><code class="signature apipage">set\_visible(val:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_color"><a class="lift" href="#set_color">set\_color</a></a> <div class="clear"></div><code class="signature apipage">set\_color(val:[phoenix.Color](#)<span></span>) : [phoenix.Color](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_shader"><a class="lift" href="#get_shader">get\_shader</a></a> <div class="clear"></div><code class="signature apipage">get\_shader() : [phoenix.Shader](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_shader"><a class="lift" href="#set_shader">set\_shader</a></a> <div class="clear"></div><code class="signature apipage">set\_shader(val:[phoenix.Shader](#)<span></span>) : [phoenix.Shader](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_depth"><a class="lift" href="#get_depth">get\_depth</a></a> <div class="clear"></div><code class="signature apipage">get\_depth() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_depth"><a class="lift" href="#set_depth">set\_depth</a></a> <div class="clear"></div><code class="signature apipage">set\_depth(val:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_group"><a class="lift" href="#get_group">get\_group</a></a> <div class="clear"></div><code class="signature apipage">get\_group() : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_group"><a class="lift" href="#set_group">set\_group</a></a> <div class="clear"></div><code class="signature apipage">set\_group(val:[Int](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_clip"><a class="lift" href="#get_clip">get\_clip</a></a> <div class="clear"></div><code class="signature apipage">get\_clip() : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_clip"><a class="lift" href="#set_clip">set\_clip</a></a> <div class="clear"></div><code class="signature apipage">set\_clip(val:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_clip_rect"><a class="lift" href="#get_clip_rect">get\_clip\_rect</a></a> <div class="clear"></div><code class="signature apipage">get\_clip\_rect() : [phoenix.Rectangle](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_clip_rect"><a class="lift" href="#set_clip_rect">set\_clip\_rect</a></a> <div class="clear"></div><code class="signature apipage">set\_clip\_rect(val:[phoenix.Rectangle](#)<span></span>) : [phoenix.Rectangle](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(options:[luxe.options.GeometryOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;