
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the prev guide](guide.one.html)
###[To the next guide](guide.three.html)
###[View all guides](guide.html)

---

#### Output image

![sprites screenshot](images/guide.two.gif)

## Drawing images instead of blocks

_This tutorial follows on the previous guide. Read that one first._

Below is a list of what we will cover, and a demo:

- image loading
- sprite flipping
- pixel art scaling
- mapping input

###Live demo

Press A/left to move left   
Press D/right to move right   

---

<div data-content="./samples/2_sprites/index.html" class="sample"> <p>Click to run example</p> </div>

---

### Loading an image asset

Assets are loaded via the luxe API, which offers functions such as `Luxe.loadTexture` to load an image.
Let's start by loading the image of a player sprite, so we can move it around later.

It is important to take note that you don't want to be touching the image reference until it is finished loading and is valid. On platforms like the web, it will take some time for an image to load. **In the next tutorial the built in preloading system is shown for loading multiple assets**. For now, we just connect to the single texture onload handler.

&nbsp;

```
override function ready() {

        //load the image
    image = Luxe.loadTexture('assets/stand.png');

        //tell us once the image is loaded by
        //calling the create_player function
    image.onload = create_player;

} //ready
```
---

###Using the image

Once it's created, we set the filtering correctly for the lower resolution pixel art.   
Then we calculate a size that fits the current window, and create the player sprite itself.

Like in the [previous guide](guide.one.html), Sprites are imported as **luxe.Sprite**, and created with the **new Sprite( options )** pattern.  You will notice that we give the texture to the sprite this time. If you don't specify the _size_ parameter, the texture size will be used.

Another thing to notice here is the \_ in the function arguments. This in haxe simply means "I don't need to know about this argument", which the onload handler for a texture sends. By specifying a \_, we are ignoring it.

&nbsp;

```
 function create_player(_) {

        //now that the image is loaded
        //keep pixels crisp when we resize it
    image.filter = FilterType.nearest;

        //work out the correct size based on a ratio
    var height = Luxe.screen.h/1.75;
    var width = (height/image.height) * image.width;

        //this is an arbitrary ratio I made up :)
    move_speed = width*3;

        //create the player image, and store the reference
        //so that we can move it around later
    player = new Sprite({
        name: 'player',
        texture: image,
        pos : new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height/1.75)),
        size: new Vector(width, height)
    });

} //create_player

```

---

### Basic input handling

To move the player around a bit, we will use one of a few methods to handle input. This type of input handling is called "immediate style" handling, as you check every frame for input and process it.

To make this less hardcoded, we will use a feature of luxe called "named input binding". This will bind multiple keys to a single name, and then we can check if that name is down or not. That way, if for example you were programming a game with customizable controls (which you should always aim to do) this makes it a whole lot easier to do.

To listen for the input, we will make a function called `connect_input` and call it from the end of the `create_player` function.

&nbsp;

```
...

        connect_input();

    } //create_player


    function connect_input() {

        //here, we are going to bind A/left and D/right into a single named
        //input event, so that we can keep our movement code the same

        Luxe.input.add('left', Key.left);
        Luxe.input.add('left', Key.key_a);

        Luxe.input.add('right', Key.right);
        Luxe.input.add('right', Key.key_d);

    } //connect_input

```

---
### The movement logic

In this case, we will use extremely simple movement logic by shifting the player along the x axis. In the next guide, we will add animations so it feels even better.

As you can see, we ask luxe if the input named "left" is pressed down. If that is true, we move left, and flip the image so it faces the correct way. If they are pressing right, we flip it the other direction and move along that way too.

&nbsp;
```
    override function update( delta:Float ) {

        if(Luxe.input.inputdown('left')) {

            player.pos.x -= move_speed * delta;
            player.flipx = true;

        } else if(Luxe.input.inputdown('right')) {

            player.pos.x += move_speed * delta;
            player.flipx = false;

        }

    } //update
```


### Notes
---

- **Where do I find a list of all the `Sprite` options?**   
Read the [Sprite options](api/luxe/options/SpriteOptions.html) documentation.   


---

###[To the prev guide](guide.one.html)
###[To the next guide](guide.three.html)
###[Back to guides](guide.html)

---

<a name="code">
#### Code listing 2
</a>

_(found in samples/guides/2_sprites/)_

```
import luxe.Input;
import luxe.Color;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;


class Main extends luxe.Game {

    var player : Sprite;
    var image : Texture;

        //set by the screen size later
    var move_speed : Float = 0;

    override function ready() {

        //it's important that if you want to build
        //for platforms where loading can take time
        //like on a web page, you must wait for your assets
        //to load before using them.

        //In the next tutorial this is shown using a built in progress bar,
        //for multiple assets, but for now we just use the onload function

        image = Luxe.loadTexture('assets/stand.png');

            //tell us once the image is loaded
        image.onload = create_player;

    } //ready

    function create_player(_) {

            //now that the image is loaded
            //keep pixels crisp
        image.filter = FilterType.nearest;

            //work out the correct size based on a ratio
        var height = Luxe.screen.h/1.75;
        var width = (height/image.height) * image.width;

            //this is an arbitrary ratio I made up :)
        move_speed = width*3;

        player = new Sprite({
            name: 'player',
            texture: image,
            pos : new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height/1.75)),
            size: new Vector(width, height)
        });

        connect_input();

    } //create_player


    function connect_input() {

        //here, we are going to bind A/left and D/right into a single named
        //input event, so that we can keep our movement code the same when changing keys

        Luxe.input.add('left', Key.left);
        Luxe.input.add('left', Key.key_a);

        Luxe.input.add('right', Key.right);
        Luxe.input.add('right', Key.key_d);

    } //connect_input

    override function update( delta:Float ) {

        if(Luxe.input.inputdown('left')) {
            player.pos.x -= move_speed * delta;
            player.flipx = true;
        } else if(Luxe.input.inputdown('right')) {
            player.pos.x += move_speed * delta;
            player.flipx = false;
        }

    } //update

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main

```