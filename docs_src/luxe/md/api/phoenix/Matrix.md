
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Matrix</h1>
<small>`phoenix.Matrix`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="elements"><a class="lift" href="#elements">elements</a></a><code class="signature apipage">elements : [Array](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="M11"><a class="lift" href="#M11">M11</a></a><code class="signature apipage">M11 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M21"><a class="lift" href="#M21">M21</a></a><code class="signature apipage">M21 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M31"><a class="lift" href="#M31">M31</a></a><code class="signature apipage">M31 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M41"><a class="lift" href="#M41">M41</a></a><code class="signature apipage">M41 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M12"><a class="lift" href="#M12">M12</a></a><code class="signature apipage">M12 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M22"><a class="lift" href="#M22">M22</a></a><code class="signature apipage">M22 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M32"><a class="lift" href="#M32">M32</a></a><code class="signature apipage">M32 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M42"><a class="lift" href="#M42">M42</a></a><code class="signature apipage">M42 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M13"><a class="lift" href="#M13">M13</a></a><code class="signature apipage">M13 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M23"><a class="lift" href="#M23">M23</a></a><code class="signature apipage">M23 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M33"><a class="lift" href="#M33">M33</a></a><code class="signature apipage">M33 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M43"><a class="lift" href="#M43">M43</a></a><code class="signature apipage">M43 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M14"><a class="lift" href="#M14">M14</a></a><code class="signature apipage">M14 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M24"><a class="lift" href="#M24">M24</a></a><code class="signature apipage">M24 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M34"><a class="lift" href="#M34">M34</a></a><code class="signature apipage">M34 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M44"><a class="lift" href="#M44">M44</a></a><code class="signature apipage">M44 : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><code class="signature apipage">set(n11:Float<span></span>, n12:Float<span></span>, n13:Float<span></span>, n14:Float<span></span>, n21:Float<span></span>, n22:Float<span></span>, n23:Float<span></span>, n24:Float<span></span>, n31:Float<span></span>, n32:Float<span></span>, n33:Float<span></span>, n34:Float<span></span>, n41:Float<span></span>, n42:Float<span></span>, n43:Float<span></span>, n44:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : String</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="float32array"><a class="lift" href="#float32array">float32array</a></a><code class="signature apipage">float32array() : lime.utils.Float32Array</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="identity"><a class="lift" href="#identity">identity</a></a><code class="signature apipage">identity() : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="copy"><a class="lift" href="#copy">copy</a></a><code class="signature apipage">copy(m:phoenix.Matrix<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="make2D"><a class="lift" href="#make2D">make2D</a></a><code class="signature apipage">make2D(\_x:Float<span></span>, \_y:Float<span></span>, \_scale:Float<span>=1</span>, \_rotation:Float<span>=0</span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="copyPosition"><a class="lift" href="#copyPosition">copyPosition</a></a><code class="signature apipage">copyPosition(m:phoenix.Matrix<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getPosition"><a class="lift" href="#getPosition">getPosition</a></a><code class="signature apipage">getPosition() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="extractRotation"><a class="lift" href="#extractRotation">extractRotation</a></a><code class="signature apipage">extractRotation(m:phoenix.Matrix<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationFromEuler"><a class="lift" href="#makeRotationFromEuler">makeRotationFromEuler</a></a><code class="signature apipage">makeRotationFromEuler(\_v:phoenix.Vector<span></span>, \_order:String<span>=&#x27;XYZ&#x27;</span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationFromQuaternion"><a class="lift" href="#makeRotationFromQuaternion">makeRotationFromQuaternion</a></a><code class="signature apipage">makeRotationFromQuaternion(q:phoenix.Quaternion<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="lookAt"><a class="lift" href="#lookAt">lookAt</a></a><code class="signature apipage">lookAt(\_eye:phoenix.Vector<span></span>, \_target:phoenix.Vector<span></span>, \_up:phoenix.Vector<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><code class="signature apipage">multiply(\_m:phoenix.Matrix<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyMatrices"><a class="lift" href="#multiplyMatrices">multiplyMatrices</a></a><code class="signature apipage">multiplyMatrices(\_a:phoenix.Matrix<span></span>, \_b:phoenix.Matrix<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyToArray"><a class="lift" href="#multiplyToArray">multiplyToArray</a></a><code class="signature apipage">multiplyToArray(\_a:phoenix.Matrix<span></span>, \_b:phoenix.Matrix<span></span>, \_r:Array<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyScalar"><a class="lift" href="#multiplyScalar">multiplyScalar</a></a><code class="signature apipage">multiplyScalar(\_s:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyVector3Array"><a class="lift" href="#multiplyVector3Array">multiplyVector3Array</a></a><code class="signature apipage">multiplyVector3Array(\_a:Array<span></span>) : Array</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="determinant"><a class="lift" href="#determinant">determinant</a></a><code class="signature apipage">determinant() : Float</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="transpose"><a class="lift" href="#transpose">transpose</a></a><code class="signature apipage">transpose() : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="flattenToArray"><a class="lift" href="#flattenToArray">flattenToArray</a></a><code class="signature apipage">flattenToArray(\_flat:Array<span>=null</span>) : Array</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="flattenToArrayOffset"><a class="lift" href="#flattenToArrayOffset">flattenToArrayOffset</a></a><code class="signature apipage">flattenToArrayOffset(\_flat:Array<span></span>, \_offset:Int<span></span>) : Array</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setPosition"><a class="lift" href="#setPosition">setPosition</a></a><code class="signature apipage">setPosition(\_v:phoenix.Vector<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="inverse"><a class="lift" href="#inverse">inverse</a></a><code class="signature apipage">inverse() : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getInverse"><a class="lift" href="#getInverse">getInverse</a></a><code class="signature apipage">getInverse(\_m:phoenix.Matrix<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><code class="signature apipage">scale(\_v:phoenix.Vector<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getMaxScaleOnAxis"><a class="lift" href="#getMaxScaleOnAxis">getMaxScaleOnAxis</a></a><code class="signature apipage">getMaxScaleOnAxis() : Float</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeTranslation"><a class="lift" href="#makeTranslation">makeTranslation</a></a><code class="signature apipage">makeTranslation(\_x:Float<span></span>, \_y:Float<span></span>, \_z:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationX"><a class="lift" href="#makeRotationX">makeRotationX</a></a><code class="signature apipage">makeRotationX(\_theta:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationY"><a class="lift" href="#makeRotationY">makeRotationY</a></a><code class="signature apipage">makeRotationY(\_theta:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationZ"><a class="lift" href="#makeRotationZ">makeRotationZ</a></a><code class="signature apipage">makeRotationZ(\_theta:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationAxis"><a class="lift" href="#makeRotationAxis">makeRotationAxis</a></a><code class="signature apipage">makeRotationAxis(\_axis:phoenix.Vector<span></span>, \_angle:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeScale"><a class="lift" href="#makeScale">makeScale</a></a><code class="signature apipage">makeScale(\_x:Float<span></span>, \_y:Float<span></span>, \_z:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compose_with_origin"><a class="lift" href="#compose_with_origin">compose\_with\_origin</a></a><code class="signature apipage">compose\_with\_origin(\_position:phoenix.Vector<span></span>, \_origin:phoenix.Vector<span></span>, \_quaternion:phoenix.Quaternion<span></span>, \_scale:phoenix.Vector<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compose"><a class="lift" href="#compose">compose</a></a><code class="signature apipage">compose(\_position:phoenix.Vector<span></span>, \_quaternion:phoenix.Quaternion<span></span>, \_scale:phoenix.Vector<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="decompose"><a class="lift" href="#decompose">decompose</a></a><code class="signature apipage">decompose(\_position:phoenix.Vector<span>=null</span>, \_quaternion:phoenix.Quaternion<span>=null</span>, \_scale:phoenix.Vector<span>=null</span>) : phoenix.MatrixTransform</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeFrustum"><a class="lift" href="#makeFrustum">makeFrustum</a></a><code class="signature apipage">makeFrustum(\_left:Float<span></span>, \_right:Float<span></span>, \_bottom:Float<span></span>, \_top:Float<span></span>, \_near:Float<span></span>, \_far:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makePerspective"><a class="lift" href="#makePerspective">makePerspective</a></a><code class="signature apipage">makePerspective(\_fov:Float<span></span>, \_aspect:Float<span></span>, \_near:Float<span></span>, \_far:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeOrthographic"><a class="lift" href="#makeOrthographic">makeOrthographic</a></a><code class="signature apipage">makeOrthographic(\_left:Float<span></span>, \_right:Float<span></span>, \_top:Float<span></span>, \_bottom:Float<span></span>, \_near:Float<span></span>, \_far:Float<span></span>) : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="fromArray"><a class="lift" href="#fromArray">fromArray</a></a><code class="signature apipage">fromArray(\_from:Array<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><code class="signature apipage">toArray() : Array</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><code class="signature apipage">clone() : phoenix.Matrix</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="up"><a class="lift" href="#up">up</a></a><code class="signature apipage">up() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="down"><a class="lift" href="#down">down</a></a><code class="signature apipage">down() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="left"><a class="lift" href="#left">left</a></a><code class="signature apipage">left() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="right"><a class="lift" href="#right">right</a></a><code class="signature apipage">right() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="backward"><a class="lift" href="#backward">backward</a></a><code class="signature apipage">backward() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="forward"><a class="lift" href="#forward">forward</a></a><code class="signature apipage">forward() : phoenix.Vector</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(n11:Float<span>=1</span>, n12:Float<span>=0</span>, n13:Float<span>=0</span>, n14:Float<span>=0</span>, n21:Float<span>=0</span>, n22:Float<span>=1</span>, n23:Float<span>=0</span>, n24:Float<span>=0</span>, n31:Float<span>=0</span>, n32:Float<span>=0</span>, n33:Float<span>=1</span>, n34:Float<span>=0</span>, n41:Float<span>=0</span>, n42:Float<span>=0</span>, n43:Float<span>=0</span>, n44:Float<span>=1</span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;