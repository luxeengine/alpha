
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Scene</h1>
<small>`luxe.Scene`</small>



---

`class`extends <code><span>luxe.Objects</span></code>
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="entities"><a class="lift" href="#entities">entities</a></a><div class="clear"></div>
                <code class="signature apipage">entities : [Map](#)&lt;[String](#), [luxe.Entity](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">id : [String](#)</code><br/></span>
            <span class="small_desc_flat">the id</span><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat">the name</span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><div class="clear"></div>
                <code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="length"><a class="lift" href="#length">length</a></a><div class="clear"></div>
                <code class="signature apipage">length : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add(entity:[luxe.Entity](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">add given entity to this scene</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="empty"><a class="lift" href="#empty">empty</a></a><div class="clear"></div>
            <code class="signature apipage">empty() : [Void](#)</code><br/><span class="small_desc_flat">destroy all entities in this scene, emptying it.</span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><div class="clear"></div>
            <code class="signature apipage">init(\_:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_name:[String](#)<span>=&#x27;untitled scene&#x27;</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><div class="clear"></div>
            <code class="signature apipage">remove(entity:[luxe.Entity](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">removes given entity from this scene</span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](#)</code><br/><span class="small_desc_flat">reset this scene, allowing all entities, children and attached components to be notified of the reset</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;