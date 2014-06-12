
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Renderer



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><code class="signature apipage">batcher : [phoenix.Batcher](#phoenix.Batcher)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="batchers"><a class="lift" href="#batchers">batchers</a></a><code class="signature apipage">batchers : [Array](http://api.haxe.org/Array.html)&lt;[phoenix.Batcher](#phoenix.Batcher)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="camera"><a class="lift" href="#camera">camera</a></a><code class="signature apipage">camera : [phoenix.Camera](#phoenix.Camera)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="clear_color"><a class="lift" href="#clear_color">clear\_color</a></a><code class="signature apipage">clear\_color : [phoenix.Color](#phoenix.Color)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="default_fbo"><a class="lift" href="#default_fbo">default\_fbo</a></a><code class="signature apipage">default\_fbo : [lime.gl.GLFramebuffer]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="default_frag_source"><a class="lift" href="#default_frag_source">default\_frag\_source</a></a><code class="signature apipage">default\_frag\_source : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="default_frag_textured_source"><a class="lift" href="#default_frag_textured_source">default\_frag\_textured\_source</a></a><code class="signature apipage">default\_frag\_textured\_source : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="default_render_path"><a class="lift" href="#default_render_path">default\_render\_path</a></a><code class="signature apipage">default\_render\_path : [phoenix.RenderPath](#phoenix.RenderPath)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="default_shader"><a class="lift" href="#default_shader">default\_shader</a></a><code class="signature apipage">default\_shader : [phoenix.Shader](#phoenix.Shader)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="default_shader_textured"><a class="lift" href="#default_shader_textured">default\_shader\_textured</a></a><code class="signature apipage">default\_shader\_textured : [phoenix.Shader](#phoenix.Shader)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="default_vert_source"><a class="lift" href="#default_vert_source">default\_vert\_source</a></a><code class="signature apipage">default\_vert\_source : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="font"><a class="lift" href="#font">font</a></a><code class="signature apipage">font : [phoenix.BitmapFont](#phoenix.BitmapFont)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="render_path"><a class="lift" href="#render_path">render\_path</a></a><code class="signature apipage">render\_path : [phoenix.RenderPath](#phoenix.RenderPath)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="resource_manager"><a class="lift" href="#resource_manager">resource\_manager</a></a><code class="signature apipage">resource\_manager : [luxe.ResourceManager](#luxe.ResourceManager)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="should_clear"><a class="lift" href="#should_clear">should\_clear</a></a><code class="signature apipage">should\_clear : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="state"><a class="lift" href="#state">state</a></a><code class="signature apipage">state : [phoenix.RenderState](#phoenix.RenderState)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="stats"><a class="lift" href="#stats">stats</a></a><code class="signature apipage">stats : [phoenix.RendererStats](#phoenix.RendererStats)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><code class="signature apipage">stop : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="stop_count"><a class="lift" href="#stop_count">stop\_count</a></a><code class="signature apipage">stop\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="target_size"><a class="lift" href="#target_size">target\_size</a></a><code class="signature apipage">target\_size : [phoenix.Vector](#phoenix.Vector)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add_batch"><a class="lift" href="#add_batch">add\_batch</a></a><code class="signature apipage">add\_batch(batch:<span>[phoenix.Batcher](#phoenix.Batcher)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><code class="signature apipage">clear(\_color:<span>[phoenix.Color](#phoenix.Color)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="create_batcher"><a class="lift" href="#create_batcher">create\_batcher</a></a><code class="signature apipage">create\_batcher(?options:<span>[luxe.options.BatcherOptions](#luxe.options.BatcherOptions)=null</span>) : [phoenix.Batcher](#phoenix.Batcher)</code><br/><span class="small_desc_flat">Create a batcher, convenience for create batcher, add batcher (option), and create a camera for the batcher.</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><code class="signature apipage">init() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_font"><a class="lift" href="#load_font">load\_font</a></a><code class="signature apipage">load\_font(\_fontid:<span>[String](http://api.haxe.org/String.html)</span>, ?\_path:<span>[String](http://api.haxe.org/String.html)=&#x27;assets/&#x27;</span>, ?\_onloaded:<span>[phoenix.BitmapFont-&gt;Void](#phoenix.BitmapFont->Void)=null</span>) : [phoenix.BitmapFont](#phoenix.BitmapFont)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_shader"><a class="lift" href="#load_shader">load\_shader</a></a><code class="signature apipage">load\_shader(\_psid:<span>[String](http://api.haxe.org/String.html)</span>, ?\_vsid:<span>[String](http://api.haxe.org/String.html)=null</span>, ?\_onloaded:<span>[phoenix.Shader-&gt;Void](#phoenix.Shader->Void)=null</span>) : [phoenix.Shader](#phoenix.Shader)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_texture"><a class="lift" href="#load_texture">load\_texture</a></a><code class="signature apipage">load\_texture(\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_onloaded:<span>[phoenix.Texture-&gt;Void](#phoenix.Texture->Void)=null</span>, ?\_silent:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>, ?asset\_bytes:<span>[lime.utils.ByteArray]()=null</span>) : [phoenix.Texture](#phoenix.Texture)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_texture_from_resource_bytes"><a class="lift" href="#load_texture_from_resource_bytes">load\_texture\_from\_resource\_bytes</a></a><code class="signature apipage">load\_texture\_from\_resource\_bytes(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_width:<span>[Int](http://api.haxe.org/Int.html)</span>, \_height:<span>[Int](http://api.haxe.org/Int.html)</span>, ?\_cache:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [phoenix.Texture](#phoenix.Texture)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_textures"><a class="lift" href="#load_textures">load\_textures</a></a><code class="signature apipage">load\_textures(\_names:<span>[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</span>, ?\_onloaded:<span>[Array-&gt;Void]()=null</span>, ?\_silent:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_core:<span>[luxe.Core](#luxe.Core)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onresize"><a class="lift" href="#onresize">onresize</a></a><code class="signature apipage">onresize(e:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a><code class="signature apipage">process() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_batch"><a class="lift" href="#remove_batch">remove\_batch</a></a><code class="signature apipage">remove\_batch(batch:<span>[phoenix.Batcher](#phoenix.Batcher)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="target"><a class="lift" href="#target">target</a></a><code class="signature apipage">target : [phoenix.RenderTexture]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;