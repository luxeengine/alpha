
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>Core</h1>
<small>`luxe.Core`</small>



<hr/>

`class`extends <code><span>snow.App</span></code><br/><span class="meta">
meta: @:keep, @:noCompletion, @:keep, @:log_as(&quot;luxe&quot;)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><div class="clear"></div>
                <code class="signature apipage">audio : [luxe.Audio](../../api/luxe/Audio.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="console_visible"><a class="lift" href="#console_visible">console\_visible</a></a><div class="clear"></div>
                <code class="signature apipage">console\_visible : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="core_thread"><a class="lift" href="#core_thread">core\_thread</a></a><div class="clear"></div>
                <code class="signature apipage">core\_thread : [cpp.vm.Thread](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><div class="clear"></div>
                <code class="signature apipage">debug : [luxe.Debug](../../api/luxe/Debug.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><div class="clear"></div>
                <code class="signature apipage">draw : [luxe.Draw](../../api/luxe/Draw.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="emitter"><a class="lift" href="#emitter">emitter</a></a><div class="clear"></div>
                <code class="signature apipage">emitter : [luxe.Emitter](../../api/luxe/Emitter.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](../../api/luxe/Events.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="game"><a class="lift" href="#game">game</a></a><div class="clear"></div>
                <code class="signature apipage">game : [luxe.Game](../../api/luxe/Game.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="has_inited"><a class="lift" href="#has_inited">has\_inited</a></a><div class="clear"></div>
                <code class="signature apipage">has\_inited : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="has_shutdown"><a class="lift" href="#has_shutdown">has\_shutdown</a></a><div class="clear"></div>
                <code class="signature apipage">has\_shutdown : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="headless"><a class="lift" href="#headless">headless</a></a><div class="clear"></div>
                <code class="signature apipage">headless : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Set to true if the app is running without a window</span><br/><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><div class="clear"></div>
                <code class="signature apipage">input : [luxe.Input](../../api/luxe/Input.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><div class="clear"></div>
                <code class="signature apipage">physics : [luxe.Physics](../../api/luxe/Physics.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><div class="clear"></div>
                <code class="signature apipage">renderer : [phoenix.Renderer](../../api/phoenix/Renderer.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](../../api/luxe/Scene.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="screen"><a class="lift" href="#screen">screen</a></a><div class="clear"></div>
                <code class="signature apipage">screen : [luxe.Screen](../../api/luxe/Screen.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="shutting_down"><a class="lift" href="#shutting_down">shutting\_down</a></a><div class="clear"></div>
                <code class="signature apipage">shutting\_down : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="thread_message"><a class="lift" href="#thread_message">thread\_message</a></a><div class="clear"></div>
                <code class="signature apipage">thread\_message : [Dynamic](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><div class="clear"></div>
                <code class="signature apipage">timer : [luxe.Timer](../../api/luxe/Timer.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div>
            <code class="signature apipage">config(config:[snow.types.AppConfig](#)<span></span>) : [snow.types.AppConfig](#)</code><br/><span class="small_desc_flat">return what the game decides for runtime config</span>


</span>
<span class="method apipage">
            <a name="emit"><a class="lift" href="#emit">emit</a></a><div class="clear"></div>
            <code class="signature apipage">emit&lt;T&gt;(event:[String](http://api.haxe.org/String.html)<span></span>, data:[emit.T](#)<span>=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a><div class="clear"></div>
            <code class="signature apipage">off&lt;T&gt;(event:[String](http://api.haxe.org/String.html)<span></span>, handler:[off.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a><div class="clear"></div>
            <code class="signature apipage">on&lt;T&gt;(event:[String](http://api.haxe.org/String.html)<span></span>, handler:[on.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadaxis(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, axis:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddevice(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.GamepadDeviceEventType](#)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepaddown"><a class="lift" href="#ongamepaddown">ongamepaddown</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddown(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepadup"><a class="lift" href="#ongamepadup">ongamepadup</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadup(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a><div class="clear"></div>
            <code class="signature apipage">oninputdown(name:[String](http://api.haxe.org/String.html)<span></span>, event:[luxe.InputEvent](../../api/luxe/InputEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a><div class="clear"></div>
            <code class="signature apipage">oninputup(name:[String](http://api.haxe.org/String.html)<span></span>, event:[luxe.InputEvent](../../api/luxe/InputEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><div class="clear"></div>
            <code class="signature apipage">onkeydown(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[luxe.ModState](../../api/luxe/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><div class="clear"></div>
            <code class="signature apipage">onkeyup(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[luxe.ModState](../../api/luxe/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><div class="clear"></div>
            <code class="signature apipage">onmousedown(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><div class="clear"></div>
            <code class="signature apipage">onmousemove(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, xrel:[Int](http://api.haxe.org/Int.html)<span></span>, yrel:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><div class="clear"></div>
            <code class="signature apipage">onmouseup(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a><div class="clear"></div>
            <code class="signature apipage">ontextinput(text:[String](http://api.haxe.org/String.html)<span></span>, start:[Int](http://api.haxe.org/Int.html)<span></span>, length:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.TextEventType](#)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchdown(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchmove(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, dx:[Float](http://api.haxe.org/Float.html)<span></span>, dy:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchup(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a><div class="clear"></div>
            <code class="signature apipage">ready() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="show_console"><a class="lift" href="#show_console">show\_console</a></a><div class="clear"></div>
            <code class="signature apipage">show\_console(\_show:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><div class="clear"></div>
            <code class="signature apipage">shutdown() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;