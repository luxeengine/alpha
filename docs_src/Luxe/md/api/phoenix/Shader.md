
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Shader</h1>
<small>`phoenix.Shader`</small>



---

`class`extends <code><span>luxe.Resource</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="errors"><a class="lift" href="#errors">errors</a></a><div class="clear"></div><code class="signature apipage">errors : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="log"><a class="lift" href="#log">log</a></a><div class="clear"></div><code class="signature apipage">log : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vertex_source_name"><a class="lift" href="#vertex_source_name">vertex\_source\_name</a></a><div class="clear"></div><code class="signature apipage">vertex\_source\_name : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fragment_source_name"><a class="lift" href="#fragment_source_name">fragment\_source\_name</a></a><div class="clear"></div><code class="signature apipage">fragment\_source\_name : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vert_shader"><a class="lift" href="#vert_shader">vert\_shader</a></a><div class="clear"></div><code class="signature apipage">vert\_shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frag_shader"><a class="lift" href="#frag_shader">frag\_shader</a></a><div class="clear"></div><code class="signature apipage">frag\_shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="program"><a class="lift" href="#program">program</a></a><div class="clear"></div><code class="signature apipage">program : [snow.render.opengl.GLProgram](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div><code class="signature apipage">shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="vert_attribute"><a class="lift" href="#vert_attribute">vert\_attribute</a></a><div class="clear"></div><code class="signature apipage">vert\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="tcoord_attribute"><a class="lift" href="#tcoord_attribute">tcoord\_attribute</a></a><div class="clear"></div><code class="signature apipage">tcoord\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="color_attribute"><a class="lift" href="#color_attribute">color\_attribute</a></a><div class="clear"></div><code class="signature apipage">color\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="normal_attribute"><a class="lift" href="#normal_attribute">normal\_attribute</a></a><div class="clear"></div><code class="signature apipage">normal\_attribute : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="projectionmatrix_attribute"><a class="lift" href="#projectionmatrix_attribute">projectionmatrix\_attribute</a></a><div class="clear"></div><code class="signature apipage">projectionmatrix\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="modelviewmatrix_attribute"><a class="lift" href="#modelviewmatrix_attribute">modelviewmatrix\_attribute</a></a><div class="clear"></div><code class="signature apipage">modelviewmatrix\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
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
                <a name="uniforms"><a class="lift" href="#uniforms">uniforms</a></a><div class="clear"></div><code class="signature apipage">uniforms : [Map](#)&lt;[String](#), [phoenix.UniformValue](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="uniform_textures"><a class="lift" href="#uniform_textures">uniform\_textures</a></a><div class="clear"></div><code class="signature apipage">uniform\_textures : [Map](#)&lt;[String](#), [phoenix.Texture](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activate"><a class="lift" href="#activate">activate</a></a> <div class="clear"></div><code class="signature apipage">activate() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deactivate"><a class="lift" href="#deactivate">deactivate</a></a> <div class="clear"></div><code class="signature apipage">deactivate() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_int"><a class="lift" href="#set_uniform_int">set\_uniform\_int</a></a> <div class="clear"></div><code class="signature apipage">set\_uniform\_int(\_name:[String](#)<span></span>, \_value:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_float"><a class="lift" href="#set_uniform_float">set\_uniform\_float</a></a> <div class="clear"></div><code class="signature apipage">set\_uniform\_float(\_name:[String](#)<span></span>, \_value:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_vector2"><a class="lift" href="#set_uniform_vector2">set\_uniform\_vector2</a></a> <div class="clear"></div><code class="signature apipage">set\_uniform\_vector2(\_name:[String](#)<span></span>, \_value:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_vector3"><a class="lift" href="#set_uniform_vector3">set\_uniform\_vector3</a></a> <div class="clear"></div><code class="signature apipage">set\_uniform\_vector3(\_name:[String](#)<span></span>, \_value:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_vector4"><a class="lift" href="#set_uniform_vector4">set\_uniform\_vector4</a></a> <div class="clear"></div><code class="signature apipage">set\_uniform\_vector4(\_name:[String](#)<span></span>, \_value:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_color"><a class="lift" href="#set_uniform_color">set\_uniform\_color</a></a> <div class="clear"></div><code class="signature apipage">set\_uniform\_color(\_name:[String](#)<span></span>, \_value:[phoenix.Color](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_texture"><a class="lift" href="#set_uniform_texture">set\_uniform\_texture</a></a> <div class="clear"></div><code class="signature apipage">set\_uniform\_texture(\_name:[String](#)<span></span>, \_value:[phoenix.Texture](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compile"><a class="lift" href="#compile">compile</a></a> <div class="clear"></div><code class="signature apipage">compile(\_type:[Int](#)<span></span>, \_source:[String](#)<span></span>, \_verbose:[Bool](#)<span>=false</span>) : [snow.render.opengl.GLShader](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="link"><a class="lift" href="#link">link</a></a> <div class="clear"></div><code class="signature apipage">link() : [snow.platform.native.render.opengl.GLProgram](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a> <div class="clear"></div><code class="signature apipage">drop() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="from_string"><a class="lift" href="#from_string">from\_string</a></a> <div class="clear"></div><code class="signature apipage">from\_string(\_vertex\_source:[String](#)<span></span>, \_fragment\_source:[String](#)<span></span>, \_frag\_name:[String](#)<span>=&#x27;&#x27;</span>, \_vertex\_name:[String](#)<span>=&#x27;&#x27;</span>, \_verbose:[Bool](#)<span>=false</span>) : [Bool](#)</code><br/><span class="small_desc_flat">Loads shaders from a string, compiles, and links them</span>
        </span>
    <span class="method apipage">
            <a name="addLog"><a class="lift" href="#addLog">addLog</a></a> <div class="clear"></div><code class="signature apipage">addLog(\_log:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="addError"><a class="lift" href="#addError">addError</a></a> <div class="clear"></div><code class="signature apipage">addError(\_error:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_manager:[luxe.ResourceManager](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">load(\_psid:[String](#)<span></span>, \_vsid:[String](#)<span>=null</span>, \_onloaded:[phoenix.Shader](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [phoenix.Shader](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;