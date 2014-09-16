
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>InputEvent</h1>
<small>`luxe.InputEvent`</small>

Information about a named input event

<hr/>

`typedef`
<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="type"><a class="lift" href="#type">type</a></a><div class="clear"></div>
                <code class="signature apipage">type : [luxe.InputType](../../api/luxe/InputType.html)</code><br/></span>
            <span class="small_desc_flat">the type of input this event was generated for</span><br/><span class="member apipage">
                <a name="touch_event"><a class="lift" href="#touch_event">touch\_event</a></a><div class="clear"></div>
                <code class="signature apipage">touch\_event : [luxe.TouchEvent](../../api/luxe/TouchEvent.html)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `touch`</span><br/><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div>
                <code class="signature apipage">state : [luxe.InteractState](../../api/luxe/InteractState.html)</code><br/></span>
            <span class="small_desc_flat">The state of the event</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the name of the input event</span><br/><span class="member apipage">
                <a name="mouse_event"><a class="lift" href="#mouse_event">mouse\_event</a></a><div class="clear"></div>
                <code class="signature apipage">mouse\_event : [luxe.MouseEvent](../../api/luxe/MouseEvent.html)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `mouse`</span><br/><span class="member apipage">
                <a name="key_event"><a class="lift" href="#key_event">key\_event</a></a><div class="clear"></div>
                <code class="signature apipage">key\_event : [luxe.KeyEvent](../../api/luxe/KeyEvent.html)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `keys`</span><br/><span class="member apipage">
                <a name="gamepad_event"><a class="lift" href="#gamepad_event">gamepad\_event</a></a><div class="clear"></div>
                <code class="signature apipage">gamepad\_event : [luxe.GamepadEvent](../../api/luxe/GamepadEvent.html)</code><br/></span>
            <span class="small_desc_flat">null, unless type is `gamepad`</span><br/>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;