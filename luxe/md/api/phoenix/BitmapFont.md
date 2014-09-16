
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>BitmapFont</h1>
<small>`phoenix.BitmapFont`</small>



<hr/>

`class`extends <code><span>luxe.resource.Resource</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="characters"><a class="lift" href="#characters">characters</a></a><div class="clear"></div>
                <code class="signature apipage">characters : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [phoenix.Character](../../api/phoenix/Character.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="dimensions"><a class="lift" href="#dimensions">dimensions</a></a><div class="clear"></div>
                <code class="signature apipage">dimensions : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="font_character_count"><a class="lift" href="#font_character_count">font\_character\_count</a></a><div class="clear"></div>
                <code class="signature apipage">font\_character\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="font_size"><a class="lift" href="#font_size">font\_size</a></a><div class="clear"></div>
                <code class="signature apipage">font\_size : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="kernings"><a class="lift" href="#kernings">kernings</a></a><div class="clear"></div>
                <code class="signature apipage">kernings : [Map](http://api.haxe.org/Map.html)&lt;[phoenix.KerningKey](../../api/phoenix/KerningKey.html), [Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="line_height"><a class="lift" href="#line_height">line\_height</a></a><div class="clear"></div>
                <code class="signature apipage">line\_height : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="on_pages_loaded"><a class="lift" href="#on_pages_loaded">on\_pages\_loaded</a></a><div class="clear"></div>
                <code class="signature apipage">on\_pages\_loaded : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="onload"><a class="lift" href="#onload">onload</a></a><div class="clear"></div>
                <code class="signature apipage">onload : [phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pages"><a class="lift" href="#pages">pages</a></a><div class="clear"></div>
                <code class="signature apipage">pages : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [phoenix.Texture](../../api/phoenix/Texture.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pages_loaded"><a class="lift" href="#pages_loaded">pages\_loaded</a></a><div class="clear"></div>
                <code class="signature apipage">pages\_loaded : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="spacing"><a class="lift" href="#spacing">spacing</a></a><div class="clear"></div>
                <code class="signature apipage">spacing : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="draw_text"><a class="lift" href="#draw_text">draw\_text</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_text(options:[Dynamic](#)<span></span>) : [phoenix.geometry.CompositeGeometry](../../api/phoenix/geometry/CompositeGeometry.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="from_string"><a class="lift" href="#from_string">from\_string</a></a><div class="clear"></div>
            <code class="signature apipage">from\_string(\_bitmap\_file:[String](http://api.haxe.org/String.html)<span>=&#x27;&#x27;</span>, \_folder:[String](http://api.haxe.org/String.html)<span>=&#x27;assets/&#x27;</span>, onloaded:[phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>, custom\_pages:[Array](http://api.haxe.org/Array.html)&lt;[phoenix.Texture](../../api/phoenix/Texture.html)&gt;<span>=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="get_kerning"><a class="lift" href="#get_kerning">get\_kerning</a></a><div class="clear"></div>
            <code class="signature apipage">get\_kerning(\_glyph:[Int](http://api.haxe.org/Int.html)<span></span>, \_index:[Int](http://api.haxe.org/Int.html)<span></span>) : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="get_text_dimensions"><a class="lift" href="#get_text_dimensions">get\_text\_dimensions</a></a><div class="clear"></div>
            <code class="signature apipage">get\_text\_dimensions(\_string:[String](http://api.haxe.org/String.html)<span></span>, \_scale:[luxe.Vector](../../api/luxe/Vector.html)<span></span>) : [luxe.Vector](../../api/luxe/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_fontid:[String](http://api.haxe.org/String.html)<span></span>, \_path:[String](http://api.haxe.org/String.html)<span>=&#x27;assets/&#x27;</span>, \_onloaded:[phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_resource\_manager:[luxe.resource.ResourceManager](../../api/luxe/resource/ResourceManager.html)<span>=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="on_all_pages_loaded"><a class="lift" href="#on_all_pages_loaded">on\_all\_pages\_loaded</a></a><div class="clear"></div>
            <code class="signature apipage">on\_all\_pages\_loaded() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="one_page_loaded"><a class="lift" href="#one_page_loaded">one\_page\_loaded</a></a><div class="clear"></div>
            <code class="signature apipage">one\_page\_loaded(t:[phoenix.Texture](../../api/phoenix/Texture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_character"><a class="lift" href="#set_character">set\_character</a></a><div class="clear"></div>
            <code class="signature apipage">set\_character(\_index:[Int](http://api.haxe.org/Int.html)<span></span>, \_char\_info:[phoenix.Character](../../api/phoenix/Character.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_kerning"><a class="lift" href="#set_kerning">set\_kerning</a></a><div class="clear"></div>
            <code class="signature apipage">set\_kerning(\_glyph:[Int](http://api.haxe.org/Int.html)<span></span>, \_index:[Int](http://api.haxe.org/Int.html)<span></span>, \_amount:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;