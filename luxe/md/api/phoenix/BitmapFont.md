
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>BitmapFont</h1>
<small>`phoenix.BitmapFont`</small>



---

`class`extends <code><span>luxe.Resource</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="dimensions"><a class="lift" href="#dimensions">dimensions</a></a><div class="clear"></div><code class="signature apipage">dimensions : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="spacing"><a class="lift" href="#spacing">spacing</a></a><div class="clear"></div><code class="signature apipage">spacing : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="line_height"><a class="lift" href="#line_height">line\_height</a></a><div class="clear"></div><code class="signature apipage">line\_height : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="font_size"><a class="lift" href="#font_size">font\_size</a></a><div class="clear"></div><code class="signature apipage">font\_size : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="font_character_count"><a class="lift" href="#font_character_count">font\_character\_count</a></a><div class="clear"></div><code class="signature apipage">font\_character\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pages"><a class="lift" href="#pages">pages</a></a><div class="clear"></div><code class="signature apipage">pages : [Map](#)&lt;[Int](#), [phoenix.Texture](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="characters"><a class="lift" href="#characters">characters</a></a><div class="clear"></div><code class="signature apipage">characters : [Map](#)&lt;[Int](#), [phoenix.Character](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="kernings"><a class="lift" href="#kernings">kernings</a></a><div class="clear"></div><code class="signature apipage">kernings : [Map](#)&lt;[phoenix.KerningKey](#), [Float](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div><code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="on_pages_loaded"><a class="lift" href="#on_pages_loaded">on\_pages\_loaded</a></a><div class="clear"></div><code class="signature apipage">on\_pages\_loaded : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pages_loaded"><a class="lift" href="#pages_loaded">pages\_loaded</a></a><div class="clear"></div><code class="signature apipage">pages\_loaded : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="onload"><a class="lift" href="#onload">onload</a></a><div class="clear"></div><code class="signature apipage">onload : [phoenix.BitmapFont](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a> <div class="clear"></div><code class="signature apipage">toString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_all_pages_loaded"><a class="lift" href="#on_all_pages_loaded">on\_all\_pages\_loaded</a></a> <div class="clear"></div><code class="signature apipage">on\_all\_pages\_loaded() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="one_page_loaded"><a class="lift" href="#one_page_loaded">one\_page\_loaded</a></a> <div class="clear"></div><code class="signature apipage">one\_page\_loaded(t:[phoenix.Texture](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="from_string"><a class="lift" href="#from_string">from\_string</a></a> <div class="clear"></div><code class="signature apipage">from\_string(\_bitmap\_file:[String](#)<span>=&#x27;&#x27;</span>, \_folder:[String](#)<span>=&#x27;assets/&#x27;</span>, onloaded:[phoenix.BitmapFont](#)&nbsp;-&gt; [Void](#)<span>=null</span>, custom\_pages:[Array](#)&lt;[phoenix.Texture](#)&gt;<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_kerning"><a class="lift" href="#set_kerning">set\_kerning</a></a> <div class="clear"></div><code class="signature apipage">set\_kerning(\_glyph:[Int](#)<span></span>, \_index:[Int](#)<span></span>, \_amount:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_kerning"><a class="lift" href="#get_kerning">get\_kerning</a></a> <div class="clear"></div><code class="signature apipage">get\_kerning(\_glyph:[Int](#)<span></span>, \_index:[Int](#)<span></span>) : [Null](#)&lt;[Float](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_text_dimensions"><a class="lift" href="#get_text_dimensions">get\_text\_dimensions</a></a> <div class="clear"></div><code class="signature apipage">get\_text\_dimensions(\_string:[String](#)<span></span>, \_scale:[luxe.Vector](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="draw_text"><a class="lift" href="#draw_text">draw\_text</a></a> <div class="clear"></div><code class="signature apipage">draw\_text(options:[Dynamic](#)<span></span>) : [phoenix.geometry.CompositeGeometry](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_character"><a class="lift" href="#set_character">set\_character</a></a> <div class="clear"></div><code class="signature apipage">set\_character(\_index:[Int](#)<span></span>, \_char\_info:[phoenix.Character](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_resource\_manager:[luxe.ResourceManager](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">load(\_fontid:[String](#)<span></span>, \_path:[String](#)<span>=&#x27;assets/&#x27;</span>, \_onloaded:[phoenix.BitmapFont](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [phoenix.BitmapFont](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;