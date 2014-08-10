
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>States</h1>
<small>`luxe.States`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="active_states"><a class="lift" href="#active_states">active\_states</a></a><div class="clear"></div><code class="signature apipage">active\_states : [Array](#)&lt;[luxe.State](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current_state"><a class="lift" href="#current_state">current\_state</a></a><div class="clear"></div><code class="signature apipage">current\_state : [luxe.State](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add_state"><a class="lift" href="#add_state">add\_state</a></a> <div class="clear"></div><code class="signature apipage">add\_state(type:[Class](#)&lt;[add_state.T1](#)&gt;<span></span>, \_name:[String](#)<span>=&#x27;&#x27;</span>, \_construct\_with:[add_state.T2](#)<span>=null</span>) : [add_state.T1](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="enable"><a class="lift" href="#enable">enable</a></a> <div class="clear"></div><code class="signature apipage">enable(\_name:[String](#)<span></span>, \_enable\_with:[enable.T](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="disable"><a class="lift" href="#disable">disable</a></a> <div class="clear"></div><code class="signature apipage">disable(\_name:[String](#)<span></span>, \_disable\_with:[disable.T](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a> <div class="clear"></div><code class="signature apipage">set(name:[String](#)<span></span>, \_enter\_with:[set.T1](#)<span>=null</span>, \_leave\_with:[set.T2](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a> <div class="clear"></div><code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a> <div class="clear"></div><code class="signature apipage">reset() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a> <div class="clear"></div><code class="signature apipage">update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="prerender"><a class="lift" href="#prerender">prerender</a></a> <div class="clear"></div><code class="signature apipage">prerender() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="postrender"><a class="lift" href="#postrender">postrender</a></a> <div class="clear"></div><code class="signature apipage">postrender() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="_call"><a class="lift" href="#_call">\_call</a></a> <div class="clear"></div><code class="signature apipage">\_call(\_object:[luxe.State](#)<span></span>, \_name:[String](#)<span></span>, \_args:[Array](#)&lt;[](#)&gt;<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a> <div class="clear"></div><code class="signature apipage">onkeydown(e:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a> <div class="clear"></div><code class="signature apipage">onkeyup(e:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a> <div class="clear"></div><code class="signature apipage">oninputup(name:[String](#)<span></span>, e:[luxe.InputEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a> <div class="clear"></div><code class="signature apipage">oninputdown(name:[String](#)<span></span>, e:[luxe.InputEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a> <div class="clear"></div><code class="signature apipage">onmousedown(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a> <div class="clear"></div><code class="signature apipage">onmousewheel(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a> <div class="clear"></div><code class="signature apipage">onmouseup(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a> <div class="clear"></div><code class="signature apipage">onmousemove(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a> <div class="clear"></div><code class="signature apipage">ontouchdown(e:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a> <div class="clear"></div><code class="signature apipage">ontouchup(e:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a> <div class="clear"></div><code class="signature apipage">ontouchmove(e:[luxe.TouchEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;