
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the prev guide](guide.two.html)
###[To the next guide](guide.four.html)
###[View all guides](guide.html)

---

#### Output image

![sprites](images/guide.three.gif)

## Animating sprites

_This tutorial follows on the previous two guides. Read those first._
Especially, this tutorial uses the code from the previous tutorial as a baseline.

Below is a list of what we will cover, and a demo:

- preloading
- sprite animation

###Live demo

Press A/left to move left   
Press D/right to move right   

---

<div data-content="./samples/3_sprite_animation/index.html" class="sample"> <p>Click to run example</p> </div>

[code listing](#code)

---


### Loading multiple assets

When you are working in games, there are commonly sections that have specific assets, and sections that share assets. In luxe, this concept is represented by a **Parcel**. This parcel is a list of assets that can be loaded in a group, and tell you when they are done. They can also be unloaded from the parcel, and loaded directly from a json file, making resource management easy to maintain across menus, UI and the game. 

We will use a Parcel here to avoid worrying about "is this texture ready yet?". If the parcel has completed, we can assume the asset has loaded (unless there is an error state, which is not covered in this guide).

We import _luxe.Parcel_ and _luxe.ParcelProgress_, one is the asset manager, and one is a preloader progress bar graphic that we can use to quickly show a loading bar.

Inside of the ready function, we create them both, like this :

&nbsp;

```
    override function ready() {

            //fetch a list of assets to load from the json file
        var json_asset = Luxe.loadJSON('assets/parcel.json');

            //then create a parcel to load it for us
        var preload = new Parcel();
            preload.from_json(json_asset.json);

            //but, we also want a progress bar for the parcel,
            //this is a default one, you can do your own
        new ParcelProgress({
            parcel      : preload,
            background  : new Color(1,1,1,0.85),
            oncomplete  : assets_loaded
        });

            //go!
        preload.load();

    } //ready
```
---

###On load complete

The function handed to the oncomplete parameter was called _assets_loaded_, and like in the last guide, we ignore the argument it sends us using the \_ .

All we do from here, is create the background imagery, create the player and it's animations, and connect the input.

&nbsp;

```
    function assets_loaded(_) {

        create_apartment();
        create_player();
        create_player_animation();
        connect_input();

    } //assets_loaded
```

### Create the apartment and player

As before, we create the image using _loadTexture_, but this time we don't have to worry about the onload timing as the preloader took care of that. We calculate a good size for the background, and create a sprite to display the image.

Much of the code is similar and will seem familiar, so the code can be viewed in the full code sample, at the end of this guide.

### Sprite animation basics

Animation for sprites in luxe are created as a Component. This is a common design pattern that has been around for a long time, and allows small, modular pieces of code to affect an “Entity”. This design pattern is commonly also referred to as composition, as you compose complex behavior from a simple item, by given it a bunch of components. There is a guide later on specific to components that will go in detail about creating and composing your own, but for now we simply want to use an existing one.

In luxe, a `Sprite` is an `Entity`, so we can attach a `Component` type to it using `add`.

To create a _SpriteAnimation_ component, we import it, create it, and attach it to the player.   
We load some JSON text to define what animations we want, and we use the _animation_ property of the component to change what animation we are seeing.

This is what the animation JSON and image file look :

image file:

![](./samples/3_sprite_animation/assets/player.png)

animation data:
```json
{
    "idle" : {
        "frame_size":{ "x":"32", "y":"73" },
        "frameset": ["1-3", "hold 2", "4","2-1", "hold 10"],
        "loop": "true",
        "speed": "8"
    },
    "walk" : {
        "frame_size":{ "x":"32", "y":"73" },
        "frameset": ["5-10"],
        "loop": "true",
        "speed": "9"
    }
}
```

You can see that the json is quite expressive, allowing timing to be expressed through frame numbers. The speed parameter is frames per second. _Note that frame numbers in images always start at 1. There is no frame 0 in an animation._ 


### Creating the animation and applying it

The animation component has a function to create its animation information from the JSON file, luxe can load the JSON file for us (no need to worry about preloading it, as text based assets like JSON are loaded synchonously by default), and we can attach the component to the sprite directly - storing the instance for later.

&nbsp;

```

    function create_player_animation() {

            //create the animation from a simple json string,
            //the frameset structure allows us to specify things like
            //"animate frames 1-3 and then hold for 2 frames" etc.
        var anim_object = Luxe.loadJSON('assets/anim.json');

            //create the animation component and add it to the sprite
        anim = player.add( new SpriteAnimation({ name:'anim' }) );

            //create the animations from the json
        anim.add_from_json_object( anim_object.json );

            //set the idle animation to active
        anim.animation = 'idle';
        anim.play();

    } //create_player_animation
```
---

###Changing animations

As much of the code is similar for movement, we will look at changing the animations only. By setting the _animation_ property of the component, you can change which animation is playing.

This is a snippet from the update function below :

```
            //set the correct animation
        if(moving) {
            if(anim.animation != 'walk') {
                anim.animation = 'walk';
            }
        } else {
            if(anim.animation != 'idle') {
                anim.animation = 'idle';
            }
        }
```

---

###[To the prev guide](guide.two.html)
###[To the next guide](guide.four.html)
###[Back to all guides](guide.html)

---

<a name="code">
#### Code listing 3
</a>

_(found in samples/guides/3_sprite_animation/)_


```

import luxe.Input;
import luxe.Color;
import luxe.Vector;

import luxe.Parcel;
import luxe.ParcelProgress;

import luxe.Sprite;
import phoenix.Texture;
import luxe.components.sprite.SpriteAnimation;


class Main extends luxe.Game {

    var player : Sprite;
    var anim : SpriteAnimation;
    var image : Texture;

        //these are altered by the screen size later
    var max_left : Float = 0;
    var max_right : Float = 0;
    var move_speed : Float = 0;


    override function ready() {

            //fetch a list of assets to load from the json file
        var json_asset = Luxe.loadJSON('assets/parcel.json');

            //then create a parcel to load it for us
        var preload = new Parcel();
            preload.from_json(json_asset.json);

            //but, we also want a progress bar for the parcel,
            //this is a default one, you can do your own
        new ParcelProgress({
            parcel      : preload,
            background  : new Color(1,1,1,0.85),
            oncomplete  : assets_loaded
        });

            //go!
        preload.load();

    } //ready

        //called when assets are done loading
    function assets_loaded(_) {

        create_apartment();
        create_player();
        create_player_animation();
        connect_input();

    } //assets_loaded

    function create_apartment() {

            //load the image up
        var apartment = Luxe.loadTexture('assets/apartment.png');

            //this makes sure the pixels stay crisp when scaling
        apartment.filter = FilterType.nearest;

            //this calculates how wide the image should be on screen,
            //if we make the image as high as the view itself

        var height = Luxe.screen.h;
        var width = (height/apartment.height) * apartment.width;

        new Sprite({
            name: 'apartment',
            texture: apartment,
            size: new Vector( width, height ),
            centered: false
        });

    } //create_apartment

    function create_player() {

            //load the image
        image = Luxe.loadTexture('assets/player.png');

            //keep pixels crisp
        image.filter = FilterType.nearest;

            //work out the correct size based on a ratio with the screen size
        var frame_width = 32;
        var height = Luxe.screen.h/1.75;
        var ratio = (height/image.height);
        var width = ratio * frame_width;

            //this is an arbitrary ratio I made up :)
        move_speed = width*1.5;

            //screen edge boundary for walking
        max_right = Luxe.screen.w - (width/2);
        max_left = (width/2);

            //start with the idle texture
        player = new Sprite({
            name: 'player',
            texture: image,
            pos : new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height/1.75)),
            size: new Vector(width, height)
        });

    } //create_player

    function create_player_animation() {

            //create the animation from a simple json string,
            //the frameset structure allows us to specify things like
            //"animate frames 1-3 and then hold for 2 frames" etc.
        var anim_object = Luxe.loadJSON('assets/anim.json');

            //create the animation component and add it to the sprite
        anim = player.add( new SpriteAnimation({ name:'anim' }) );

            //create the animations from the json
        anim.add_from_json_object( anim_object.json );

            //set the idle animation to active
        anim.animation = 'idle';
        anim.play();

    } //create_player_animation

    function connect_input() {

        //here, we are going to bind A/left and D/right into a single named
        //input event, so that we can keep our movement code the same when changing keys

        Luxe.input.bind_key('left', Key.left);
        Luxe.input.bind_key('left', Key.key_a);

        Luxe.input.bind_key('right', Key.right);
        Luxe.input.bind_key('right', Key.key_d);

    } //connect_input

    override function update( delta:Float ) {

        //this can get called while waiting, so if it's not
        //ready we just return!
        if(player == null) {
            return;
        }

        var moving = false;

        if(Luxe.input.inputdown('left')) {

            player.pos.x -= move_speed * delta;
            player.flipx = true;

            moving = true;

        } else if(Luxe.input.inputdown('right')) {

            player.pos.x += move_speed * delta;
            player.flipx = false;

            moving = true;

        } //left/right

           //limit to the screen edges
        if(player.pos.x >= max_right) {
            player.pos.x = max_right;
            moving = false;
        }
        if(player.pos.x <= max_left) {
            player.pos.x = max_left;
            moving = false;
        }

            //set the correct animation
        if(moving) {
            if(anim.animation != 'walk') {
                anim.animation = 'walk';
            }
        } else {
            if(anim.animation != 'idle') {
                anim.animation = 'idle';
            }
        }

    } //update

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main

```