
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the prev guide](guide.input.html)
###[View all guides](guide.html)

---

## Understanding Components

_This tutorial assumes you are familiar with the basics of [getting started with luxe](guide.gettingstarted.html), and [displaying stuff](guide.sprites.html) on screen, or [handling input](guide.input.html)._

[Jump to the full code listing?](#code)
  

### What are Entities, and what are Components?
---
You have probably heard about about component/entity systems at some point if you have made games, 
and with good reason as they are quite useful for the way games are often structured.

The terms are quite simple to understand -   

- An Entity is a container for components   
- A Component adds some behavior to the Entity it is attached to
 
** A more useful example **

- A Sprite on screen is an Entity, "EnemyTower" sprite   
- A "ShootEveryThreeSeconds" is a component   
- A "TakeDamageUntilZeroAndThenDie" is a component   

This means that generally an entity doesn't do anything on it's own, but by attaching components to it, it can become more specific.

![EntityComponentRelationship](http://luxeengine.com/docs/images/entitycomponents.png)

###Live demo
---
You mouse x position controls the rotation speed.

<div data-content="samples/5_components/index.html" class="sample"> <p>Click to run example</p> </div>

### Anatomy of a Component class
---

Component classes have some default functions that are called for you, much like the game class.
Have a look at the comments in the code below to see them.


	import luxe.Component;

	class MyComponent extends Component {

	    override function init() {
	    	//called when initialising the component
	    }

	    override function update(dt:Float) {
	    	//called every frame for you
	    }

	    override function onreset() {
	    	//called when the scene starts or restarts
	    }

	}


### Understanding the Component transforms
---

Components are directly tied to the entity they are attached to.   

When you change the transform from a component class - it is changing the entity itself.   

`pos.x = 100` changes the **_entity_** position. It is the same as saying `entity.pos.x = 100`.   
`pos` , `rotation` and `scale` affect the entity transform directly. Keep this in mind!

&nbsp;
&nbsp;   

## Creating and accessing entities
---

### Creating entities 
---
Entities are created using the same common pattern of `new Entity(options)`. Remember to import `luxe.Entity`. This entity will automatically be added to the default scene unless you ask it not to be. See the [EntityOptions](api/luxe/options/EntityOptions.html)

	var entity = new Entity({ name:'entity_name' });

The `Sprite` and `Camera` class in luxe extend from the Entity class so that you can add components to them. 

### Accessing entities from other entities and components
---
Entities are stored in the scene by name, so you can fetch them later. This means that when creating your sprite, or entity, you will want to pass the name as well.   
You fetch the sprite from the scene by accessing the entities property from the scene.

	public function init() {

		var sprite = new Sprite({
			name : 'spritename'
		});		

	}

	...

		//at a later time
	var sprite : Sprite = cast Luxe.scene.entities.get('spritename');

&nbsp;   

## Creating and accessing components
---

All components should extend from the luxe Components class in order to benefit from the features of the component class. Extend from the class, like in the anatomy above.

### Adding components to entities
---

Components are added to entities using the `add` function _on the entity_, and the `add` function returns the instance for convenience.
Remember to name things, as the name of the component is crucial for fetching a reference later on. The component name is the unique instance name of this specific component, so remember that!

When you create a custom component, the constructor is in your hands, but remember to call _super_ with the name of the instance. You can see this in the example later.

	var component : Component;
	var entity : Entity;

	override function ready() {

			// create an entity in the default scene
		entity = new Entity({ name:'some_entity' });

			// add/attach a component to the entity.
		component = entity.add(new Component({ name:'some_component' });

	}

### Accessing the entity instance
---

When you are inside of a component and want to access the entity that the component is connected to,    
there is a variable called `entity` that is declared in the Component class as `entity : Entity`. 

When the entity is attached to a sub class of Entity (like a Sprite, which `extends Entity`),   
you can store a typed reference by using the `cast` keyword. Like below :

	var sprite : Sprite;

	override function init() {

		sprite = cast entity;

	}

&nbsp;   


## Accessing other components attached to the entity
---

When you want to access other components attached to the entity, you can use the `get` function.    

The `get` function is available from inside the component class, or from the entity.   

The parameter passed into the get function is the _name of the component instance_ (which is passed into the constructor of the Component. when calling the new function).

&nbsp;   

	var move : Movement;

	override function init() {

		move = cast get('move');

			move.speed *= 2;

		var health : Health = get('health');

			health.amount += 10;

	}

&nbsp;   

## A practical sample
---

To further demonstrate component entity systems, we will do the following : 

- Create a sprite (which is an entity)
- Attach a custom component that will rotate the sprite
- Attach a custom component that will make the sprite bounce

![EntityComponentRelationship](http://luxeengine.com/docs/images/entitycomponents2.png)


#### Output image

![getting started screenshot](images/guide.basiccomponents.png)

<a name="code">
#### Code listing 4
</a>

_(found in samples/guides/5_components/)_

### Rotate.hx

```

import luxe.Vector;

import luxe.Component;
import luxe.Sprite;

//This component will rotate the entity that it is attached to a small amount each frame.
//It is assumed that the entity is a Sprite! 

class Rotate extends Component {


	public var rotate_speed : Float = 10;
	public var max_rotate_speed : Float = 60;

    var sprite : Sprite;

    override function init() {
        sprite = cast entity;
    }

    override function update( dt:Float ) {

    		//changes to the transform inside of components affect the entity directly!
        sprite.rotation_z += rotate_speed * dt;

    } //update

} //Rotate
```

### Bounce.hx

```
import luxe.Component;


class Bounce extends Component {


	var dir : Int = 1;
	var speed : Int = 200;

		//to demonstrate using custom constructor
	public function new(_speed:Int) {

		super({ name:'bounce' });
		speed = _speed;

	} //new

    override function update( dt:Float ) {

        pos.y += speed * dir * dt;
        	//hit the bottom? go back up
        if(pos.y > Luxe.screen.h) {
        	dir = -1;
        }
        	//hit the middle? go down
        if(pos.y < Luxe.screen.h/2) {
        	dir = 1;
        }

    } //update


} //Bounce

```

### Main.hx
```

import luxe.Input;
import luxe.Sprite;
import luxe.Text;
import luxe.Vector;
import luxe.Color;


class Main extends luxe.Game {


	var logo : Sprite;
	var rotator : Rotate;
    var delta_time_text : Text;


    override function ready() {

    	logo = new Sprite({
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            texture : Luxe.loadTexture('assets/luxelogo.png'),
        });

        rotator = new Rotate({ name:'rotator' });
        logo.add(rotator);

        	//we don't need to reference the bounce component, so we just add it.
        logo.add(new Bounce(230));

        delta_time_text = new luxe.Text({
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(60,60),
            font : Luxe.renderer.font,
            size : 20
        });

    } //ready

    override function update(dt:Float) {
            //Update the text each frame
        delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;

    } //update

    override function onmousemove( e:MouseEvent ) {

    	var percent = e.pos.x / Luxe.screen.w;
    	var new_speed = percent * rotator.max_rotate_speed;

    		rotator.rotate_speed = new_speed;

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
```

---

&nbsp;   

<a name="links">
###[To the prev guide](guide.input.html)
###[Back to guides](guide.html)
</a>

&nbsp;   

---
&nbsp;   
&nbsp;   
&nbsp;   



