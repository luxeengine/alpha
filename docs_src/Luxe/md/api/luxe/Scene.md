
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Scene</h1>
<small>`luxe.Scene`</small>



---

`class`extends <code><span>luxe.Objects</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="entities"><a class="lift" href="#entities">entities</a></a><code class="signature apipage">entities : [Map](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><code class="signature apipage">inited : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="entitycount"><a class="lift" href="#entitycount">entitycount</a></a><code class="signature apipage">entitycount : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : String</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><code class="signature apipage">create(type:Class<span></span>, \_name:String<span>=&#x27;&#x27;</span>, \_data:luxe.options.EntityOptions<span>=null</span>) : create.T1</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><code class="signature apipage">add(entity:luxe.Entity<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><code class="signature apipage">remove(entity:luxe.Entity<span></span>) : Bool</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="empty"><a class="lift" href="#empty">empty</a></a><code class="signature apipage">empty() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><code class="signature apipage">onkeydown(e:luxe.KeyEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><code class="signature apipage">onkeyup(e:luxe.KeyEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><code class="signature apipage">onmousedown(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><code class="signature apipage">onmousewheel(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><code class="signature apipage">onmouseup(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><code class="signature apipage">onmousemove(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchbegin"><a class="lift" href="#ontouchbegin">ontouchbegin</a></a><code class="signature apipage">ontouchbegin(e:luxe.TouchEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchend"><a class="lift" href="#ontouchend">ontouchend</a></a><code class="signature apipage">ontouchend(e:luxe.TouchEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><code class="signature apipage">ontouchmove(e:luxe.TouchEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><code class="signature apipage">ongamepadaxis(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadball"><a class="lift" href="#ongamepadball">ongamepadball</a></a><code class="signature apipage">ongamepadball(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadhat"><a class="lift" href="#ongamepadhat">ongamepadhat</a></a><code class="signature apipage">ongamepadhat(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttonup"><a class="lift" href="#ongamepadbuttonup">ongamepadbuttonup</a></a><code class="signature apipage">ongamepadbuttonup(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttondown"><a class="lift" href="#ongamepadbuttondown">ongamepadbuttondown</a></a><code class="signature apipage">ongamepadbuttondown(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a><code class="signature apipage">oninputdown(\_name:String<span></span>, e:luxe.InputEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a><code class="signature apipage">oninputup(\_name:String<span></span>, e:luxe.InputEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><code class="signature apipage">init() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><code class="signature apipage">reset() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><code class="signature apipage">update(dt:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="fixed_update"><a class="lift" href="#fixed_update">fixed\_update</a></a><code class="signature apipage">fixed\_update() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="serialize_to_disk"><a class="lift" href="#serialize_to_disk">serialize\_to\_disk</a></a><code class="signature apipage">serialize\_to\_disk(\_destination\_path:String<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;