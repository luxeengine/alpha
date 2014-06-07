
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Matrix



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="elements"><a class="lift" href="#elements">elements</a></a><code class="signature apipage">elements : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="backward"><a class="lift" href="#backward">backward</a></a><code class="signature apipage">backward() : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><code class="signature apipage">clone() : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compose"><a class="lift" href="#compose">compose</a></a><code class="signature apipage">compose(\_position:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_quaternion:<span>[phoenix.Quaternion](#phoenix.Quaternion)</span>, \_scale:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="compose_with_origin"><a class="lift" href="#compose_with_origin">compose\_with\_origin</a></a><code class="signature apipage">compose\_with\_origin(\_position:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_origin:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_quaternion:<span>[phoenix.Quaternion](#phoenix.Quaternion)</span>, \_scale:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="copy"><a class="lift" href="#copy">copy</a></a><code class="signature apipage">copy(m:<span>[phoenix.Matrix](#phoenix.Matrix)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="copyPosition"><a class="lift" href="#copyPosition">copyPosition</a></a><code class="signature apipage">copyPosition(m:<span>[phoenix.Matrix](#phoenix.Matrix)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="decompose"><a class="lift" href="#decompose">decompose</a></a><code class="signature apipage">decompose(?\_position:<span>[phoenix.Vector](#phoenix.Vector)=null</span>, ?\_quaternion:<span>[phoenix.Quaternion](#phoenix.Quaternion)=null</span>, ?\_scale:<span>[phoenix.Vector](#phoenix.Vector)=null</span>) : [phoenix.MatrixTransform](#phoenix.MatrixTransform)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="determinant"><a class="lift" href="#determinant">determinant</a></a><code class="signature apipage">determinant() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="down"><a class="lift" href="#down">down</a></a><code class="signature apipage">down() : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="extractRotation"><a class="lift" href="#extractRotation">extractRotation</a></a><code class="signature apipage">extractRotation(m:<span>[phoenix.Matrix](#phoenix.Matrix)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="flattenToArray"><a class="lift" href="#flattenToArray">flattenToArray</a></a><code class="signature apipage">flattenToArray(?\_flat:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;=null</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="flattenToArrayOffset"><a class="lift" href="#flattenToArrayOffset">flattenToArrayOffset</a></a><code class="signature apipage">flattenToArrayOffset(\_flat:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>, \_offset:<span>[Int](http://api.haxe.org/Int.html)</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="float32array"><a class="lift" href="#float32array">float32array</a></a><code class="signature apipage">float32array() : [lime.utils.Float32Array]()</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="forward"><a class="lift" href="#forward">forward</a></a><code class="signature apipage">forward() : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="fromArray"><a class="lift" href="#fromArray">fromArray</a></a><code class="signature apipage">fromArray(\_from:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getInverse"><a class="lift" href="#getInverse">getInverse</a></a><code class="signature apipage">getInverse(\_m:<span>[phoenix.Matrix](#phoenix.Matrix)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getMaxScaleOnAxis"><a class="lift" href="#getMaxScaleOnAxis">getMaxScaleOnAxis</a></a><code class="signature apipage">getMaxScaleOnAxis() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="getPosition"><a class="lift" href="#getPosition">getPosition</a></a><code class="signature apipage">getPosition() : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="identity"><a class="lift" href="#identity">identity</a></a><code class="signature apipage">identity() : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="inverse"><a class="lift" href="#inverse">inverse</a></a><code class="signature apipage">inverse() : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="left"><a class="lift" href="#left">left</a></a><code class="signature apipage">left() : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="lookAt"><a class="lift" href="#lookAt">lookAt</a></a><code class="signature apipage">lookAt(\_eye:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_target:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_up:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="make2D"><a class="lift" href="#make2D">make2D</a></a><code class="signature apipage">make2D(\_x:<span>[Float](http://api.haxe.org/Float.html)</span>, \_y:<span>[Float](http://api.haxe.org/Float.html)</span>, ?\_scale:<span>[Float](http://api.haxe.org/Float.html)=1</span>, ?\_rotation:<span>[Float](http://api.haxe.org/Float.html)=0</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeFrustum"><a class="lift" href="#makeFrustum">makeFrustum</a></a><code class="signature apipage">makeFrustum(\_left:<span>[Float](http://api.haxe.org/Float.html)</span>, \_right:<span>[Float](http://api.haxe.org/Float.html)</span>, \_bottom:<span>[Float](http://api.haxe.org/Float.html)</span>, \_top:<span>[Float](http://api.haxe.org/Float.html)</span>, \_near:<span>[Float](http://api.haxe.org/Float.html)</span>, \_far:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeOrthographic"><a class="lift" href="#makeOrthographic">makeOrthographic</a></a><code class="signature apipage">makeOrthographic(\_left:<span>[Float](http://api.haxe.org/Float.html)</span>, \_right:<span>[Float](http://api.haxe.org/Float.html)</span>, \_top:<span>[Float](http://api.haxe.org/Float.html)</span>, \_bottom:<span>[Float](http://api.haxe.org/Float.html)</span>, \_near:<span>[Float](http://api.haxe.org/Float.html)</span>, \_far:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makePerspective"><a class="lift" href="#makePerspective">makePerspective</a></a><code class="signature apipage">makePerspective(\_fov:<span>[Float](http://api.haxe.org/Float.html)</span>, \_aspect:<span>[Float](http://api.haxe.org/Float.html)</span>, \_near:<span>[Float](http://api.haxe.org/Float.html)</span>, \_far:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationAxis"><a class="lift" href="#makeRotationAxis">makeRotationAxis</a></a><code class="signature apipage">makeRotationAxis(\_axis:<span>[phoenix.Vector](#phoenix.Vector)</span>, \_angle:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationFromEuler"><a class="lift" href="#makeRotationFromEuler">makeRotationFromEuler</a></a><code class="signature apipage">makeRotationFromEuler(\_v:<span>[phoenix.Vector](#phoenix.Vector)</span>, ?\_order:<span>[String](http://api.haxe.org/String.html)=&#x27;XYZ&#x27;</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationFromQuaternion"><a class="lift" href="#makeRotationFromQuaternion">makeRotationFromQuaternion</a></a><code class="signature apipage">makeRotationFromQuaternion(q:<span>[phoenix.Quaternion](#phoenix.Quaternion)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationX"><a class="lift" href="#makeRotationX">makeRotationX</a></a><code class="signature apipage">makeRotationX(\_theta:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationY"><a class="lift" href="#makeRotationY">makeRotationY</a></a><code class="signature apipage">makeRotationY(\_theta:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeRotationZ"><a class="lift" href="#makeRotationZ">makeRotationZ</a></a><code class="signature apipage">makeRotationZ(\_theta:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeScale"><a class="lift" href="#makeScale">makeScale</a></a><code class="signature apipage">makeScale(\_x:<span>[Float](http://api.haxe.org/Float.html)</span>, \_y:<span>[Float](http://api.haxe.org/Float.html)</span>, \_z:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="makeTranslation"><a class="lift" href="#makeTranslation">makeTranslation</a></a><code class="signature apipage">makeTranslation(\_x:<span>[Float](http://api.haxe.org/Float.html)</span>, \_y:<span>[Float](http://api.haxe.org/Float.html)</span>, \_z:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><code class="signature apipage">multiply(\_m:<span>[phoenix.Matrix](#phoenix.Matrix)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyMatrices"><a class="lift" href="#multiplyMatrices">multiplyMatrices</a></a><code class="signature apipage">multiplyMatrices(\_a:<span>[phoenix.Matrix](#phoenix.Matrix)</span>, \_b:<span>[phoenix.Matrix](#phoenix.Matrix)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyScalar"><a class="lift" href="#multiplyScalar">multiplyScalar</a></a><code class="signature apipage">multiplyScalar(\_s:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyToArray"><a class="lift" href="#multiplyToArray">multiplyToArray</a></a><code class="signature apipage">multiplyToArray(\_a:<span>[phoenix.Matrix](#phoenix.Matrix)</span>, \_b:<span>[phoenix.Matrix](#phoenix.Matrix)</span>, \_r:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyVector3Array"><a class="lift" href="#multiplyVector3Array">multiplyVector3Array</a></a><code class="signature apipage">multiplyVector3Array(\_a:<span>[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(?n11:<span>[Float](http://api.haxe.org/Float.html)=1</span>, ?n12:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n13:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n14:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n21:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n22:<span>[Float](http://api.haxe.org/Float.html)=1</span>, ?n23:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n24:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n31:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n32:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n33:<span>[Float](http://api.haxe.org/Float.html)=1</span>, ?n34:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n41:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n42:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n43:<span>[Float](http://api.haxe.org/Float.html)=0</span>, ?n44:<span>[Float](http://api.haxe.org/Float.html)=1</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="right"><a class="lift" href="#right">right</a></a><code class="signature apipage">right() : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><code class="signature apipage">scale(\_v:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><code class="signature apipage">set(n11:<span>[Float](http://api.haxe.org/Float.html)</span>, n12:<span>[Float](http://api.haxe.org/Float.html)</span>, n13:<span>[Float](http://api.haxe.org/Float.html)</span>, n14:<span>[Float](http://api.haxe.org/Float.html)</span>, n21:<span>[Float](http://api.haxe.org/Float.html)</span>, n22:<span>[Float](http://api.haxe.org/Float.html)</span>, n23:<span>[Float](http://api.haxe.org/Float.html)</span>, n24:<span>[Float](http://api.haxe.org/Float.html)</span>, n31:<span>[Float](http://api.haxe.org/Float.html)</span>, n32:<span>[Float](http://api.haxe.org/Float.html)</span>, n33:<span>[Float](http://api.haxe.org/Float.html)</span>, n34:<span>[Float](http://api.haxe.org/Float.html)</span>, n41:<span>[Float](http://api.haxe.org/Float.html)</span>, n42:<span>[Float](http://api.haxe.org/Float.html)</span>, n43:<span>[Float](http://api.haxe.org/Float.html)</span>, n44:<span>[Float](http://api.haxe.org/Float.html)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setPosition"><a class="lift" href="#setPosition">setPosition</a></a><code class="signature apipage">setPosition(\_v:<span>[phoenix.Vector](#phoenix.Vector)</span>) : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><code class="signature apipage">toArray() : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><code class="signature apipage">toString() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="transpose"><a class="lift" href="#transpose">transpose</a></a><code class="signature apipage">transpose() : [phoenix.Matrix](#phoenix.Matrix)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="up"><a class="lift" href="#up">up</a></a><code class="signature apipage">up() : [phoenix.Vector](#phoenix.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="M11"><a class="lift" href="#M11">M11</a></a><code class="signature apipage">M11 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M12"><a class="lift" href="#M12">M12</a></a><code class="signature apipage">M12 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M13"><a class="lift" href="#M13">M13</a></a><code class="signature apipage">M13 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M14"><a class="lift" href="#M14">M14</a></a><code class="signature apipage">M14 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M21"><a class="lift" href="#M21">M21</a></a><code class="signature apipage">M21 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M22"><a class="lift" href="#M22">M22</a></a><code class="signature apipage">M22 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M23"><a class="lift" href="#M23">M23</a></a><code class="signature apipage">M23 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M24"><a class="lift" href="#M24">M24</a></a><code class="signature apipage">M24 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M31"><a class="lift" href="#M31">M31</a></a><code class="signature apipage">M31 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M32"><a class="lift" href="#M32">M32</a></a><code class="signature apipage">M32 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M33"><a class="lift" href="#M33">M33</a></a><code class="signature apipage">M33 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M34"><a class="lift" href="#M34">M34</a></a><code class="signature apipage">M34 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M41"><a class="lift" href="#M41">M41</a></a><code class="signature apipage">M41 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M42"><a class="lift" href="#M42">M42</a></a><code class="signature apipage">M42 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M43"><a class="lift" href="#M43">M43</a></a><code class="signature apipage">M43 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="M44"><a class="lift" href="#M44">M44</a></a><code class="signature apipage">M44 : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;