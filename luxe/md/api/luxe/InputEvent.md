
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>InputEvent</h1>
<small>`luxe.InputEvent`</small>

Information about a named input event

---

`typedef`


---


&nbsp;
&nbsp;







<h3>Members</h3> <hr/><span class="member apipage">
                <a name="type"><a class="lift" href="#type">type</a></a><div class="clear"></div>
                <code class="signature apipage">type : [luxe.InputType](#)</code><br/></span>
            <span class="small_desc_flat">the type of input this event was generated for</span><span class="member apipage">
                <a name="touch_event"><a class="lift" href="#touch_event">touch\_event</a></a><div class="clear"></div>
                <code class="signature apipage">touch\_event : [luxe.TouchEvent](#)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `touch`</span><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div>
                <code class="signature apipage">state : [luxe.InteractState](#)</code><br/></span>
            <span class="small_desc_flat">The state of the event</span><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](#)</code><br/></span>
            <span class="small_desc_flat">the name of the input event</span><span class="member apipage">
                <a name="mouse_event"><a class="lift" href="#mouse_event">mouse\_event</a></a><div class="clear"></div>
                <code class="signature apipage">mouse\_event : [luxe.MouseEvent](#)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `mouse`</span><span class="member apipage">
                <a name="key_event"><a class="lift" href="#key_event">key\_event</a></a><div class="clear"></div>
                <code class="signature apipage">key\_event : [luxe.KeyEvent](#)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `keys`</span><span class="member apipage">
                <a name="gamepad_event"><a class="lift" href="#gamepad_event">gamepad\_event</a></a><div class="clear"></div>
                <code class="signature apipage">gamepad\_event : [luxe.GamepadEvent](#)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `gamepad`</span>








---

&nbsp;
&nbsp;
&nbsp;
&nbsp;