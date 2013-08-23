
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)

###luxe.Color

<a name="new" href="#new">new</a>

	new Color( _r:Float=1 , _g:Float=1, _b:Float=1 , _a:Float=1 ) : Color   
<span class="small_desc_flat"> Create a new color instance </span> `var color = new Color()`     


<a name="set" href="#set">set</a>

	set( ?_r : Float, ?_g : Float, ?_b : Float, ?_a : Float ) : Color
<span class="small_desc_flat"> Set components of this color, if any components is passed in as null - it will be left as is. </span> `color.set( null, null, 0.5 )`   

	

<a name="clone" href="#clone">clone</a>

	color.clone() 
<span class="small_desc_flat"> Create a copy of this color </span>      

<a name="rgb" href="#rgb">rgb</a>

	color.rgb( _rgb:Int = 0xFFFFFF ) : Color 
<span class="small_desc_flat"> Set the color using a hex based Int, like 0xf6007b </span> `var color = new Color(0,0,0,0.4).rgb(0xf6007b);` 

	      
