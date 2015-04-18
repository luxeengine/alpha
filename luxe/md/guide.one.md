
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the next guide](guide.two.html)
###[View all guides](guide.html)

----

#### Output image

![getting started screenshot](images/guide.one.gif)

## Getting Started with luxe

Before you get started, make sure you have [installed luxe and that it is working first](setup.html), of course!    

To see what this guide will teach you, click on the demo below!

###Live demo

Move the mouse around

---

<div data-content="samples/1_gettingstarted/index.html" class="sample"> <p>Click to run example</p> </div>

[code listing](#code)

---

### An empty project

For now, as luxe is in development, you can **copy the `luxe/samples/empty` folder as a starting point**.

_This will be automated in future, and in some editors (FlashDevelop) a new project template is already included._

###Basic Anatomy 

#### A flow file?!

When you build a luxe app, it's built by flow, a build tool that reads your project file.
Your **project file is called a flow file**, and has the extension `.flow`.

To build your game, you run flow (discussed further below) and it does all the work.

If you copied the project template, or look inside `samples/empty` you'll see a `project.flow`  file.
Open that up, and you'll find the information specific to that project.

Here's is an example of what that looks like:

![flow-file](images/flow-file.png)

#### Your game in code

The second place to look, is the `src/Main.hx` file, which is where your game begins.

A luxe app in it's very basic form is a single haxe class that extends the `luxe.Game` class. If you override the `ready` function from the luxe game class, you will have the start of a project. If you ran this as is, you would see a blank window with default properties!


```
class Main extends luxe.Game {

	override function ready() {
	   //your game starts here
	}

}
```

Aside from the `ready` function, there are quite a few that you can override in order to handle luxe system events - like `onkeyup(event:KeyEvent)` or `update(dt:Float)`. The first being when a key is released, and update is called every frame for you, so you can update your game logic.

### The empty Game class

If you start from the empty project template, it would look similar to this: 

```

import luxe.Input;

class Main extends luxe.Game {

    override function ready() {

	    //called by luxe for you when you can start coding

    } //ready

    override function onkeyup( e:KeyEvent ) {

	    //called by luxe for you, when a key is released

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

    	//called by luxe for you, each frame, and passes in the
        //delta time (the length in seconds of the last frame).

    } //update


} //Main
```

If you run this app as is, and push the escape key, the application would quit. 

---

###Building and running a luxe app

luxe uses a build toolchain called [flow](http://snowkit.org/flow) to build and run your application. flow is a command line tool but is integrated into tools like [Sublime Text](http://sublimetext.com/3) so that you can work from within a GUI instead of the command line, if you prefer.

####Running from the command line

To run the game from a cli, you simply run `flow run` from within your project folder. If you want to build without running, use `flow build`. If you wanted to run in debug mode (useful for debugging) you would append a `--debug` flag, so the final command would be `flow run --debug`. This is not necessary unless your app is crashing and you need a callstack to see why.

####Running from sublime text 

Make sure the [sublime text plugins](http://snowkit.org/flow/sublimetext) are installed and configured correctly.

Once installed, you open your project folder as a folder in sublime text,

1. set the flow file of your project to be the active flow file
2. press ctrl/cmd + B depending on your platform


---

###Getting something on screen

Now that we have a blank window, let's draw a sprite and move it around!

Remember that to use classes from the luxe package, we need to import them first. At the top of your file, with the other imports, add the following lines. We want to use colors, vectors (a x/y object) and the sprite class.

```
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
```

This will bring the Sprite class into scope, so that can use it directly without using the full name, and the same for the other classes.

Now, inside the ready function we can create a sprite. To use the sprite class, it wants us to specify some options in an object, like a simple object could look like this :

`{  name:'a sprite' }`

This is an object with a `name` property, and it's value set. Since the Sprite class has a lot of options, it is easier to specify only the options we want to through objects (instead of a mega constructors).

For now, we will simply create a small orange block in the middle of the screen, so we need to give it a color, a size and a position. The name is optional, but it will make your project infinitely easier to work with if you name things. 

You will see we store a reference to the sprite and call it block, this is so that we can move it later when the mouse moves.


```
var block : Sprite;

override function ready() {

	block = new Sprite({
		name: 'a sprite',
		pos: Luxe.screen.mid,
		color: new Color().rgb(0xf94b04),
		size: new Vector(128, 128)
	});
   
} //ready

```

There, now if you run this, you will see an orange block, center screen!

---

###Moving things around

&nbsp;
####mouse move

We can use one of the Game classes functions called `onmousemove` to let us know when the mouse is moving - and we can use this information to move the block. To change the position of the block, you set the `pos` property of the block, which has an `x` and a `y` component.

So we start with overriding the `onmousemove` function, and using the event object to set the position of the block :

```
override function onmousemove( event:MouseEvent ) {

	block.pos = event.pos;

} //onmousemove
```

&nbsp;
####rotate on update

Another thing we can do is rotate the block every frame by a small amount, using the update function shown above. The sprite class has a `rotation_z` property which is set in degrees, and controls how many degrees of rotation the sprite will have. If we want to animate the block spinning indefinitely, we simply add a small amount each frame, and scale it by the delta (difference in) time.

If you wonder why you multiply this value, [read this link] when you are done here.

```
override function update( delta:Float ) {

	    //if we add 40 each frame, and scale it by the delta,
        //it becomes 40 degrees per second!
    block.rotation_z += 40 * delta;

} //update
```

---

##conclusion

That's the basics, of getting things on screen and updating things every frame, and using the override functions from the Game class to get key and mouse input.


### What comes next

Well, that's as basic as it gets!
Some of the questions you may have,

- **Where do I find a list of all the supported `Game` class functions?**   
Read the [Game class](api/luxe/Game.html) documentation.   

- **Where do I find a list of all the `Sprite` options?**   
Read the [Sprite options](api/luxe/options/SpriteOptions.html) documentation.   

- **Things that were not discussed include**   
the [color](guide.color.html) class, [mouse events](guide.input.html#mouse), [key events](guide.input.html#keys).

###[To the next guide](guide.two.html)
###[Back to guides](guide.html)

---

<a name="code">
#### Code listing 1 
</a>

_(found in samples/guides/1_gettingstarted/)_


```
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;

class Main extends luxe.Game {

    var block : Sprite;

    override function ready() {

        block = new Sprite({
            name: 'a sprite',
            pos: Luxe.screen.mid,
            color: new Color().rgb(0xf94b04),
            size: new Vector(128, 128)
        });

    } //ready

    override function onmousemove( event:MouseEvent ) {

        block.pos = event.pos;

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update( delta:Float ) {

            //if we add 40 each frame, and scale it by the delta,
            //it becomes 40 degrees per second!
        block.rotation_z += 40 * delta;

    } //update


} //Main
```

&nbsp;

