
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>TouchEvent</h1>
<small>`luxe.TouchEvent`</small>

Information about a touch event

<hr/>

`typedef`
<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The x position in the window of the touch event</span><br/><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The x position in the window of the touch event</span><br/><span class="member apipage">
                <a name="touch_id"><a class="lift" href="#touch_id">touch\_id</a></a><div class="clear"></div>
                <code class="signature apipage">touch\_id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The id of the touch that this event comes from, a finger id</span><br/><span class="member apipage">
                <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><div class="clear"></div>
                <code class="signature apipage">timestamp : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The time in seconds when this touch event occurred, use for deltas</span><br/><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div>
                <code class="signature apipage">state : [luxe.InteractState](../../api/luxe/InteractState.html)</code><br/></span>
            <span class="small_desc_flat">The state this touch event is in</span><br/><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">A convenience vector access of the x and y position</span><br/><span class="member apipage">
                <a name="dy"><a class="lift" href="#dy">dy</a></a><div class="clear"></div>
                <code class="signature apipage">dy : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The delta y value of the touch event, if the state is `moving`</span><br/><span class="member apipage">
                <a name="dx"><a class="lift" href="#dx">dx</a></a><div class="clear"></div>
                <code class="signature apipage">dx : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The delta x value of the touch event, if the state is `moving`</span><br/>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;