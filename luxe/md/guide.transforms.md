
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## Transforms
---
### Luxe.Transform

`Transform` is a component that is used to manipulate game objects in a 2D space. Every `Entity` comes with an attached transform that can be used to perform operations related to that Entity.

#### Properties

###### pos
`pos` is a `Vector` that contains the Entity's position coordinates. These can be accessed using `Transform.pos.x` or `Transform.pos.y` for the x and y coordinates respectively.

###### rotation
`rotation` is a `Quaternion` that contains the Entity's rotation. The values can be directly accessed using `Transform.rotation.w`, `Transform.rotation.x`, `Transform.rotation.y` and `Transform.rotation.z` respectively for the w, x, y, and z components. More functionally however you will probably be using the `toeuler` and `setFromEuler` to access the angle.

###### scale
`scale` is a `Vector` that contains the Entity's x and y scale. The values can be accessed using `Transform.scale.x` and `Transform.scale.y` respectively.

###### parent
`parent` is a link to this Entity's parent transform. This is equal to null if there is no parent transform.

###### local

###### origin

###### dirty

###### world


---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   