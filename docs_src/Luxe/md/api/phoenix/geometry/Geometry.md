
[![Logo](../../../images/logo.png)](../../../index.html)

---

#Geometry


&emsp;&emsp;&emsp;home   
[API Index](../../../api/index.html#phoenix.geometry)   
&emsp;&emsp;&emsp;parent    
[phoenix](../)     
&emsp;&emsp;&emsp;current    
[phoenix.geometry](./) / Geometry

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
<a class="lift" name="added" href="#added">added</a>



`added : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="batchers" href="#batchers">batchers</a>



`batchers : Array<phoenix.Batcher>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dropped" href="#dropped">dropped</a>



`dropped : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="id" href="#id">id</a>



`id : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="immediate" href="#immediate">immediate</a>



`immediate : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="key" href="#key">key</a>



`key : phoenix.geometry.GeometryKey`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="state" href="#state">state</a>



`state : phoenix.geometry.GeometryState`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="static_normal_buffer" href="#static_normal_buffer">static_normal_buffer</a>



`static_normal_buffer : lime.gl.GLBuffer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="static_tcoord_buffer" href="#static_tcoord_buffer">static_tcoord_buffer</a>



`static_tcoord_buffer : lime.gl.GLBuffer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="static_vcolor_buffer" href="#static_vcolor_buffer">static_vcolor_buffer</a>



`static_vcolor_buffer : lime.gl.GLBuffer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="static_vertex_buffer" href="#static_vertex_buffer">static_vertex_buffer</a>



`static_vertex_buffer : lime.gl.GLBuffer`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="submitted" href="#submitted">submitted</a>



`submitted : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="transform" href="#transform">transform</a>



`transform : phoenix.Transform`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="uuid" href="#uuid">uuid</a>



`uuid : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="vertices" href="#vertices">vertices</a>



`vertices : Array<phoenix.geometry.Vertex>`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="clip" href="#clip">clip</a>



`clip : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="clip_rect" href="#clip_rect">clip_rect</a>



`clip_rect : phoenix.Rectangle`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="color" href="#color">color</a>



`color : phoenix.Color`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="depth" href="#depth">depth</a>



`depth : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dirty" href="#dirty">dirty</a>



`dirty : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="group" href="#group">group</a>



`group : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="locked" href="#locked">locked</a>



`locked : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="origin" href="#origin">origin</a>



`origin : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="primitive_type" href="#primitive_type">primitive_type</a>



`primitive_type : phoenix.PrimitiveType`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="shader" href="#shader">shader</a>



`shader : phoenix.Shader`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="texture" href="#texture">texture</a>



`texture : phoenix.Texture`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="visible" href="#visible">visible</a>



`visible : Bool`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="add" href="#add">add</a>



`add(v:phoenix.geometry.Vertex) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="batch" href="#batch">batch</a>



`batch(vertlist:Array<Float>, tcoordlist:Array<Float>, colorlist:Array<Float>, normallist:Array<Float>) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="batch_into_float32array" href="#batch_into_float32array">batch_into_float32array</a>



`batch_into_float32array(vert_index:Int, tcoord_index:Int, color_index:Int, normal_index:Int, vertlist:lime.utils.Float32Array, tcoordlist:lime.utils.Float32Array, colorlist:lime.utils.Float32Array, normallist:lime.utils.Float32Array) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="drop" href="#drop">drop</a>



`drop(?remove:Bool) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_clip" href="#get_clip">get_clip</a>



`get_clip() : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_clip_rect" href="#get_clip_rect">get_clip_rect</a>



`get_clip_rect() : phoenix.Rectangle`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_depth" href="#get_depth">get_depth</a>



`get_depth() : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_dirty" href="#get_dirty">get_dirty</a>



`get_dirty() : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_group" href="#get_group">get_group</a>



`get_group() : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_locked" href="#get_locked">get_locked</a>



`get_locked() : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_shader" href="#get_shader">get_shader</a>



`get_shader() : phoenix.Shader`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_texture" href="#get_texture">get_texture</a>



`get_texture() : phoenix.Texture`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="key_string" href="#key_string">key_string</a>



`key_string() : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new(options:Dynamic) `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="refresh_key" href="#refresh_key">refresh_key</a>



`refresh_key() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="remove" href="#remove">remove</a>



`remove(v:phoenix.geometry.Vertex) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_clip" href="#set_clip">set_clip</a>



`set_clip(val:Bool) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_clip_rect" href="#set_clip_rect">set_clip_rect</a>



`set_clip_rect(val:phoenix.Rectangle) : phoenix.Rectangle`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_color" href="#set_color">set_color</a>



`set_color(val:phoenix.Color) : phoenix.Color`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_depth" href="#set_depth">set_depth</a>



`set_depth(val:Float) : Float`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_dirty" href="#set_dirty">set_dirty</a>



`set_dirty(_dirty:Bool) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_group" href="#set_group">set_group</a>



`set_group(val:Int) : Int`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_locked" href="#set_locked">set_locked</a>



`set_locked(_locked:Bool) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_origin" href="#set_origin">set_origin</a>



`set_origin(_origin:phoenix.Vector) : phoenix.Vector`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_shader" href="#set_shader">set_shader</a>



`set_shader(val:phoenix.Shader) : phoenix.Shader`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_texture" href="#set_texture">set_texture</a>



`set_texture(val:phoenix.Texture) : phoenix.Texture`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_visible" href="#set_visible">set_visible</a>



`set_visible(val:Bool) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="short_id" href="#short_id">short_id</a>



`short_id() : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="str" href="#str">str</a>



`str() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="translate" href="#translate">translate</a>



`translate(_offset:phoenix.Vector) : Void`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   