
[![Logo](../../images/logo.png)](../../api/index.html)

---



#DualQuaternion



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="dual"><a class="lift" href="#dual">dual</a></a><code class="signature apipage">dual : [phoenix.Quaternion](#phoenix.Quaternion)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="real"><a class="lift" href="#real">real</a></a><code class="signature apipage">real : [phoenix.Quaternion](#phoenix.Quaternion)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="Add"><a class="lift" href="#Add">Add</a></a><span class="inline-block static">static</span><code class="signature apipage">Add(\_a:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>, \_b:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><code class="signature apipage">clone() : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Conjugate"><a class="lift" href="#Conjugate">Conjugate</a></a><span class="inline-block static">static</span><code class="signature apipage">Conjugate(\_q:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="conjugate"><a class="lift" href="#conjugate">conjugate</a></a><code class="signature apipage">conjugate() : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Dot"><a class="lift" href="#Dot">Dot</a></a><span class="inline-block static">static</span><code class="signature apipage">Dot(\_a:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>, \_b:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dot"><a class="lift" href="#dot">dot</a></a><code class="signature apipage">dot(\_other:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="GetRotation"><a class="lift" href="#GetRotation">GetRotation</a></a><span class="inline-block static">static</span><code class="signature apipage">GetRotation(\_q:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.Quaternion](#phoenix.Quaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="GetTranslation"><a class="lift" href="#GetTranslation">GetTranslation</a></a><span class="inline-block static">static</span><code class="signature apipage">GetTranslation(\_q:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Multiply"><a class="lift" href="#Multiply">Multiply</a></a><span class="inline-block static">static</span><code class="signature apipage">Multiply(\_a:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>, \_b:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><code class="signature apipage">multiply(\_other:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Normalize"><a class="lift" href="#Normalize">Normalize</a></a><span class="inline-block static">static</span><code class="signature apipage">Normalize(\_dq:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="normalize"><a class="lift" href="#normalize">normalize</a></a><code class="signature apipage">normalize() : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><code class="signature apipage">scale(\_scale:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><code class="signature apipage">set(\_real:<span>[phoenix.Quaternion](#phoenix.Quaternion)</span>, \_dual:<span>[phoenix.Quaternion](#phoenix.Quaternion)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setFromTranslationRotation"><a class="lift" href="#setFromTranslationRotation">setFromTranslationRotation</a></a><code class="signature apipage">setFromTranslationRotation(\_translation:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_rotation:<span>[phoenix.Quaternion](#phoenix.Quaternion)</span>) : [phoenix.DualQuaternion](#phoenix.DualQuaternion)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ToMatrix"><a class="lift" href="#ToMatrix">ToMatrix</a></a><span class="inline-block static">static</span><code class="signature apipage">ToMatrix(\_dq:<span>[phoenix.DualQuaternion](#phoenix.DualQuaternion)</span>) : [phoenix.Matrix4](#phoenix.Matrix4)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><code class="signature apipage">rotation : [phoenix.Quaternion]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="translation"><a class="lift" href="#translation">translation</a></a><code class="signature apipage">translation : [phoenix.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;