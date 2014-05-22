
[![Logo](../../images/logo.png)](../../index.html)

---

#Core


&emsp;&emsp;&emsp;home   
[API Index](../../api/index.html#luxe)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[luxe](./) / Core

<br/>

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="audio" href="#audio">audio</a>



`audio : luxe.Audio`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="config" href="#config">config</a>



`config : lime.LimeConfig`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="console_visible" href="#console_visible">console_visible</a>



`console_visible : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="core_thread" href="#core_thread">core_thread</a>



`core_thread : cpp.vm.Thread`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="debug" href="#debug">debug</a>



`debug : luxe.Debug`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="draw" href="#draw">draw</a>



`draw : luxe.Draw`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dt" href="#dt">dt</a>



`dt : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="events" href="#events">events</a>



`events : luxe.Events`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="has_shutdown" href="#has_shutdown">has_shutdown</a>



`has_shutdown : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="host" href="#host">host</a>



`host : Dynamic`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="input" href="#input">input</a>



`input : luxe.Input`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="lime" href="#lime">lime</a>



`lime : lime.Lime`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="log" href="#log">log</a>



`log : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="more_verbose" href="#more_verbose">more_verbose</a>



`more_verbose : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="physics" href="#physics">physics</a>



`physics : luxe.Physics`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="renderer" href="#renderer">renderer</a>



`renderer : phoenix.Renderer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="scene" href="#scene">scene</a>



`scene : luxe.Scene`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="screen" href="#screen">screen</a>



`screen : luxe.Screen`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="shutting_down" href="#shutting_down">shutting_down</a>



`shutting_down : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="thread_message" href="#thread_message">thread_message</a>



`thread_message : Dynamic`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="time" href="#time">time</a>



`time : luxe.Timer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="verbose" href="#verbose">verbose</a>



`verbose : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="version" href="#version">version</a>



`version : String`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="_debug" href="#_debug">_debug</a>



`_debug(value:Dynamic, ?_verbose:Bool, ?_more_verbose:Bool) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="add_internal_update" href="#add_internal_update">add_internal_update</a>



`add_internal_update(_update:Float->Void) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="init" href="#init">init</a>



`init() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load" href="#load">load</a>



`load(library:String, method:String, ?args:Int) : Dynamic`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_host:Dynamic) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ongamepadaxis" href="#ongamepadaxis">ongamepadaxis</a>



`ongamepadaxis(e:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ongamepadball" href="#ongamepadball">ongamepadball</a>



`ongamepadball(e:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ongamepadbuttondown" href="#ongamepadbuttondown">ongamepadbuttondown</a>



`ongamepadbuttondown(e:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ongamepadbuttonup" href="#ongamepadbuttonup">ongamepadbuttonup</a>



`ongamepadbuttonup(e:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ongamepadhat" href="#ongamepadhat">ongamepadhat</a>



`ongamepadhat(e:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="oninputdown" href="#oninputdown">oninputdown</a>



`oninputdown(_name:String, e:luxe.InputEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="oninputup" href="#oninputup">oninputup</a>



`oninputup(_name:String, e:luxe.InputEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onkeydown" href="#onkeydown">onkeydown</a>



`onkeydown(e:luxe.KeyEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onkeyup" href="#onkeyup">onkeyup</a>



`onkeyup(e:luxe.KeyEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmousedown" href="#onmousedown">onmousedown</a>



`onmousedown(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmousemove" href="#onmousemove">onmousemove</a>



`onmousemove(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmouseup" href="#onmouseup">onmouseup</a>



`onmouseup(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onmousewheel" href="#onmousewheel">onmousewheel</a>



`onmousewheel(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onresize" href="#onresize">onresize</a>



`onresize(e:null<null,null>) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ontouchbegin" href="#ontouchbegin">ontouchbegin</a>



`ontouchbegin(e:luxe.TouchEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ontouchend" href="#ontouchend">ontouchend</a>



`ontouchend(e:luxe.TouchEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="ontouchmove" href="#ontouchmove">ontouchmove</a>



`ontouchmove(e:luxe.TouchEvent) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="render" href="#render">render</a>



`render() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_renderer" href="#set_renderer">set_renderer</a>



`set_renderer(_renderer:phoenix.Renderer) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="show_console" href="#show_console">show_console</a>



`show_console(?_show:Bool) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="shutdown" href="#shutdown">shutdown</a>



`shutdown() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="update" href="#update">update</a>



`update() : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   