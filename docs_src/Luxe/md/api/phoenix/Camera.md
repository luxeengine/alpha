
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Camera



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a><code class="signature apipage">minimum\_zoom : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="ortho_options"><a class="lift" href="#ortho_options">ortho\_options</a></a><code class="signature apipage">ortho\_options : [luxe.options.ProjectionOptions](#luxe.options.ProjectionOptions)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="perspective_options"><a class="lift" href="#perspective_options">perspective\_options</a></a><code class="signature apipage">perspective\_options : [luxe.options.ProjectionOptions](#luxe.options.ProjectionOptions)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="projection"><a class="lift" href="#projection">projection</a></a><code class="signature apipage">projection : [phoenix.ProjectionType](#phoenix.ProjectionType)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="projection_matrix"><a class="lift" href="#projection_matrix">projection\_matrix</a></a><code class="signature apipage">projection\_matrix : [phoenix.Matrix4](#phoenix.Matrix4)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="target"><a class="lift" href="#target">target</a></a><code class="signature apipage">target : [phoenix.Vector](#phoenix.Vector)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="up"><a class="lift" href="#up">up</a></a><code class="signature apipage">up : [phoenix.Vector](#phoenix.Vector)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="view_matrix"><a class="lift" href="#view_matrix">view\_matrix</a></a><code class="signature apipage">view\_matrix : [phoenix.Matrix4](#phoenix.Matrix4)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="apply_ortho"><a class="lift" href="#apply_ortho">apply\_ortho</a></a><code class="signature apipage">apply\_ortho() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="apply_perspective"><a class="lift" href="#apply_perspective">apply\_perspective</a></a><code class="signature apipage">apply\_perspective() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(?options:<span>[luxe.options.CameraOptions](#luxe.options.CameraOptions)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a><code class="signature apipage">process() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="projectVector"><a class="lift" href="#projectVector">projectVector</a></a><code class="signature apipage">projectVector(\_vector:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_ray"><a class="lift" href="#screen_point_to_ray">screen\_point\_to\_ray</a></a><code class="signature apipage">screen\_point\_to\_ray(\_vector:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Ray](#phoenix.Ray)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a><code class="signature apipage">screen\_point\_to\_world(\_vector:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_ortho"><a class="lift" href="#set_ortho">set\_ortho</a></a><code class="signature apipage">set\_ortho(options:<span>[luxe.options.ProjectionOptions](#luxe.options.ProjectionOptions)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_perspective"><a class="lift" href="#set_perspective">set\_perspective</a></a><code class="signature apipage">set\_perspective(options:<span>[luxe.options.ProjectionOptions](#luxe.options.ProjectionOptions)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unprojectVector"><a class="lift" href="#unprojectVector">unprojectVector</a></a><code class="signature apipage">unprojectVector(\_vector:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update_look_at"><a class="lift" href="#update_look_at">update\_look\_at</a></a><code class="signature apipage">update\_look\_at() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a><code class="signature apipage">world\_point\_to\_screen(\_vector:<span>[phoenix.Vector](#phoenix.Vector)</span>, ?\_viewport:<span>[phoenix.Rectangle](#phoenix.Rectangle)=null</span>) : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="center"><a class="lift" href="#center">center</a></a><code class="signature apipage">center : [phoenix.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="pos"><a class="lift" href="#pos">pos</a></a><code class="signature apipage">pos : [phoenix.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><code class="signature apipage">rotation : [phoenix.Quaternion]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><code class="signature apipage">scale : [phoenix.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><code class="signature apipage">viewport : [phoenix.Rectangle]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="zoom"><a class="lift" href="#zoom">zoom</a></a><code class="signature apipage">zoom : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;