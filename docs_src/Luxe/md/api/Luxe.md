
[![Logo](../images/logo.png)](../index.html)

---

#Luxe


&emsp;&emsp;&emsp;home   
[API Index](../api/index.html#)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[](./) / Luxe

<br/>

---


[Members](#Members)   
[Properties](#Properties)   
[StaticMethods](#StaticMethods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="audio" href="#audio">audio</a>



<span class="inline-block static">static</span>`audio : luxe.Audio`

<span class="small_desc_flat"> Access to the audio features </span>   

<a class="lift" name="camera" href="#camera">camera</a>



<span class="inline-block static">static</span>`camera : luxe.Camera`

<span class="small_desc_flat"> Access to the default camera </span>   

<a class="lift" name="core" href="#core">core</a>



<span class="inline-block static">static</span>`core : luxe.Core`

<span class="small_desc_flat"> Direct access to the core engine </span>   

<a class="lift" name="debug" href="#debug">debug</a>



<span class="inline-block static">static</span>`debug : luxe.Debug`

<span class="small_desc_flat"> Access to the core debug features </span>   

<a class="lift" name="draw" href="#draw">draw</a>



<span class="inline-block static">static</span>`draw : luxe.Draw`

<span class="small_desc_flat"> Access to the drawing features </span>   

<a class="lift" name="dt" href="#dt">dt</a>



<span class="inline-block static">static</span>`dt : Float`

<span class="small_desc_flat"> The time the last frame took, this value can be altered or fixed using `Luxe.timescale` or `Luxe.fixed_timestep` </span>   

<a class="lift" name="events" href="#events">events</a>



<span class="inline-block static">static</span>`events : luxe.Events`

<span class="small_desc_flat"> Access to the global event system </span>   

<a class="lift" name="fixed_timestep" href="#fixed_timestep">fixed_timestep</a>



<span class="inline-block static">static</span>`fixed_timestep : Float`

<span class="small_desc_flat"> Set this for a fixed timestep value </span>   

<a class="lift" name="input" href="#input">input</a>



<span class="inline-block static">static</span>`input : luxe.Input`

<span class="small_desc_flat"> Access to the input features </span>   

<a class="lift" name="mouse" href="#mouse">mouse</a>



<span class="inline-block static">static</span>`mouse : luxe.Vector`

<span class="small_desc_flat"> The last known mouse position </span>   

<a class="lift" name="physics" href="#physics">physics</a>



<span class="inline-block static">static</span>`physics : luxe.Physics`

<span class="small_desc_flat"> Access to the physics bindings, if any </span>   

<a class="lift" name="renderer" href="#renderer">renderer</a>



<span class="inline-block static">static</span>`renderer : phoenix.Renderer`

<span class="small_desc_flat"> Access to the rendering system </span>   

<a class="lift" name="resources" href="#resources">resources</a>



<span class="inline-block static">static</span>`resources : luxe.ResourceManager`

<span class="small_desc_flat"> Access to the default resource manager </span>   

<a class="lift" name="scene" href="#scene">scene</a>



<span class="inline-block static">static</span>`scene : luxe.Scene`

<span class="small_desc_flat"> Access to the default luxe scene </span>   

<a class="lift" name="timer" href="#timer">timer</a>



<span class="inline-block static">static</span>`timer : luxe.Timer`

<span class="small_desc_flat"> Access to the timing features </span>   

<a class="lift" name="timescale" href="#timescale">timescale</a>



<span class="inline-block static">static</span>`timescale : Float`

<span class="small_desc_flat"> The scale of time that affects the update rates and deltas </span>   

<a class="lift" name="utils" href="#utils">utils</a>



<span class="inline-block static">static</span>`utils : luxe.utils.Utils`

<span class="small_desc_flat"> Access to the different utilities </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="screen" href="#screen">screen</a>



`screen : luxe.Screen`

<span class="small_desc_flat"> Access to information about the game window (sizes, cursor etc) </span>   

<a class="lift" name="time" href="#time">time</a>



`time : Float`

<span class="small_desc_flat"> The current time in seconds, highest precision from the platform </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="addGeometry" href="#addGeometry">addGeometry</a>



`addGeometry(_geom:phoenix.geometry.Geometry) : Void`

<span class="small_desc_flat"> Add geometry to the default batcher </span>   

<a class="lift" name="addGroup" href="#addGroup">addGroup</a>



`addGroup(_group:Int, ?_pre_render:phoenix.Batcher->Void, ?_post_render:phoenix.Batcher->Void) : Void`

<span class="small_desc_flat"> Add a geometry group to the default batcher </span>   

<a class="lift" name="createBatcher" href="#createBatcher">createBatcher</a>



`createBatcher(?_name:String='batcher', ?_camera:luxe.Camera, ?_add:Bool=true) : phoenix.Batcher`

<span class="small_desc_flat"> Create a batcher, convenience for create batcher, add batcher, and create camera for the batcher. </span>   

<a class="lift" name="fileDialogFolder" href="#fileDialogFolder">fileDialogFolder</a>



`fileDialogFolder(_title:String, _text:String) : String`

<span class="small_desc_flat"> Open the system folder dialog picker </span>   

<a class="lift" name="fileDialogOpen" href="#fileDialogOpen">fileDialogOpen</a>



`fileDialogOpen(_title:String, _text:String) : String`

<span class="small_desc_flat"> Open the system file open dialog picker </span>   

<a class="lift" name="fileDialogSave" href="#fileDialogSave">fileDialogSave</a>



`fileDialogSave(_title:String, _text:String) : String`

<span class="small_desc_flat"> Open the system file save dialog picker </span>   

<a class="lift" name="loadData" href="#loadData">loadData</a>



`loadData(_id:String, ?_onloaded:luxe.DataResource->Void) : luxe.DataResource`

<span class="small_desc_flat"> Load a bytes/data resource </span>   

<a class="lift" name="loadFont" href="#loadFont">loadFont</a>



`loadFont(_id:String, ?_path:String, ?_onloaded:phoenix.BitmapFont->Void) : phoenix.BitmapFont`

<span class="small_desc_flat"> Load a font resource </span>   

<a class="lift" name="loadShader" href="#loadShader">loadShader</a>



`loadShader(?_ps_id:String='default', ?_vs_id:String='default', ?_onloaded:phoenix.Shader->Void) : phoenix.Shader`

<span class="small_desc_flat"> Load a shader resource </span>   

<a class="lift" name="loadSound" href="#loadSound">loadSound</a>



`loadSound(_name:String, _id:String, ?_is_music:Bool=false, ?_onloaded:luxe.SoundResource->Void) : luxe.SoundResource`

<span class="small_desc_flat"> Load a sound resource </span>   

<a class="lift" name="loadText" href="#loadText">loadText</a>



`loadText(_id:String, ?_onloaded:luxe.TextResource->Void) : luxe.TextResource`

<span class="small_desc_flat"> Load a text resource </span>   

<a class="lift" name="loadTexture" href="#loadTexture">loadTexture</a>



`loadTexture(_id:String, ?_onloaded:phoenix.Texture->Void, ?_silent:Bool=false, ?_asset_bytes:lime.utils.ByteArray) : phoenix.Texture`

<span class="small_desc_flat"> Load a texture/image resource </span>   

<a class="lift" name="loadTextures" href="#loadTextures">loadTextures</a>



`loadTextures(_ids:Array<String>, ?_onloaded:Array->Void, ?_silent:Bool=false) : Void`

<span class="small_desc_flat"> Load multiple texture/image resources, useful for preloading </span>   

<a class="lift" name="openURL" href="#openURL">openURL</a>



`openURL(_url:String) : Void`

<span class="small_desc_flat"> Open the system browser with the given URL </span>   

<a class="lift" name="removeGeometry" href="#removeGeometry">removeGeometry</a>



`removeGeometry(_geom:phoenix.geometry.Geometry) : Void`

<span class="small_desc_flat"> Remove geometry to the default batcher </span>   

<a class="lift" name="showConsole" href="#showConsole">showConsole</a>



`showConsole(_show:Bool) : Void`

<span class="small_desc_flat"> show/hide the debug console programmatically </span>   

<a class="lift" name="shutdown" href="#shutdown">shutdown</a>



`shutdown() : Void`

<span class="small_desc_flat"> shutdown the engine and quit </span>   

&nbsp;   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   