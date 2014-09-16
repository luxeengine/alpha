
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>FlyCamera</h1>
<small>`luxe.components.cameras.FlyCamera`</small>



---

`class`extends <code><span>luxe.Camera</span></code>
<span class="meta">
<br/>meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="bounds"><a class="lift" href="#bounds">bounds</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">bounds : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat">if set, the camera will not move outside of this region (world space)</span><span class="member apipage">
                <a name="children"><a class="lift" href="#children">children</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">children : [Array](#)&lt;[luxe.Entity](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of children this entity is parenting. Use `child.parent = null;` to remove, or `child.parent = entity;` to assign.</span><span class="member apipage">
                <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">destroyed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been destroyed</span><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat">A local event system for sending and receiving named events through the entity. Helps communicate between components, and more.</span><span class="member apipage">
                <a name="forward"><a class="lift" href="#forward">forward</a></a><div class="clear"></div>
                <code class="signature apipage">forward : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been inited yet</span><span class="member apipage">
                <a name="move_back"><a class="lift" href="#move_back">move\_back</a></a><div class="clear"></div>
                <code class="signature apipage">move\_back : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_forward"><a class="lift" href="#move_forward">move\_forward</a></a><div class="clear"></div>
                <code class="signature apipage">move\_forward : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_left"><a class="lift" href="#move_left">move\_left</a></a><div class="clear"></div>
                <code class="signature apipage">move\_left : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_right"><a class="lift" href="#move_right">move\_right</a></a><div class="clear"></div>
                <code class="signature apipage">move\_right : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_speed"><a class="lift" href="#move_speed">move\_speed</a></a><div class="clear"></div>
                <code class="signature apipage">move\_speed : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="move_speed_scale"><a class="lift" href="#move_speed_scale">move\_speed\_scale</a></a><div class="clear"></div>
                <code class="signature apipage">move\_speed\_scale : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="right"><a class="lift" href="#right">right</a></a><div class="clear"></div>
                <code class="signature apipage">right : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="sensitivity_x"><a class="lift" href="#sensitivity_x">sensitivity\_x</a></a><div class="clear"></div>
                <code class="signature apipage">sensitivity\_x : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="sensitivity_y"><a class="lift" href="#sensitivity_y">sensitivity\_y</a></a><div class="clear"></div>
                <code class="signature apipage">sensitivity\_y : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been started/reset by the scene</span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat">The spatial transform of the entity.</span><span class="member apipage">
                <a name="up"><a class="lift" href="#up">up</a></a><div class="clear"></div>
                <code class="signature apipage">up : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view"><a class="lift" href="#view">view</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">view : [phoenix.Camera](#)</code><br/></span>
            <span class="small_desc_flat">the view camera this entity wraps</span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">if the entity is active in the scene or not. set to inactive to stop scene events propogating into this entity and it's components and children</span><span class="member apipage">
                <a name="center"><a class="lift" href="#center">center</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">center : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The center point of this camera, proxy to the view</span><span class="member apipage">
                <a name="components"><a class="lift" href="#components">components</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">components : [Map](#)&lt;[String](#), [luxe.Component](#)&gt;</code><br/></span>
            <span class="small_desc_flat">The map of attached components, by name. use .get to find components in children and from other components instead of accessing this unless you need to</span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">fixed\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat">per entity fixed rate timer, if any. if 0 (default) no fixed update is called on this entity.</span><span class="member apipage">
                <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">minimum\_zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The minimum zoom value this camera can be set to, proxy to the view</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local origin of the spatial transform</span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">parent : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat">The parent entity if any, set to null for no parent</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local position of the spatial transform</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat">The local rotation of the spatial transform</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local scale of the spatial transform</span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat">if the entity is in a scene, this is not null</span><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">viewport : [luxe.Rectangle](#)</code><br/></span>
            <span class="small_desc_flat">The viewport size for this camera, proxy to the view</span><span class="member apipage">
                <a name="zoom"><a class="lift" href="#zoom">zoom</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">zoom : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The current zoom value this camera can be set to, proxy to the view</span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(\_component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat">attach a component to the entity</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy(\_from\_parent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">destroy this entity. removes it from the scene if any, from the parent etc.</span>
        </span>
    <span class="method apipage">
            <a name="enable"><a class="lift" href="#enable">enable</a></a><div class="clear"></div>
            <code class="signature apipage">enable() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="focus"><a class="lift" href="#focus">focus</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">focus(\_p:[luxe.Vector](#)<span></span>, \_t:[Float](#)<span>=0.6f</span>, oncomplete:[Dynamic](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat">Focus the camera on a specific point, for Ortho only.
        Use `.target` for a focus in perspective</span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat">get a component from the entity, by name</span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>, \_first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat">get all component from the entity, by name</span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">returns true if the entity has a component by the given name</span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.LuxeCameraOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeydown(e:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeyup(e:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousemove(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmouseup(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">remove a component from the entity</span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">screen\_point\_to\_world(\_vector:[luxe.Vector](#)<span></span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat">convert a screen point to world space for this camera. handles zoom, rotation, scale, etc</span>
        </span>
    <span class="method apipage">
            <a name="shake"><a class="lift" href="#shake">shake</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">shake(amount:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Shake the camera a given amount</span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a><a title="inherited from luxe.Camera" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">world\_point\_to\_screen(\_vector:[luxe.Vector](#)<span></span>, \_viewport:[luxe.Rectangle](#)<span>=null</span>) : [luxe.Vector](#)</code><br/><span class="small_desc_flat">convert a world point to screen space for this camera. handles zoom, rotation, scale, etc</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;