
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>ResourceManager</h1>
<small>`luxe.ResourceManager`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="resourcelist"><a class="lift" href="#resourcelist">resourcelist</a></a><div class="clear"></div><code class="signature apipage">resourcelist : [Array](#)&lt;[luxe.Resource](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="render_textures"><a class="lift" href="#render_textures">render\_textures</a></a><div class="clear"></div><code class="signature apipage">render\_textures : [Map](#)&lt;[String](#), [phoenix.RenderTexture](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="textures"><a class="lift" href="#textures">textures</a></a><div class="clear"></div><code class="signature apipage">textures : [Map](#)&lt;[String](#), [phoenix.Texture](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shaders"><a class="lift" href="#shaders">shaders</a></a><div class="clear"></div><code class="signature apipage">shaders : [Map](#)&lt;[String](#), [phoenix.Shader](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fonts"><a class="lift" href="#fonts">fonts</a></a><div class="clear"></div><code class="signature apipage">fonts : [Map](#)&lt;[String](#), [phoenix.BitmapFont](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="data"><a class="lift" href="#data">data</a></a><div class="clear"></div><code class="signature apipage">data : [Map](#)&lt;[String](#), [luxe.DataResource](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="text"><a class="lift" href="#text">text</a></a><div class="clear"></div><code class="signature apipage">text : [Map](#)&lt;[String](#), [luxe.TextResource](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="json"><a class="lift" href="#json">json</a></a><div class="clear"></div><code class="signature apipage">json : [Map](#)&lt;[String](#), [luxe.JSONResource](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="sounds"><a class="lift" href="#sounds">sounds</a></a><div class="clear"></div><code class="signature apipage">sounds : [Map](#)&lt;[String](#), [luxe.SoundResource](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="stats"><a class="lift" href="#stats">stats</a></a><div class="clear"></div><code class="signature apipage">stats : [luxe.ResourceStats](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a> <div class="clear"></div><code class="signature apipage">add(res:[luxe.Resource](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a> <div class="clear"></div><code class="signature apipage">remove(res:[luxe.Resource](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="uncache"><a class="lift" href="#uncache">uncache</a></a> <div class="clear"></div><code class="signature apipage">uncache(res:[luxe.Resource](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="cache"><a class="lift" href="#cache">cache</a></a> <div class="clear"></div><code class="signature apipage">cache(res:[luxe.Resource](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_render_texture"><a class="lift" href="#find_render_texture">find\_render\_texture</a></a> <div class="clear"></div><code class="signature apipage">find\_render\_texture(\_name:[String](#)<span></span>) : [Null](#)&lt;[phoenix.RenderTexture](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_texture"><a class="lift" href="#find_texture">find\_texture</a></a> <div class="clear"></div><code class="signature apipage">find\_texture(\_name:[String](#)<span></span>) : [Null](#)&lt;[phoenix.Texture](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_shader"><a class="lift" href="#find_shader">find\_shader</a></a> <div class="clear"></div><code class="signature apipage">find\_shader(\_name:[String](#)<span></span>) : [Null](#)&lt;[phoenix.Shader](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_font"><a class="lift" href="#find_font">find\_font</a></a> <div class="clear"></div><code class="signature apipage">find\_font(\_name:[String](#)<span></span>) : [Null](#)&lt;[phoenix.BitmapFont](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_sound"><a class="lift" href="#find_sound">find\_sound</a></a> <div class="clear"></div><code class="signature apipage">find\_sound(\_name:[String](#)<span></span>) : [Null](#)&lt;[luxe.SoundResource](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_text"><a class="lift" href="#find_text">find\_text</a></a> <div class="clear"></div><code class="signature apipage">find\_text(\_name:[String](#)<span></span>) : [Null](#)&lt;[luxe.TextResource](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_json"><a class="lift" href="#find_json">find\_json</a></a> <div class="clear"></div><code class="signature apipage">find\_json(\_name:[String](#)<span></span>) : [Null](#)&lt;[luxe.JSONResource](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find_data"><a class="lift" href="#find_data">find\_data</a></a> <div class="clear"></div><code class="signature apipage">find\_data(\_name:[String](#)<span></span>) : [Null](#)&lt;[luxe.DataResource](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a> <div class="clear"></div><code class="signature apipage">clear(and\_persistent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="find"><a class="lift" href="#find">find</a></a> <div class="clear"></div><code class="signature apipage">find(id:[String](#)<span></span>) : [luxe.Resource](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;