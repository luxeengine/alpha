
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Transform</h1>
<small>`phoenix.Transform`</small>



---

`class`extends <code><span>luxe.Objects</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="_origin_undo_matrix"><a class="lift" href="#_origin_undo_matrix">\_origin\_undo\_matrix</a></a><div class="clear"></div><code class="signature apipage">\_origin\_undo\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_pos_matrix"><a class="lift" href="#_pos_matrix">\_pos\_matrix</a></a><div class="clear"></div><code class="signature apipage">\_pos\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_rotation_matrix"><a class="lift" href="#_rotation_matrix">\_rotation\_matrix</a></a><div class="clear"></div><code class="signature apipage">\_rotation\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_setup"><a class="lift" href="#_setup">\_setup</a></a><div class="clear"></div><code class="signature apipage">\_setup : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_cleaning"><a class="lift" href="#_cleaning">\_cleaning</a></a><div class="clear"></div><code class="signature apipage">\_cleaning : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_clean_handlers"><a class="lift" href="#_clean_handlers">\_clean\_handlers</a></a><div class="clear"></div><code class="signature apipage">\_clean\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_dirty_handlers"><a class="lift" href="#_dirty_handlers">\_dirty\_handlers</a></a><div class="clear"></div><code class="signature apipage">\_dirty\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_pos_handlers"><a class="lift" href="#_pos_handlers">\_pos\_handlers</a></a><div class="clear"></div><code class="signature apipage">\_pos\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_rotation_handlers"><a class="lift" href="#_rotation_handlers">\_rotation\_handlers</a></a><div class="clear"></div><code class="signature apipage">\_rotation\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_scale_handlers"><a class="lift" href="#_scale_handlers">\_scale\_handlers</a></a><div class="clear"></div><code class="signature apipage">\_scale\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_origin_handlers"><a class="lift" href="#_origin_handlers">\_origin\_handlers</a></a><div class="clear"></div><code class="signature apipage">\_origin\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_parent_handlers"><a class="lift" href="#_parent_handlers">\_parent\_handlers</a></a><div class="clear"></div><code class="signature apipage">\_parent\_handlers : [Array](#)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a> <div class="clear"></div><code class="signature apipage">parent : [phoenix.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="local"><a class="lift" href="#local">local</a></a> <div class="clear"></div><code class="signature apipage">local : [phoenix.Spatial](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="world"><a class="lift" href="#world">world</a></a> <div class="clear"></div><code class="signature apipage">world : [phoenix.Spatial](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a> <div class="clear"></div><code class="signature apipage">origin : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dirty"><a class="lift" href="#dirty">dirty</a></a> <div class="clear"></div><code class="signature apipage">dirty : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a> <div class="clear"></div><code class="signature apipage">pos : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a> <div class="clear"></div><code class="signature apipage">rotation : [phoenix.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a> <div class="clear"></div><code class="signature apipage">scale : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_dirty"><a class="lift" href="#set_dirty">set\_dirty</a></a> <div class="clear"></div><code class="signature apipage">set\_dirty(\_dirty:[Bool](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_local_pos_change"><a class="lift" href="#on_local_pos_change">on\_local\_pos\_change</a></a> <div class="clear"></div><code class="signature apipage">on\_local\_pos\_change(v:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_local_rotation_change"><a class="lift" href="#on_local_rotation_change">on\_local\_rotation\_change</a></a> <div class="clear"></div><code class="signature apipage">on\_local\_rotation\_change(r:[phoenix.Quaternion](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_local_scale_change"><a class="lift" href="#on_local_scale_change">on\_local\_scale\_change</a></a> <div class="clear"></div><code class="signature apipage">on\_local\_scale\_change(s:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_parent_cleaned"><a class="lift" href="#on_parent_cleaned">on\_parent\_cleaned</a></a> <div class="clear"></div><code class="signature apipage">on\_parent\_cleaned(p:[phoenix.Transform](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_local"><a class="lift" href="#get_local">get\_local</a></a> <div class="clear"></div><code class="signature apipage">get\_local() : [phoenix.Spatial](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_local"><a class="lift" href="#set_local">set\_local</a></a> <div class="clear"></div><code class="signature apipage">set\_local(l:[phoenix.Spatial](#)<span></span>) : [phoenix.Spatial](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_world"><a class="lift" href="#get_world">get\_world</a></a> <div class="clear"></div><code class="signature apipage">get\_world() : [phoenix.Spatial](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a> <div class="clear"></div><code class="signature apipage">toString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_origin"><a class="lift" href="#get_origin">get\_origin</a></a> <div class="clear"></div><code class="signature apipage">get\_origin() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_origin"><a class="lift" href="#set_origin">set\_origin</a></a> <div class="clear"></div><code class="signature apipage">set\_origin(o:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_world"><a class="lift" href="#set_world">set\_world</a></a> <div class="clear"></div><code class="signature apipage">set\_world(w:[phoenix.Spatial](#)<span></span>) : [phoenix.Spatial](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_parent"><a class="lift" href="#get_parent">get\_parent</a></a> <div class="clear"></div><code class="signature apipage">get\_parent() : [phoenix.Transform](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_parent"><a class="lift" href="#set_parent">set\_parent</a></a> <div class="clear"></div><code class="signature apipage">set\_parent(\_p:[phoenix.Transform](#)<span></span>) : [phoenix.Transform](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_pos"><a class="lift" href="#get_pos">get\_pos</a></a> <div class="clear"></div><code class="signature apipage">get\_pos() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_rotation"><a class="lift" href="#get_rotation">get\_rotation</a></a> <div class="clear"></div><code class="signature apipage">get\_rotation() : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_scale"><a class="lift" href="#get_scale">get\_scale</a></a> <div class="clear"></div><code class="signature apipage">get\_scale() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_pos"><a class="lift" href="#set_pos">set\_pos</a></a> <div class="clear"></div><code class="signature apipage">set\_pos(value:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_rotation"><a class="lift" href="#set_rotation">set\_rotation</a></a> <div class="clear"></div><code class="signature apipage">set\_rotation(value:[phoenix.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_scale"><a class="lift" href="#set_scale">set\_scale</a></a> <div class="clear"></div><code class="signature apipage">set\_scale(value:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="propagate_clean"><a class="lift" href="#propagate_clean">propagate\_clean</a></a> <div class="clear"></div><code class="signature apipage">propagate\_clean() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="propagate_dirty"><a class="lift" href="#propagate_dirty">propagate\_dirty</a></a> <div class="clear"></div><code class="signature apipage">propagate\_dirty() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="propagate_pos"><a class="lift" href="#propagate_pos">propagate\_pos</a></a> <div class="clear"></div><code class="signature apipage">propagate\_pos(\_pos:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="propagate_rotation"><a class="lift" href="#propagate_rotation">propagate\_rotation</a></a> <div class="clear"></div><code class="signature apipage">propagate\_rotation(\_rotation:[phoenix.Quaternion](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="propagate_scale"><a class="lift" href="#propagate_scale">propagate\_scale</a></a> <div class="clear"></div><code class="signature apipage">propagate\_scale(\_scale:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="propagate_origin"><a class="lift" href="#propagate_origin">propagate\_origin</a></a> <div class="clear"></div><code class="signature apipage">propagate\_origin(\_origin:[phoenix.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="propagate_parent"><a class="lift" href="#propagate_parent">propagate\_parent</a></a> <div class="clear"></div><code class="signature apipage">propagate\_parent(\_parent:[phoenix.Transform](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen"><a class="lift" href="#listen">listen</a></a> <div class="clear"></div><code class="signature apipage">listen(\_handler:[phoenix.Transform](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten"><a class="lift" href="#unlisten">unlisten</a></a> <div class="clear"></div><code class="signature apipage">unlisten(\_handler:[phoenix.Transform](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_dirty"><a class="lift" href="#listen_dirty">listen\_dirty</a></a> <div class="clear"></div><code class="signature apipage">listen\_dirty(\_handler:[phoenix.Transform](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_dirty"><a class="lift" href="#unlisten_dirty">unlisten\_dirty</a></a> <div class="clear"></div><code class="signature apipage">unlisten\_dirty(\_handler:[phoenix.Transform](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_pos"><a class="lift" href="#listen_pos">listen\_pos</a></a> <div class="clear"></div><code class="signature apipage">listen\_pos(\_handler:[phoenix.Vector](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_pos"><a class="lift" href="#unlisten_pos">unlisten\_pos</a></a> <div class="clear"></div><code class="signature apipage">unlisten\_pos(\_handler:[phoenix.Vector](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_scale"><a class="lift" href="#listen_scale">listen\_scale</a></a> <div class="clear"></div><code class="signature apipage">listen\_scale(\_handler:[phoenix.Vector](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_scale"><a class="lift" href="#unlisten_scale">unlisten\_scale</a></a> <div class="clear"></div><code class="signature apipage">unlisten\_scale(\_handler:[phoenix.Vector](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_rotation"><a class="lift" href="#listen_rotation">listen\_rotation</a></a> <div class="clear"></div><code class="signature apipage">listen\_rotation(\_handler:[phoenix.Quaternion](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_rotation"><a class="lift" href="#unlisten_rotation">unlisten\_rotation</a></a> <div class="clear"></div><code class="signature apipage">unlisten\_rotation(\_handler:[phoenix.Quaternion](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_origin"><a class="lift" href="#listen_origin">listen\_origin</a></a> <div class="clear"></div><code class="signature apipage">listen\_origin(\_handler:[phoenix.Vector](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_origin"><a class="lift" href="#unlisten_origin">unlisten\_origin</a></a> <div class="clear"></div><code class="signature apipage">unlisten\_origin(\_handler:[phoenix.Vector](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_parent"><a class="lift" href="#listen_parent">listen\_parent</a></a> <div class="clear"></div><code class="signature apipage">listen\_parent(\_handler:[phoenix.Transform](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_parent"><a class="lift" href="#unlisten_parent">unlisten\_parent</a></a> <div class="clear"></div><code class="signature apipage">unlisten\_parent(\_handler:[phoenix.Transform](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;