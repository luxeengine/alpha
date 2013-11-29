
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the prev guide](guide.gettingstarted.html)
###[To the next guide](guide.input.html)
###[View all guides](guide.html)

---

## Drawing images and blocks as sprites

_This tutorial assumes you are familiar with the basics of getting started with luxe, so if you are not sure what is going on, ._

[Jump to the full code listing?](#code)


### Loading images (and other assets)
---

Assets are loaded via the Luxe api, which offers functions such as `Luxe.loadTexture` and `Luxe.loadText` to fetch assets from your asset folder, and get them in your game. If you need a more in depth look at the assets folder, read the [assets documentation](guide.assets.html).


Like in the [previous guide](guide.gettingstarted.html), Sprites are imported as `luxe.Sprite`, and created with the `new Sprite( options )` syntax. 

&nbsp;  

Inside your `ready` function, you can create a sprite like this : 

		sprite_image = new Sprite({
	        pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
	        texture : Luxe.loadTexture('assets/luxelogo.png'),
	        depth : 1,
	    }); //sprite_image


&nbsp;    

###A Texture = An Image
---

You may notice that there is a `texture` property passed in, using the luxe api to load it, and there is also a `depth` value. We set the depth to 1 (higher than 0) because in the next code block, we create a full sized sprite as a big colored block, which would cover up our image if we didn't specify the depth.

	    sprite_block = new Sprite({
	        pos : new Vector(0,0),
	        size : new Vector(Luxe.screen.w, Luxe.screen.h),
	        centered : false,
	        color : new Color(0.6,0.4,0.2,0.2)
	    }); //sprite_block

Now this sprite, by default, will be created at `depth` 0, and will have no texture (just a colored rectangle). The way depth works is that `0 is always < 1`, so it will draw below the higher depths. The depth value is a floating point value (which makes 0.00001 a valid depth above 0 as well) but for your own clarity using whole round numbers is generally easier.

You can also see another option for sprites - the `centered` property. This will make the sprite position based on the top left corner (not the center, which is default). 

The last new option is `size` - which is set to the size of the screen. You can also set the size of an image sprite, which would affect the underlying geometry.

### What comes next
---

Hopefully this is more than enough to get you putting your games together.   
Some of the questions you may have, 

- **What made the sprites appear (and stay) on screen?**   
Read [understanding geometry in luxe](guide.geometry.html).   

- **Where do I find a list of all the supported `Sprite` values to pass in?**    
Read Sprite class documentation  

---

###[To the prev guide](guide.gettingstarted.html)
###[To the next guide](guide.input.html)
###[Back to guides](guide.html)

---

#### Output image

![getting started screenshot](images/guide.sprites.png)

<a name="code">
#### Code listing 2
</a>

_(found in samples/guides/2_sprites/)_


    import luxe.Input;
    import luxe.Color;
    import luxe.Sprite;
    import luxe.Vector;

    class Main extends luxe.Game {

        var sprite_image : Sprite;
        var sprite_block : Sprite;

        public function ready() {

                //create a sprite with an image 
            sprite_image = new Sprite({
                pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
                texture : Luxe.loadTexture('assets/luxelogo.png'),
                depth : 1,
            }); //sprite_image

                //create a sprite just as a block , the size of the window
            sprite_block = new Sprite({
                pos : new Vector(0,0),
                size : new Vector(Luxe.screen.w, Luxe.screen.h),
                centered : false,
                color : new Color(0.6,0.4,0.2,0.2)
            }); //sprite_block

        } //ready

        public function onmousemove( e:MouseEvent ) {

            sprite_image.pos = e.pos;

        } //onmousemove
      
        public function onkeyup( e:KeyEvent ) {
            if(e.key == KeyValue.escape) {
                Luxe.shutdown();
            }
        } //onkeyup

        public function update(dt:Float) {

        } //update

    } //Main