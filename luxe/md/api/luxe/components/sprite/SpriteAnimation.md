
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>SpriteAnimation</h1>
<small>`luxe.components.sprite.SpriteAnimation`</small>



---

`class`extends <code><span>luxe.Component</span></code>
<span class="meta">
<br/>meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="animation_list"><a class="lift" href="#animation_list">animation\_list</a></a><div class="clear"></div>
                <code class="signature apipage">animation\_list : [Map](#)&lt;[String](#), [luxe.components.sprite.SpriteAnimationData](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current"><a class="lift" href="#current">current</a></a><div class="clear"></div>
                <code class="signature apipage">current : [luxe.components.sprite.SpriteAnimationData](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current_frame"><a class="lift" href="#current_frame">current\_frame</a></a><div class="clear"></div>
                <code class="signature apipage">current\_frame : [luxe.components.sprite.SpriteAnimationFrame](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame"><a class="lift" href="#frame">frame</a></a><div class="clear"></div>
                <code class="signature apipage">frame : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_time"><a class="lift" href="#frame_time">frame\_time</a></a><div class="clear"></div>
                <code class="signature apipage">frame\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="image_frame"><a class="lift" href="#image_frame">image\_frame</a></a><div class="clear"></div>
                <code class="signature apipage">image\_frame : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="loop"><a class="lift" href="#loop">loop</a></a><div class="clear"></div>
                <code class="signature apipage">loop : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pingpong"><a class="lift" href="#pingpong">pingpong</a></a><div class="clear"></div>
                <code class="signature apipage">pingpong : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="playing"><a class="lift" href="#playing">playing</a></a><div class="clear"></div>
                <code class="signature apipage">playing : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="reverse"><a class="lift" href="#reverse">reverse</a></a><div class="clear"></div>
                <code class="signature apipage">reverse : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat">The spatial transform of the attached entity. direct proxy to the entity transform</span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="animation"><a class="lift" href="#animation">animation</a></a><div class="clear"></div>
                <code class="signature apipage">animation : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="entity"><a class="lift" href="#entity">entity</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">entity : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat">the entity this component is attached to</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local origin of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local position of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat">The local rotation of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local scale of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="speed"><a class="lift" href="#speed">speed</a></a><div class="clear"></div>
                <code class="signature apipage">speed : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat">attach a component to the entity</span>
        </span>
    <span class="method apipage">
            <a name="add_event"><a class="lift" href="#add_event">add\_event</a></a><div class="clear"></div>
            <code class="signature apipage">add\_event(\_animation:[String](#)<span></span>, \_image\_frame:[Int](#)<span></span>, \_event:[String](#)<span>=&#x27;&#x27;</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_from_json"><a class="lift" href="#add_from_json">add\_from\_json</a></a><div class="clear"></div>
            <code class="signature apipage">add\_from\_json(\_json\_string:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_from_json_object"><a class="lift" href="#add_from_json_object">add\_from\_json\_object</a></a><div class="clear"></div>
            <code class="signature apipage">add\_from\_json\_object(\_json\_object:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](#)<span></span>, in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat">get a component from the entity, by name</span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](#)<span></span>, in\_children:[Bool](#)<span>=false</span>, first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat">get all component from the entity, by name</span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">returns true if the entity has a component by the given name</span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.ComponentOptions](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onadded"><a class="lift" href="#onadded">onadded</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onadded() : [Void](#)</code><br/><span class="small_desc_flat">called when the component is attached to an entity</span>
        </span>
    <span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onremoved"><a class="lift" href="#onremoved">onremoved</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onremoved() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><div class="clear"></div>
            <code class="signature apipage">play() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a title="inherited from luxe.Component" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">remove a component from the entity</span>
        </span>
    <span class="method apipage">
            <a name="remove_event"><a class="lift" href="#remove_event">remove\_event</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_event(\_animation:[String](#)<span></span>, \_image\_frame:[Int](#)<span></span>, \_event:[String](#)<span>=&#x27;&#x27;</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_events"><a class="lift" href="#remove_events">remove\_events</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_events(\_animation:[String](#)<span></span>, \_image\_frame:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="restart"><a class="lift" href="#restart">restart</a></a><div class="clear"></div>
            <code class="signature apipage">restart() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_frame"><a class="lift" href="#set_frame">set\_frame</a></a><div class="clear"></div>
            <code class="signature apipage">set\_frame(\_frame:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><div class="clear"></div>
            <code class="signature apipage">stop() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;