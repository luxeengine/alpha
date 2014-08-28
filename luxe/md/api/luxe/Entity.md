
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Entity</h1>
<small>`luxe.Entity`</small>



---

`class`extends <code><span>luxe.Objects</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><div class="clear"></div><code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="children"><a class="lift" href="#children">children</a></a><div class="clear"></div><code class="signature apipage">children : [Array](#)&lt;[luxe.Entity](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="_destroyed"><a class="lift" href="#_destroyed">\_destroyed</a></a><div class="clear"></div><code class="signature apipage">\_destroyed : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><div class="clear"></div><code class="signature apipage">inited : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><div class="clear"></div><code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="serialize"><a class="lift" href="#serialize">serialize</a></a><div class="clear"></div><code class="signature apipage">serialize : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div><code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="components"><a class="lift" href="#components">components</a></a> <div class="clear"></div><code class="signature apipage">components : [Map](#)&lt;[String](#), [luxe.Component](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a> <div class="clear"></div><code class="signature apipage">fixed\_rate : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a> <div class="clear"></div><code class="signature apipage">parent : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a> <div class="clear"></div><code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a> <div class="clear"></div><code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a> <div class="clear"></div><code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a> <div class="clear"></div><code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a> <div class="clear"></div><code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a> <div class="clear"></div><code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy(\_from\_parent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a> <div class="clear"></div><code class="signature apipage">add(type:[Class](#)&lt;[add.T1](#)&gt;<span></span>, \_name:[String](#)<span>=&#x27;&#x27;</span>, \_data:[add.T2](#)<span>=null</span>) : [add.T1](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a> <div class="clear"></div><code class="signature apipage">remove(\_name:[String](#)<span>=&#x27;&#x27;</span>, \_data:[remove.T](#)<span>=null</span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a> <div class="clear"></div><code class="signature apipage">get(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a> <div class="clear"></div><code class="signature apipage">get\_any(\_name:[String](#)<span></span>, \_in\_children:[Bool](#)<span>=false</span>, \_first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a> <div class="clear"></div><code class="signature apipage">has(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a> <div class="clear"></div><code class="signature apipage">get\_serialize\_data() : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="serialize_to_disk"><a class="lift" href="#serialize_to_disk">serialize\_to\_disk</a></a> <div class="clear"></div><code class="signature apipage">serialize\_to\_disk(\_destination\_path:[String](#)<span></span>, \_parent\_write:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_options:[luxe.options.EntityOptions](#)&lt;[new.T](#)&gt;<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;