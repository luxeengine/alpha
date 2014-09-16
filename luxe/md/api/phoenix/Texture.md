
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Texture</h1>
<small>`phoenix.Texture`</small>



---

`class`extends <code><span>luxe.resource.Resource</span></code>
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="_onload_handlers"><a class="lift" href="#_onload_handlers">\_onload\_handlers</a></a><div class="clear"></div>
                <code class="signature apipage">\_onload\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="asset"><a class="lift" href="#asset">asset</a></a><div class="clear"></div>
                <code class="signature apipage">asset : [snow.assets.AssetImage](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a><div class="clear"></div>
                <code class="signature apipage">height : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="height_actual"><a class="lift" href="#height_actual">height\_actual</a></a><div class="clear"></div>
                <code class="signature apipage">height\_actual : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><div class="clear"></div>
                <code class="signature apipage">loaded : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="slot"><a class="lift" href="#slot">slot</a></a><div class="clear"></div>
                <code class="signature apipage">slot : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [snow.render.opengl.GLTexture](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a><div class="clear"></div>
                <code class="signature apipage">width : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="width_actual"><a class="lift" href="#width_actual">width\_actual</a></a><div class="clear"></div>
                <code class="signature apipage">width\_actual : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="clamp"><a class="lift" href="#clamp">clamp</a></a><div class="clear"></div>
                <code class="signature apipage">clamp : [phoenix.ClampType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter"><a class="lift" href="#filter">filter</a></a><div class="clear"></div>
                <code class="signature apipage">filter : [phoenix.FilterType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter_mag"><a class="lift" href="#filter_mag">filter\_mag</a></a><div class="clear"></div>
                <code class="signature apipage">filter\_mag : [phoenix.FilterType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter_min"><a class="lift" href="#filter_min">filter\_min</a></a><div class="clear"></div>
                <code class="signature apipage">filter\_min : [phoenix.FilterType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="onload"><a class="lift" href="#onload">onload</a></a><div class="clear"></div>
                <code class="signature apipage">onload : [phoenix.Texture](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activate"><a class="lift" href="#activate">activate</a></a><div class="clear"></div>
            <code class="signature apipage">activate(att:[snow.render.opengl.GLUniformLocation](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="bind"><a class="lift" href="#bind">bind</a></a><div class="clear"></div>
            <code class="signature apipage">bind() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="create_from_bytes_html"><a class="lift" href="#create_from_bytes_html">create\_from\_bytes\_html</a></a><div class="clear"></div>
            <code class="signature apipage">create\_from\_bytes\_html(\_asset\_name:[String](#)<span></span>, \_asset\_bytes:[Dynamic](#)<span></span>, \_width:[Float](#)<span></span>, \_height:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="do_onload"><a class="lift" href="#do_onload">do\_onload</a></a><div class="clear"></div>
            <code class="signature apipage">do\_onload() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><div class="clear"></div>
            <code class="signature apipage">drop() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="estimated_memory"><a class="lift" href="#estimated_memory">estimated\_memory</a></a><div class="clear"></div>
            <code class="signature apipage">estimated\_memory() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="from_asset"><a class="lift" href="#from_asset">from\_asset</a></a><div class="clear"></div>
            <code class="signature apipage">from\_asset(\_asset:[snow.assets.AssetImage](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="generate_mipmaps"><a class="lift" href="#generate_mipmaps">generate\_mipmaps</a></a><div class="clear"></div>
            <code class="signature apipage">generate\_mipmaps() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_pixel"><a class="lift" href="#get_pixel">get\_pixel</a></a><div class="clear"></div>
            <code class="signature apipage">get\_pixel(\_pos:[phoenix.Vector](#)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_id:[String](#)<span></span>, \_onloaded:[phoenix.Texture](#)&nbsp;-&gt; [Void](#)<span>=null</span>, \_silent:[Bool](#)<span>=false</span>) : [Null](#)&lt;[phoenix.Texture](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load_from_resource"><a class="lift" href="#load_from_resource">load\_from\_resource</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load\_from\_resource(\_name:[String](#)<span></span>, \_width:[Int](#)<span></span>, \_height:[Int](#)<span></span>, \_cache:[Bool](#)<span>=true</span>) : [phoenix.Texture](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="lock"><a class="lift" href="#lock">lock</a></a><div class="clear"></div>
            <code class="signature apipage">lock() : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_manager:[luxe.resource.ResourceManager](#)<span></span>, \_type:[luxe.resource.ResourceType](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_onload"><a class="lift" href="#set_onload">set\_onload</a></a><div class="clear"></div>
            <code class="signature apipage">set\_onload(f:[phoenix.Texture](#)&nbsp;-&gt; [Void](#)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_pixel"><a class="lift" href="#set_pixel">set\_pixel</a></a><div class="clear"></div>
            <code class="signature apipage">set\_pixel(\_pos:[phoenix.Vector](#)<span></span>, \_color:[phoenix.Color](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlock"><a class="lift" href="#unlock">unlock</a></a><div class="clear"></div>
            <code class="signature apipage">unlock() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;