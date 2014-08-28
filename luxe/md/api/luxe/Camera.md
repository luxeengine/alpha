
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Camera</h1>
<small>`luxe.Camera`</small>



---

`class`extends <code><span>luxe.Entity</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="view"><a class="lift" href="#view">view</a></a><div class="clear"></div><code class="signature apipage">view : [phoenix.Camera](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="bounds"><a class="lift" href="#bounds">bounds</a></a><div class="clear"></div><code class="signature apipage">bounds : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shake_vector"><a class="lift" href="#shake_vector">shake\_vector</a></a><div class="clear"></div><code class="signature apipage">shake\_vector : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shake_amount"><a class="lift" href="#shake_amount">shake\_amount</a></a><div class="clear"></div><code class="signature apipage">shake\_amount : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shaking"><a class="lift" href="#shaking">shaking</a></a><div class="clear"></div><code class="signature apipage">shaking : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="minimum_shake"><a class="lift" href="#minimum_shake">minimum\_shake</a></a><div class="clear"></div><code class="signature apipage">minimum\_shake : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a> <div class="clear"></div><code class="signature apipage">viewport : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="center"><a class="lift" href="#center">center</a></a> <div class="clear"></div><code class="signature apipage">center : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="zoom"><a class="lift" href="#zoom">zoom</a></a> <div class="clear"></div><code class="signature apipage">zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a> <div class="clear"></div><code class="signature apipage">minimum\_zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="focus"><a class="lift" href="#focus">focus</a></a> <div class="clear"></div><code class="signature apipage">focus(\_p:[luxe.Vector](#)<span></span>, \_t:[Float](#)<span>=0.6f</span>, oncomplete:[Dynamic](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a> <div class="clear"></div><code class="signature apipage">screen\_point\_to\_world(\_vector:[luxe.Vector](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a> <div class="clear"></div><code class="signature apipage">world\_point\_to\_screen(\_vector:[luxe.Vector](#)<span></span>, \_viewport:[luxe.Rectangle](#)<span>=null</span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shake"><a class="lift" href="#shake">shake</a></a> <div class="clear"></div><code class="signature apipage">shake(amount:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a> <div class="clear"></div><code class="signature apipage">get\_serialize\_data() : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(options:[luxe.options.LuxeCameraOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;