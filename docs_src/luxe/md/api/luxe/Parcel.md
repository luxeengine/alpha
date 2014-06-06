
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Parcel



---

`class`extends <code><span>[luxe.ResourceManager]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="current_count"><a class="lift" href="#current_count">current\_count</a></a><code class="signature apipage">current\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="options"><a class="lift" href="#options">options</a></a><code class="signature apipage">options : [luxe.ParcelOptions](#luxe.ParcelOptions)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="time_to_load"><a class="lift" href="#time_to_load">time\_to\_load</a></a><code class="signature apipage">time\_to\_load : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="total_items"><a class="lift" href="#total_items">total\_items</a></a><code class="signature apipage">total\_items : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="data"><a class="lift" href="#data">data</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">data : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [lime.utils.ByteArray]()&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="fonts"><a class="lift" href="#fonts">fonts</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">fonts : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.BitmapFont](#phoenix.BitmapFont)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="json"><a class="lift" href="#json">json</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">json : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [Dynamic](http://api.haxe.org/Dynamic.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="render_textures"><a class="lift" href="#render_textures">render\_textures</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">render\_textures : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.RenderTexture](#phoenix.RenderTexture)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="resourcelist"><a class="lift" href="#resourcelist">resourcelist</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">resourcelist : [Array](http://api.haxe.org/Array.html)&lt;[luxe.Resource](#luxe.Resource)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="shaders"><a class="lift" href="#shaders">shaders</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">shaders : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.Shader](#phoenix.Shader)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="sounds"><a class="lift" href="#sounds">sounds</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">sounds : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="stats"><a class="lift" href="#stats">stats</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">stats : [luxe.ResourceStats](#luxe.ResourceStats)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="text"><a class="lift" href="#text">text</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">text : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [String](http://api.haxe.org/String.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="textures"><a class="lift" href="#textures">textures</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">textures : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.Texture](#phoenix.Texture)&gt;</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add_data"><a class="lift" href="#add_data">add\_data</a></a><code class="signature apipage">add\_data(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_datas"><a class="lift" href="#add_datas">add\_datas</a></a><code class="signature apipage">add\_datas(list:<span>[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_font"><a class="lift" href="#add_font">add\_font</a></a><code class="signature apipage">add\_font(\_id:<span>[String](http://api.haxe.org/String.html)</span>, \_path:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_fonts"><a class="lift" href="#add_fonts">add\_fonts</a></a><code class="signature apipage">add\_fonts(list:<span>[Array](http://api.haxe.org/Array.html)&lt;[luxe.FontInfo](#luxe.FontInfo)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_shader"><a class="lift" href="#add_shader">add\_shader</a></a><code class="signature apipage">add\_shader(?ps\_id:<span>[String](http://api.haxe.org/String.html)=&#x27;default&#x27;</span>, ?vs\_id:<span>[String](http://api.haxe.org/String.html)=&#x27;default&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_shaders"><a class="lift" href="#add_shaders">add\_shaders</a></a><code class="signature apipage">add\_shaders(list:<span>[Array](http://api.haxe.org/Array.html)&lt;[luxe.ShaderInfo](#luxe.ShaderInfo)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_sound"><a class="lift" href="#add_sound">add\_sound</a></a><code class="signature apipage">add\_sound(\_id:<span>[String](http://api.haxe.org/String.html)</span>, \_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_is\_music:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_sounds"><a class="lift" href="#add_sounds">add\_sounds</a></a><code class="signature apipage">add\_sounds(list:<span>[Array](http://api.haxe.org/Array.html)&lt;[luxe.SoundInfo](#luxe.SoundInfo)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_text"><a class="lift" href="#add_text">add\_text</a></a><code class="signature apipage">add\_text(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_texts"><a class="lift" href="#add_texts">add\_texts</a></a><code class="signature apipage">add\_texts(list:<span>[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_texture"><a class="lift" href="#add_texture">add\_texture</a></a><code class="signature apipage">add\_texture(\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_textures"><a class="lift" href="#add_textures">add\_textures</a></a><code class="signature apipage">add\_textures(list:<span>[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="from_json"><a class="lift" href="#from_json">from\_json</a></a><code class="signature apipage">from\_json(\_json\_object:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><code class="signature apipage">load() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">new(?\_options:<span>[luxe.ParcelOptions](#luxe.ParcelOptions)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">add(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="cache"><a class="lift" href="#cache">cache</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">cache(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">clear(?and\_persistent:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find"><a class="lift" href="#find">find</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find(id:<span>[String](http://api.haxe.org/String.html)</span>) : [luxe.Resource](#luxe.Resource)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_data"><a class="lift" href="#find_data">find\_data</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_data(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[lime.utils.ByteArray]()&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_font"><a class="lift" href="#find_font">find\_font</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_font(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.BitmapFont](#phoenix.BitmapFont)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_json"><a class="lift" href="#find_json">find\_json</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_json(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_render_texture"><a class="lift" href="#find_render_texture">find\_render\_texture</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_render\_texture(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.RenderTexture](#phoenix.RenderTexture)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_shader"><a class="lift" href="#find_shader">find\_shader</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_shader(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Shader](#phoenix.Shader)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_sound"><a class="lift" href="#find_sound">find\_sound</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_sound(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_text"><a class="lift" href="#find_text">find\_text</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_text(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_texture"><a class="lift" href="#find_texture">find\_texture</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">find\_texture(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Texture](#phoenix.Texture)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">remove(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="uncache"><a class="lift" href="#uncache">uncache</a></a><a title="inherited from luxe.ResourceManager" class="tooltip inherited">&gt;</a><code class="signature apipage">uncache(res:<span>[luxe.Resource](#luxe.Resource)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;