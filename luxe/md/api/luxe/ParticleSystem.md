
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>ParticleSystem</h1>
<small>`luxe.ParticleSystem`</small>



<hr/>

`class`extends <code><span>luxe.Entity</span></code><br/><span class="meta">
meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="children"><a class="lift" href="#children">children</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">children : [Array](http://api.haxe.org/Array.html)&lt;[luxe.Entity](../../api/luxe/Entity.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of children this entity is parenting. Use `child.parent = null;` to remove, or `child.parent = entity;` to assign.</span><br/><span class="member apipage">
                <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">destroyed : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been destroyed</span><br/><span class="member apipage">
                <a name="emitters"><a class="lift" href="#emitters">emitters</a></a><div class="clear"></div>
                <code class="signature apipage">emitters : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.ParticleEmitter](../../api/luxe/ParticleEmitter.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="enabled"><a class="lift" href="#enabled">enabled</a></a><div class="clear"></div>
                <code class="signature apipage">enabled : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](../../api/luxe/Events.html)</code><br/></span>
            <span class="small_desc_flat">A local event system for sending and receiving named events through the entity. Helps communicate between components, and more.</span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the id</span><br/><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been inited yet</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the name</span><br/><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">started : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been started/reset by the scene</span><br/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](../../api/luxe/Transform.html)</code><br/></span>
            <span class="small_desc_flat">The spatial transform of the entity.</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">active : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">if the entity is active in the scene or not. set to inactive to stop scene events propogating into this entity and it's components and children</span><span class="member apipage">
                <a name="components"><a class="lift" href="#components">components</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">components : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.Component](../../api/luxe/Component.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The map of attached components, by name. use .get to find components in children and from other components instead of accessing this unless you need to</span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">fixed\_rate : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">per entity fixed rate timer, if any. if 0 (default) no fixed update is called on this entity.</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local origin of the spatial transform</span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">parent : [luxe.Entity](../../api/luxe/Entity.html)</code><br/></span>
            <span class="small_desc_flat">The parent entity if any, set to null for no parent</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local position of the spatial transform</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](../../api/luxe/Quaternion.html)</code><br/></span>
            <span class="small_desc_flat">The local rotation of the spatial transform</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local scale of the spatial transform</span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](../../api/luxe/Scene.html)</code><br/></span>
            <span class="small_desc_flat">if the entity is in a scene, this is not null</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(\_component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat">attach a component to the entity</span>


</span>
<span class="method apipage">
            <a name="add_emitter"><a class="lift" href="#add_emitter">add\_emitter</a></a><div class="clear"></div>
            <code class="signature apipage">add\_emitter(\_template:[luxe.options.ParticleEmitterOptions](../../api/luxe/options/ParticleEmitterOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy(\_from\_parent:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">destroy this entity. removes it from the scene if any, from the parent etc.</span>


</span>
<span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_in\_children:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat">get a component from the entity, by name</span>


</span>
<span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_in\_children:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>, \_first\_only:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Array](http://api.haxe.org/Array.html)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat">get all component from the entity, by name</span>


</span>
<span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the entity has a component by the given name</span>


</span>
<span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.EntityOptions](../../api/luxe/options/EntityOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">remove a component from the entity</span>


</span>
<span class="method apipage">
            <a name="start"><a class="lift" href="#start">start</a></a><div class="clear"></div>
            <code class="signature apipage">start(duration:[Float](http://api.haxe.org/Float.html)<span>=-1</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><div class="clear"></div>
            <code class="signature apipage">stop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><a title="inherited from luxe.Entity" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;