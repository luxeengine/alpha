
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Camera



---

`class`extends <code><span>[luxe.Entity]()</span></code>
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="bounds"><a class="lift" href="#bounds">bounds</a></a><code class="signature apipage">bounds : [luxe.Rectangle](#luxe.Rectangle)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="minimum_shake"><a class="lift" href="#minimum_shake">minimum\_shake</a></a><code class="signature apipage">minimum\_shake : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="shake_amount"><a class="lift" href="#shake_amount">shake\_amount</a></a><code class="signature apipage">shake\_amount : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="shake_vector"><a class="lift" href="#shake_vector">shake\_vector</a></a><code class="signature apipage">shake\_vector : [luxe.Vector](#luxe.Vector)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="shaking"><a class="lift" href="#shaking">shaking</a></a><code class="signature apipage">shaking : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="view"><a class="lift" href="#view">view</a></a><code class="signature apipage">view : [phoenix.Camera](#phoenix.Camera)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="focus"><a class="lift" href="#focus">focus</a></a><code class="signature apipage">focus(\_p:<span>[luxe.Vector](#luxe.Vector)</span>, ?\_t:<span>[Float](http://api.haxe.org/Float.html)=0.6f</span>, ?oncomplete:<span>[Void](http://api.haxe.org/Void.html)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a><code class="signature apipage">get\_serialize\_data() : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(?options:<span>[luxe.options.LuxeCameraOptions](#luxe.options.LuxeCameraOptions)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a><code class="signature apipage">screen\_point\_to\_world(\_vector:<span>[luxe.Vector](#luxe.Vector)</span>) : [luxe.Vector](#luxe.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shake"><a class="lift" href="#shake">shake</a></a><code class="signature apipage">shake(amount:<span>[Float](http://api.haxe.org/Float.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a><code class="signature apipage">world\_point\_to\_screen(\_vector:<span>[luxe.Vector](#luxe.Vector)</span>, ?\_viewport:<span>[luxe.Rectangle](#luxe.Rectangle)=null</span>) : [luxe.Vector](#luxe.Vector)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="center"><a class="lift" href="#center">center</a></a><code class="signature apipage">center : [luxe.Vector]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a><code class="signature apipage">minimum\_zoom : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><code class="signature apipage">viewport : [luxe.Rectangle]()</code><br/><span class="small_desc_flat"></span>
        </span><span class="property apipage">
            <a name="zoom"><a class="lift" href="#zoom">zoom</a></a><code class="signature apipage">zoom : [Float]()</code><br/><span class="small_desc_flat"></span>
        </span>

&nbsp;
&nbsp;
&nbsp;