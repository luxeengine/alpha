
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Entity



---

`class`extends <code><span>[luxe.Objects]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="_destroyed"><a class="lift" href="#_destroyed">\_destroyed</a></a><code class="signature apipage">\_destroyed : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="children"><a class="lift" href="#children">children</a></a><code class="signature apipage">children : [Array](http://api.haxe.org/Array.html)&lt;[luxe.Entity](#luxe.Entity)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="events"><a class="lift" href="#events">events</a></a><code class="signature apipage">events : [luxe.Events](#luxe.Events)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="inited"><a class="lift" href="#inited">inited</a></a><code class="signature apipage">inited : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="serialize"><a class="lift" href="#serialize">serialize</a></a><code class="signature apipage">serialize : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="started"><a class="lift" href="#started">started</a></a><code class="signature apipage">started : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="transform"><a class="lift" href="#transform">transform</a></a><code class="signature apipage">transform : [luxe.Transform](#luxe.Transform)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><code class="signature apipage">add(type:<span>[Class]()&lt;[add.T1]()&gt;</span>, ?\_name:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>, ?\_data:<span>[add.T2]()=null</span>) : [add.T1]()</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><code class="signature apipage">get(\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_in\_children:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [get.T]()</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><code class="signature apipage">get\_any(\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_in\_children:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>, ?\_first\_only:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [Array](http://api.haxe.org/Array.html)&lt;[get_any.T]()&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a><code class="signature apipage">get\_serialize\_data() : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><code class="signature apipage">has(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><code class="signature apipage">new(?\_options:<span>[luxe.options.EntityOptions](#luxe.options.EntityOptions)&lt;[new.T]()&gt;=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><code class="signature apipage">remove(?\_name:<span>[String](http://api.haxe.org/String.html)=&#x27;&#x27;</span>, ?\_data:<span>[remove.T]()=null</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="serialize_to_disk"><a class="lift" href="#serialize_to_disk">serialize\_to\_disk</a></a><code class="signature apipage">serialize\_to\_disk(\_destination\_path:<span>[String](http://api.haxe.org/String.html)</span>, ?\_parent\_write:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="active"><a class="lift" href="#active">active</a></a><code class="signature apipage">active : [Bool]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="components"><a class="lift" href="#components">components</a></a><code class="signature apipage">components : [Map]()&lt;[String](), [luxe.Component]()&gt;</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><code class="signature apipage">fixed\_rate : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="origin"><a class="lift" href="#origin">origin</a></a><code class="signature apipage">origin : [luxe.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="parent"><a class="lift" href="#parent">parent</a></a><code class="signature apipage">parent : [luxe.Entity]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="pos"><a class="lift" href="#pos">pos</a></a><code class="signature apipage">pos : [luxe.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><code class="signature apipage">rotation : [luxe.Quaternion]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><code class="signature apipage">scale : [luxe.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="scene"><a class="lift" href="#scene">scene</a></a><code class="signature apipage">scene : [luxe.Scene]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;