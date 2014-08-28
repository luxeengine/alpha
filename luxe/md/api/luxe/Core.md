
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Core</h1>
<small>`luxe.Core`</small>



---

`class`extends <code><span>snow.App</span></code>
<span class="meta">
<br/>meta: @:noCompletion, @:keep, @:log_as(&quot;luxe&quot;)
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="game"><a class="lift" href="#game">game</a></a><div class="clear"></div><code class="signature apipage">game : [luxe.Game](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="core_thread"><a class="lift" href="#core_thread">core\_thread</a></a><div class="clear"></div><code class="signature apipage">core\_thread : [cpp.vm.Thread](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="thread_message"><a class="lift" href="#thread_message">thread\_message</a></a><div class="clear"></div><code class="signature apipage">thread\_message : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="console_visible"><a class="lift" href="#console_visible">console\_visible</a></a><div class="clear"></div><code class="signature apipage">console\_visible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="headless"><a class="lift" href="#headless">headless</a></a><div class="clear"></div><code class="signature apipage">headless : [Bool](#)</code><br/></span>
            <span class="small_desc_flat">Set to true if the app is running without a window</span><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><div class="clear"></div><code class="signature apipage">debug : [luxe.Debug](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><div class="clear"></div><code class="signature apipage">draw : [luxe.Draw](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><div class="clear"></div><code class="signature apipage">timer : [luxe.Timer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><div class="clear"></div><code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><div class="clear"></div><code class="signature apipage">input : [luxe.Input](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><div class="clear"></div><code class="signature apipage">audio : [luxe.Audio](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><div class="clear"></div><code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><div class="clear"></div><code class="signature apipage">renderer : [phoenix.Renderer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="screen"><a class="lift" href="#screen">screen</a></a><div class="clear"></div><code class="signature apipage">screen : [luxe.Screen](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><div class="clear"></div><code class="signature apipage">physics : [luxe.Physics](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shutting_down"><a class="lift" href="#shutting_down">shutting\_down</a></a><div class="clear"></div><code class="signature apipage">shutting\_down : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="has_shutdown"><a class="lift" href="#has_shutdown">has\_shutdown</a></a><div class="clear"></div><code class="signature apipage">has\_shutdown : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add_internal_update"><a class="lift" href="#add_internal_update">add\_internal\_update</a></a> <div class="clear"></div><code class="signature apipage">add\_internal\_update(\_update:[Float](#)&nbsp;-&gt; [Void](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a> <div class="clear"></div><code class="signature apipage">ready() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a> <div class="clear"></div><code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a> <div class="clear"></div><code class="signature apipage">shutdown() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a> <div class="clear"></div><code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="show_console"><a class="lift" href="#show_console">show\_console</a></a> <div class="clear"></div><code class="signature apipage">show\_console(\_show:[Bool](#)<span>=true</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a> <div class="clear"></div><code class="signature apipage">onkeydown(keycode:[Int](#)<span></span>, scancode:[Int](#)<span></span>, repeat:[Bool](#)<span></span>, mod:[luxe.ModState](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a> <div class="clear"></div><code class="signature apipage">onkeyup(keycode:[Int](#)<span></span>, scancode:[Int](#)<span></span>, repeat:[Bool](#)<span></span>, mod:[luxe.ModState](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a> <div class="clear"></div><code class="signature apipage">oninputdown(\_name:[String](#)<span></span>, e:[luxe.InputEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a> <div class="clear"></div><code class="signature apipage">oninputup(\_name:[String](#)<span></span>, e:[luxe.InputEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a> <div class="clear"></div><code class="signature apipage">onmousedown(x:[Int](#)<span></span>, y:[Int](#)<span></span>, button:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a> <div class="clear"></div><code class="signature apipage">onmouseup(x:[Int](#)<span></span>, y:[Int](#)<span></span>, button:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a> <div class="clear"></div><code class="signature apipage">onmousemove(x:[Int](#)<span></span>, y:[Int](#)<span></span>, xrel:[Int](#)<span></span>, yrel:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a> <div class="clear"></div><code class="signature apipage">onmousewheel(x:[Int](#)<span></span>, y:[Int](#)<span></span>, timestamp:[Float](#)<span></span>, window\_id:[Int](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a> <div class="clear"></div><code class="signature apipage">ontouchdown(x:[Float](#)<span></span>, y:[Float](#)<span></span>, touch\_id:[Int](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a> <div class="clear"></div><code class="signature apipage">ontouchup(x:[Float](#)<span></span>, y:[Float](#)<span></span>, touch\_id:[Int](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a> <div class="clear"></div><code class="signature apipage">ontouchmove(x:[Float](#)<span></span>, y:[Float](#)<span></span>, dx:[Float](#)<span></span>, dy:[Float](#)<span></span>, touch\_id:[Int](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a> <div class="clear"></div><code class="signature apipage">ongamepadaxis(gamepad:[Int](#)<span></span>, axis:[Int](#)<span></span>, value:[Float](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttondown"><a class="lift" href="#ongamepadbuttondown">ongamepadbuttondown</a></a> <div class="clear"></div><code class="signature apipage">ongamepadbuttondown(gamepad:[Int](#)<span></span>, button:[Int](#)<span></span>, value:[Float](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttonup"><a class="lift" href="#ongamepadbuttonup">ongamepadbuttonup</a></a> <div class="clear"></div><code class="signature apipage">ongamepadbuttonup(gamepad:[Int](#)<span></span>, button:[Int](#)<span></span>, value:[Float](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a> <div class="clear"></div><code class="signature apipage">ongamepaddevice(gamepad:[Int](#)<span></span>, type:[snow.types.GamepadDeviceEventType](#)<span></span>, timestamp:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="config"><a class="lift" href="#config">config</a></a> <div class="clear"></div><code class="signature apipage">config(config:[snow.types.AppConfig](#)<span></span>) : [snow.types.AppConfig](#)</code><br/><span class="small_desc_flat">return what the game decides for runtime config</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_game:[luxe.Game](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;