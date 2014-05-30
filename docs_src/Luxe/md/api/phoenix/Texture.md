
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Texture



---

`class`extends <code><span>[luxe.Resource]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="_onload_handlers"><a class="lift" href="#_onload_handlers">\_onload\_handlers</a></a><code class="signature apipage">\_onload\_handlers : [Array](http://api.haxe.org/Array.html)&lt;[phoenix.Texture-&gt;Void](#phoenix.Texture->Void)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="actual_height"><a class="lift" href="#actual_height">actual\_height</a></a><code class="signature apipage">actual\_height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="actual_width"><a class="lift" href="#actual_width">actual\_width</a></a><code class="signature apipage">actual\_width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="data"><a class="lift" href="#data">data</a></a><code class="signature apipage">data : [lime.utils.UInt8Array]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="height"><a class="lift" href="#height">height</a></a><code class="signature apipage">height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><code class="signature apipage">loaded : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="slot"><a class="lift" href="#slot">slot</a></a><code class="signature apipage">slot : [Int](http://api.haxe.org/Int.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="texture"><a class="lift" href="#texture">texture</a></a><code class="signature apipage">texture : [lime.gl.GLTexture]()</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="width"><a class="lift" href="#width">width</a></a><code class="signature apipage">width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
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
            <a name="activate"><a class="lift" href="#activate">activate</a></a><code class="signature apipage">activate(att:<span>[lime.gl.GLUniformLocation]()</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="bind"><a class="lift" href="#bind">bind</a></a><code class="signature apipage">bind() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="create_from_bytes"><a class="lift" href="#create_from_bytes">create\_from\_bytes</a></a><code class="signature apipage">create\_from\_bytes(\_asset\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_asset\_bytes:<span>[haxe.io.Bytes](http://api.haxe.org/haxe/io/Bytes.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="create_from_bytes_html"><a class="lift" href="#create_from_bytes_html">create\_from\_bytes\_html</a></a><code class="signature apipage">create\_from\_bytes\_html(\_asset\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_asset\_bytes:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, \_width:<span>[Float](http://api.haxe.org/Float.html)</span>, \_height:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="create_from_bytes_using_haxe"><a class="lift" href="#create_from_bytes_using_haxe">create\_from\_bytes\_using\_haxe</a></a><code class="signature apipage">create\_from\_bytes\_using\_haxe(\_asset\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_asset\_bytes:<span>[haxe.io.Bytes](http://api.haxe.org/haxe/io/Bytes.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="do_onload"><a class="lift" href="#do_onload">do\_onload</a></a><code class="signature apipage">do\_onload() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">drop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="estimated_memory"><a class="lift" href="#estimated_memory">estimated\_memory</a></a><code class="signature apipage">estimated\_memory() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="generate_mipmaps"><a class="lift" href="#generate_mipmaps">generate\_mipmaps</a></a><code class="signature apipage">generate\_mipmaps() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_pixel"><a class="lift" href="#get_pixel">get\_pixel</a></a><code class="signature apipage">get\_pixel(\_pos:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [Dynamic](http://api.haxe.org/Dynamic.html)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;, [Dynamic](http://api.haxe.org/Dynamic.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;, [Dynamic](http://api.haxe.org/Dynamic.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;, [Dynamic](http://api.haxe.org/Dynamic.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="lock"><a class="lift" href="#lock">lock</a></a><code class="signature apipage">lock() : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Resource" class="tooltip inherited">&gt;</a><code class="signature apipage">new(\_manager:<span>[luxe.ResourceManager](#luxe.ResourceManager)</span>, ?\_type:<span>[luxe.ResourceType](#luxe.ResourceType)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onload"><a class="lift" href="#onload">onload</a></a><code class="signature apipage">onload() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_onload"><a class="lift" href="#set_onload">set\_onload</a></a><code class="signature apipage">set\_onload(f:<span>[phoenix.Texture-&gt;Void](#phoenix.Texture->Void)</span>) : [phoenix.Texture-&gt;Void](#phoenix.Texture->Void)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_pixel"><a class="lift" href="#set_pixel">set\_pixel</a></a><code class="signature apipage">set\_pixel(\_pos:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_color:<span>[phoenix.Color](#phoenix.Color)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlock"><a class="lift" href="#unlock">unlock</a></a><code class="signature apipage">unlock() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="clamp"><a class="lift" href="#clamp">clamp</a></a><code class="signature apipage">clamp : [phoenix.ClampType]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="filter"><a class="lift" href="#filter">filter</a></a><code class="signature apipage">filter : [phoenix.FilterType]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="filter_mag"><a class="lift" href="#filter_mag">filter\_mag</a></a><code class="signature apipage">filter\_mag : [phoenix.FilterType]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="filter_min"><a class="lift" href="#filter_min">filter\_min</a></a><code class="signature apipage">filter\_min : [phoenix.FilterType]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;