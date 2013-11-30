
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)

[Properties](#Properties)   
[Extends from Color](#Extended)   

###luxe.Color
---

<a class="lift" name="new" href="#new">new</a>

`new Color( _r:Float=1 , _g:Float=1, _b:Float=1 , _a:Float=1 ) : Color`
<span class="small_desc_flat"> Create a new color instance </span>

<a class="lift" name="set" href="#set">set</a>

`set( ?_r : Float, ?_g : Float, ?_b : Float, ?_a : Float ) : Color`
<span class="small_desc_flat"> Set components of this color, if any components is passed in as null (or not passed in) - it will be left as is. </span> 

<a class="lift" name="clone" href="#clone">clone</a>

`color.clone()`
<span class="small_desc_flat"> Create a copy of this color </span>      

<a class="lift" name="rgb" href="#rgb">rgb</a>

`color.rgb( _rgb:Int = 0xFFFFFF ) : Color`
<span class="small_desc_flat"> Set the color using a hex based Int, like 0xf6007b </span>


<a class="lift" name="tween" href="#tween">tween</a>

`color.tween( ?_time_in_seconds:Float = 0.5, ?_properties_to_tween:Dynamic = null, _override:Bool = true )`
<span class="small_desc_flat"> Tween properties of this color (r,g,b,a for example) from the current values to the ones specific in `properties_to_tween`, like `{ a:0 }` would fade to 0. </span>

<a class="lift" name="toColorHSL" href="#toColorHSL">toColorHSL</a>

`toColorHSL() : ColorHSL`
<span class="small_desc_flat"> Return an HSL version of this color, as a ColorHSL instance </span>

<a class="lift" name="toColorHSV" href="#toColorHSV">toColorHSV</a>

`toColorHSV() : ColorHSV`
<span class="small_desc_flat"> Return an HSV version of this color, as a ColorHSV instance </span>

<a class="lift" name="fromColorHSL" href="#fromColorHSL">fromColorHSL</a>

`fromColorHSL( _color_hsl:ColorHSL )`
<span class="small_desc_flat"> Set the RGB values from a HSL color instance </span>

<a class="lift" name="fromColorHSV" href="#fromColorHSV">fromColorHSV</a>

`fromColorHSV( _color_hsv:ColorHSV )`
<span class="small_desc_flat"> Set the RGB values from a HSV color instance </span>

<a class="lift" name="maxRGB" href="#maxRGB">maxRGB</a>

`color.maxRGB() : Float`
<span class="small_desc_flat"> Get the maximum of the rgb values (useful for color calculations) </span>

<a class="lift" name="minRGB" href="#minRGB">minRGB</a>

`color.minRGB() : Float`
<span class="small_desc_flat"> Get the minimum of the rgb values (useful for color calculations) </span>


&nbsp;   


<a class="lift" name="Properties" ></a>
###Properties
---

<a class="toplink" href="#top">back to top</a>

<a class="lift" name="r" href="#r">r</a>

`color.r : Float`
<span class="small_desc_flat"> The red component of this color </span> 

<a class="lift" name="g" href="#g">g</a>

`color.g : Float`
<span class="small_desc_flat"> The green component of this color </span> 

<a class="lift" name="b" href="#b">b</a>

`color.b : Float`
<span class="small_desc_flat"> The blue component of this color </span> 

<a class="lift" name="a" href="#a">a</a>

`color.a : Float`
<span class="small_desc_flat"> The alpha component of this color </span> 

&nbsp;   

<a class="lift" name="Extended" ></a>
##Extends from color
---

<a class="toplink" href="#top">back to top</a>

These classes inherit all of the functions and properties from Color, and add to it.   


<a name="ColorHSLClass"></a>
###luxe.ColorHSL
---

<a class="lift" name="new" href="#new">new</a>

`new( _h:Float = 0.0, _s:Float = 1.0, _l:Float = 1.0, _a:Float = 1.0 ) : ColorHSL`
<span class="small_desc_flat"> Create a new color instance </span>

<a class="lift" name="set" href="#set">set</a>

`set( ?_h : Float, ?_s : Float, ?_l : Float, ?_a : Float ) : ColorHSL`
<span class="small_desc_flat"> Set components of this color, if any components is passed in as null (or not passed in) - it will be left as is. </span> 


<a class="lift" name="ColorHSLProperties" ></a>
###Properties
---

<a class="lift" name="h" href="#colorhslh">h</a>

`colorhsl.h : Float`
<span class="small_desc_flat"> The red component of this color </span> 

<a class="lift" name="s" href="#colorhsls">s</a>

`colorhsl.s : Float`
<span class="small_desc_flat"> The saturation component of this color </span> 

<a class="lift" name="l" href="#colorhsll">l</a>

`colorhsl.l : Float`
<span class="small_desc_flat"> The lightness component of this color </span> 

<a class="lift" name="ColorHSVClass"></a>
###luxe.ColorHSV
---

<a class="lift" name="new" href="#new">new</a>

`new( _h:Float = 0.0, _s:Float = 0.0, _v:Float = 1.0, _a:Float = 1.0 ) : ColorHSV`
<span class="small_desc_flat"> Create a new color instance </span>

<a class="lift" name="set" href="#set">set</a>

`set( ?_h : Float, ?_s : Float, ?_v : Float, ?_a : Float ) : ColorHSL`
<span class="small_desc_flat"> Set components of this color, if any components is passed in as null (or not passed in) - it will be left as is. </span> 


<a class="lift" name="ColorHSVProperties" ></a>
###Properties
---

<a class="lift" name="h" href="#colorhsvh">h</a>

`colorhsv.h : Float`
<span class="small_desc_flat"> The red component of this color </span> 

<a class="lift" name="s" href="#colorhsvs">s</a>

`colorhsv.s : Float`
<span class="small_desc_flat"> The saturation component of this color </span> 

<a class="lift" name="v" href="#colorhsvv">v</a>

`colorhsv.v : Float`
<span class="small_desc_flat"> The value component of this color </span> 


&nbsp;   

---
###[Back to types](types.html)


&nbsp;   
&nbsp;   
