
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>RenderState</h1>
<small>`phoenix.RenderState`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="cull_face"><a class="lift" href="#cull_face">cull\_face</a></a><div class="clear"></div><code class="signature apipage">cull\_face : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="depth_test"><a class="lift" href="#depth_test">depth\_test</a></a><div class="clear"></div><code class="signature apipage">depth\_test : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><div class="clear"></div><code class="signature apipage">renderer : [phoenix.Renderer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_viewport"><a class="lift" href="#_viewport">\_viewport</a></a><div class="clear"></div><code class="signature apipage">\_viewport : [phoenix.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_current_fbo"><a class="lift" href="#_current_fbo">\_current\_fbo</a></a><div class="clear"></div><code class="signature apipage">\_current\_fbo : [snow.render.opengl.GLFramebuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_current_rbo"><a class="lift" href="#_current_rbo">\_current\_rbo</a></a><div class="clear"></div><code class="signature apipage">\_current\_rbo : [snow.render.opengl.GLRenderbuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_used_program"><a class="lift" href="#_used_program">\_used\_program</a></a><div class="clear"></div><code class="signature apipage">\_used\_program : [snow.render.opengl.GLProgram](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_active_texture"><a class="lift" href="#_active_texture">\_active\_texture</a></a><div class="clear"></div><code class="signature apipage">\_active\_texture : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_bound_texture_2D"><a class="lift" href="#_bound_texture_2D">\_bound\_texture\_2D</a></a><div class="clear"></div><code class="signature apipage">\_bound\_texture\_2D : [snow.render.opengl.GLTexture](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_last_line_width"><a class="lift" href="#_last_line_width">\_last\_line\_width</a></a><div class="clear"></div><code class="signature apipage">\_last\_line\_width : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="enable"><a class="lift" href="#enable">enable</a></a> <div class="clear"></div><code class="signature apipage">enable(what:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="disable"><a class="lift" href="#disable">disable</a></a> <div class="clear"></div><code class="signature apipage">disable(what:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="viewport"><a class="lift" href="#viewport">viewport</a></a> <div class="clear"></div><code class="signature apipage">viewport(x:[Float](#)<span></span>, y:[Float](#)<span></span>, w:[Float](#)<span></span>, h:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="bindFramebuffer"><a class="lift" href="#bindFramebuffer">bindFramebuffer</a></a> <div class="clear"></div><code class="signature apipage">bindFramebuffer(buffer:[snow.render.opengl.GLFramebuffer](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="bindRenderbuffer"><a class="lift" href="#bindRenderbuffer">bindRenderbuffer</a></a> <div class="clear"></div><code class="signature apipage">bindRenderbuffer(buffer:[snow.render.opengl.GLRenderbuffer](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="useProgram"><a class="lift" href="#useProgram">useProgram</a></a> <div class="clear"></div><code class="signature apipage">useProgram(program:[snow.render.opengl.GLProgram](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="activeTexture"><a class="lift" href="#activeTexture">activeTexture</a></a> <div class="clear"></div><code class="signature apipage">activeTexture(val:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="bindTexture2D"><a class="lift" href="#bindTexture2D">bindTexture2D</a></a> <div class="clear"></div><code class="signature apipage">bindTexture2D(tex:[snow.render.opengl.GLTexture](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="lineWidth"><a class="lift" href="#lineWidth">lineWidth</a></a> <div class="clear"></div><code class="signature apipage">lineWidth(\_width:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_renderer:[phoenix.Renderer](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;