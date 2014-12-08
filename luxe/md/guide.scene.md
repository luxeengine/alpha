
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## Scenes & Entities
---

###Luxe.Scene
When you initialize a game a default scene is created. Any entities you create automatically belong to this scene.

A scene is essentially an enclosure for all of the entities in your game. You can have multiple scenes within a game, which would function as different levels.

The main benefits of a scene are that it allows you to more easily access and manipulate all of the entities within it. This is done through several functions.

####get named like
If you're looking to perform a function on a group of entities in your scene, say enemies. You could call `get_named_like` with the string "enemy" and you would get an Array of all of the enemies in your scene. Currently this only works on (name.)* searching from the beginning of each name. So searching "enemy" would return enemy1, enemy2, etc. but would not return specific.enemy

####entities
You also have direct access to all of the entities in a given scene. You can access the Map from the `entities` member of Scene.

####reset
Calling reset on your scene will send the reset call to every entity in the scene. Giving an easy way to reset an entire scene like say restarting a level, or anything like that.

####modifying a scene
You can also add and remove entities from your scene manually. Any entity you create in your game will automatically get added to the default scene, but if you wanted to add it to another scene as well you have that functionality with the add function. And if you'd like to remove an entity from a scene there is also a remove function.

---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   