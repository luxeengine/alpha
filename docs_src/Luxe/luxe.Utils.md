
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to api](api.html)

## Luxe Utils API

The utility class contains various functions that prove useful to the library.

<a name="PublicMethods" ></a>

### Public methods

**uuid** (returns a Universally Unique Identifier)   
`var unique_id = Luxe.utils.uuid() : String`

<a name="PublicProperties" ></a>

### Public properties

<a class="toplink" href="#">back to top</a>


<a name="geometry" href="#geometry">
#### geometry
</a>


Accesssed via `Luxe.utils.geometry`,

<a name="random_point_in_unit_circle" href="#random_point_in_unit_circle">random_point_in_unit_circle</a>

	var shake_direction = Luxe.utils.geometry.random_point_in_unit_circle() : Vector  
<span class="small_desc_flat"> returns a random point inside a unit circle of radius [-1,1] </span>      

<a name="point_in_polygon" href="#point_in_polygon">point_in_polygon</a>

	var inside = Luxe.utils.geometry.point_in_polygon( _point:Vector, _offset:Vector, _verts:Array<Vector> ) : Bool   
<span class="small_desc_flat"> returns true if the point lies within the vertices of the polygon </span>      

<br/>
<br/>
<br/>
<br/>