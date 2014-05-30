
[![Logo](../../images/logo.png)](../../api/index.html)

---



#ResourceManager



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="data"><a class="lift" href="#data">data</a></a><code class="signature apipage">data : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [lime.utils.ByteArray]()&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="fonts"><a class="lift" href="#fonts">fonts</a></a><code class="signature apipage">fonts : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.BitmapFont](#phoenix.BitmapFont)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="render_textures"><a class="lift" href="#render_textures">render\_textures</a></a><code class="signature apipage">render\_textures : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.RenderTexture](#phoenix.RenderTexture)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="resourcelist"><a class="lift" href="#resourcelist">resourcelist</a></a><code class="signature apipage">resourcelist : [Array](http://api.haxe.org/Array.html)&lt;[luxe.Resource](#luxe.Resource)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="shaders"><a class="lift" href="#shaders">shaders</a></a><code class="signature apipage">shaders : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.Shader](#phoenix.Shader)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="sounds"><a class="lift" href="#sounds">sounds</a></a><code class="signature apipage">sounds : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="stats"><a class="lift" href="#stats">stats</a></a><code class="signature apipage">stats : [luxe.ResourceStats](#luxe.ResourceStats)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="text"><a class="lift" href="#text">text</a></a><code class="signature apipage">text : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="textures"><a class="lift" href="#textures">textures</a></a><code class="signature apipage">textures : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.Texture](#phoenix.Texture)&gt;</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><code class="signature apipage">add(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="cache"><a class="lift" href="#cache">cache</a></a><code class="signature apipage">cache(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><code class="signature apipage">clear(?and\_persistent:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find"><a class="lift" href="#find">find</a></a><code class="signature apipage">find(id:<span>[String](http://api.haxe.org/String.html)</span>) : [luxe.Resource](#luxe.Resource)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_data"><a class="lift" href="#find_data">find\_data</a></a><code class="signature apipage">find\_data(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[lime.utils.ByteArray]()&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_font"><a class="lift" href="#find_font">find\_font</a></a><code class="signature apipage">find\_font(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.BitmapFont](#phoenix.BitmapFont)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_render_texture"><a class="lift" href="#find_render_texture">find\_render\_texture</a></a><code class="signature apipage">find\_render\_texture(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.RenderTexture](#phoenix.RenderTexture)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_shader"><a class="lift" href="#find_shader">find\_shader</a></a><code class="signature apipage">find\_shader(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Shader](#phoenix.Shader)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_sound"><a class="lift" href="#find_sound">find\_sound</a></a><code class="signature apipage">find\_sound(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_text"><a class="lift" href="#find_text">find\_text</a></a><code class="signature apipage">find\_text(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_texture"><a class="lift" href="#find_texture">find\_texture</a></a><code class="signature apipage">find\_texture(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Texture](#phoenix.Texture)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><code class="signature apipage">remove(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="uncache"><a class="lift" href="#uncache">uncache</a></a><code class="signature apipage">uncache(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;