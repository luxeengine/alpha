
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Debug</h1>
<small>`luxe.Debug`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="core"><a class="lift" href="#core">core</a></a><div class="clear"></div><code class="signature apipage">core : [luxe.Core](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div><code class="signature apipage">visible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="debug_inspector"><a class="lift" href="#debug_inspector">debug\_inspector</a></a><div class="clear"></div><code class="signature apipage">debug\_inspector : [luxe.debug.Inspector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="overlay"><a class="lift" href="#overlay">overlay</a></a><div class="clear"></div><code class="signature apipage">overlay : [phoenix.geometry.QuadGeometry](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div><code class="signature apipage">batcher : [phoenix.Batcher](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="view"><a class="lift" href="#view">view</a></a><div class="clear"></div><code class="signature apipage">view : [phoenix.Camera](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="debug_font"><a class="lift" href="#debug_font">debug\_font</a></a><div class="clear"></div><code class="signature apipage">debug\_font : [phoenix.BitmapFont](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dt_average"><a class="lift" href="#dt_average">dt\_average</a></a><div class="clear"></div><code class="signature apipage">dt\_average : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dt_average_accum"><a class="lift" href="#dt_average_accum">dt\_average\_accum</a></a><div class="clear"></div><code class="signature apipage">dt\_average\_accum : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dt_average_span"><a class="lift" href="#dt_average_span">dt\_average\_span</a></a><div class="clear"></div><code class="signature apipage">dt\_average\_span : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="dt_average_count"><a class="lift" href="#dt_average_count">dt\_average\_count</a></a><div class="clear"></div><code class="signature apipage">dt\_average\_count : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current_view_index"><a class="lift" href="#current_view_index">current\_view\_index</a></a><div class="clear"></div><code class="signature apipage">current\_view\_index : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="last_view_index"><a class="lift" href="#last_view_index">last\_view\_index</a></a><div class="clear"></div><code class="signature apipage">last\_view\_index : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current_view"><a class="lift" href="#current_view">current\_view</a></a><div class="clear"></div><code class="signature apipage">current\_view : [luxe.debug.DebugView](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="padding"><a class="lift" href="#padding">padding</a></a><div class="clear"></div><code class="signature apipage">padding : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><div class="clear"></div><code class="signature apipage">started : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="profile_path"><a class="lift" href="#profile_path">profile\_path</a></a><div class="clear"></div><code class="signature apipage">profile\_path : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="profiling"><a class="lift" href="#profiling">profiling</a></a><div class="clear"></div><code class="signature apipage">profiling : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="shut_down"><a class="lift" href="#shut_down">shut\_down</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">shut\_down : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="views"><a class="lift" href="#views">views</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">views : [Array](#)&lt;[luxe.debug.DebugView](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a> <div class="clear"></div><code class="signature apipage">init() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="start"><a class="lift" href="#start">start</a></a> <div class="clear"></div><code class="signature apipage">start(\_name:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="end"><a class="lift" href="#end">end</a></a> <div class="clear"></div><code class="signature apipage">end(\_name:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_trace_listener"><a class="lift" href="#remove_trace_listener">remove\_trace\_listener</a></a> <div class="clear"></div><code class="signature apipage">remove\_trace\_listener(\_name:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_trace_listener"><a class="lift" href="#add_trace_listener">add\_trace\_listener</a></a> <div class="clear"></div><code class="signature apipage">add\_trace\_listener(\_name:[String](#)<span></span>, \_callback:[](#)&nbsp; -&gt; [haxe.PosInfos](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="create_debug_console"><a class="lift" href="#create_debug_console">create\_debug\_console</a></a> <div class="clear"></div><code class="signature apipage">create\_debug\_console() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a> <div class="clear"></div><code class="signature apipage">onmouseup(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a> <div class="clear"></div><code class="signature apipage">onmousedown(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a> <div class="clear"></div><code class="signature apipage">onmousewheel(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a> <div class="clear"></div><code class="signature apipage">onmousemove(e:[luxe.MouseEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a> <div class="clear"></div><code class="signature apipage">onkeyup(e:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a> <div class="clear"></div><code class="signature apipage">onkeydown(e:[luxe.KeyEvent](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onresize"><a class="lift" href="#onresize">onresize</a></a> <div class="clear"></div><code class="signature apipage">onresize(e:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="switch_view"><a class="lift" href="#switch_view">switch\_view</a></a> <div class="clear"></div><code class="signature apipage">switch\_view() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="show_console"><a class="lift" href="#show_console">show\_console</a></a> <div class="clear"></div><code class="signature apipage">show\_console(\_show:[Bool](#)<span>=true</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a> <div class="clear"></div><code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a> <div class="clear"></div><code class="signature apipage">process() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(\_core:[luxe.Core](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="internal_trace"><a class="lift" href="#internal_trace">internal\_trace</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">internal\_trace(v:[Dynamic](#)<span></span>, inf:[haxe.PosInfos](#)<span>=null</span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;