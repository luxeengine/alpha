
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Entity</h1>
<small>`luxe.Entity`</small>



---

`class`extends <code><span>luxe.Objects</span></code>
<span class="meta">
<br/>meta: @:keep, @:autoBuild(&#x27;???&#x27;)
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="children"><a class="lift" href="#children">children</a></a><div class="clear"></div>
                <code class="signature apipage">children : [Array](#)&lt;[luxe.Entity](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a><div class="clear"></div>
                <code class="signature apipage">destroyed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">id : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><div class="clear"></div>
                <code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><div class="clear"></div>
                <code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="components"><a class="lift" href="#components">components</a></a><div class="clear"></div>
                <code class="signature apipage">components : [Map](#)&lt;[String](#), [luxe.Component](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><div class="clear"></div>
                <code class="signature apipage">fixed\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><div class="clear"></div>
                <code class="signature apipage">parent : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(\_component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy(\_from\_parent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>, \_first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.EntityOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;