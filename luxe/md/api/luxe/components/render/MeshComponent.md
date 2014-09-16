
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>MeshComponent</h1>
<small>`luxe.components.render.MeshComponent`</small>



---

`class`extends <code><span>luxe.Component</span></code>
<span class="meta">
<br/>meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div>
                <code class="signature apipage">batcher : [phoenix.Batcher](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="file"><a class="lift" href="#file">file</a></a><div class="clear"></div>
                <code class="signature apipage">file : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="mesh"><a class="lift" href="#mesh">mesh</a></a><div class="clear"></div>
                <code class="signature apipage">mesh : [luxe.Mesh](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="entity"><a class="lift" href="#entity">entity</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">entity : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="entity_pos_change"><a class="lift" href="#entity_pos_change">entity\_pos\_change</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">entity\_pos\_change(\_pos:[luxe.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="entity_rotation_change"><a class="lift" href="#entity_rotation_change">entity\_rotation\_change</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">entity\_rotation\_change(\_rotation:[luxe.Quaternion](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="entity_scale_change"><a class="lift" href="#entity_scale_change">entity\_scale\_change</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">entity\_scale\_change(\_scale:[luxe.Vector](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](#)<span></span>, in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](#)<span></span>, in\_children:[Bool](#)<span>=false</span>, first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.ComponentOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onadded"><a class="lift" href="#onadded">onadded</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onadded() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onfixedupdate"><a class="lift" href="#onfixedupdate">onfixedupdate</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onfixedupdate() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ongamepadaxis(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ongamepaddevice(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddown"><a class="lift" href="#ongamepaddown">ongamepaddown</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ongamepaddown(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadup"><a class="lift" href="#ongamepadup">ongamepadup</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ongamepadup(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeydown(event:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeyup(event:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousedown(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousemove(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmouseup(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onremoved"><a class="lift" href="#onremoved">onremoved</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onremoved() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onreset"><a class="lift" href="#onreset">onreset</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onreset() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ontouchdown(event:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ontouchmove(event:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ontouchup(event:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;