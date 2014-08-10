
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>CompositeGeometry</h1>
<small>`phoenix.geometry.CompositeGeometry`</small>



---

`class`extends <code><span>phoenix.geometry.Geometry</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><div class="clear"></div><code class="signature apipage">geometry : [Array](#)&lt;[phoenix.geometry.Geometry](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a> <div class="clear"></div><code class="signature apipage">toString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a> <div class="clear"></div><code class="signature apipage">clear() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="replace"><a class="lift" href="#replace">replace</a></a> <div class="clear"></div><code class="signature apipage">replace(\_geometry:[Array](#)&lt;[phoenix.geometry.Geometry](#)&gt;<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="has_geometry"><a class="lift" href="#has_geometry">has\_geometry</a></a> <div class="clear"></div><code class="signature apipage">has\_geometry(geom:[phoenix.geometry.Geometry](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_geometry"><a class="lift" href="#add_geometry">add\_geometry</a></a> <div class="clear"></div><code class="signature apipage">add\_geometry(geom:[phoenix.geometry.Geometry](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_geometry"><a class="lift" href="#remove_geometry">remove\_geometry</a></a> <div class="clear"></div><code class="signature apipage">remove\_geometry(g:[phoenix.geometry.Geometry](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_to_batcher"><a class="lift" href="#add_to_batcher">add\_to\_batcher</a></a> <div class="clear"></div><code class="signature apipage">add\_to\_batcher(\_batcher:[phoenix.Batcher](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a> <div class="clear"></div><code class="signature apipage">drop(remove:[Bool](#)<span>=true</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="translate"><a class="lift" href="#translate">translate</a></a> <div class="clear"></div><code class="signature apipage">translate(\_offset:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_color"><a class="lift" href="#set_color">set\_color</a></a> <div class="clear"></div><code class="signature apipage">set\_color(\_color:[phoenix.Color](#)<span></span>) : [phoenix.Color](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_primitive_type"><a class="lift" href="#set_primitive_type">set\_primitive\_type</a></a> <div class="clear"></div><code class="signature apipage">set\_primitive\_type(val:[phoenix.PrimitiveType](#)<span></span>) : [phoenix.PrimitiveType](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_shader"><a class="lift" href="#set_shader">set\_shader</a></a> <div class="clear"></div><code class="signature apipage">set\_shader(val:[phoenix.Shader](#)<span></span>) : [phoenix.Shader](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_texture"><a class="lift" href="#set_texture">set\_texture</a></a> <div class="clear"></div><code class="signature apipage">set\_texture(val:[phoenix.Texture](#)<span></span>) : [phoenix.Texture](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_depth"><a class="lift" href="#set_depth">set\_depth</a></a> <div class="clear"></div><code class="signature apipage">set\_depth(val:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_group"><a class="lift" href="#set_group">set\_group</a></a> <div class="clear"></div><code class="signature apipage">set\_group(val:[Int](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_locked"><a class="lift" href="#set_locked">set\_locked</a></a> <div class="clear"></div><code class="signature apipage">set\_locked(val:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_dirty"><a class="lift" href="#set_dirty">set\_dirty</a></a> <div class="clear"></div><code class="signature apipage">set\_dirty(val:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_clip_rect"><a class="lift" href="#set_clip_rect">set\_clip\_rect</a></a> <div class="clear"></div><code class="signature apipage">set\_clip\_rect(val:[phoenix.Rectangle](#)<span></span>) : [phoenix.Rectangle](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_visible"><a class="lift" href="#set_visible">set\_visible</a></a> <div class="clear"></div><code class="signature apipage">set\_visible(val:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_options:[luxe.options.GeometryOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;