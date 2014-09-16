
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Quaternion</h1>
<small>`luxe.Quaternion`</small>



---

`typedef`&nbsp;alias of `phoenix.Quaternion`


---


&nbsp;
&nbsp;







<h3>Members</h3> <hr/><span class="member apipage">
                <a name="ignore_listeners"><a class="lift" href="#ignore_listeners">ignore\_listeners</a></a><div class="clear"></div>
                <code class="signature apipage">ignore\_listeners : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="listen_w"><a class="lift" href="#listen_w">listen\_w</a></a><div class="clear"></div>
                <code class="signature apipage">listen\_w : [Float](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="listen_x"><a class="lift" href="#listen_x">listen\_x</a></a><div class="clear"></div>
                <code class="signature apipage">listen\_x : [Float](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="listen_y"><a class="lift" href="#listen_y">listen\_y</a></a><div class="clear"></div>
                <code class="signature apipage">listen\_y : [Float](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="listen_z"><a class="lift" href="#listen_z">listen\_z</a></a><div class="clear"></div>
                <code class="signature apipage">listen\_z : [Float](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="w"><a class="lift" href="#w">w</a></a><div class="clear"></div>
                <code class="signature apipage">w : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="z"><a class="lift" href="#z">z</a></a><div class="clear"></div>
                <code class="signature apipage">z : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="Dot"><a class="lift" href="#Dot">Dot</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Dot(\_a:[phoenix.Quaternion](#)<span></span>, \_b:[phoenix.Quaternion](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="Slerp"><a class="lift" href="#Slerp">Slerp</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Slerp(\_qa:[phoenix.Quaternion](#)<span></span>, \_qb:[phoenix.Quaternion](#)<span></span>, \_qm:[phoenix.Quaternion](#)<span></span>, \_t:[Float](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add(\_quaternion:[phoenix.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="addQuaternions"><a class="lift" href="#addQuaternions">addQuaternions</a></a><div class="clear"></div>
            <code class="signature apipage">addQuaternions(\_a:[phoenix.Quaternion](#)<span></span>, \_b:[phoenix.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><div class="clear"></div>
            <code class="signature apipage">clone() : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="conjugate"><a class="lift" href="#conjugate">conjugate</a></a><div class="clear"></div>
            <code class="signature apipage">conjugate() : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="copy"><a class="lift" href="#copy">copy</a></a><div class="clear"></div>
            <code class="signature apipage">copy(\_quaternion:[phoenix.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dot"><a class="lift" href="#dot">dot</a></a><div class="clear"></div>
            <code class="signature apipage">dot(\_other:[phoenix.Quaternion](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="equals"><a class="lift" href="#equals">equals</a></a><div class="clear"></div>
            <code class="signature apipage">equals(\_q:[phoenix.Quaternion](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="fromArray"><a class="lift" href="#fromArray">fromArray</a></a><div class="clear"></div>
            <code class="signature apipage">fromArray(\_a:[Array](#)&lt;[Float](#)&gt;<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="inverse"><a class="lift" href="#inverse">inverse</a></a><div class="clear"></div>
            <code class="signature apipage">inverse() : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="length"><a class="lift" href="#length">length</a></a><div class="clear"></div>
            <code class="signature apipage">length() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="lengthSq"><a class="lift" href="#lengthSq">lengthSq</a></a><div class="clear"></div>
            <code class="signature apipage">lengthSq() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen"><a class="lift" href="#listen">listen</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">listen(\_q:[phoenix.Quaternion](#)<span></span>, listener:[Float](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><div class="clear"></div>
            <code class="signature apipage">multiply(\_quaternion:[phoenix.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyQuaternions"><a class="lift" href="#multiplyQuaternions">multiplyQuaternions</a></a><div class="clear"></div>
            <code class="signature apipage">multiplyQuaternions(\_a:[phoenix.Quaternion](#)<span></span>, \_b:[phoenix.Quaternion](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="multiplyScalar"><a class="lift" href="#multiplyScalar">multiplyScalar</a></a><div class="clear"></div>
            <code class="signature apipage">multiplyScalar(\_scalar:[Float](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_x:[Float](#)<span>=0</span>, \_y:[Float](#)<span>=0</span>, \_z:[Float](#)<span>=0</span>, \_w:[Float](#)<span>=1</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="normalize"><a class="lift" href="#normalize">normalize</a></a><div class="clear"></div>
            <code class="signature apipage">normalize() : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><div class="clear"></div>
            <code class="signature apipage">set(\_x:[Float](#)<span></span>, \_y:[Float](#)<span></span>, \_z:[Float](#)<span></span>, \_w:[Float](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setFromAxisAngle"><a class="lift" href="#setFromAxisAngle">setFromAxisAngle</a></a><div class="clear"></div>
            <code class="signature apipage">setFromAxisAngle(\_axis:[phoenix.Vector](#)<span></span>, \_angle:[Float](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setFromEuler"><a class="lift" href="#setFromEuler">setFromEuler</a></a><div class="clear"></div>
            <code class="signature apipage">setFromEuler(\_euler:[phoenix.Vector](#)<span></span>, \_order:[String](#)<span>=&#x27;XYZ&#x27;</span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="setFromRotationMatrix"><a class="lift" href="#setFromRotationMatrix">setFromRotationMatrix</a></a><div class="clear"></div>
            <code class="signature apipage">setFromRotationMatrix(\_m:[phoenix.Matrix](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_xyzw"><a class="lift" href="#set_xyzw">set\_xyzw</a></a><div class="clear"></div>
            <code class="signature apipage">set\_xyzw(\_x:[Float](#)<span></span>, \_y:[Float](#)<span></span>, \_z:[Float](#)<span></span>, \_w:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="slerp"><a class="lift" href="#slerp">slerp</a></a><div class="clear"></div>
            <code class="signature apipage">slerp(\_qb:[phoenix.Quaternion](#)<span></span>, \_t:[Float](#)<span></span>) : [phoenix.Quaternion](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><div class="clear"></div>
            <code class="signature apipage">toArray() : [Array](#)&lt;[Float](#)&gt;</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toString"><a class="lift" href="#toString">toString</a></a><div class="clear"></div>
            <code class="signature apipage">toString() : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="toeuler"><a class="lift" href="#toeuler">toeuler</a></a><div class="clear"></div>
            <code class="signature apipage">toeuler() : [phoenix.Vector](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    



    











---

&nbsp;
&nbsp;
&nbsp;
&nbsp;