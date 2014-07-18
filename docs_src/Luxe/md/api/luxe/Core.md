
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Core</h1>
<small>`luxe.Core`</small>



---

`class`
<span class="meta">
<br/>meta: @:noCompletion, @:keep, @:log_as(&quot;luxe&quot;)
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="host"><a class="lift" href="#host">host</a></a><code class="signature apipage">host : [](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="config"><a class="lift" href="#config">config</a></a><code class="signature apipage">config : [lime.LimeConfig](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="core_thread"><a class="lift" href="#core_thread">core\_thread</a></a><code class="signature apipage">core\_thread : [cpp.vm.Thread](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="thread_message"><a class="lift" href="#thread_message">thread\_message</a></a><code class="signature apipage">thread\_message : [](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="console_visible"><a class="lift" href="#console_visible">console\_visible</a></a><code class="signature apipage">console\_visible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="lime"><a class="lift" href="#lime">lime</a></a><code class="signature apipage">lime : [lime.Lime](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><code class="signature apipage">debug : [luxe.Debug](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><code class="signature apipage">draw : [luxe.Draw](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="time"><a class="lift" href="#time">time</a></a><code class="signature apipage">time : [luxe.Timer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><code class="signature apipage">input : [luxe.Input](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><code class="signature apipage">audio : [luxe.Audio](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><code class="signature apipage">renderer : [phoenix.Renderer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="screen"><a class="lift" href="#screen">screen</a></a><code class="signature apipage">screen : [luxe.Screen](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><code class="signature apipage">physics : [luxe.Physics](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dt"><a class="lift" href="#dt">dt</a></a><code class="signature apipage">dt : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shutting_down"><a class="lift" href="#shutting_down">shutting\_down</a></a><code class="signature apipage">shutting\_down : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="has_shutdown"><a class="lift" href="#has_shutdown">has\_shutdown</a></a><code class="signature apipage">has\_shutdown : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add_internal_update"><a class="lift" href="#add_internal_update">add\_internal\_update</a></a><code class="signature apipage">add\_internal\_update(\_update:<span></span>) : String</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><code class="signature apipage">init() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><code class="signature apipage">shutdown() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><code class="signature apipage">update() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="render"><a class="lift" href="#render">render</a></a><code class="signature apipage">render() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_renderer"><a class="lift" href="#set_renderer">set\_renderer</a></a><code class="signature apipage">set\_renderer(\_renderer:phoenix.Renderer<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="show_console"><a class="lift" href="#show_console">show\_console</a></a><code class="signature apipage">show\_console(\_show:Bool<span>=true</span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onresize"><a class="lift" href="#onresize">onresize</a></a><code class="signature apipage">onresize(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><code class="signature apipage">onkeydown(e:luxe.KeyEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><code class="signature apipage">onkeyup(e:luxe.KeyEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a><code class="signature apipage">oninputdown(\_name:String<span></span>, e:luxe.InputEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a><code class="signature apipage">oninputup(\_name:String<span></span>, e:luxe.InputEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><code class="signature apipage">onmousedown(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><code class="signature apipage">onmousewheel(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><code class="signature apipage">onmouseup(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><code class="signature apipage">onmousemove(e:luxe.MouseEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchbegin"><a class="lift" href="#ontouchbegin">ontouchbegin</a></a><code class="signature apipage">ontouchbegin(e:luxe.TouchEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchend"><a class="lift" href="#ontouchend">ontouchend</a></a><code class="signature apipage">ontouchend(e:luxe.TouchEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><code class="signature apipage">ontouchmove(e:luxe.TouchEvent<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><code class="signature apipage">ongamepadaxis(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadball"><a class="lift" href="#ongamepadball">ongamepadball</a></a><code class="signature apipage">ongamepadball(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadhat"><a class="lift" href="#ongamepadhat">ongamepadhat</a></a><code class="signature apipage">ongamepadhat(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttondown"><a class="lift" href="#ongamepadbuttondown">ongamepadbuttondown</a></a><code class="signature apipage">ongamepadbuttondown(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ongamepadbuttonup"><a class="lift" href="#ongamepadbuttonup">ongamepadbuttonup</a></a><code class="signature apipage">ongamepadbuttonup(e:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(\_host:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><code class="signature apipage">load(library:String<span></span>, method:String<span></span>, args:Int<span>=0</span>) : Dynamic</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;