
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Visual</h1>
<small>`luxe.Visual`</small>



---

`class`extends <code><span>luxe.Entity</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="_rotation_euler"><a class="lift" href="#_rotation_euler">\_rotation\_euler</a></a><div class="clear"></div><code class="signature apipage">\_rotation\_euler : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_rotation_quat"><a class="lift" href="#_rotation_quat">\_rotation\_quat</a></a><div class="clear"></div><code class="signature apipage">\_rotation\_quat : [phoenix.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_has_custom_origin"><a class="lift" href="#_has_custom_origin">\_has\_custom\_origin</a></a><div class="clear"></div><code class="signature apipage">\_has\_custom\_origin : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_creating_geometry"><a class="lift" href="#_creating_geometry">\_creating\_geometry</a></a><div class="clear"></div><code class="signature apipage">\_creating\_geometry : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="ignore_texture_on_geometry_change"><a class="lift" href="#ignore_texture_on_geometry_change">ignore\_texture\_on\_geometry\_change</a></a><div class="clear"></div><code class="signature apipage">ignore\_texture\_on\_geometry\_change : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="size"><a class="lift" href="#size">size</a></a> <div class="clear"></div><code class="signature apipage">size : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a> <div class="clear"></div><code class="signature apipage">geometry : [phoenix.geometry.Geometry](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="locked"><a class="lift" href="#locked">locked</a></a> <div class="clear"></div><code class="signature apipage">locked : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a> <div class="clear"></div><code class="signature apipage">texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a> <div class="clear"></div><code class="signature apipage">shader : [phoenix.Shader](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a> <div class="clear"></div><code class="signature apipage">color : [luxe.Color](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a> <div class="clear"></div><code class="signature apipage">visible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a> <div class="clear"></div><code class="signature apipage">depth : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a> <div class="clear"></div><code class="signature apipage">group : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a> <div class="clear"></div><code class="signature apipage">clip\_rect : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="radians"><a class="lift" href="#radians">radians</a></a> <div class="clear"></div><code class="signature apipage">radians : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation_z"><a class="lift" href="#rotation_z">rotation\_z</a></a> <div class="clear"></div><code class="signature apipage">rotation\_z : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a> <div class="clear"></div><code class="signature apipage">destroyed() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_geometry_created"><a class="lift" href="#on_geometry_created">on\_geometry\_created</a></a> <div class="clear"></div><code class="signature apipage">on\_geometry\_created() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_visible"><a class="lift" href="#set_visible">set\_visible</a></a> <div class="clear"></div><code class="signature apipage">set\_visible(\_v:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_depth"><a class="lift" href="#set_depth">set\_depth</a></a> <div class="clear"></div><code class="signature apipage">set\_depth(\_v:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_group"><a class="lift" href="#set_group">set\_group</a></a> <div class="clear"></div><code class="signature apipage">set\_group(\_v:[Int](#)<span></span>) : [Int](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_color"><a class="lift" href="#set_color">set\_color</a></a> <div class="clear"></div><code class="signature apipage">set\_color(\_c:[luxe.Color](#)<span></span>) : [luxe.Color](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_texture"><a class="lift" href="#set_texture">set\_texture</a></a> <div class="clear"></div><code class="signature apipage">set\_texture(\_t:[phoenix.Texture](#)<span></span>) : [phoenix.Texture](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_shader"><a class="lift" href="#set_shader">set\_shader</a></a> <div class="clear"></div><code class="signature apipage">set\_shader(\_s:[phoenix.Shader](#)<span></span>) : [phoenix.Shader](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_geometry"><a class="lift" href="#set_geometry">set\_geometry</a></a> <div class="clear"></div><code class="signature apipage">set\_geometry(\_g:[phoenix.geometry.Geometry](#)<span></span>) : [phoenix.geometry.Geometry](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_rotation_from_transform"><a class="lift" href="#set_rotation_from_transform">set\_rotation\_from\_transform</a></a> <div class="clear"></div><code class="signature apipage">set\_rotation\_from\_transform(\_rotation:[phoenix.Quaternion](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_size"><a class="lift" href="#set_size">set\_size</a></a> <div class="clear"></div><code class="signature apipage">set\_size(\_v:[luxe.Vector](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_rotation_z"><a class="lift" href="#get_rotation_z">get\_rotation\_z</a></a> <div class="clear"></div><code class="signature apipage">get\_rotation\_z() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_rotation_z"><a class="lift" href="#set_rotation_z">set\_rotation\_z</a></a> <div class="clear"></div><code class="signature apipage">set\_rotation\_z(\_r:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_radians"><a class="lift" href="#set_radians">set\_radians</a></a> <div class="clear"></div><code class="signature apipage">set\_radians(\_r:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_radians"><a class="lift" href="#get_radians">get\_radians</a></a> <div class="clear"></div><code class="signature apipage">get\_radians() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_locked"><a class="lift" href="#set_locked">set\_locked</a></a> <div class="clear"></div><code class="signature apipage">set\_locked(\_l:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_clip_rect"><a class="lift" href="#set_clip_rect">set\_clip\_rect</a></a> <div class="clear"></div><code class="signature apipage">set\_clip\_rect(val:[luxe.Rectangle](#)<span></span>) : [luxe.Rectangle](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_size_change"><a class="lift" href="#_size_change">\_size\_change</a></a> <div class="clear"></div><code class="signature apipage">\_size\_change(\_v:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a> <div class="clear"></div><code class="signature apipage">get\_serialize\_data() : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_options:[luxe.options.VisualOptions](#)&lt;[new.T](#)&gt;<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;