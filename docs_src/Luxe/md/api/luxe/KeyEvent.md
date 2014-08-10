
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>KeyEvent</h1>
<small>`luxe.KeyEvent`</small>

Information about a keyboard event

---

`typedef`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="window_id"><a class="lift" href="#window_id">window\_id</a></a><div class="clear"></div><code class="signature apipage">window\_id : [Int](#)</code><br/></span>
            <span class="small_desc_flat">The window id this event originated from</span><span class="member apipage">
                <a name="timestamp"><a class="lift" href="#timestamp">timestamp</a></a><div class="clear"></div><code class="signature apipage">timestamp : [Float](#)</code><br/></span>
            <span class="small_desc_flat">The time in seconds when this touch event occurred, use for deltas</span><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div><code class="signature apipage">state : [luxe.InteractState](#)</code><br/></span>
            <span class="small_desc_flat">The state of the key in this event</span><span class="member apipage">
                <a name="scancode"><a class="lift" href="#scancode">scancode</a></a><div class="clear"></div><code class="signature apipage">scancode : [Int](#)</code><br/></span>
            <span class="small_desc_flat">The `snow.input.Scan` code value for this event</span><span class="member apipage">
                <a name="repeat"><a class="lift" href="#repeat">repeat</a></a><div class="clear"></div><code class="signature apipage">repeat : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">If this value is bigger than 0 this is a key repeat event of a key held down</span><span class="member apipage">
                <a name="mod"><a class="lift" href="#mod">mod</a></a><div class="clear"></div><code class="signature apipage">mod : [luxe.ModState](#)</code><br/></span>
            <span class="small_desc_flat">The modifier state of this event</span><span class="member apipage">
                <a name="keycode"><a class="lift" href="#keycode">keycode</a></a><div class="clear"></div><code class="signature apipage">keycode : [Int](#)</code><br/></span>
            <span class="small_desc_flat">The `snow.input.Key` code value for this event</span>







---

&nbsp;
&nbsp;
&nbsp;
&nbsp;