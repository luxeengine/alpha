
[![Logo](http://luxeengine.com/images/logo.png)](index.html)


[Extends](#Extends)   
[Members](#Members)   
[Properties](#Properties)   
[Methods](#Methods)   


&nbsp;   

<a class="lift" name="Extends" ></a>
###Extends   
---
<a class="lift" name="luxe.Objects" href="luxe.Objects.html">luxe.Objects</a>

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="inited" href="#inited">inited</a>



    inited : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="children" href="#children">children</a>



    children : Array<luxe.Entity>

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="started" href="#started">started</a>



    started : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="_destroyed" href="#_destroyed">_destroyed</a>



    _destroyed : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="serialize" href="#serialize">serialize</a>



    serialize : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="events" href="#events">events</a>



    events : luxe.Events

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="rotation" href="#rotation">rotation</a>



    rotation : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="scaleRelative" href="#scaleRelative">scaleRelative</a>



    scaleRelative : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="components" href="#components">components</a>



    components : Map

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="posRelative" href="#posRelative">posRelative</a>



    posRelative : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="parent" href="#parent">parent</a>



    parent : luxe.Entity

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="scene" href="#scene">scene</a>



    scene : luxe.Scene

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="scale" href="#scale">scale</a>



    scale : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="rotationRelative" href="#rotationRelative">rotationRelative</a>



    rotationRelative : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="pos" href="#pos">pos</a>



    pos : luxe.Vector

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="fixed_rate" href="#fixed_rate">fixed_rate</a>



    fixed_rate : Float

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="get" href="#get">get</a>



    get(_name:String, ?_in_children:Bool, ?_first_only:Bool) : null

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="remove" href="#remove">remove</a>



    remove(?_name:String, ?_data:remove.T) : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="serialize_to_disk" href="#serialize_to_disk">serialize_to_disk</a>



    serialize_to_disk(_destination_path:String, ?_parent_write:Bool) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



    new(?_options:luxe.options.EntityOptions<new.T>) 

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="remove_child" href="#remove_child">remove_child</a>



    remove_child(child:luxe.Entity) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="get_serialize_data" href="#get_serialize_data">get_serialize_data</a>



    get_serialize_data() : null

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="add_child" href="#add_child">add_child</a>



    add_child(child:luxe.Entity) : Void

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="add" href="#add">add</a>



    add(type:Class<add.T1>, ?_name:String, ?_data:add.T2) : add.T1

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="has" href="#has">has</a>



    has(_name:String) : Bool

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



    destroy() : Void

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   