
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## Utilities and helpers
---

###Geometry utils

Often when dealing with geometry or geometrical constructions (like procedurally generating spaces) it's helpful to have functions or classes to make building complex things easier.

####These functions are accessible through `Luxe.utils.geometry`

The geometrical utils object contains a handful of useful functions for exactly that, some examples:

- Determine line segments that make a smooth circle with a radius of _r_
- Generate a random point within a 1 radius circle area
- Find if a point is inside of this polygon (list of positions, or Geometry)
- Find a point of line intersect with an invisible plane

These functions are easily used by `Luxe.utils.geometry` from anywhere.

As the API changes and more additions are added,    
you will find the full list of utilities in the   
[GeometryUtils API docs](api/luxe/utils/GeometryUtils.html)

###General utilities

These are functions that aren't specific to any discipline so there are many different kinds.   
Some of the examples include :

####These functions are accessible through `Luxe.utils`

- generate a uniqueid or UUID
- get a haxe stacktrace as a string
- find assets in a sequence

###Math utilities

Haxe already has many maths utilities built in, in the [Math](http://api.haxe.org/Math.html) class.

On top of that, there are many game or rendering specific maths functions that are convenient to have,

These are all currently **static functions**, rather than an instance. i.e `Maths.radians( 90 )`

####These functions are accessible through `luxe.utils.Maths`


- is a value within a range (useful for floating point "equality")
- wrap an angle smoothly around a fixed range (like 0~60 or 0~360)
- the nearest power of two value of a number
- smoothstep interpolations
- degrees/radians conversions
- random number helpers


You will find the full list of utilities in the   
[Maths API docs](api/luxe/utils/Maths.html)

---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   