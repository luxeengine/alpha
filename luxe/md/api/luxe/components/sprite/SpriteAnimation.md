
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---


<h1>SpriteAnimation</h1>
<small>`luxe.components.sprite.SpriteAnimation`</small>



<hr/>

`class`extends <code><span>luxe.Component</span></code><br/><span class="meta">
meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="animation_list"><a class="lift" href="#animation_list">animation\_list</a></a><div class="clear"></div>
                <code class="signature apipage">animation\_list : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.components.sprite.SpriteAnimationData](../../../../api/luxe/components/sprite/SpriteAnimationData.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="current"><a class="lift" href="#current">current</a></a><div class="clear"></div>
                <code class="signature apipage">current : [luxe.components.sprite.SpriteAnimationData](../../../../api/luxe/components/sprite/SpriteAnimationData.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="current_frame"><a class="lift" href="#current_frame">current\_frame</a></a><div class="clear"></div>
                <code class="signature apipage">current\_frame : [luxe.components.sprite.SpriteAnimationFrame](../../../../api/luxe/components/sprite/SpriteAnimationFrame.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="frame"><a class="lift" href="#frame">frame</a></a><div class="clear"></div>
                <code class="signature apipage">frame : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="frame_time"><a class="lift" href="#frame_time">frame\_time</a></a><div class="clear"></div>
                <code class="signature apipage">frame\_time : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="image_frame"><a class="lift" href="#image_frame">image\_frame</a></a><div class="clear"></div>
                <code class="signature apipage">image\_frame : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="loop"><a class="lift" href="#loop">loop</a></a><div class="clear"></div>
                <code class="signature apipage">loop : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pingpong"><a class="lift" href="#pingpong">pingpong</a></a><div class="clear"></div>
                <code class="signature apipage">pingpong : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="playing"><a class="lift" href="#playing">playing</a></a><div class="clear"></div>
                <code class="signature apipage">playing : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="reverse"><a class="lift" href="#reverse">reverse</a></a><div class="clear"></div>
                <code class="signature apipage">reverse : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](../../../../api/luxe/Transform.html)</code><br/></span>
            <span class="small_desc_flat">The spatial transform of the attached entity. direct proxy to the entity transform</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="animation"><a class="lift" href="#animation">animation</a></a><div class="clear"></div>
                <code class="signature apipage">animation : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="entity"><a class="lift" href="#entity">entity</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">entity : [luxe.Entity](../../../../api/luxe/Entity.html)</code><br/></span>
            <span class="small_desc_flat">the entity this component is attached to</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](../../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local origin of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local position of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](../../../../api/luxe/Quaternion.html)</code><br/></span>
            <span class="small_desc_flat">The local rotation of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](../../../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local scale of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="speed"><a class="lift" href="#speed">speed</a></a><div class="clear"></div>
                <code class="signature apipage">speed : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat">attach a component to the entity</span>


</span>
<span class="method apipage">
            <a name="add_event"><a class="lift" href="#add_event">add\_event</a></a><div class="clear"></div>
            <code class="signature apipage">add\_event(\_animation:[String](http://api.haxe.org/String.html)<span></span>, \_image\_frame:[Int](http://api.haxe.org/Int.html)<span></span>, \_event:[String](http://api.haxe.org/String.html)<span>=&#x27;&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_from_json"><a class="lift" href="#add_from_json">add\_from\_json</a></a><div class="clear"></div>
            <code class="signature apipage">add\_from\_json(\_json\_string:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_from_json_object"><a class="lift" href="#add_from_json_object">add\_from\_json\_object</a></a><div class="clear"></div>
            <code class="signature apipage">add\_from\_json\_object(\_json\_object:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](http://api.haxe.org/String.html)<span></span>, in\_children:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat">get a component from the entity, by name</span>


</span>
<span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](http://api.haxe.org/String.html)<span></span>, in\_children:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>, first\_only:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Array](http://api.haxe.org/Array.html)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat">get all component from the entity, by name</span>


</span>
<span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the entity has a component by the given name</span>


</span>
<span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.ComponentOptions](../../../../api/luxe/options/ComponentOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onadded"><a class="lift" href="#onadded">onadded</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onadded() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">called when the component is attached to an entity</span>


</span>
<span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onremoved"><a class="lift" href="#onremoved">onremoved</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onremoved() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><div class="clear"></div>
            <code class="signature apipage">play() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">remove a component from the entity</span>


</span>
<span class="method apipage">
            <a name="remove_event"><a class="lift" href="#remove_event">remove\_event</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_event(\_animation:[String](http://api.haxe.org/String.html)<span></span>, \_image\_frame:[Int](http://api.haxe.org/Int.html)<span></span>, \_event:[String](http://api.haxe.org/String.html)<span>=&#x27;&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove_events"><a class="lift" href="#remove_events">remove\_events</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_events(\_animation:[String](http://api.haxe.org/String.html)<span></span>, \_image\_frame:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="restart"><a class="lift" href="#restart">restart</a></a><div class="clear"></div>
            <code class="signature apipage">restart() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_frame"><a class="lift" href="#set_frame">set\_frame</a></a><div class="clear"></div>
            <code class="signature apipage">set\_frame(\_frame:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><div class="clear"></div>
            <code class="signature apipage">stop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;