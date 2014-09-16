
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>RenderTexture</h1>
<small>`phoenix.RenderTexture`</small>



<hr/>

`class`extends <code><span>phoenix.Texture</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="_onload_handlers"><a class="lift" href="#_onload_handlers">\_onload\_handlers</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">\_onload\_handlers : [Array](http://api.haxe.org/Array.html)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="asset"><a class="lift" href="#asset">asset</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">asset : [snow.assets.AssetImage](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="fbo"><a class="lift" href="#fbo">fbo</a></a><div class="clear"></div>
                <code class="signature apipage">fbo : [snow.render.opengl.GLFramebuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="height_actual"><a class="lift" href="#height_actual">height\_actual</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">height\_actual : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">loaded : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="renderbuffer"><a class="lift" href="#renderbuffer">renderbuffer</a></a><div class="clear"></div>
                <code class="signature apipage">renderbuffer : [snow.render.opengl.GLRenderbuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="slot"><a class="lift" href="#slot">slot</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">slot : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">texture : [snow.render.opengl.GLTexture](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="width_actual"><a class="lift" href="#width_actual">width\_actual</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">width\_actual : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="clamp"><a class="lift" href="#clamp">clamp</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">clamp : [phoenix.ClampType](../../api/phoenix/ClampType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter"><a class="lift" href="#filter">filter</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">filter : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter_mag"><a class="lift" href="#filter_mag">filter\_mag</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">filter\_mag : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter_min"><a class="lift" href="#filter_min">filter\_min</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">filter\_min : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="onload"><a class="lift" href="#onload">onload</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">onload : [phoenix.Texture](../../api/phoenix/Texture.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activate"><a class="lift" href="#activate">activate</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">activate(att:[snow.render.opengl.GLUniformLocation](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bind"><a class="lift" href="#bind">bind</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">bind() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="create_from_bytes_html"><a class="lift" href="#create_from_bytes_html">create\_from\_bytes\_html</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">create\_from\_bytes\_html(\_asset\_name:[String](http://api.haxe.org/String.html)<span></span>, \_asset\_bytes:[Dynamic](#)<span></span>, \_width:[Float](http://api.haxe.org/Float.html)<span></span>, \_height:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="do_onload"><a class="lift" href="#do_onload">do\_onload</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">do\_onload() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">drop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="estimated_memory"><a class="lift" href="#estimated_memory">estimated\_memory</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">estimated\_memory() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="from_asset"><a class="lift" href="#from_asset">from\_asset</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">from\_asset(\_asset:[snow.assets.AssetImage](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="generate_mipmaps"><a class="lift" href="#generate_mipmaps">generate\_mipmaps</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">generate\_mipmaps() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="get_pixel"><a class="lift" href="#get_pixel">get\_pixel</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_pixel(\_pos:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onloaded:[phoenix.Texture](../../api/phoenix/Texture.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Texture](../../api/phoenix/Texture.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load_from_resource"><a class="lift" href="#load_from_resource">load\_from\_resource</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load\_from\_resource(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_width:[Int](http://api.haxe.org/Int.html)<span></span>, \_height:[Int](http://api.haxe.org/Int.html)<span></span>, \_cache:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [phoenix.Texture](../../api/phoenix/Texture.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lock"><a class="lift" href="#lock">lock</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">lock() : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_manager:[luxe.resource.ResourceManager](../../api/luxe/resource/ResourceManager.html)<span></span>, \_size:[phoenix.Vector](../../api/phoenix/Vector.html)<span>=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_onload"><a class="lift" href="#set_onload">set\_onload</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_onload(f:[phoenix.Texture](../../api/phoenix/Texture.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_pixel"><a class="lift" href="#set_pixel">set\_pixel</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_pixel(\_pos:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_color:[phoenix.Color](../../api/phoenix/Color.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="unlock"><a class="lift" href="#unlock">unlock</a></a><a title="inherited from phoenix.Texture" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">unlock() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;