
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

#[luxe](index.html)
###[Back to types](types.html)

## Luxe Utils API

The utility class contains various functions that prove useful to the library.

### Public methods

**uuid** (returns a Universally Unique Identifier)   
`var unique_id = Luxe.utils.uuid() : String`

### Public Properties

####geometry

Accesssed via `Luxe.utils.geometry`,

**random\_point\_in\_unit\_circle** (returns a random point inside a unit circle [-1,1] )
`var shake_direction = Luxe.utils.geometry.random_point_in_unit_circle() : Vector`

**point\_in\_polygon** point to check, offset of polygon (position relative to vertices), list of vertices (returns if inside)   
`var is_point_inside = Luxe.utils.geometry.point_in_polygon(_point:Vector, _offset:Vector, _verts:Array<Vector> ) : Bool`

