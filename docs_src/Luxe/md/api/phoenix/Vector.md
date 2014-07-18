
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Vector</h1>
<small>`phoenix.Vector`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="w"><a class="lift" href="#w">w</a></a><code class="signature apipage">w : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="ignore_listeners"><a class="lift" href="#ignore_listeners">ignore\_listeners</a></a><code class="signature apipage">ignore\_listeners : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="listen_x"><a class="lift" href="#listen_x">listen\_x</a></a><code class="signature apipage">listen\_x : Float-&gt;Void</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="listen_y"><a class="lift" href="#listen_y">listen\_y</a></a><code class="signature apipage">listen\_y : Float-&gt;Void</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="listen_z"><a class="lift" href="#listen_z">listen\_z</a></a><code class="signature apipage">listen\_z : Float-&gt;Void</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><code class="signature apipage">x : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><code class="signature apipage">y : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="z"><a class="lift" href="#z">z</a></a><code class="signature apipage">z : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="length"><a class="lift" href="#length">length</a></a><code class="signature apipage">length : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="lengthsq"><a class="lift" href="#lengthsq">lengthsq</a></a><code class="signature apipage">lengthsq : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="angle2D"><a class="lift" href="#angle2D">angle2D</a></a><code class="signature apipage">angle2D : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="normalized"><a class="lift" href="#normalized">normalized</a></a><code class="signature apipage">normalized : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inverted"><a class="lift" href="#inverted">inverted</a></a><code class="signature apipage">inverted : [phoenix.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="serialized"><a class="lift" href="#serialized">serialized</a></a><code class="signature apipage">serialized : [](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="copy_from"><a class="lift" href="#copy_from">copy\_from</a></a><code class="signature apipage">copy\_from(\_other:phoenix.Vector<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_xyz"><a class="lift" href="#set_xyz">set\_xyz</a></a><code class="signature apipage">set\_xyz(\_x:Float<span></span>, \_y:Float<span></span>, \_z:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_xyzw"><a class="lift" href="#set_xyzw">set\_xyzw</a></a><code class="signature apipage">set\_xyzw(\_x:Float<span></span>, \_y:Float<span></span>, \_z:Float<span></span>, \_w:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_xy"><a class="lift" href="#set_xy">set\_xy</a></a><code class="signature apipage">set\_xy(\_x:Float<span></span>, \_y:Float<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><code class="signature apipage">set(\_x:Float<span>=null</span>, \_y:Float<span>=null</span>, \_z:Float<span>=null</span>, \_w:Float<span>=null</span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : String</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="equals"><a class="lift" href="#equals">equals</a></a><code class="signature apipage">equals(other:phoenix.Vector<span></span>) : Bool</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><code class="signature apipage">clone() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="normalize"><a class="lift" href="#normalize">normalize</a></a><code class="signature apipage">normalize() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dot"><a class="lift" href="#dot">dot</a></a><code class="signature apipage">dot(other:phoenix.Vector<span></span>) : Float</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="cross"><a class="lift" href="#cross">cross</a></a><code class="signature apipage">cross(a:phoenix.Vector<span></span>, b:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="invert"><a class="lift" href="#invert">invert</a></a><code class="signature apipage">invert() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><code class="signature apipage">add(other:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="subtract"><a class="lift" href="#subtract">subtract</a></a><code class="signature apipage">subtract(other:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><code class="signature apipage">multiply(other:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="divide"><a class="lift" href="#divide">divide</a></a><code class="signature apipage">divide(other:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="addScalar"><a class="lift" href="#addScalar">addScalar</a></a><code class="signature apipage">addScalar(v:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="subtractScalar"><a class="lift" href="#subtractScalar">subtractScalar</a></a><code class="signature apipage">subtractScalar(v:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyScalar"><a class="lift" href="#multiplyScalar">multiplyScalar</a></a><code class="signature apipage">multiplyScalar(v:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="divideScalar"><a class="lift" href="#divideScalar">divideScalar</a></a><code class="signature apipage">divideScalar(v:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="truncate"><a class="lift" href="#truncate">truncate</a></a><code class="signature apipage">truncate(max:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="rotationTo"><a class="lift" href="#rotationTo">rotationTo</a></a><code class="signature apipage">rotationTo(other:phoenix.Vector<span></span>) : Float</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="applyQuaternion"><a class="lift" href="#applyQuaternion">applyQuaternion</a></a><code class="signature apipage">applyQuaternion(q:phoenix.Quaternion<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="applyProjection"><a class="lift" href="#applyProjection">applyProjection</a></a><code class="signature apipage">applyProjection(m:phoenix.Matrix<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="transform"><a class="lift" href="#transform">transform</a></a><code class="signature apipage">transform(\_m:phoenix.Matrix<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="transformDirection"><a class="lift" href="#transformDirection">transformDirection</a></a><code class="signature apipage">transformDirection(m:phoenix.Matrix<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setEulerFromRotationMatrix"><a class="lift" href="#setEulerFromRotationMatrix">setEulerFromRotationMatrix</a></a><code class="signature apipage">setEulerFromRotationMatrix(m:phoenix.Matrix<span></span>, order:String<span>=&#x27;XYZ&#x27;</span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setEulerFromQuaternion"><a class="lift" href="#setEulerFromQuaternion">setEulerFromQuaternion</a></a><code class="signature apipage">setEulerFromQuaternion(q:phoenix.Quaternion<span></span>, order:String<span>=&#x27;XYZ&#x27;</span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="degrees"><a class="lift" href="#degrees">degrees</a></a><code class="signature apipage">degrees() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="radians"><a class="lift" href="#radians">radians</a></a><code class="signature apipage">radians() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_x:Float<span>=0</span>, \_y:Float<span>=0</span>, \_z:Float<span>=0</span>, \_w:Float<span>=0</span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Add"><a class="lift" href="#Add">Add</a></a><span class="inline-block static">static</span><code class="signature apipage">Add(a:phoenix.Vector<span></span>, b:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Subtract"><a class="lift" href="#Subtract">Subtract</a></a><span class="inline-block static">static</span><code class="signature apipage">Subtract(a:phoenix.Vector<span></span>, b:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="MultiplyVector"><a class="lift" href="#MultiplyVector">MultiplyVector</a></a><span class="inline-block static">static</span><code class="signature apipage">MultiplyVector(a:phoenix.Vector<span></span>, b:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="DivideVector"><a class="lift" href="#DivideVector">DivideVector</a></a><span class="inline-block static">static</span><code class="signature apipage">DivideVector(a:phoenix.Vector<span></span>, b:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Multiply"><a class="lift" href="#Multiply">Multiply</a></a><span class="inline-block static">static</span><code class="signature apipage">Multiply(a:phoenix.Vector<span></span>, b:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Divide"><a class="lift" href="#Divide">Divide</a></a><span class="inline-block static">static</span><code class="signature apipage">Divide(a:phoenix.Vector<span></span>, b:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="AddScalar"><a class="lift" href="#AddScalar">AddScalar</a></a><span class="inline-block static">static</span><code class="signature apipage">AddScalar(a:phoenix.Vector<span></span>, b:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="SubtractScalar"><a class="lift" href="#SubtractScalar">SubtractScalar</a></a><span class="inline-block static">static</span><code class="signature apipage">SubtractScalar(a:phoenix.Vector<span></span>, b:Float<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Cross"><a class="lift" href="#Cross">Cross</a></a><span class="inline-block static">static</span><code class="signature apipage">Cross(a:phoenix.Vector<span></span>, b:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="RotationTo"><a class="lift" href="#RotationTo">RotationTo</a></a><span class="inline-block static">static</span><code class="signature apipage">RotationTo(a:phoenix.Vector<span></span>, b:phoenix.Vector<span></span>) : Float</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen"><a class="lift" href="#listen">listen</a></a><span class="inline-block static">static</span><code class="signature apipage">listen(\_v:phoenix.Vector<span></span>, listener:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Degrees"><a class="lift" href="#Degrees">Degrees</a></a><span class="inline-block static">static</span><code class="signature apipage">Degrees(\_radian\_vector:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Radians"><a class="lift" href="#Radians">Radians</a></a><span class="inline-block static">static</span><code class="signature apipage">Radians(\_degree\_vector:phoenix.Vector<span></span>) : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;