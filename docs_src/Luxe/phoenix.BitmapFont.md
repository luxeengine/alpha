
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
<a class="lift" name="onload" href="#onload">onload</a>



    onload : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="kernings" href="#kernings">kernings</a>



    kernings : Map<phoenix.KerningKey,Int>

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="characters" href="#characters">characters</a>



    characters : Map<Int,phoenix.Character>

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="pages" href="#pages">pages</a>



    pages : Map<Int,phoenix.Texture>

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="font_character_count" href="#font_character_count">font_character_count</a>



    font_character_count : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="line_height" href="#line_height">line_height</a>



    line_height : Float

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="on_pages_loaded" href="#on_pages_loaded">on_pages_loaded</a>



    on_pages_loaded : Dynamic

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="pages_loaded" href="#pages_loaded">pages_loaded</a>



    pages_loaded : Int

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="font_size" href="#font_size">font_size</a>



    font_size : Float

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="scale" href="#scale">scale</a>



    scale : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="spacing" href="#spacing">spacing</a>



    spacing : Float

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dimensions" href="#dimensions">dimensions</a>



    dimensions : luxe.Vector

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="get_kerning" href="#get_kerning">get_kerning</a>



    get_kerning(_glyph:Int, _index:Int) : Null<Int>

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="one_page_loaded" href="#one_page_loaded">one_page_loaded</a>



    one_page_loaded(t:phoenix.Texture) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



    new(?_resource_manager:luxe.ResourceManager) 

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="toString" href="#toString">toString</a>



    toString() : String

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_kerning" href="#set_kerning">set_kerning</a>



    set_kerning(_glyph:Int, _index:Int, _amount:Int) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="draw_text" href="#draw_text">draw_text</a>



    draw_text(options:Dynamic) : phoenix.geometry.CompositeGeometry

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_text_dimensions" href="#get_text_dimensions">get_text_dimensions</a>



    get_text_dimensions(_string:String, _scale:luxe.Vector) : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="load_from_string" href="#load_from_string">load_from_string</a>



    load_from_string(?_bitmap_file:String, ?_folder:String, ?onloaded:phoenix.BitmapFont->Void, ?custom_pages:Array<phoenix.Texture>) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="set_character" href="#set_character">set_character</a>



    set_character(_index:Int, _char_info:phoenix.Character) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="on_all_pages_loaded" href="#on_all_pages_loaded">on_all_pages_loaded</a>



    on_all_pages_loaded() : Void

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   