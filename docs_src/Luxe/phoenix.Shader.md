
[![Logo](http://luxeengine.com/images/logo.png)](index.html)


[Extends](#Extends)   
[Members](#Members)   
[Methods](#Methods)   


&nbsp;   

<a class="lift" name="Extends" ></a>
###Extends   
---
<a class="lift" name="luxe.Resource" href="luxe.Resource.html">luxe.Resource</a>

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="tex1_attribute" href="#tex1_attribute">tex1_attribute</a>



    tex1_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tex2_attribute" href="#tex2_attribute">tex2_attribute</a>



    tex2_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tex3_attribute" href="#tex3_attribute">tex3_attribute</a>



    tex3_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="shader" href="#shader">shader</a>



    shader : lime.gl.GLShader

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tex4_attribute" href="#tex4_attribute">tex4_attribute</a>



    tex4_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tex5_attribute" href="#tex5_attribute">tex5_attribute</a>



    tex5_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tex6_attribute" href="#tex6_attribute">tex6_attribute</a>



    tex6_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="vert_attribute" href="#vert_attribute">vert_attribute</a>



    vert_attribute : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="program" href="#program">program</a>



    program : lime.gl.GLProgram

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tex7_attribute" href="#tex7_attribute">tex7_attribute</a>



    tex7_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="errors" href="#errors">errors</a>



    errors : String

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="normal_attribute" href="#normal_attribute">normal_attribute</a>



    normal_attribute : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="frag_shader" href="#frag_shader">frag_shader</a>



    frag_shader : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="uniforms" href="#uniforms">uniforms</a>



    uniforms : Map<String,Dynamic>

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="vert_shader" href="#vert_shader">vert_shader</a>



    vert_shader : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="modelviewmatrix_attribute" href="#modelviewmatrix_attribute">modelviewmatrix_attribute</a>



    modelviewmatrix_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tcoord_attribute" href="#tcoord_attribute">tcoord_attribute</a>



    tcoord_attribute : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="log" href="#log">log</a>



    log : String

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="color_attribute" href="#color_attribute">color_attribute</a>



    color_attribute : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="projectionmatrix_attribute" href="#projectionmatrix_attribute">projectionmatrix_attribute</a>



    projectionmatrix_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="tex0_attribute" href="#tex0_attribute">tex0_attribute</a>



    tex0_attribute : Dynamic

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="compile" href="#compile">compile</a>



    compile(_type:Int, _source:String, ?_verbose:Bool) : lime.gl.GLShader

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_uniform_vector4" href="#set_uniform_vector4">set_uniform_vector4</a>



    set_uniform_vector4(_name:String, _value:phoenix.Vector) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_uniform_vector3" href="#set_uniform_vector3">set_uniform_vector3</a>



    set_uniform_vector3(_name:String, _value:phoenix.Vector) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_uniform_color" href="#set_uniform_color">set_uniform_color</a>



    set_uniform_color(_name:String, _value:phoenix.Color) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_uniform_float" href="#set_uniform_float">set_uniform_float</a>



    set_uniform_float(_name:String, _value:Float) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="addError" href="#addError">addError</a>



    addError(_error:String) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



    new(_manager:luxe.ResourceManager) 

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_uniform_texture" href="#set_uniform_texture">set_uniform_texture</a>



    set_uniform_texture(_name:String, _value:phoenix.Texture) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_uniform_vector2" href="#set_uniform_vector2">set_uniform_vector2</a>



    set_uniform_vector2(_name:String, _value:phoenix.Vector) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="addLog" href="#addLog">addLog</a>



    addLog(_log:String) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



    destroy() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="deactivate" href="#deactivate">deactivate</a>



    deactivate() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load_from_string" href="#load_from_string">load_from_string</a>



    load_from_string(_vertex_source:String, _fragment_source:String, ?_verbose:Bool) : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="drop" href="#drop">drop</a>



    drop() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_uniform_int" href="#set_uniform_int">set_uniform_int</a>



    set_uniform_int(_name:String, _value:Int) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="activate" href="#activate">activate</a>



    activate() : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="link" href="#link">link</a>



    link() : lime.gl.GLProgram

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   