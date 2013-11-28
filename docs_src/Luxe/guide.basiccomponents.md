
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[To the prev guide](guide.sprites.html)
###[To the next guide](guide.html)
###[View all guides](guide.html)

&nbsp;

## Understanding Components

### What are Entities, and what are Components?

_This tutorial assumes you are familiar with the basics of [getting started with luxe](guide.gettingstarted.html), and [displaying stuff](guide.sprites.html) on screen._

[Jump to the full code listing](#code)

You have probably heard about about Component/Entity system at some point if you have made games, 
and with good reason as they are quite useful for the way games are usually layed out.

The terms are quite simple to understand -   
- An Entity is a container for components   
- A Component adds some behavior to the Entity it is attached to

Let's make the terms practical -    
- A Sprite on screen is an Entity, "EnemyTower" sprite   
- A "ShootEveryThreeSeconds" is a component   

This means that generally an entity doesn't do anything on it's own, but by attaching components to it, it can become more specific.

![EntityComponentRelationship](http://luxeengine.com/docs/images/entitycomponents.png)

### Anatomy of a Component class

Component classes have some default functions that are called for you, much like the game class.
Have a look at the comments in the code below to see them.


	import luxe.components.Components.Component;

	class MyComponent extends Component {

	    public function init() {
	    	//called when initialising the component
	    }
	    
	    public function start() {
	    	//called when the scene starts or restarts
	    }

	    public function update(dt:Float) {
	    	//called every frame for you
	    }

	}


### Understanding the Component transforms

Components are directly related to the entity that they are connected to.   
When you change the transform from inside of a component - it is changing the entity itself.

`pos.x = 100` changes the entity position. It is the same as saying `entity.pos.x = 100`.

`pos` , `rotation` and `scale` affect the entity transform directly. Keep this in mind!

&nbsp;
&nbsp;   

## Creating and accessing entities

### Creating entities via the scene class

The Scene class has a `create` function that will return an entity instance.

	var entity = Luxe.scene.create(Entity, 'entity_name');

### Creating entities from classes

Entites can also be created from the constructor but are not added to any scene. This gives you control, but take note of it when something isn't showing up.

	var entity = new Entity();

The `Sprite` and `Camera` class in luxe extend from the Entity class so that you can add components to them. Sprites are automatically added to the default scene unless you tell it not to, by passing `add : false` into the constructor of Sprite.

### Accessing entities from other entities and components

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

## Creating and accessing components

All components should extend from the luxe Components class in order to benefit from the features of the component class. Extend from the class, like in the anatomy above.

### Adding components to entities

Components are added to entities using the `add` function, and the `add` function returns the instance if you want to store a typed reference.
The second parameter is the name of the entity or component, so you can use them by name later on.

For example, inside of your game init function :

	var component : Component;
	var entity : Entity;

	public function init() {

			// create an entity in the default scene
		entity = Luxe.scene.create(Entity, 'some_entity');

			// add/attach a component to the entity.
		component = entity.add(Component, 'some_component');

	}

### Accessing the entity

When you are inside of a component and want to access the entity that the component is connected to,    
there is a variable called `entity` that is declared in the Component class as `entity : Entity`. 

When the entity is attached to a sub class of Entity (like a Sprite, which `extends Entity`),   
you can store a typed reference by using the `cast` keyword. Like below :

	var sprite:Sprite;

	public function init() {

		sprite = cast entity;

	}

### Accessing other components attached to the entity

When you want to access other components attached to the entity, you can use the `get` function.    
The `get` function is available from inside the component class, or from the entity.   
The parameter passed into the get function is the name of the component instance (which is set when calling the `add` function, like above).

	var other_component : Component2;

	function init() {

		other_component = cast get('other_component_name');

		var another_component = entity.get('another');

	}

## A practical sample

To further demonstrate component entity systems, we will do the following : 

- Create a sprite (which is an entity)
- Attach a component that will rotate the sprite
- Attach a component that will make the sprite bounce

![EntityComponentRelationship](http://luxeengine.com/docs/images/entitycomponents2.png)

###[To the prev guide](guide.sprites.html)
###[To the next guide](guide.html)
###[Back to guides](guide.html)

&nbsp;

#### Output image

![getting started screenshot](images/guide.basiccomponents.png)

<a name="code">
#### Code listing 3
</a>

_(found in samples/guides/3_components/)_

### Rotate.hx

	import luxe.components.Components.Component;
	import luxe.Vector;

	//This component will rotate the entity that it is attached to a small amount each frame.
	//It is assumed that the entity is a Sprite! 

	class Rotate extends Component {

		public var rotate_speed : Float = 10;
		public var max_rotate_speed : Float = 60;

	    public function update(dt:Float) {

	    		//changes to the transform inside of components affect the entity directly!
	        rotation.z += rotate_speed * dt;

	    }

	}

### Bounce.hx

	import luxe.components.Components.Component;
	
	class Bounce extends Component {

		var dir : Int = 1;
		var speed : Int = 200;

	    public function update(dt:Float) {
	        pos.y += speed * dir * dt;
	        	//hit the bottom? go back up
	        if(pos.y > Luxe.screen.h) {
	        	dir = -1;
	        }
	        	//hit the middle? go down
	        if(pos.y < Luxe.screen.h/2) {
	        	dir = 1;
	        }
	    }

	}

### Main.hx

	import luxe.Input;
	import luxe.Sprite;
	import luxe.Vector;

	class Main extends luxe.Game {

		var logo : Sprite;
		var rotator : Rotate;

	    public function ready() {

	    	logo = new Sprite({
	            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
	            texture : Luxe.loadTexture('assets/luxelogo.png'),
	        }); 

	            //Now the important bit, we attach a component to an 
	            //entity by calling .add(TypeOfComponent, 'NameOfComponent');
	            //It is important to note that the name of the component must be set 
	            //if you want to fetch it later using .get('NameOfComponent').
	            //If no name is given, it uses a UUID.
	        rotator = logo.add(Rotate, 'rotator');
	        
	        	//we don't need to reference the bounce component, so we just add it.
	        logo.add(Bounce, 'bounce');

	    } //ready

	    public function onmousemove( e:MouseEvent ) {
	    		
	    		//Change the sprite speed based on the mouse x position

	    	var percent = e.pos.x / Luxe.screen.w;
	    	var new_speed = percent * rotator.max_rotate_speed;

	    		rotator.rotate_speed = new_speed;

	    }

	} //Main


&nbsp;
