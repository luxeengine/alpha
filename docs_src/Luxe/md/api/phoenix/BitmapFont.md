
[![Logo](../../images/logo.png)](../../api/index.html)

---



#BitmapFont



---

`class`extends <code><span>[luxe.Resource]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="characters"><a class="lift" href="#characters">characters</a></a><code class="signature apipage">characters : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [phoenix.Character](#phoenix.Character)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="dimensions"><a class="lift" href="#dimensions">dimensions</a></a><code class="signature apipage">dimensions : [luxe.Vector](#luxe.Vector)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="font_character_count"><a class="lift" href="#font_character_count">font\_character\_count</a></a><code class="signature apipage">font\_character\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="font_size"><a class="lift" href="#font_size">font\_size</a></a><code class="signature apipage">font\_size : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="kernings"><a class="lift" href="#kernings">kernings</a></a><code class="signature apipage">kernings : [Map](http://api.haxe.org/Map.html)&lt;[phoenix.KerningKey](#phoenix.KerningKey), [Int](http://api.haxe.org/Int.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="line_height"><a class="lift" href="#line_height">line\_height</a></a><code class="signature apipage">line\_height : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="on_pages_loaded"><a class="lift" href="#on_pages_loaded">on\_pages\_loaded</a></a><code class="signature apipage">on\_pages\_loaded : [Void](http://api.haxe.org/Void.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="onload"><a class="lift" href="#onload">onload</a></a><code class="signature apipage">onload : [phoenix.BitmapFont-&gt;Void](#phoenix.BitmapFont->Void)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="pages"><a class="lift" href="#pages">pages</a></a><code class="signature apipage">pages : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [phoenix.Texture](#phoenix.Texture)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="pages_loaded"><a class="lift" href="#pages_loaded">pages\_loaded</a></a><code class="signature apipage">pages\_loaded : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><code class="signature apipage">scale : [luxe.Vector](#luxe.Vector)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="spacing"><a class="lift" href="#spacing">spacing</a></a><code class="signature apipage">spacing : [Float](http://api.haxe.org/Float.html)</code><br/></span>
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
            <a name="draw_text"><a class="lift" href="#draw_text">draw\_text</a></a><code class="signature apipage">draw\_text(options:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [phoenix.geometry.CompositeGeometry](#phoenix.geometry.CompositeGeometry)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_kerning"><a class="lift" href="#get_kerning">get\_kerning</a></a><code class="signature apipage">get\_kerning(\_glyph:<span>[Int](http://api.haxe.org/Int.html)</span>, \_index:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Null](http://api.haxe.org/Null.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_text_dimensions"><a class="lift" href="#get_text_dimensions">get\_text\_dimensions</a></a><code class="signature apipage">get\_text\_dimensions(\_string:<span>[String](http://api.haxe.org/String.html)</span>, \_scale:<span>[luxe.Vector](#luxe.Vector)</span>) : [luxe.Vector](#luxe.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_from_string"><a class="lift" href="#load_from_string">load\_from\_string</a></a><code class="signature apipage">load\_from\_string(?\_bitmap\_file:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>, ?\_folder:<span>[String](http://api.haxe.org/String.html)=&#x27;assets/&#x27;</span>, ?onloaded:<span>[phoenix.BitmapFont-&gt;Void](#phoenix.BitmapFont->Void)=null</span>, ?custom\_pages:<span>[Array](http://api.haxe.org/Array.html)&lt;[phoenix.Texture](#phoenix.Texture)&gt;=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">new(?\_resource\_manager:<span>[luxe.ResourceManager](#luxe.ResourceManager)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_all_pages_loaded"><a class="lift" href="#on_all_pages_loaded">on\_all\_pages\_loaded</a></a><code class="signature apipage">on\_all\_pages\_loaded() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="one_page_loaded"><a class="lift" href="#one_page_loaded">one\_page\_loaded</a></a><code class="signature apipage">one\_page\_loaded(t:<span>[phoenix.Texture](#phoenix.Texture)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_character"><a class="lift" href="#set_character">set\_character</a></a><code class="signature apipage">set\_character(\_index:<span>[Int](http://api.haxe.org/Int.html)</span>, \_char\_info:<span>[phoenix.Character](#phoenix.Character)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_kerning"><a class="lift" href="#set_kerning">set\_kerning</a></a><code class="signature apipage">set\_kerning(\_glyph:<span>[Int](http://api.haxe.org/Int.html)</span>, \_index:<span>[Int](http://api.haxe.org/Int.html)</span>, \_amount:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">drop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;