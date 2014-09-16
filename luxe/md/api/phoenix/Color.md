
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>Color</h1>
<small>`phoenix.Color`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="a"><a class="lift" href="#a">a</a></a><div class="clear"></div>
                <code class="signature apipage">a : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="b"><a class="lift" href="#b">b</a></a><div class="clear"></div>
                <code class="signature apipage">b : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="g"><a class="lift" href="#g">g</a></a><div class="clear"></div>
                <code class="signature apipage">g : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="r"><a class="lift" href="#r">r</a></a><div class="clear"></div>
                <code class="signature apipage">r : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><div class="clear"></div>
            <code class="signature apipage">clone() : [phoenix.Color](../../api/phoenix/Color.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fromColorHSL"><a class="lift" href="#fromColorHSL">fromColorHSL</a></a><div class="clear"></div>
            <code class="signature apipage">fromColorHSL(\_color\_hsl:[phoenix.ColorHSL](../../api/phoenix/ColorHSL.html)<span></span>) : [phoenix.Color](../../api/phoenix/Color.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fromColorHSV"><a class="lift" href="#fromColorHSV">fromColorHSV</a></a><div class="clear"></div>
            <code class="signature apipage">fromColorHSV(\_color\_hsv:[phoenix.ColorHSV](../../api/phoenix/ColorHSV.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="maxRGB"><a class="lift" href="#maxRGB">maxRGB</a></a><div class="clear"></div>
            <code class="signature apipage">maxRGB() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="minRGB"><a class="lift" href="#minRGB">minRGB</a></a><div class="clear"></div>
            <code class="signature apipage">minRGB() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_r:[Float](http://api.haxe.org/Float.html)<span>=1.0f</span>, \_g:[Float](http://api.haxe.org/Float.html)<span>=1.0f</span>, \_b:[Float](http://api.haxe.org/Float.html)<span>=1.0f</span>, \_a:[Float](http://api.haxe.org/Float.html)<span>=1.0f</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="random"><a class="lift" href="#random">random</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">random(\_include\_alpha:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [phoenix.Color](../../api/phoenix/Color.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="rgb"><a class="lift" href="#rgb">rgb</a></a><div class="clear"></div>
            <code class="signature apipage">rgb(\_rgb:[Int](http://api.haxe.org/Int.html)<span>=16777215</span>) : [phoenix.Color](../../api/phoenix/Color.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><div class="clear"></div>
            <code class="signature apipage">set(\_r:[Float](http://api.haxe.org/Float.html)<span>=null</span>, \_g:[Float](http://api.haxe.org/Float.html)<span>=null</span>, \_b:[Float](http://api.haxe.org/Float.html)<span>=null</span>, \_a:[Float](http://api.haxe.org/Float.html)<span>=null</span>) : [phoenix.Color](../../api/phoenix/Color.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="toColorHSL"><a class="lift" href="#toColorHSL">toColorHSL</a></a><div class="clear"></div>
            <code class="signature apipage">toColorHSL() : [phoenix.ColorHSL](../../api/phoenix/ColorHSL.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="toColorHSV"><a class="lift" href="#toColorHSV">toColorHSV</a></a><div class="clear"></div>
            <code class="signature apipage">toColorHSV() : [phoenix.ColorHSV](../../api/phoenix/ColorHSV.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="tween"><a class="lift" href="#tween">tween</a></a><div class="clear"></div>
            <code class="signature apipage">tween(\_time\_in\_seconds:[Float](http://api.haxe.org/Float.html)<span>=0.5f</span>, \_properties\_to\_tween:[luxe.options.ColorOptions](../../api/luxe/options/ColorOptions.html)<span>=null</span>, \_override:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [luxe.tween.actuators.IGenericActuator](../../api/luxe/tween/actuators/IGenericActuator.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;