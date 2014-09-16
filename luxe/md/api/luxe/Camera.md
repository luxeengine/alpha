
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Camera</h1>
<small>`luxe.Camera`</small>



---

`class`extends <code><span>luxe.Entity</span></code>
<span class="meta">
<br/>meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="bounds"><a class="lift" href="#bounds">bounds</a></a><div class="clear"></div>
                <code class="signature apipage">bounds : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="children"><a class="lift" href="#children">children</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">children : [Array](#)&lt;[luxe.Entity](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">destroyed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="minimum_shake"><a class="lift" href="#minimum_shake">minimum\_shake</a></a><div class="clear"></div>
                <code class="signature apipage">minimum\_shake : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shake_amount"><a class="lift" href="#shake_amount">shake\_amount</a></a><div class="clear"></div>
                <code class="signature apipage">shake\_amount : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shake_vector"><a class="lift" href="#shake_vector">shake\_vector</a></a><div class="clear"></div>
                <code class="signature apipage">shake\_vector : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shaking"><a class="lift" href="#shaking">shaking</a></a><div class="clear"></div>
                <code class="signature apipage">shaking : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view"><a class="lift" href="#view">view</a></a><div class="clear"></div>
                <code class="signature apipage">view : [phoenix.Camera](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="center"><a class="lift" href="#center">center</a></a><div class="clear"></div>
                <code class="signature apipage">center : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="components"><a class="lift" href="#components">components</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">components : [Map](#)&lt;[String](#), [luxe.Component](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">fixed\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a><div class="clear"></div>
                <code class="signature apipage">minimum\_zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">parent : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><div class="clear"></div>
                <code class="signature apipage">viewport : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="zoom"><a class="lift" href="#zoom">zoom</a></a><div class="clear"></div>
                <code class="signature apipage">zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(\_component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy(\_from\_parent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="focus"><a class="lift" href="#focus">focus</a></a><div class="clear"></div>
            <code class="signature apipage">focus(\_p:[luxe.Vector](#)<span></span>, \_t:[Float](#)<span>=0.6f</span>, oncomplete:[Dynamic](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>, \_first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">new(options:[luxe.options.LuxeCameraOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a><div class="clear"></div>
            <code class="signature apipage">screen\_point\_to\_world(\_vector:[luxe.Vector](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shake"><a class="lift" href="#shake">shake</a></a><div class="clear"></div>
            <code class="signature apipage">shake(amount:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a><div class="clear"></div>
            <code class="signature apipage">world\_point\_to\_screen(\_vector:[luxe.Vector](#)<span></span>, \_viewport:[luxe.Rectangle](#)<span>=null</span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;