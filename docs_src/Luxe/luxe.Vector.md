
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to types](types.html)

[Properties](#Properties)   
[Transforms](#Transforms)   
[Operations](#Operations)   
[Static Methods](#StaticMethods)   

###luxe.Vector

<a name="new" href="#new">new</a>

	new Vector( ?_x:Float=0, ?_y:Float=0, ?_z:Float=0, ?_w : Float=0 ) : Vector   
<span class="small_desc_flat"> Create a new Vector instance </span> `var pos = new Vector(10,10,10)`     


<a name="set" href="#set">set</a>

	set( ?_r : Float, ?_g : Float, ?_b : Float, ?_a : Float ) : Vector
<span class="small_desc_flat"> Set components of this vector, if any components is passed in as null - it will be left as is. </span> `vector.set( 10, 20 )`   

	

<a name="clone" href="#clone">clone</a>

	vector.clone() 
<span class="small_desc_flat"> Create a copy of this vector </span>      


<a name="dot" href="#dot">dot</a>

	vector.dot( other:Vector ) : Float 
<span class="small_desc_flat"> Return the dot product between this and another vector </span>      

<a name="cross" href="#cross">cross</a>

	vector.cross( other:Vector ) : Float 
<span class="small_desc_flat"> Return the cross product between this and another vector </span>     

<a name="normalize" href="#normalize">normalize</a>

	vector.normalize( other:Vector ) : Float 
<span class="small_desc_flat"> Return the normalize product between this and another vector </span>      

<a name="Properties" ></a>

###Properties

<a class="toplink" href="#top">back to top</a>

<a name="length" href="#length">length</a>

	vector.length : Float
<span class="small_desc_flat"> Return the magnitude/length of this vector </span> 

	vector.normalized : Vector
<span class="small_desc_flat"> Return a normalized copy of this vector </span> 

	vector.inverted : Vector
<span class="small_desc_flat"> Return an copy of this vector </span> 

	vector.listen_x : Float->Void
	vector.listen_y : Float->Void
	vector.listen_z : Float->Void
<span class="small_desc_flat"> Listeners for each component, when a sub component changes, this optional function will be called for you. </span> 

<a name="Transforms" ></a>

###Transforms

<a class="toplink" href="#top">back to top</a>

<a name="setEulerFromQuaternion" href="#setEulerFromQuaternion">setEulerFromQuaternion</a>

	vector.setEulerFromQuaternion( q:Quaternion ) : Vector
<span class="small_desc_flat"> Set this vector from a quaternion value </span> 

<a name="setEulerFromRotationMatrix" href="#setEulerFromRotationMatrix">setEulerFromRotationMatrix</a>

	vector.setEulerFromRotationMatrix( _m:Matrix4 ) : Vector
<span class="small_desc_flat"> Set this vector from a quaternion value </span>      

<a name="applyMatrix4" href="#applyMatrix4">applyMatrix4</a>

	vector.applyMatrix4( _m:Matrix4 ) : Vector
<span class="small_desc_flat"> Apply a matrix to this vector </span>      

<a name="applyProjection" href="#applyProjection">applyProjection</a>

	vector.applyProjection( _m:Matrix4 ) : Vector
<span class="small_desc_flat"> Apply a projection matrix to this vector </span>      

<a name="applyQuaternion" href="#applyQuaternion">applyQuaternion</a>

	vector.applyQuaternion( _q:Quaternion ) : Vector
<span class="small_desc_flat"> Apply a quaternion value to this vector </span>      

<a name="transformDirection" href="#transformDirection">transformDirection</a>

	vector.transformDirection( _m:Matrix4 ) : Vector
<span class="small_desc_flat"> Apply a direction matrix to this vector </span>      

<a name="Operations" ></a>

###Operations

<a class="toplink" href="#top">back to top</a>

<a name="add" href="#add">add</a>

	vector.add( other:Vector ) : Vector 
<span class="small_desc_flat"> Add another vector to this vector (changes this vector) </span>      

<a name="subtract" href="#subtract">subtract</a>

	vector.subtract( other:Vector ) : Vector 
<span class="small_desc_flat"> Subtract another vector from this vector (changes this vector) </span>      


<a name="multiply" href="#multiply">multiply</a>

	vector.multiply( other:Vector ) : Vector 
<span class="small_desc_flat"> Multiply another vector with this vector (changes this vector) </span>      

<a name="divide" href="#divide">divide</a>

	vector.divide( other:Vector ) : Vector 
<span class="small_desc_flat"> Divide this vector by another vector (changes this vector) </span>      


<a name="addScalar" href="#addScalar">addScalar</a>

	vector.addScalar( scalar:Float ) : Vector 
<span class="small_desc_flat"> Add a scalar value (number) with this vector (changes this vector) </span>  


<a name="subtractScalar" href="#subtractScalar">subtractScalar</a>

	vector.subtractScalar( scalar:Float ) : Vector 
<span class="small_desc_flat"> Subtract a scalar value (number) with this vector (changes this vector) </span>      


<a name="multiplyScalar" href="#multiplyScalar">multiplyScalar</a>

	vector.multiplyScalar( scalar:Float ) : Vector 
<span class="small_desc_flat"> Multiply a scalar value (number) with this vector (changes this vector) </span>      


<a name="divideScalar" href="#divideScalar">divideScalar</a>

	vector.divideScalar( scalar:Float ) : Vector 
<span class="small_desc_flat"> Divide this vector by a scalar value (number) (changes this vector) </span>      

<a name="StaticMethods" ></a>

###Static Methods

<a class="toplink" href="#">back to top</a>

<a name="Add" href="#Add">Add</a>

	luxe.Vector.Add( a:Vector, b:Vector ) : Vector 
<span class="small_desc_flat"> Add `a` and `b` together, returning a new vector </span>      

<a name="AddScale" href="#AddScalar">AddScalar</a>

	luxe.Vector.AddScalar( a:Vector, b:Float ) : Vector 
<span class="small_desc_flat"> Add `a` and `b` together, returning a new vector </span>      

<a name="Subtract" href="#Subtract">Subtract</a>

	luxe.Vector.Subtract( a:Vector, b:Vector ) : Vector 
<span class="small_desc_flat"> Subtract `b` from `a` vector , returning a new vector </span>  

<a name="SubtractScalar" href="#SubtractScalar">SubtractScalar</a>

	luxe.Vector.SubtractScalar( a:Vector, b:Float ) : Vector 
<span class="small_desc_flat"> Subtract `b` from `a` vector , returning a new vector </span>      

<a name="Multiply" href="#Multiply">Multiply</a>

	luxe.Vector.Multiply( a:Vector, b:Float ) : Vector 
<span class="small_desc_flat"> Multiply `a` by `b`, returning a new vector </span>      

<a name="MultiplyVector" href="#MultiplyVector">MultiplyVector</a>

	luxe.Vector.MultiplyVector( a:Vector, b:Vector ) : Vector 
<span class="small_desc_flat"> Multiply `a` by `b`, returning a new vector </span>      

<a name="Divide" href="#Divide">Divide</a>

	luxe.Vector.Divide( a:Vector, b:Float ) : Vector 
<span class="small_desc_flat"> Divide `a` by `b`, returning a new vector </span>      

<a name="DivideVector" href="#DivideVector">DivideVector</a>

	luxe.Vector.DivideVector( a:Vector, b:Vector ) : Vector 
<span class="small_desc_flat"> Divide `a` by `b`, returning a new vector </span>      

<a name="Cross" href="#Cross">Cross</a>

	luxe.Vector.Cross( a:Vector, b:Vector ) : Vector 
<span class="small_desc_flat"> Cross product between `a` and `b`</span>      



