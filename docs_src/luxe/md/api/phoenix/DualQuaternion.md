
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>DualQuaternion</h1>
<small>`phoenix.DualQuaternion`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="real"><a class="lift" href="#real">real</a></a><div class="clear"></div><code class="signature apipage">real : [phoenix.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dual"><a class="lift" href="#dual">dual</a></a><div class="clear"></div><code class="signature apipage">dual : [phoenix.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div><code class="signature apipage">rotation : [phoenix.Quaternion](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="translation"><a class="lift" href="#translation">translation</a></a><div class="clear"></div><code class="signature apipage">translation : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a> <div class="clear"></div><code class="signature apipage">set(\_real:[phoenix.Quaternion](#)<span></span>, \_dual:[phoenix.Quaternion](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a> <div class="clear"></div><code class="signature apipage">clone() : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setFromTranslationRotation"><a class="lift" href="#setFromTranslationRotation">setFromTranslationRotation</a></a> <div class="clear"></div><code class="signature apipage">setFromTranslationRotation(\_translation:[phoenix.Vector](#)<span></span>, \_rotation:[phoenix.Quaternion](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dot"><a class="lift" href="#dot">dot</a></a> <div class="clear"></div><code class="signature apipage">dot(\_other:[phoenix.DualQuaternion](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="normalize"><a class="lift" href="#normalize">normalize</a></a> <div class="clear"></div><code class="signature apipage">normalize() : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a> <div class="clear"></div><code class="signature apipage">scale(\_scale:[Float](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="conjugate"><a class="lift" href="#conjugate">conjugate</a></a> <div class="clear"></div><code class="signature apipage">conjugate() : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a> <div class="clear"></div><code class="signature apipage">multiply(\_other:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ToMatrix"><a class="lift" href="#ToMatrix">ToMatrix</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">ToMatrix(\_dq:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.Matrix](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Dot"><a class="lift" href="#Dot">Dot</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">Dot(\_a:[phoenix.DualQuaternion](#)<span></span>, \_b:[phoenix.DualQuaternion](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Normalize"><a class="lift" href="#Normalize">Normalize</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">Normalize(\_dq:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Add"><a class="lift" href="#Add">Add</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">Add(\_a:[phoenix.DualQuaternion](#)<span></span>, \_b:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Multiply"><a class="lift" href="#Multiply">Multiply</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">Multiply(\_a:[phoenix.DualQuaternion](#)<span></span>, \_b:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Conjugate"><a class="lift" href="#Conjugate">Conjugate</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">Conjugate(\_q:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.DualQuaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="GetRotation"><a class="lift" href="#GetRotation">GetRotation</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">GetRotation(\_q:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="GetTranslation"><a class="lift" href="#GetTranslation">GetTranslation</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">GetTranslation(\_q:[phoenix.DualQuaternion](#)<span></span>) : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;