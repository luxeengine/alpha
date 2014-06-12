
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Shader



---

`class`extends <code><span>[luxe.Resource]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="color_attribute"><a class="lift" href="#color_attribute">color\_attribute</a></a><code class="signature apipage">color\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="errors"><a class="lift" href="#errors">errors</a></a><code class="signature apipage">errors : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="frag_shader"><a class="lift" href="#frag_shader">frag\_shader</a></a><code class="signature apipage">frag\_shader : [lime.gl.GLShader]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="fragment_source_name"><a class="lift" href="#fragment_source_name">fragment\_source\_name</a></a><code class="signature apipage">fragment\_source\_name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="log"><a class="lift" href="#log">log</a></a><code class="signature apipage">log : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="modelviewmatrix_attribute"><a class="lift" href="#modelviewmatrix_attribute">modelviewmatrix\_attribute</a></a><code class="signature apipage">modelviewmatrix\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="normal_attribute"><a class="lift" href="#normal_attribute">normal\_attribute</a></a><code class="signature apipage">normal\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="program"><a class="lift" href="#program">program</a></a><code class="signature apipage">program : [lime.gl.GLProgram]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="projectionmatrix_attribute"><a class="lift" href="#projectionmatrix_attribute">projectionmatrix\_attribute</a></a><code class="signature apipage">projectionmatrix\_attribute : [lime.gl.GLUniformLocation]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="shader"><a class="lift" href="#shader">shader</a></a><code class="signature apipage">shader : [lime.gl.GLShader]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="tcoord_attribute"><a class="lift" href="#tcoord_attribute">tcoord\_attribute</a></a><code class="signature apipage">tcoord\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
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
            <a name="uniforms"><a class="lift" href="#uniforms">uniforms</a></a><code class="signature apipage">uniforms : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.UniformValue](#phoenix.UniformValue)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&gt;&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vert_attribute"><a class="lift" href="#vert_attribute">vert\_attribute</a></a><code class="signature apipage">vert\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vert_shader"><a class="lift" href="#vert_shader">vert\_shader</a></a><code class="signature apipage">vert\_shader : [lime.gl.GLShader]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="vertex_source_name"><a class="lift" href="#vertex_source_name">vertex\_source\_name</a></a><code class="signature apipage">vertex\_source\_name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="dropped"><a class="lift" href="#dropped">dropped</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">dropped : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="manager"><a class="lift" href="#manager">manager</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">manager : [luxe.ResourceManager](#luxe.ResourceManager)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="persistent"><a class="lift" href="#persistent">persistent</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">persistent : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="time_created"><a class="lift" href="#time_created">time\_created</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">time\_created : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="time_to_load"><a class="lift" href="#time_to_load">time\_to\_load</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">time\_to\_load : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="type"><a class="lift" href="#type">type</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">type : [luxe.ResourceType](#luxe.ResourceType)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activate"><a class="lift" href="#activate">activate</a></a><code class="signature apipage">activate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="addError"><a class="lift" href="#addError">addError</a></a><code class="signature apipage">addError(\_error:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="addLog"><a class="lift" href="#addLog">addLog</a></a><code class="signature apipage">addLog(\_log:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compile"><a class="lift" href="#compile">compile</a></a><code class="signature apipage">compile(\_type:<span>[Int](http://api.haxe.org/Int.html)</span>, \_source:<span>[String](http://api.haxe.org/String.html)</span>, ?\_verbose:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [lime.gl.GLShader]()</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="deactivate"><a class="lift" href="#deactivate">deactivate</a></a><code class="signature apipage">deactivate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">drop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="link"><a class="lift" href="#link">link</a></a><code class="signature apipage">link() : [lime.gl.GLProgram]()</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_from_string"><a class="lift" href="#load_from_string">load\_from\_string</a></a><code class="signature apipage">load\_from\_string(\_vertex\_source:<span>[String](http://api.haxe.org/String.html)</span>, \_fragment\_source:<span>[String](http://api.haxe.org/String.html)</span>, ?\_frag\_name:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>, ?\_vertex\_name:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>, ?\_verbose:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">new(\_manager:<span>[luxe.ResourceManager](#luxe.ResourceManager)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_color"><a class="lift" href="#set_uniform_color">set\_uniform\_color</a></a><code class="signature apipage">set\_uniform\_color(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_value:<span>[phoenix.Color](#phoenix.Color)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_float"><a class="lift" href="#set_uniform_float">set\_uniform\_float</a></a><code class="signature apipage">set\_uniform\_float(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_value:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_int"><a class="lift" href="#set_uniform_int">set\_uniform\_int</a></a><code class="signature apipage">set\_uniform\_int(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_value:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_texture"><a class="lift" href="#set_uniform_texture">set\_uniform\_texture</a></a><code class="signature apipage">set\_uniform\_texture(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_value:<span>[phoenix.Texture](#phoenix.Texture)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_vector2"><a class="lift" href="#set_uniform_vector2">set\_uniform\_vector2</a></a><code class="signature apipage">set\_uniform\_vector2(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_value:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_vector3"><a class="lift" href="#set_uniform_vector3">set\_uniform\_vector3</a></a><code class="signature apipage">set\_uniform\_vector3(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_value:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_uniform_vector4"><a class="lift" href="#set_uniform_vector4">set\_uniform\_vector4</a></a><code class="signature apipage">set\_uniform\_vector4(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_value:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;