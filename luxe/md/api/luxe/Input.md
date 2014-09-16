
[![Logo](../../images/logo.png)](../../api/index.html)

---


<h1>Input</h1>
<small>`luxe.Input`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_binding\_value:[add.T](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">add a named input binding to a `Key` keycode, a `MouseButton`. :todo: add gamepad</span>


</span>
<span class="method apipage">
            <a name="gamepadaxis"><a class="lift" href="#gamepadaxis">gamepadaxis</a></a><div class="clear"></div>
            <code class="signature apipage">gamepadaxis(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_axis:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">immediate query of the axis value of a gamepad axis.</span>


</span>
<span class="method apipage">
            <a name="gamepaddown"><a class="lift" href="#gamepaddown">gamepaddown</a></a><div class="clear"></div>
            <code class="signature apipage">gamepaddown(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the down state of a gamepad button. only true while the button is down</span>


</span>
<span class="method apipage">
            <a name="gamepadpressed"><a class="lift" href="#gamepadpressed">gamepadpressed</a></a><div class="clear"></div>
            <code class="signature apipage">gamepadpressed(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the pressed state of a gamepad button. only true if pressed within one frame</span>


</span>
<span class="method apipage">
            <a name="gamepadreleased"><a class="lift" href="#gamepadreleased">gamepadreleased</a></a><div class="clear"></div>
            <code class="signature apipage">gamepadreleased(\_gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, \_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the released state of a gamepad button. only true if released within one frame</span>


</span>
<span class="method apipage">
            <a name="inputdown"><a class="lift" href="#inputdown">inputdown</a></a><div class="clear"></div>
            <code class="signature apipage">inputdown(\_event:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the down state of a named input. only true while the key is down</span>


</span>
<span class="method apipage">
            <a name="inputpressed"><a class="lift" href="#inputpressed">inputpressed</a></a><div class="clear"></div>
            <code class="signature apipage">inputpressed(\_event:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the pressed state of a named input. only true if pressed within one frame</span>


</span>
<span class="method apipage">
            <a name="inputreleased"><a class="lift" href="#inputreleased">inputreleased</a></a><div class="clear"></div>
            <code class="signature apipage">inputreleased(\_event:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the released state of a named input. only true if released within one frame</span>


</span>
<span class="method apipage">
            <a name="keydown"><a class="lift" href="#keydown">keydown</a></a><div class="clear"></div>
            <code class="signature apipage">keydown(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the down state of a `keycode`, use `Key` for named keycodes. only true while the key is down</span>


</span>
<span class="method apipage">
            <a name="keypressed"><a class="lift" href="#keypressed">keypressed</a></a><div class="clear"></div>
            <code class="signature apipage">keypressed(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the pressed state of a `keycode`, use `Key` for named keycodes. only true if pressed within one frame</span>


</span>
<span class="method apipage">
            <a name="keyreleased"><a class="lift" href="#keyreleased">keyreleased</a></a><div class="clear"></div>
            <code class="signature apipage">keyreleased(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the released state of a `keycode`, use `Key` for named keycodes. only true if released within one frame</span>


</span>
<span class="method apipage">
            <a name="mousedown"><a class="lift" href="#mousedown">mousedown</a></a><div class="clear"></div>
            <code class="signature apipage">mousedown(\_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the down state of a mouse button. only true while the button is down. :todo: use `MouseButton` like it should be.</span>


</span>
<span class="method apipage">
            <a name="mousepressed"><a class="lift" href="#mousepressed">mousepressed</a></a><div class="clear"></div>
            <code class="signature apipage">mousepressed(\_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the pressed state of a mouse button. only true if pressed within one frame</span>


</span>
<span class="method apipage">
            <a name="mousereleased"><a class="lift" href="#mousereleased">mousereleased</a></a><div class="clear"></div>
            <code class="signature apipage">mousereleased(\_button:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the released state of a mouse button. only true if released within one frame</span>


</span>
<span class="method apipage">
            <a name="scandown"><a class="lift" href="#scandown">scandown</a></a><div class="clear"></div>
            <code class="signature apipage">scandown(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the down state of a `scancode`, use `Scan` for named scancodes. only true while the key is down</span>


</span>
<span class="method apipage">
            <a name="scanpressed"><a class="lift" href="#scanpressed">scanpressed</a></a><div class="clear"></div>
            <code class="signature apipage">scanpressed(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the pressed state of a `scancode`, use `Scan` for named scancodes. only true if pressed within one frame</span>


</span>
<span class="method apipage">
            <a name="scanreleased"><a class="lift" href="#scanreleased">scanreleased</a></a><div class="clear"></div>
            <code class="signature apipage">scanreleased(\_code:[Int](http://api.haxe.org/Int.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">immediate query of the released state of a `scancode`, use `Scan` for named scancodes. only true if released within one frame</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;