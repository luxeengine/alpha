
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

- preloading with a progress bar
- sprite animation

###Live demo

Press A/left to move left   
Press D/right to move right   

---

<div data-content="./samples/3_sprite_animation/index.html" class="sample"> <p>Click to run example</p> </div>

[code listing](#code)

---


### Preloading with a progress bar

When you are working in games, there are often sections that have specific assets, and sections that share assets. In luxe, this concept is represented by a **Parcel**. This parcel is a list of assets that are loaded in a group, and removed in a group.

To show a progress bar while our Parcel is loading, we import _luxe.Parcel_ and _luxe.ParcelProgress_, the default progress bar. You can extend from this class, and customize the progress bar however you want. You can also listen for the events from the parcel instead.

Inside of the ready function, we create them both like this :

&nbsp;

```
    override function ready() {

            //A parcel is a group of resources,
            //which allows us to conveniently load
            //them all at once and keep track. We add
            //the list of resources we want to the
            //parcel when creating it, and then
            //tell it to load.

        var parcel = new Parcel({
            jsons:[ { id:'assets/anim.json' } ],
            textures : [
                { id: 'assets/apartment.png' },
                { id: 'assets/player.png' }
            ],
        });

            //but, before we load it, we also want to
            //display a simple progress bar for the parcel,
            //this is a default one, you can create your own
        new ParcelProgress({
            parcel      : parcel,
            background  : new Color(1,1,1,0.85),
            oncomplete  : assets_loaded
        });

            //go!
        parcel.load();

    } //ready
```
---

###On load complete

The function handed to the oncomplete parameter - we named it _assets_loaded_.

You'll notice that the function has a \_ for an argument. You can use this when you are using a function callback (like we are, asking the progress bar to call back to us when it's done) and you don't need the values it's giving you. It's a bit like an unnamed argument, we don't need it so we ignore it.

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

As before, we now fetch the already loaded image using `Luxe.resources.texture`. We calculate a good size for the background, and create a sprite to display the image - as before.

Much of the code is similar and will seem familiar, so the code can be viewed in the full code sample, at the end of this guide.

### Sprite animation basics

Animation for sprites in luxe are created as a Component, and attached to a sprite.

**A Component?!**   
This is a common design pattern that has been around for a long time. It allows small, modular pieces of code to affect any “Entity”. This design pattern is commonly also referred to as composition, as you compose complex behavior from a simple base item, by given it a bunch of components.

There is a guide in one of the next tutorials specific to components - so for now we simply want to use an existing one, the `SpriteAnimation` component.

You will find that many engines have some variant of the `Component` type, but there are differences in how they behave, how they function and more. Don't assume because the name of the pattern is the same, that the functionality or behavior is the same.

**A Sprite is an Entity**   
In luxe, a `Sprite` is an `Entity`, so we can attach a `Component` type to it using `add`. A Sprite is a container for components.

To create a _SpriteAnimation_, we import it and create an instance as usual, and attach it to the player once we have done this.   

**Animation data**
Previously we loaded some JSON text using the parcel. Inside this JSON file, was a list of animations. These are stored in the animation component, and later we can use the _animation_ property to change what animation we are seeing.

This is how the animation image looks :

image file:

![](./samples/3_sprite_animation/assets/player.png)

This is how the animation data looks, in the json file:


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


### Creating the animation

The animation component has a function to create its animation information from the JSON data we have loaded - and we also store a reference to the animation component because we want to use it to change the animation when moving.

Here is how we create the animation, add it to the sprite, and set the idle animation as active. You'll notice instead of `Luxe.resources.texture` we use `Luxe.resources.json`.

&nbsp;

```
    function create_player_animation() {

            //create the animation from the previously loaded json,
            //the frameset structure allows us to specify things like
            //"animate frames 1-3 and then hold for 2 frames" etc.
        var anim_object = Luxe.resources.json('assets/anim.json');

            //create the animation component and add it to the sprite
        anim = player.add( new SpriteAnimation({ name:'anim' }) );

            //create the animations from the json
        anim.add_from_json_object( anim_object.asset.json );

            //set the idle animation to active
        anim.animation = 'idle';
        anim.play();

    } //create_player_animation
```
---

###Changing animations

As much of the code is similar for movement, we will look at changing the animations only. By setting the _animation_ property of the component, you can change which animation is playing - like we did for the `idle` animation when creating it.

This is a snippet from the update function below :

```haxe
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
