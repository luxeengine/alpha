
[![Logo](http://luxeengine.com/images/logo.png)](index.html)


###[View all guides](guide.html)

## Understanding Components

### What are Entity and Components?

You have probably heard about about Component/Entity system at some point if you have made games, 
and with good reason as they are quite useful for the way games are usually layed out.

The terms are quite simple to understand -   
- An Entity is a container for components   
- A Component adds a behavior to the Entity is is attached to   

Let's make the terms practical -    
- A Sprite on screen is an Entity, "EnemyTower" sprite   
- A "ShootEveryThreeSeconds" is a component   

This means that generally an entity doesn't do anything on it's own, but by attaching components to it, it can become specific.

Let's take a look at another example for a game like space invaders : 

Entities :

- Player extends Entity   
- Enemy extends Entity   

Now, components :

- TakesDamage extends Component    
- DealsDamage extends Component    
- KeyInput extends Component    
- MouseInput extends Component    

Here, we can attach the components to the entities. 
You will notice that the Components are fairly granular, this is because we can share components between entities.

`TakesDamage` can be shared between anything in the game that has the concept of health. Like the Player, and the Enemy. If you later decided to add an asteroid entity that has health? You already have the functionality you need. Just add the component to the asteroid.

`TakesDamage` is a simple component that stores a health value, and has a function similar to `takeDamage( amount:Float )`, which will maybe look something like this : 
	
	var health : Float = 100;

	public function takeDamage( amount:Float ) {
		health -= amount;
		if(health <= 0) {
			health = 0;
			IHaveDied();
		}
	}

`DealsDamage` is the sort of component that will call the above function, from maybe a Bullet entity, when it collides with an enemy.

	var damage_to_inflict : Float = 20;

	public function dealDamage( to:Entity ) {

		var take_damage_component : TakesDamage = to.get('TakesDamage');

			take_damage_component.takeDamage( damage_to_inflict );

	} //dealDamage


This code should hopefully help you understand that components are usually focused and simple classes that are added to entities to give them behaviors.
You can see a more concrete example in the code listing at the end of this guide.

### Anatomy of a Component class


	import luxe.components.Components.Component;

	class MyComponent extends Component {

	    public function init() {
	    	//called when initialising the component
	    }
	    
	    public function start() {
	    	//called when the scene starts or restarts
	    }

	    public function update(dt:Float) {
	    	//called every frame
	    }

	}



