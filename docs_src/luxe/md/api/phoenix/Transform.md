
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Transform



---

`class`extends <code><span>[luxe.Objects]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="id"><a class="lift" href="#id">id</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="name"><a class="lift" href="#name">name</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen"><a class="lift" href="#listen">listen</a></a><code class="signature apipage">listen(\_handler:<span>[phoenix.Transform-&gt;Void](#phoenix.Transform->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_dirty"><a class="lift" href="#listen_dirty">listen\_dirty</a></a><code class="signature apipage">listen\_dirty(\_handler:<span>[phoenix.Transform-&gt;Void](#phoenix.Transform->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_origin"><a class="lift" href="#listen_origin">listen\_origin</a></a><code class="signature apipage">listen\_origin(\_handler:<span>[phoenix.Vector-&gt;Void](#phoenix.Vector->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_parent"><a class="lift" href="#listen_parent">listen\_parent</a></a><code class="signature apipage">listen\_parent(\_handler:<span>[phoenix.Transform-&gt;Void](#phoenix.Transform->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_pos"><a class="lift" href="#listen_pos">listen\_pos</a></a><code class="signature apipage">listen\_pos(\_handler:<span>[phoenix.Vector-&gt;Void](#phoenix.Vector->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_rotation"><a class="lift" href="#listen_rotation">listen\_rotation</a></a><code class="signature apipage">listen\_rotation(\_handler:<span>[phoenix.Quaternion-&gt;Void](#phoenix.Quaternion->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen_scale"><a class="lift" href="#listen_scale">listen\_scale</a></a><code class="signature apipage">listen\_scale(\_handler:<span>[phoenix.Vector-&gt;Void](#phoenix.Vector->Void)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><a title="inherited from luxe.Objects" class="tooltip inherited">&gt;</a><code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten"><a class="lift" href="#unlisten">unlisten</a></a><code class="signature apipage">unlisten(\_handler:<span>[phoenix.Transform-&gt;Void](#phoenix.Transform->Void)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_dirty"><a class="lift" href="#unlisten_dirty">unlisten\_dirty</a></a><code class="signature apipage">unlisten\_dirty(\_handler:<span>[phoenix.Transform-&gt;Void](#phoenix.Transform->Void)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_origin"><a class="lift" href="#unlisten_origin">unlisten\_origin</a></a><code class="signature apipage">unlisten\_origin(\_handler:<span>[phoenix.Vector-&gt;Void](#phoenix.Vector->Void)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_parent"><a class="lift" href="#unlisten_parent">unlisten\_parent</a></a><code class="signature apipage">unlisten\_parent(\_handler:<span>[phoenix.Transform-&gt;Void](#phoenix.Transform->Void)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_pos"><a class="lift" href="#unlisten_pos">unlisten\_pos</a></a><code class="signature apipage">unlisten\_pos(\_handler:<span>[phoenix.Vector-&gt;Void](#phoenix.Vector->Void)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_rotation"><a class="lift" href="#unlisten_rotation">unlisten\_rotation</a></a><code class="signature apipage">unlisten\_rotation(\_handler:<span>[phoenix.Quaternion-&gt;Void](#phoenix.Quaternion->Void)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unlisten_scale"><a class="lift" href="#unlisten_scale">unlisten\_scale</a></a><code class="signature apipage">unlisten\_scale(\_handler:<span>[phoenix.Vector-&gt;Void](#phoenix.Vector->Void)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="dirty"><a class="lift" href="#dirty">dirty</a></a><code class="signature apipage">dirty : [Bool]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="local"><a class="lift" href="#local">local</a></a><code class="signature apipage">local : [phoenix.Spatial]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="origin"><a class="lift" href="#origin">origin</a></a><code class="signature apipage">origin : [phoenix.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="parent"><a class="lift" href="#parent">parent</a></a><code class="signature apipage">parent : [phoenix.Transform]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="pos"><a class="lift" href="#pos">pos</a></a><code class="signature apipage">pos : [phoenix.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><code class="signature apipage">rotation : [phoenix.Quaternion]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><code class="signature apipage">scale : [phoenix.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="world"><a class="lift" href="#world">world</a></a><code class="signature apipage">world : [phoenix.Spatial]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;