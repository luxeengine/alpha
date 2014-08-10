
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Entity</h1>
<small>`luxe.Entity`</small>



---

`class`extends <code><span>luxe.Objects</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><div class="clear"></div><code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="children"><a class="lift" href="#children">children</a></a><div class="clear"></div><code class="signature apipage">children : [Array](#)&lt;[luxe.Entity](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_destroyed"><a class="lift" href="#_destroyed">\_destroyed</a></a><div class="clear"></div><code class="signature apipage">\_destroyed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><div class="clear"></div><code class="signature apipage">inited : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><div class="clear"></div><code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="serialize"><a class="lift" href="#serialize">serialize</a></a><div class="clear"></div><code class="signature apipage">serialize : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div><code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_components"><a class="lift" href="#_components">\_components</a></a><div class="clear"></div><code class="signature apipage">\_components : [luxe.components.Components](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fixed_rate_timer"><a class="lift" href="#fixed_rate_timer">fixed\_rate\_timer</a></a><div class="clear"></div><code class="signature apipage">fixed\_rate\_timer : [snow.utils.Timer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="options"><a class="lift" href="#options">options</a></a><div class="clear"></div><code class="signature apipage">options : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="components"><a class="lift" href="#components">components</a></a> <div class="clear"></div><code class="signature apipage">components : [Map](#)&lt;[String](#), [luxe.Component](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a> <div class="clear"></div><code class="signature apipage">fixed\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a> <div class="clear"></div><code class="signature apipage">parent : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a> <div class="clear"></div><code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a> <div class="clear"></div><code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a> <div class="clear"></div><code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a> <div class="clear"></div><code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a> <div class="clear"></div><code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a> <div class="clear"></div><code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy(\_from\_parent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_fixed_rate"><a class="lift" href="#get_fixed_rate">get\_fixed\_rate</a></a> <div class="clear"></div><code class="signature apipage">get\_fixed\_rate() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_fixed_rate"><a class="lift" href="#set_fixed_rate">set\_fixed\_rate</a></a> <div class="clear"></div><code class="signature apipage">set\_fixed\_rate(\_rate:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_stop_fixed_rate_timer"><a class="lift" href="#_stop_fixed_rate_timer">\_stop\_fixed\_rate\_timer</a></a> <div class="clear"></div><code class="signature apipage">\_stop\_fixed\_rate\_timer() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_start_fixed_rate_timer"><a class="lift" href="#_start_fixed_rate_timer">\_start\_fixed\_rate\_timer</a></a> <div class="clear"></div><code class="signature apipage">\_start\_fixed\_rate\_timer(\_rate:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a> <div class="clear"></div><code class="signature apipage">add(type:[Class](#)&lt;[add.T1](#)&gt;<span></span>, \_name:[String](#)<span>=&#x27;&#x27;</span>, \_data:[add.T2](#)<span>=null</span>) : [add.T1](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a> <div class="clear"></div><code class="signature apipage">remove(\_name:[String](#)<span>=&#x27;&#x27;</span>, \_data:[remove.T](#)<span>=null</span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a> <div class="clear"></div><code class="signature apipage">get(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a> <div class="clear"></div><code class="signature apipage">get\_any(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>, \_first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a> <div class="clear"></div><code class="signature apipage">has(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_components"><a class="lift" href="#get_components">get\_components</a></a> <div class="clear"></div><code class="signature apipage">get\_components() : [Map](#)&lt;[String](#), [luxe.Component](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_pos_from_transform"><a class="lift" href="#set_pos_from_transform">set\_pos\_from\_transform</a></a> <div class="clear"></div><code class="signature apipage">set\_pos\_from\_transform(\_pos:[luxe.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_rotation_from_transform"><a class="lift" href="#set_rotation_from_transform">set\_rotation\_from\_transform</a></a> <div class="clear"></div><code class="signature apipage">set\_rotation\_from\_transform(\_rotation:[luxe.Quaternion](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_scale_from_transform"><a class="lift" href="#set_scale_from_transform">set\_scale\_from\_transform</a></a> <div class="clear"></div><code class="signature apipage">set\_scale\_from\_transform(\_scale:[luxe.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_origin_from_transform"><a class="lift" href="#set_origin_from_transform">set\_origin\_from\_transform</a></a> <div class="clear"></div><code class="signature apipage">set\_origin\_from\_transform(\_origin:[luxe.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_parent_from_transform"><a class="lift" href="#set_parent_from_transform">set\_parent\_from\_transform</a></a> <div class="clear"></div><code class="signature apipage">set\_parent\_from\_transform(\_parent:[luxe.Transform](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_pos"><a class="lift" href="#set_pos">set\_pos</a></a> <div class="clear"></div><code class="signature apipage">set\_pos(\_p:[luxe.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_pos"><a class="lift" href="#get_pos">get\_pos</a></a> <div class="clear"></div><code class="signature apipage">get\_pos() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_rotation"><a class="lift" href="#set_rotation">set\_rotation</a></a> <div class="clear"></div><code class="signature apipage">set\_rotation(\_r:[luxe.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_rotation"><a class="lift" href="#get_rotation">get\_rotation</a></a> <div class="clear"></div><code class="signature apipage">get\_rotation() : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_scale"><a class="lift" href="#set_scale">set\_scale</a></a> <div class="clear"></div><code class="signature apipage">set\_scale(\_s:[luxe.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_scale"><a class="lift" href="#get_scale">get\_scale</a></a> <div class="clear"></div><code class="signature apipage">get\_scale() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_origin"><a class="lift" href="#set_origin">set\_origin</a></a> <div class="clear"></div><code class="signature apipage">set\_origin(\_origin:[luxe.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_origin"><a class="lift" href="#get_origin">get\_origin</a></a> <div class="clear"></div><code class="signature apipage">get\_origin() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_parent"><a class="lift" href="#set_parent">set\_parent</a></a> <div class="clear"></div><code class="signature apipage">set\_parent(other:[luxe.Entity](#)<span></span>) : [luxe.Entity](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_parent"><a class="lift" href="#get_parent">get\_parent</a></a> <div class="clear"></div><code class="signature apipage">get\_parent() : [luxe.Entity](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_scene"><a class="lift" href="#set_scene">set\_scene</a></a> <div class="clear"></div><code class="signature apipage">set\_scene(\_scene:[luxe.Scene](#)<span></span>) : [luxe.Scene](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_scene"><a class="lift" href="#get_scene">get\_scene</a></a> <div class="clear"></div><code class="signature apipage">get\_scene() : [luxe.Scene](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_active"><a class="lift" href="#set_active">set\_active</a></a> <div class="clear"></div><code class="signature apipage">set\_active(\_active:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_active"><a class="lift" href="#get_active">get\_active</a></a> <div class="clear"></div><code class="signature apipage">get\_active() : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a> <div class="clear"></div><code class="signature apipage">get\_serialize\_data() : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="serialize_to_disk"><a class="lift" href="#serialize_to_disk">serialize\_to\_disk</a></a> <div class="clear"></div><code class="signature apipage">serialize\_to\_disk(\_destination\_path:[String](#)<span></span>, \_parent\_write:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_options:[luxe.options.EntityOptions](#)&lt;[new.T](#)&gt;<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;