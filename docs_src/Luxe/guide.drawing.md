
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#drawing)
###[View all guides](guide.html)


## Drawing shapes and geometry in luxe
---

Luxe supports drawing a few shapes by default, each with some very similar options available. We can start by defining which functions are available, these functions are accessed via the Luxe api under `Luxe.draw`.

- line    
- rectangle
- box
- ring
- circle
- arc
- pie
- text

You should notice a pattern here - a rectangle is an outline, and a box is filled in. A ring is an `outline`, a circle is `solid`. An arc is an `outline`, a pie is `solid`. 

---

&nbsp;   
&nbsp;   


## Starting by example, drawing a line
---

	var mid_y = Luxe.screen.h/2;

	Luxe.draw.line({
        p0 : new Vector( 0, mid_y ),
        p1 : new Vector( Luxe.screen.w, mid_y ),
        color : new Color( 0.5, 0.2, 0.2, 1 )
    });

#### And a rectangle : 

	Luxe.draw.rectangle({
        x : 10, 
        y : 10,
        w : Luxe.screen.w - 20, 
        h : Luxe.screen.h - 20,
        color : new Color( 0.4, 0.4, 0.4 )
    });

#### And a circle : 

    Luxe.draw.circle({
        x : Luxe.screen.w/2,
        y : Luxe.screen.h/2,
        r : 50,
        color : new Color( 0.8, 0.3, 0.2, 1 )
    });


###Drawing options 
Each drawing function takes an `options` parameter that can have the following values :

---

### text
    
- text &emsp; The text to draw &emsp; `String` 
- font &emsp; The font to use when drawing &emsp; `BitmapFont` 

&nbsp;   

- pos `Vector`
- color `Color`
- depth `Float`
- group `Int`
- immediate `Bool`
- batcher `Batcher`

---


### line

- p0 &emsp; The first point on the line &emsp; `Vector` 
- p1 &emsp; The second point on the line &emsp; `Vector` 

&nbsp;   

- color `Color`
- depth `Float`
- group `Int`
- immediate `Bool`
- batcher `Batcher`

---

### rectangle / box

- x &emsp; The top left x of the shape &emsp; `Float` 
- y &emsp; The top left y of the shape &emsp; `Float` 
- w &emsp; The width of the shape &emsp; `Float` 
- h &emsp; The height of the shape &emsp; `Float` 

&nbsp;   

- color `Color`
- depth `Float`
- group `Int`
- immediate `Bool`
- batcher `Batcher`

---

### circle / ring

- x &emsp; The x center of the shape &emsp; `Float` 
- y &emsp; The y center of the shape &emsp; `Float` 
- r &emsp; The radius of the circle &emsp; `Float` 

&nbsp;   

- color `Color`
- depth `Float`
- group `Int`
- immediate `Bool`
- batcher `Batcher`

---

### arc / pie

- x  &emsp; The x center of the shape &emsp; `Float`
- y &emsp; The y center of the shape &emsp; `Float`
- r &emsp; The radius of the circle &emsp; `Float` 
- end_angle &emsp; The ending angle of the arc  &emsp; `Float`

&nbsp;   

- color `Color`
- depth `Float`
- group `Int`
- immediate `Bool`
- batcher `Batcher`

---

###Live demo
---

<div data-content="samples/test_draw/index.html" class="sample"> <p>Click to run example</p> </div>

---

### Code from the live demo


	import luxe.Vector;
	import luxe.Color;
	import luxe.Input;

	import phoenix.geometry.CircleGeometry;
	import phoenix.geometry.RingGeometry;
	import phoenix.geometry.LineGeometry;
	import phoenix.geometry.QuadGeometry;
	import phoenix.geometry.RectangleGeometry;

	class Main extends luxe.Game {

	    public var mouse    : Vector;
	    public var line     : LineGeometry; 
	    public var rect     : RectangleGeometry; 
	    public var box      : QuadGeometry; 
	    public var circle   : CircleGeometry; 
	    public var ring     : RingGeometry; 

	    public function ready() {

	        mouse = new Vector();

	        line = Luxe.draw.line({
	            p0 : new Vector( 0, Luxe.screen.h/2 ),
	            p1 : new Vector( Luxe.screen.w, Luxe.screen.h/2 ),
	            color : new Color(0.5,0.2,0.2,1)
	        });

	        rect = Luxe.draw.rectangle({
	            x : 10, y : 10,
	            w : Luxe.screen.w - 20, 
	            h : Luxe.screen.h - 20,
	            color : new Color(0.4,0.4,0.4)
	        });

	        box = Luxe.draw.box({
	            x : 40, y : 40,
	            w : Luxe.screen.w - 80, 
	            h : Luxe.screen.h - 80,
	            color : new Color(0.5,0.2,0.2,0.5)
	        });

	        circle = Luxe.draw.circle({
	            x : Luxe.screen.w/2,
	            y : Luxe.screen.h/2,
	            r : 50,
	            color : new Color(0.8,0.3,0.2,1)
	        });

	        ring = Luxe.draw.ring({
	            x : Luxe.screen.w/2,
	            y : Luxe.screen.h/2,
	            r : 60,
	            color : new Color(1,1,1,1)
	        });

	        Luxe.draw.arc({
	            x : Luxe.screen.w/2,
	            y : Luxe.screen.h/2,
	            r : 70,
	            end_angle:70,
	            color : new Color(1,1,1,1)
	        });

	        Luxe.draw.text({
	            color : new Color(Math.random(),Math.random(),Math.random(),0.5),
	            pos : new Vector( Luxe.screen.w/2, Luxe.screen.h/2 ),
	            text : "Luxe.draw.ring({
	                        \t x : Luxe.screen.w/2,
	                        \t y : Luxe.screen.h/2,
	                        \t r : 70,
	                        \t color : new Color(1,1,1,1)
	                    });\n"
	        });

	    } //ready
	  
	    public function onmousemove(e) {
	        mouse.set(e.x,e.y);
	    }
	    public function onmousedown(e) {
	        mouse.set(e.x,e.y);
	    }
	    public function onmouseup(e) {
	        mouse.set(e.x,e.y);
	    }

	    public function onkeyup(e) {
	        if(e.value == Input.Keys.escape) {
	            Luxe.shutdown();
	        }
	    } //onkeyup

	    public function update(dt:Float) {

	        Luxe.draw.rectangle({
	                //this line is important, as each frame it will create new geometry!
	            immediate : true,
	            x : mouse.x, y : mouse.y,
	            w : 120,
	            h : 120,
	            color : new Color(Math.random(),Math.random(),Math.random(),0.5)
	        });

	        Luxe.draw.text({
	                //this line is important, as each frame it will create new geometry!
	            immediate:true,
	            color : new Color(Math.random(),Math.random(),Math.random(),0.5),
	            pos : mouse,
	            text : Luxe.dt
	        });

	    } //update

	} //Main




&nbsp;   

&nbsp;   

###[Back to feature guide](guide.html#drawing)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   