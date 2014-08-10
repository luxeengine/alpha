
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>FlyCamera</h1>
<small>`luxe.components.cameras.FlyCamera`</small>



---

`class`extends <code><span>luxe.Camera</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="move_forward"><a class="lift" href="#move_forward">move\_forward</a></a><div class="clear"></div><code class="signature apipage">move\_forward : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_back"><a class="lift" href="#move_back">move\_back</a></a><div class="clear"></div><code class="signature apipage">move\_back : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_left"><a class="lift" href="#move_left">move\_left</a></a><div class="clear"></div><code class="signature apipage">move\_left : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_right"><a class="lift" href="#move_right">move\_right</a></a><div class="clear"></div><code class="signature apipage">move\_right : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_speed"><a class="lift" href="#move_speed">move\_speed</a></a><div class="clear"></div><code class="signature apipage">move\_speed : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_speed_scale"><a class="lift" href="#move_speed_scale">move\_speed\_scale</a></a><div class="clear"></div><code class="signature apipage">move\_speed\_scale : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="sensitivity_x"><a class="lift" href="#sensitivity_x">sensitivity\_x</a></a><div class="clear"></div><code class="signature apipage">sensitivity\_x : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="sensitivity_y"><a class="lift" href="#sensitivity_y">sensitivity\_y</a></a><div class="clear"></div><code class="signature apipage">sensitivity\_y : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="newpos"><a class="lift" href="#newpos">newpos</a></a><div class="clear"></div><code class="signature apipage">newpos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="mouse_delta"><a class="lift" href="#mouse_delta">mouse\_delta</a></a><div class="clear"></div><code class="signature apipage">mouse\_delta : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="forward"><a class="lift" href="#forward">forward</a></a><div class="clear"></div><code class="signature apipage">forward : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="right"><a class="lift" href="#right">right</a></a><div class="clear"></div><code class="signature apipage">right : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="up"><a class="lift" href="#up">up</a></a><div class="clear"></div><code class="signature apipage">up : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="yaw"><a class="lift" href="#yaw">yaw</a></a><div class="clear"></div><code class="signature apipage">yaw : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pitch"><a class="lift" href="#pitch">pitch</a></a><div class="clear"></div><code class="signature apipage">pitch : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pitch_rotation_matrix"><a class="lift" href="#pitch_rotation_matrix">pitch\_rotation\_matrix</a></a><div class="clear"></div><code class="signature apipage">pitch\_rotation\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="yaw_rotation_matrix"><a class="lift" href="#yaw_rotation_matrix">yaw\_rotation\_matrix</a></a><div class="clear"></div><code class="signature apipage">yaw\_rotation\_matrix : [phoenix.Matrix](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="ready"><a class="lift" href="#ready">ready</a></a><div class="clear"></div><code class="signature apipage">ready : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="halfPI"><a class="lift" href="#halfPI">halfPI</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">halfPI : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="twoPI"><a class="lift" href="#twoPI">twoPI</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">twoPI : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a> <div class="clear"></div><code class="signature apipage">reset() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a> <div class="clear"></div><code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="move_look"><a class="lift" href="#move_look">move\_look</a></a> <div class="clear"></div><code class="signature apipage">move\_look(xDelta:[Float](#)<span></span>, yDelta:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a> <div class="clear"></div><code class="signature apipage">onmouseup(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="enable"><a class="lift" href="#enable">enable</a></a> <div class="clear"></div><code class="signature apipage">enable() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a> <div class="clear"></div><code class="signature apipage">onmousemove(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a> <div class="clear"></div><code class="signature apipage">onkeydown(e:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a> <div class="clear"></div><code class="signature apipage">onkeyup(e:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_options:[luxe.options.LuxeCameraOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;