
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>Scene</h1>
<small>`luxe.Scene`</small>



<hr/>

`class`extends <code><span>luxe.Objects</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="entities"><a class="lift" href="#entities">entities</a></a><div class="clear"></div>
                <code class="signature apipage">entities : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.Entity](../../api/luxe/Entity.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the id</span><br/><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the name</span><br/><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><div class="clear"></div>
                <code class="signature apipage">started : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="length"><a class="lift" href="#length">length</a></a><div class="clear"></div>
                <code class="signature apipage">length : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add(entity:[luxe.Entity](../../api/luxe/Entity.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">add given entity to this scene</span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="empty"><a class="lift" href="#empty">empty</a></a><div class="clear"></div>
            <code class="signature apipage">empty() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">destroy all entities in this scene, emptying it.</span>


</span>
<span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><div class="clear"></div>
            <code class="signature apipage">init(\_:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_name:[String](http://api.haxe.org/String.html)<span>=&#x27;untitled scene&#x27;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><div class="clear"></div>
            <code class="signature apipage">remove(entity:[luxe.Entity](../../api/luxe/Entity.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">removes given entity from this scene</span>


</span>
<span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">reset this scene, allowing all entities, children and attached components to be notified of the reset</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;