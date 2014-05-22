
[![Logo](../../images/logo.png)](../../index.html)

---

#Renderer


##[API Index](../../api/index.html#phoenix)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[phoenix](./) / Renderer

<br/>

---


[Members](#Members)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="batchers" href="#batchers">batchers</a>



`batchers : Array<phoenix.Batcher>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="clear_color" href="#clear_color">clear_color</a>



`clear_color : phoenix.Color`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="default_batcher" href="#default_batcher">default_batcher</a>



`default_batcher : phoenix.Batcher`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="default_camera" href="#default_camera">default_camera</a>



`default_camera : phoenix.Camera`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="default_font" href="#default_font">default_font</a>



`default_font : phoenix.BitmapFont`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="default_render_path" href="#default_render_path">default_render_path</a>



`default_render_path : phoenix.RenderPath`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="default_shader" href="#default_shader">default_shader</a>



`default_shader : phoenix.Shader`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="default_shader_textured" href="#default_shader_textured">default_shader_textured</a>



`default_shader_textured : phoenix.Shader`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="render_path" href="#render_path">render_path</a>



`render_path : phoenix.RenderPath`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="resource_manager" href="#resource_manager">resource_manager</a>



`resource_manager : luxe.ResourceManager`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="should_clear" href="#should_clear">should_clear</a>



`should_clear : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="state" href="#state">state</a>



`state : phoenix.RenderState`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="stats" href="#stats">stats</a>



`stats : phoenix.RendererStats`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="stop" href="#stop">stop</a>



`stop : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="stop_count" href="#stop_count">stop_count</a>



`stop_count : Int`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="add_batch" href="#add_batch">add_batch</a>



`add_batch(batch:phoenix.Batcher) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="clear" href="#clear">clear</a>



`clear(_color:phoenix.Color) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



`destroy() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="init" href="#init">init</a>



`init() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load_font" href="#load_font">load_font</a>



`load_font(_fontid:String, ?_path:String='assets/', ?_onloaded:phoenix.BitmapFont->Void) : phoenix.BitmapFont`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load_shader" href="#load_shader">load_shader</a>



`load_shader(_psid:String, ?_vsid:String, ?_onloaded:phoenix.Shader->Void) : phoenix.Shader`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load_texture" href="#load_texture">load_texture</a>



`load_texture(_name:String, ?_onloaded:phoenix.Texture->Void, ?_silent:Bool=false, ?asset_bytes:lime.utils.ByteArray) : phoenix.Texture`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load_texture_from_string_byte_array" href="#load_texture_from_string_byte_array">load_texture_from_string_byte_array</a>



`load_texture_from_string_byte_array(?_name:String='untitled texture', _string_byte_array:String, _width:Int, _height:Int) : phoenix.Texture`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load_textures" href="#load_textures">load_textures</a>



`load_textures(_names:Array<String>, ?_onloaded:Array->Void, ?_silent:Bool=false) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new(_core:luxe.Core) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="onresize" href="#onresize">onresize</a>



`onresize(e:Dynamic) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="process" href="#process">process</a>



`process() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="remove_batch" href="#remove_batch">remove_batch</a>



`remove_batch(batch:phoenix.Batcher) : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   