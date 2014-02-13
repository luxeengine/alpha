
[![Logo](http://luxeengine.com/images/logo.png)](index.html)


[Members](#Members)   
[Methods](#Methods)   


&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="profile_path" href="#profile_path">profile_path</a>



    profile_path : String

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="visible" href="#visible">visible</a>



    visible : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="started" href="#started">started</a>



    started : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="view" href="#view">view</a>



    view : phoenix.Camera

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="views" href="#views">views</a>



    views : Array<luxe.debug.DebugView>

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="current_view_index" href="#current_view_index">current_view_index</a>



    current_view_index : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dt_average" href="#dt_average">dt_average</a>



    dt_average : Float

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="shut_down" href="#shut_down">shut_down</a>



    shut_down : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="last_view_index" href="#last_view_index">last_view_index</a>



    last_view_index : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="batcher" href="#batcher">batcher</a>



    batcher : phoenix.Batcher

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dt_average_accum" href="#dt_average_accum">dt_average_accum</a>



    dt_average_accum : Float

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="profiling" href="#profiling">profiling</a>



    profiling : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="overlay" href="#overlay">overlay</a>



    overlay : phoenix.geometry.QuadGeometry

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="padding" href="#padding">padding</a>



    padding : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="current_view" href="#current_view">current_view</a>



    current_view : luxe.debug.DebugView

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dt_average_span" href="#dt_average_span">dt_average_span</a>



    dt_average_span : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="debug_font" href="#debug_font">debug_font</a>



    debug_font : phoenix.BitmapFont

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="debug_inspector" href="#debug_inspector">debug_inspector</a>



    debug_inspector : luxe.debug.Inspector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="core" href="#core">core</a>



    core : luxe.Core

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dt_average_count" href="#dt_average_count">dt_average_count</a>



    dt_average_count : Int

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="onresize" href="#onresize">onresize</a>



    onresize(e:null<null,null>) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="process" href="#process">process</a>



    process() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmousedown" href="#onmousedown">onmousedown</a>



    onmousedown(e:luxe.MouseEvent) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmousewheel" href="#onmousewheel">onmousewheel</a>



    onmousewheel(e:luxe.MouseEvent) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="switch_view" href="#switch_view">switch_view</a>



    switch_view() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmouseup" href="#onmouseup">onmouseup</a>



    onmouseup(e:luxe.MouseEvent) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onkeydown" href="#onkeydown">onkeydown</a>



    onkeydown(e:luxe.KeyEvent) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="create_debug_console" href="#create_debug_console">create_debug_console</a>



    create_debug_console() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="add_trace_listener" href="#add_trace_listener">add_trace_listener</a>



    add_trace_listener(_name:String, _callback:null->haxe.PosInfos->Void) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



    new(_core:luxe.Core) 

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmousemove" href="#onmousemove">onmousemove</a>



    onmousemove(e:luxe.MouseEvent) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="remove_trace_listener" href="#remove_trace_listener">remove_trace_listener</a>



    remove_trace_listener(_name:String) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="start" href="#start">start</a>



    start(_name:String) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="internal_trace" href="#internal_trace">internal_trace</a>



    internal_trace(v:Dynamic, ?inf:haxe.PosInfos) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



    destroy() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="show_console" href="#show_console">show_console</a>



    show_console(?_show:Bool) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onkeyup" href="#onkeyup">onkeyup</a>



    onkeyup(e:luxe.KeyEvent) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="end" href="#end">end</a>



    end(_name:String) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="init" href="#init">init</a>



    init() : Void

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   