
![Logo](http://underscorediscovery.com/sven/images/logo.png)

#[haxelab](../index.html)
###[Back to types](types.html)

## Lab Utils API

The utility class contains various functions that prove useful to the library.

### Public methods

**uuid** (returns a Universally Unique Identifier)   
`var unique_id = Lab.utils.uuid() : String`

### Public Properties

####geometry

Accesssed via `Lab.utils.geometry`,

**random\_point\_in\_unit\_circle** (returns a random point inside a unit circle [-1,1] )
`var shake_direction = Lab.utils.geometry.random_point_in_unit_circle() : Vector`

**point\_in\_polygon** point to check, offset of polygon (position relative to vertices), list of vertices (returns if inside)   
`var is_point_inside = Lab.utils.geometry.point_in_polygon(_point:Vector, _offset:Vector, _verts:Array<Vector> ) : Bool`

