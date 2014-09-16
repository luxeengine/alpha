
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>MouseEvent</h1>
<small>`luxe.MouseEvent`</small>

Information about a mouse event

<hr/>

`typedef`
<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="yrel"><a class="lift" href="#yrel">yrel</a></a><div class="clear"></div>
                <code class="signature apipage">yrel : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The relative y position if `state` is `move` or a window has grabbed state</span><br/><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The y position in the window of the mouse event</span><br/><span class="member apipage">
                <a name="xrel"><a class="lift" href="#xrel">xrel</a></a><div class="clear"></div>
                <code class="signature apipage">xrel : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The relative x position if `state` is `move` or a window has grabbed state</span><br/><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The x position in the window of the mouse event</span><br/><span class="member apipage">
                <a name="window_id"><a class="lift" href="#window_id">window\_id</a></a><div class="clear"></div>
                <code class="signature apipage">window\_id : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The window id this event originated from</span><br/><span class="member apipage">
                <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><div class="clear"></div>
                <code class="signature apipage">timestamp : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">The time in seconds when this touch event occurred, use for deltas</span><br/><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div>
                <code class="signature apipage">state : [luxe.InteractState](../../api/luxe/InteractState.html)</code><br/></span>
            <span class="small_desc_flat">The state this event is in</span><br/><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">A convenience vector access of the x and y position</span><br/><span class="member apipage">
                <a name="button"><a class="lift" href="#button">button</a></a><div class="clear"></div>
                <code class="signature apipage">button : [luxe.MouseButton](../../api/luxe/MouseButton.html)</code><br/></span>
            <span class="small_desc_flat">The button id, if the event `state` is `down` or `up`</span><br/>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;