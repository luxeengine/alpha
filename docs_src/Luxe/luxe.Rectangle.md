
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)

###luxe.Rectangle

<a name="new" href="#new">new</a>

	new Rectangle( ?_x:Float=0, ?_y:Float=0, ?_w:Float=0, ?_h : Float=0 ) : Rectangle   
<span class="small_desc_flat"> Create a new rectangle instance </span> `var rect = new Rectangle(10,10,100,100)`     


<a name="set" href="#set">set</a>

	set( ?_r : Float, ?_g : Float, ?_b : Float, ?_a : Float ) : Rectangle
<span class="small_desc_flat"> Set components of this rect, if any components is passed in as null - it will be left as is. </span> `rect.set( 200,200,20,20 )`   

	

<a name="clone" href="#clone">clone</a>

	rect.clone() 
<span class="small_desc_flat"> Create a copy of this rectangle </span>      
