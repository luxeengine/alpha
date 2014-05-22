
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
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="audio" href="#audio">audio</a>



`audio : luxe.Audio`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="camera" href="#camera">camera</a>



`camera : luxe.Camera`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="core" href="#core">core</a>



`core : luxe.Core`

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

<a class="lift" name="fixed_timestep" href="#fixed_timestep">fixed_timestep</a>



`fixed_timestep : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="input" href="#input">input</a>



`input : luxe.Input`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="mouse" href="#mouse">mouse</a>



`mouse : luxe.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="physics" href="#physics">physics</a>



`physics : luxe.Physics`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="renderer" href="#renderer">renderer</a>



`renderer : phoenix.Renderer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="resources" href="#resources">resources</a>



`resources : luxe.ResourceManager`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="scene" href="#scene">scene</a>



`scene : luxe.Scene`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="timer" href="#timer">timer</a>



`timer : luxe.Timer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="timescale" href="#timescale">timescale</a>



`timescale : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="utils" href="#utils">utils</a>



`utils : luxe.utils.Utils`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="screen" href="#screen">screen</a>



`screen : luxe.Screen`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="time" href="#time">time</a>



`time : Float`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="addGeometry" href="#addGeometry">addGeometry</a>



`addGeometry(_geom:phoenix.geometry.Geometry) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="addGroup" href="#addGroup">addGroup</a>



`addGroup(_group:Int, ?_pre_render:phoenix.Batcher->Void, ?_post_render:phoenix.Batcher->Void) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="createBatcher" href="#createBatcher">createBatcher</a>



`createBatcher(?_name:String, ?_camera:luxe.Camera, ?_add:Bool) : phoenix.Batcher`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="fileDialogFolder" href="#fileDialogFolder">fileDialogFolder</a>



`fileDialogFolder(_title:String, _text:String) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="fileDialogOpen" href="#fileDialogOpen">fileDialogOpen</a>



`fileDialogOpen(_title:String, _text:String) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="fileDialogSave" href="#fileDialogSave">fileDialogSave</a>



`fileDialogSave(_title:String, _text:String) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loadData" href="#loadData">loadData</a>



`loadData(_id:String, ?_onloaded:luxe.DataResource->Void) : luxe.DataResource`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loadFont" href="#loadFont">loadFont</a>



`loadFont(_id:String, ?_path:String, ?_onloaded:phoenix.BitmapFont->Void) : phoenix.BitmapFont`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loadShader" href="#loadShader">loadShader</a>



`loadShader(?_ps_id:String, ?_vs_id:String, ?_onloaded:phoenix.Shader->Void) : phoenix.Shader`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loadSound" href="#loadSound">loadSound</a>



`loadSound(_name:String, _id:String, ?_is_music:Bool, ?_onloaded:luxe.SoundResource->Void) : luxe.SoundResource`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loadText" href="#loadText">loadText</a>



`loadText(_id:String, ?_onloaded:luxe.TextResource->Void) : luxe.TextResource`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loadTexture" href="#loadTexture">loadTexture</a>



`loadTexture(_id:String, ?_onloaded:phoenix.Texture->Void, ?_silent:Bool, ?_asset_bytes:lime.utils.ByteArray) : phoenix.Texture`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loadTextures" href="#loadTextures">loadTextures</a>



`loadTextures(_ids:Array<String>, ?_onloaded:Array->Void, ?_silent:Bool) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="openURL" href="#openURL">openURL</a>



`openURL(_url:String) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="removeGeometry" href="#removeGeometry">removeGeometry</a>



`removeGeometry(_geom:phoenix.geometry.Geometry) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="showConsole" href="#showConsole">showConsole</a>



`showConsole(_show:Bool) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="shutdown" href="#shutdown">shutdown</a>



`shutdown() : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   