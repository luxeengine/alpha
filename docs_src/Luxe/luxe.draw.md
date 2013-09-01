
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to API](api.html)

[Drawing geometry](#DrawingGeometry)   
[Drawing text](#DrawingText)   

## Luxe Drawing API

To draw using the draw api :

	Luxe.draw.line({
		p0    : new Vector( 0, 0 ),
		p1    : new Vector( Luxe.screen.w, Luxe.screen.h ),
		color : new Color().rgb(0xcc0000)
	});

<a name="DrawingGeometry" ></a>

###Drawing geometry

<a name="line" href="#line">line</a>

	Luxe.draw.line( _options:Dynamic ) : LineGeometry   
<span class="small_desc_flat"> Draw a line, options are - ( option : Type = default )
	<span class="indent">
		`p0 : Vector = new Vector()`   
		`p1 : Vector = new Vector()`   
		`color : Color = new Color()`   
		`depth : Int = 0`   
		`group : Int = 0`   
		`immediate : Bool = false`   
		`batcher : Batcher = Luxe.renderer.default_batcher`   
	</span>
</span>      

<a name="rectangle" href="#rectangle">rectangle</a>

	Luxe.draw.rectangle( _options:Dynamic ) : RectangleGeometry   
<span class="small_desc_flat"> Draw a rectangle, options are - ( option : Type = default )
	<span class="indent">
		`x : Float = 0.0`   
		`y : Float = 0.0`   
		`w : Float = 0.0`   
		`h : Float = 0.0`   
		`color : Color = new Color()`   
		`depth : Int = 0`   
		`group : Int = 0`   
		`immediate : Bool = false`   
		`batcher : Batcher = Luxe.renderer.default_batcher`   
	</span>
</span>      

<a name="DrawingText" ></a>

###Drawing text

<a name="text" href="#text">text</a>

	Luxe.draw.text( _options:Dynamic ) : CompositeGeometry   
<span class="small_desc_flat"> Draw some text, options are - ( option : Type = default )
	<span class="indent">
		`text : String = ''`   
		`font : BitmapFont = Luxe.renderer.default_font`   
		`color : Color = new Color()`   
		`depth : Int = 0`   
		`group : Int = 0`   
		`immediate : Bool = false`   
		`batcher : Batcher = Luxe.renderer.default_batcher`   
	</span>
</span>      
      


<br/>
<br/>
<br/>