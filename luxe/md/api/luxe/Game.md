
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Game</h1>
<small>`luxe.Game`</small>



---

`class`extends <code><span>luxe.Emitter</span></code>
<span class="meta">
<br/>meta: @:keep, @:noCompletion, @:keepSub
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div>
            <code class="signature apipage">config(config:[luxe.AppConfig](#)<span></span>) : [luxe.AppConfig](#)</code><br/><span class="small_desc_flat">Called by luxe to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called.</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat">Empty constructor. Use `ready` instead.</span>
        </span>
    <span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](#)</code><br/><span class="small_desc_flat">Your exit point. Called for you when you should shut down your application</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadaxis(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad axis moves, use `gamepad` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddevice(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a gamepad is connected or disconnected, use `gamepad` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddown"><a class="lift" href="#ongamepaddown">ongamepaddown</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddown(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is pressed, use `gamepad` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="ongamepadup"><a class="lift" href="#ongamepadup">ongamepadup</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadup(event:[luxe.GamepadEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is released, use `gamepad` to determine gamepad id</span>
        </span>
    <span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a><div class="clear"></div>
            <code class="signature apipage">oninputdown(\_name:[String](#)<span></span>, e:[luxe.InputEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called when a named input down event occurs</span>
        </span>
    <span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a><div class="clear"></div>
            <code class="signature apipage">oninputup(\_name:[String](#)<span></span>, e:[luxe.InputEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called when a named input up event occurs</span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><div class="clear"></div>
            <code class="signature apipage">onkeydown(event:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a key is pressed down</span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><div class="clear"></div>
            <code class="signature apipage">onkeyup(event:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a key is released</span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><div class="clear"></div>
            <code class="signature apipage">onmousedown(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a mouse button is pressed</span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><div class="clear"></div>
            <code class="signature apipage">onmousemove(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when the mouse moves</span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><div class="clear"></div>
            <code class="signature apipage">onmouseup(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a mouse button is released</span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(event:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when the mouse wheel moves</span>
        </span>
    <span class="method apipage">
            <a name="onpostrender"><a class="lift" href="#onpostrender">onpostrender</a></a><div class="clear"></div>
            <code class="signature apipage">onpostrender() : [Void](#)</code><br/><span class="small_desc_flat">Called when the application is done rendering</span>
        </span>
    <span class="method apipage">
            <a name="onprerender"><a class="lift" href="#onprerender">onprerender</a></a><div class="clear"></div>
            <code class="signature apipage">onprerender() : [Void](#)</code><br/><span class="small_desc_flat">Called when the application is about to render</span>
        </span>
    <span class="method apipage">
            <a name="onrender"><a class="lift" href="#onrender">onrender</a></a><div class="clear"></div>
            <code class="signature apipage">onrender() : [Void](#)</code><br/><span class="small_desc_flat">Called when the application is rendering</span>
        </span>
    <span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a><div class="clear"></div>
            <code class="signature apipage">ontextinput(event:[luxe.TextEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc.</span>
        </span>
    <span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchdown(event:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a touch is released, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchmove(event:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a touch is moved, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchup(event:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Called for you when a touch is first pressed, use the `touch_id` to track which</span>
        </span>
    <span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a><div class="clear"></div>
            <code class="signature apipage">ready() : [Void](#)</code><br/><span class="small_desc_flat">Your entry point. Called for you when you can initialize your application</span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide})</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;