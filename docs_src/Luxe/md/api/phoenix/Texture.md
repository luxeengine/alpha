
[![Logo](../../images/logo.png)](../../index.html)

---

#Texture


&emsp;&emsp;&emsp;home   
[API Index](../../api/index.html#phoenix)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[phoenix](./) / Texture

<br/>

---


[Extends](#Extends)   
[Members](#Members)   
[Properties](#Properties)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Extends" ></a>
###Extends   
---
<a class="lift" name="luxe.Resource" href="{{{rel_path}}}api/luxe/Resource.html">luxe.Resource</a>

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="_onload_handlers" href="#_onload_handlers">_onload_handlers</a>



`_onload_handlers : Array<null>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="actual_height" href="#actual_height">actual_height</a>



`actual_height : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="actual_width" href="#actual_width">actual_width</a>



`actual_width : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="data" href="#data">data</a>



`data : lime.utils.UInt8Array`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="height" href="#height">height</a>



`height : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="loaded" href="#loaded">loaded</a>



`loaded : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="slot" href="#slot">slot</a>



`slot : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="texture" href="#texture">texture</a>



`texture : lime.gl.GLTexture`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="width" href="#width">width</a>



`width : Int`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="clamp" href="#clamp">clamp</a>



`clamp : phoenix.ClampType`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="filter" href="#filter">filter</a>



`filter : phoenix.FilterType`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="filter_mag" href="#filter_mag">filter_mag</a>



`filter_mag : phoenix.FilterType`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="filter_min" href="#filter_min">filter_min</a>



`filter_min : phoenix.FilterType`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onload" href="#onload">onload</a>



`onload : Dynamic`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="activate" href="#activate">activate</a>



`activate(att:lime.gl.GLUniformLocation) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="bind" href="#bind">bind</a>



`bind() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="create_from_bytes" href="#create_from_bytes">create_from_bytes</a>



`create_from_bytes(_asset_name:String, _asset_bytes:haxe.io.Bytes) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="create_from_bytes_html" href="#create_from_bytes_html">create_from_bytes_html</a>



`create_from_bytes_html(_asset_name:String, _asset_bytes:Dynamic, _width:Float, _height:Float) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="create_from_bytes_using_haxe" href="#create_from_bytes_using_haxe">create_from_bytes_using_haxe</a>



`create_from_bytes_using_haxe(_asset_name:String, _asset_bytes:haxe.io.Bytes) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



`destroy() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="do_onload" href="#do_onload">do_onload</a>



`do_onload() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="drop" href="#drop">drop</a>



`drop() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="estimated_memory" href="#estimated_memory">estimated_memory</a>



`estimated_memory() : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="generate_mipmaps" href="#generate_mipmaps">generate_mipmaps</a>



`generate_mipmaps() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_pixel" href="#get_pixel">get_pixel</a>



`get_pixel(_pos:phoenix.Vector) : null<null,null,null,null>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="lock" href="#lock">lock</a>



`lock() : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_manager:luxe.ResourceManager, ?_type:luxe.ResourceType) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_onload" href="#set_onload">set_onload</a>



`set_onload(f:phoenix.Texture->Void) : phoenix.Texture->Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_pixel" href="#set_pixel">set_pixel</a>



`set_pixel(_pos:phoenix.Vector, _color:phoenix.Color) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="toString" href="#toString">toString</a>



`toString() : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="unlock" href="#unlock">unlock</a>



`unlock() : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   