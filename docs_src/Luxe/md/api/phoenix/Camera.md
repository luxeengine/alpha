
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Camera</h1>
<small>`phoenix.Camera`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div><code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div><code class="signature apipage">transform : [phoenix.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a><div class="clear"></div><code class="signature apipage">minimum\_zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="projection_matrix"><a class="lift" href="#projection_matrix">projection\_matrix</a></a><div class="clear"></div><code class="signature apipage">projection\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view_matrix"><a class="lift" href="#view_matrix">view\_matrix</a></a><div class="clear"></div><code class="signature apipage">view\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view_matrix_inverse"><a class="lift" href="#view_matrix_inverse">view\_matrix\_inverse</a></a><div class="clear"></div><code class="signature apipage">view\_matrix\_inverse : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="look_at_matrix"><a class="lift" href="#look_at_matrix">look\_at\_matrix</a></a><div class="clear"></div><code class="signature apipage">look\_at\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="options"><a class="lift" href="#options">options</a></a><div class="clear"></div><code class="signature apipage">options : [luxe.options.CameraOptions](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="projection"><a class="lift" href="#projection">projection</a></a><div class="clear"></div><code class="signature apipage">projection : [phoenix.ProjectionType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="up"><a class="lift" href="#up">up</a></a><div class="clear"></div><code class="signature apipage">up : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform_dirty"><a class="lift" href="#transform_dirty">transform\_dirty</a></a><div class="clear"></div><code class="signature apipage">transform\_dirty : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="projection_dirty"><a class="lift" href="#projection_dirty">projection\_dirty</a></a><div class="clear"></div><code class="signature apipage">projection\_dirty : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="look_at_dirty"><a class="lift" href="#look_at_dirty">look\_at\_dirty</a></a><div class="clear"></div><code class="signature apipage">look\_at\_dirty : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_setup"><a class="lift" href="#_setup">\_setup</a></a><div class="clear"></div><code class="signature apipage">\_setup : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_refresh_pos"><a class="lift" href="#_refresh_pos">\_refresh\_pos</a></a><div class="clear"></div><code class="signature apipage">\_refresh\_pos : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a> <div class="clear"></div><code class="signature apipage">viewport : [phoenix.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="center"><a class="lift" href="#center">center</a></a> <div class="clear"></div><code class="signature apipage">center : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="zoom"><a class="lift" href="#zoom">zoom</a></a> <div class="clear"></div><code class="signature apipage">zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="near"><a class="lift" href="#near">near</a></a> <div class="clear"></div><code class="signature apipage">near : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="far"><a class="lift" href="#far">far</a></a> <div class="clear"></div><code class="signature apipage">far : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fov"><a class="lift" href="#fov">fov</a></a> <div class="clear"></div><code class="signature apipage">fov : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="aspect"><a class="lift" href="#aspect">aspect</a></a> <div class="clear"></div><code class="signature apipage">aspect : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="target"><a class="lift" href="#target">target</a></a> <div class="clear"></div><code class="signature apipage">target : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a> <div class="clear"></div><code class="signature apipage">pos : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a> <div class="clear"></div><code class="signature apipage">scale : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a> <div class="clear"></div><code class="signature apipage">rotation : [phoenix.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="set_ortho"><a class="lift" href="#set_ortho">set\_ortho</a></a> <div class="clear"></div><code class="signature apipage">set\_ortho(\_options:[luxe.options.CameraOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_perspective"><a class="lift" href="#set_perspective">set\_perspective</a></a> <div class="clear"></div><code class="signature apipage">set\_perspective(\_options:[luxe.options.CameraOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="project"><a class="lift" href="#project">project</a></a> <div class="clear"></div><code class="signature apipage">project(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unproject"><a class="lift" href="#unproject">unproject</a></a> <div class="clear"></div><code class="signature apipage">unproject(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_ray"><a class="lift" href="#screen_point_to_ray">screen\_point\_to\_ray</a></a> <div class="clear"></div><code class="signature apipage">screen\_point\_to\_ray(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Ray](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a> <div class="clear"></div><code class="signature apipage">screen\_point\_to\_world(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a> <div class="clear"></div><code class="signature apipage">world\_point\_to\_screen(\_vector:[phoenix.Vector](#)<span></span>, \_viewport:[phoenix.Rectangle](#)<span>=null</span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_transform_cleaned"><a class="lift" href="#on_transform_cleaned">on\_transform\_cleaned</a></a> <div class="clear"></div><code class="signature apipage">on\_transform\_cleaned(t:[phoenix.Transform](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update_look_at"><a class="lift" href="#update_look_at">update\_look\_at</a></a> <div class="clear"></div><code class="signature apipage">update\_look\_at() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update_view_matrix"><a class="lift" href="#update_view_matrix">update\_view\_matrix</a></a> <div class="clear"></div><code class="signature apipage">update\_view\_matrix() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update_projection_matrix"><a class="lift" href="#update_projection_matrix">update\_projection\_matrix</a></a> <div class="clear"></div><code class="signature apipage">update\_projection\_matrix() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="apply_state"><a class="lift" href="#apply_state">apply\_state</a></a> <div class="clear"></div><code class="signature apipage">apply\_state(state:[Int](#)<span></span>, value:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="apply_default_camera_options"><a class="lift" href="#apply_default_camera_options">apply\_default\_camera\_options</a></a> <div class="clear"></div><code class="signature apipage">apply\_default\_camera\_options() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="default_camera_options"><a class="lift" href="#default_camera_options">default\_camera\_options</a></a> <div class="clear"></div><code class="signature apipage">default\_camera\_options() : [luxe.options.CameraOptions](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ortho_screen_to_world"><a class="lift" href="#ortho_screen_to_world">ortho\_screen\_to\_world</a></a> <div class="clear"></div><code class="signature apipage">ortho\_screen\_to\_world(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ortho_world_to_screen"><a class="lift" href="#ortho_world_to_screen">ortho\_world\_to\_screen</a></a> <div class="clear"></div><code class="signature apipage">ortho\_world\_to\_screen(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="persepective_world_to_screen"><a class="lift" href="#persepective_world_to_screen">persepective\_world\_to\_screen</a></a> <div class="clear"></div><code class="signature apipage">persepective\_world\_to\_screen(\_vector:[phoenix.Vector](#)<span></span>, \_viewport:[phoenix.Rectangle](#)<span>=null</span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_target"><a class="lift" href="#set_target">set\_target</a></a> <div class="clear"></div><code class="signature apipage">set\_target(\_target:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_fov"><a class="lift" href="#set_fov">set\_fov</a></a> <div class="clear"></div><code class="signature apipage">set\_fov(\_fov:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_aspect"><a class="lift" href="#set_aspect">set\_aspect</a></a> <div class="clear"></div><code class="signature apipage">set\_aspect(\_aspect:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_near"><a class="lift" href="#set_near">set\_near</a></a> <div class="clear"></div><code class="signature apipage">set\_near(\_near:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_far"><a class="lift" href="#set_far">set\_far</a></a> <div class="clear"></div><code class="signature apipage">set\_far(\_far:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_zoom"><a class="lift" href="#set_zoom">set\_zoom</a></a> <div class="clear"></div><code class="signature apipage">set\_zoom(\_z:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_center"><a class="lift" href="#set_center">set\_center</a></a> <div class="clear"></div><code class="signature apipage">set\_center(\_p:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_center"><a class="lift" href="#get_center">get\_center</a></a> <div class="clear"></div><code class="signature apipage">get\_center() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
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
            <a name="get_viewport"><a class="lift" href="#get_viewport">get\_viewport</a></a> <div class="clear"></div><code class="signature apipage">get\_viewport() : [phoenix.Rectangle](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_viewport"><a class="lift" href="#set_viewport">set\_viewport</a></a> <div class="clear"></div><code class="signature apipage">set\_viewport(\_r:[phoenix.Rectangle](#)<span></span>) : [phoenix.Rectangle](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_rotation"><a class="lift" href="#set_rotation">set\_rotation</a></a> <div class="clear"></div><code class="signature apipage">set\_rotation(\_q:[phoenix.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_scale"><a class="lift" href="#set_scale">set\_scale</a></a> <div class="clear"></div><code class="signature apipage">set\_scale(\_s:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_pos"><a class="lift" href="#set_pos">set\_pos</a></a> <div class="clear"></div><code class="signature apipage">set\_pos(\_p:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_merge_options"><a class="lift" href="#_merge_options">\_merge\_options</a></a> <div class="clear"></div><code class="signature apipage">\_merge\_options(\_options:[luxe.options.CameraOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_pos_changed"><a class="lift" href="#_pos_changed">\_pos\_changed</a></a> <div class="clear"></div><code class="signature apipage">\_pos\_changed(v:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_center_changed"><a class="lift" href="#_center_changed">\_center\_changed</a></a> <div class="clear"></div><code class="signature apipage">\_center\_changed(v:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_options:[luxe.options.CameraOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;