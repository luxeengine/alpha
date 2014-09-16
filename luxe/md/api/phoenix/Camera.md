
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Camera</h1>
<small>`phoenix.Camera`</small>



---

`class`
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="look_at_matrix"><a class="lift" href="#look_at_matrix">look\_at\_matrix</a></a><div class="clear"></div>
                <code class="signature apipage">look\_at\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a><div class="clear"></div>
                <code class="signature apipage">minimum\_zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="options"><a class="lift" href="#options">options</a></a><div class="clear"></div>
                <code class="signature apipage">options : [luxe.options.CameraOptions](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="projection"><a class="lift" href="#projection">projection</a></a><div class="clear"></div>
                <code class="signature apipage">projection : [phoenix.ProjectionType](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="projection_matrix"><a class="lift" href="#projection_matrix">projection\_matrix</a></a><div class="clear"></div>
                <code class="signature apipage">projection\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div>
                <code class="signature apipage">transform : [phoenix.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="up"><a class="lift" href="#up">up</a></a><div class="clear"></div>
                <code class="signature apipage">up : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view_matrix"><a class="lift" href="#view_matrix">view\_matrix</a></a><div class="clear"></div>
                <code class="signature apipage">view\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view_matrix_inverse"><a class="lift" href="#view_matrix_inverse">view\_matrix\_inverse</a></a><div class="clear"></div>
                <code class="signature apipage">view\_matrix\_inverse : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="aspect"><a class="lift" href="#aspect">aspect</a></a><div class="clear"></div>
                <code class="signature apipage">aspect : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="center"><a class="lift" href="#center">center</a></a><div class="clear"></div>
                <code class="signature apipage">center : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="far"><a class="lift" href="#far">far</a></a><div class="clear"></div>
                <code class="signature apipage">far : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fov"><a class="lift" href="#fov">fov</a></a><div class="clear"></div>
                <code class="signature apipage">fov : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="near"><a class="lift" href="#near">near</a></a><div class="clear"></div>
                <code class="signature apipage">near : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [phoenix.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="target"><a class="lift" href="#target">target</a></a><div class="clear"></div>
                <code class="signature apipage">target : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><div class="clear"></div>
                <code class="signature apipage">viewport : [phoenix.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="zoom"><a class="lift" href="#zoom">zoom</a></a><div class="clear"></div>
                <code class="signature apipage">zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.CameraOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="project"><a class="lift" href="#project">project</a></a><div class="clear"></div>
            <code class="signature apipage">project(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_ray"><a class="lift" href="#screen_point_to_ray">screen\_point\_to\_ray</a></a><div class="clear"></div>
            <code class="signature apipage">screen\_point\_to\_ray(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Ray](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a><div class="clear"></div>
            <code class="signature apipage">screen\_point\_to\_world(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_ortho"><a class="lift" href="#set_ortho">set\_ortho</a></a><div class="clear"></div>
            <code class="signature apipage">set\_ortho(\_options:[luxe.options.CameraOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_perspective"><a class="lift" href="#set_perspective">set\_perspective</a></a><div class="clear"></div>
            <code class="signature apipage">set\_perspective(\_options:[luxe.options.CameraOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unproject"><a class="lift" href="#unproject">unproject</a></a><div class="clear"></div>
            <code class="signature apipage">unproject(\_vector:[phoenix.Vector](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a><div class="clear"></div>
            <code class="signature apipage">world\_point\_to\_screen(\_vector:[phoenix.Vector](#)<span></span>, \_viewport:[phoenix.Rectangle](#)<span>=null</span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;