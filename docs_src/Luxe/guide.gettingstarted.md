
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the next guide](guide.sprites.html)
###[View all guides](guide.html)

----

## Getting Started with Luxe

### What is luxe?
---

Luxe is a game focused framework, which is written in haxe to offer many output platforms sharing the same code.
It focuses on performance, usability, flexibility and rapid iteration.   

Luxe is made so that you can make game jam games quickly, but also in such a way that bigger longer term projects still make sense. 
For a much deeper look at how luxe is built and why, see this guide [here](understandingluxe.html).

&nbsp;

### Actually getting started

---

If you are ready to get something on screen, let's dive straight in. For a full code listing [click here](#code).
Make sure you have [installed luxe and that it is working first](setup.html), of course.    

You can create an empty project in a folder by using `luxe create empty project_name`, or by copying the empty folder from the `template_projects/empty` folder yourself.

&nbsp;

### What the empty project code looks like

---

    import luxe.Input;

    class Main extends luxe.Game {

        public function ready() {
        	//called by luxe for you when the game is starting
        } //ready
      
        public function onkeyup( e:KeyEvent ) {

        		//called by luxe for you, when a key is released
                //so, when the escape key is pressed, quit!
            if(e.key == KeyValue.escape) {
                Luxe.shutdown();
            }
        } //onkeyup

        public function update(dt:Float) {
        	//called by luxe for you, each frame, and passes in the
            //delta time (the length in seconds of the last frame).
        } //update

    } //Main

&nbsp;

### Drawing something
---

The class above shows the basic functions that a game _can_ implement. A full list of functions are shown here, but for a basic game, you can implement only the important functions like `ready`, `update` and `onkeyup`.    

Now you can draw something inside the `ready` function, and it will appear on screen. Let's draw a [box](luxe.draw.html#box), and a [ring](luxe.draw.html#ring) around the box. We store the ring as a class member, because we want to move it later on. 

**Take note** that the Geometry classes are considered "low level" and later guides show you easier ways of making objects (like [sprites](guide.sprites.html))

###Drawing a ring on screen
---
	var ring : RingGeometry;

    public function ready() {

        var middle_screen_x = Luxe.screen.w / 2;
        var middle_screen_y = Luxe.screen.h / 2;

        var box = Luxe.draw.box({
            x: middle_screen_x - 45,
            y: middle_screen_y - 45,
            w: 90,
            h: 90,
            color : new Color().rgb(0xff5917)
        });

        ring = Luxe.draw.ring({
            x: middle_screen_x,
            y: middle_screen_y,
            r: 70
        });

    } //ready

### Moving the ring

To move the ring, you can set the `.pos` value of the geometry that was returned by Luxe. To make this simpler, we will use the `onmousemove` function from luxe, by adding it to our class like below :
	
	public function onmousemove( e:MouseEvent ) {

            //move the ring to the mouse position
        ring.pos = e.pos;

    } //onmousemove


### What comes next

Well, that's as basic as it gets! 
Some of the questions you may have, 

- **Do I have to deal with lower level geometry?**   
No! Read the next guide [drawing images as sprites](guide.sprites.html)   

- **What made the geometry appear (and stay) on screen?**   
Read [understanding geometry in luxe](guide.geometry.html).   

- **Where do I find a list of all the supported `Game` class functions?**    
Read [game class documentation](luxe.Game.html).   

- **Things that were not discussed include**    
the Color class, [mouse events](luxe.Input.MouseEvent.html), [key events](luxe.Input.KeyEvent.html).

###[To the next guide](guide.sprites.html)
###[Back to guides](guide.html)

&nbsp;

#### Output image

![getting started screenshot](images/guide.gettingstarted.png)

<a name="code">
#### Code listing 1 
</a>

_(found in samples/guides/1_gettingstarted/)_


    import luxe.Input;
    import luxe.Color;

    import phoenix.geometry.RingGeometry;

    class Main extends luxe.Game {

        var ring : RingGeometry;

        public function ready() {

            var middle_screen_x = Luxe.screen.w / 2;
            var middle_screen_y = Luxe.screen.h / 2;

            var box = Luxe.draw.box({
                x: middle_screen_x - 45,
                y: middle_screen_y - 45,
                w: 90,
                h: 90,
                color : new Color().rgb(0xff5917)
            });

            ring = Luxe.draw.ring({
                x: middle_screen_x,
                y: middle_screen_y,
                r: 70
            });

        } //ready

        public function onmousemove( e:MouseEvent ) {

                //move the ring to the mouse position
            ring.pos = e.pos;

        } //onmousemove
      
        public function onkeyup( e:KeyEvent ) {
            if(e.key == KeyValue.escape) {
                Luxe.shutdown();
            }
        } //onkeyup

        public function update(dt:Float) {

        } //update

    } //Main


&nbsp;

