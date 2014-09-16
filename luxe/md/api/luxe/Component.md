
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Component</h1>
<small>`luxe.Component`</small>



---

`class`extends <code><span>luxe.ID</span></code>
<span class="meta">
<br/>meta: @:keep, @:autoBuild(&#x27;???&#x27;)
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](#)</code><br/></span>
            <span class="small_desc_flat">The spatial transform of the attached entity. direct proxy to the entity transform</span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="entity"><a class="lift" href="#entity">entity</a></a><div class="clear"></div>
                <code class="signature apipage">entity : [luxe.Entity](#)</code><br/></span>
            <span class="small_desc_flat">the entity this component is attached to</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local origin of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local position of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat">The local rotation of the spatial transform. direct proxy to the entity transform</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The local scale of the spatial transform. direct proxy to the entity transform</span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat">attach a component to the entity</span>
        </span>
    <span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](#)<span></span>, in\_children:[Bool](#)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat">get a component from the entity, by name</span>
        </span>
    <span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](#)<span></span>, in\_children:[Bool](#)<span>=false</span>, first\_only:[Bool](#)<span>=true</span>) : [Array](#)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat">get all component from the entity, by name</span>
        </span>
    <span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">returns true if the entity has a component by the given name</span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat">called when the scene is initiated. **use this instead of new** for state setup. it respects the order of creations, children, and component ordering.</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.ComponentOptions](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat">Use this to pass instance specific data and values to the component.</span>
        </span>
    <span class="method apipage">
            <a name="onadded"><a class="lift" href="#onadded">onadded</a></a><div class="clear"></div>
            <code class="signature apipage">onadded() : [Void](#)</code><br/><span class="small_desc_flat">called when the component is attached to an entity</span>
        </span>
    <span class="method apipage">
            <a name="onremoved"><a class="lift" href="#onremoved">onremoved</a></a><div class="clear"></div>
            <code class="signature apipage">onremoved() : [Void](#)</code><br/><span class="small_desc_flat">called when the component is removed from an entity</span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">remove a component from the entity</span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">called once per frame, passing the delta time</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;