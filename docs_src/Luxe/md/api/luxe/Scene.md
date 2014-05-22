
[![Logo](../../images/logo.png)](../../index.html)

---


##[API Index](../../api/index.html#luxe)   
&emsp;&emsp;&emsp;[luxe](./)   
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Scene

---

#Scene


---


[Extends](#Extends)   
[Members](#Members)   
[Properties](#Properties)   
[Methods](#Methods)   


---

&nbsp;   

<a class="lift" name="Extends" ></a>
###Extends   
---
<a class="lift" name="luxe.Objects" href="{{{rel_path}}}api/luxe/Objects.html">luxe.Objects</a>

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="entities" href="#entities">entities</a>



`entities : Map<String,luxe.Entity>`

<span class="small_desc_flat">  </span>   

<a class="lift" name="inited" href="#inited">inited</a>



`inited : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="started" href="#started">started</a>



`started : Bool`

<span class="small_desc_flat">  </span>   

&nbsp;   

<a class="lift" name="Properties" ></a>
###Properties   
---
<a class="lift" name="entitycount" href="#entitycount">entitycount</a>



`entitycount : Int`

<span class="small_desc_flat">  </span>   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="add" href="#add">add</a>



`add(entity:luxe.Entity) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="create" href="#create">create</a>



`create<T1,T2>(type:Class<create.T1>, ?_name:String='', ?_data:create.T2) : create.T1`

<span class="small_desc_flat">  </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



`destroy() : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="empty" href="#empty">empty</a>



`empty() : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="fixed_update" href="#fixed_update">fixed_update</a>



`fixed_update() : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="init" href="#init">init</a>



`init() : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="new" href="#new">new</a>



`new() `

<span class="small_desc_flat">  </span>   

<a class="lift" name="ongamepadaxis" href="#ongamepadaxis">ongamepadaxis</a>



`ongamepadaxis(e:Dynamic) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ongamepadball" href="#ongamepadball">ongamepadball</a>



`ongamepadball(e:Dynamic) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ongamepadbuttondown" href="#ongamepadbuttondown">ongamepadbuttondown</a>



`ongamepadbuttondown(e:Dynamic) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ongamepadbuttonup" href="#ongamepadbuttonup">ongamepadbuttonup</a>



`ongamepadbuttonup(e:Dynamic) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ongamepadhat" href="#ongamepadhat">ongamepadhat</a>



`ongamepadhat(e:Dynamic) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="oninputdown" href="#oninputdown">oninputdown</a>



`oninputdown(_name:String, e:luxe.InputEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="oninputup" href="#oninputup">oninputup</a>



`oninputup(_name:String, e:luxe.InputEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="onkeydown" href="#onkeydown">onkeydown</a>



`onkeydown(e:luxe.KeyEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="onkeyup" href="#onkeyup">onkeyup</a>



`onkeyup(e:luxe.KeyEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="onmousedown" href="#onmousedown">onmousedown</a>



`onmousedown(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="onmousemove" href="#onmousemove">onmousemove</a>



`onmousemove(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="onmouseup" href="#onmouseup">onmouseup</a>



`onmouseup(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="onmousewheel" href="#onmousewheel">onmousewheel</a>



`onmousewheel(e:luxe.MouseEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ontouchbegin" href="#ontouchbegin">ontouchbegin</a>



`ontouchbegin(e:luxe.TouchEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ontouchend" href="#ontouchend">ontouchend</a>



`ontouchend(e:luxe.TouchEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="ontouchmove" href="#ontouchmove">ontouchmove</a>



`ontouchmove(e:luxe.TouchEvent) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="remove" href="#remove">remove</a>



`remove(entity:luxe.Entity) : Bool`

<span class="small_desc_flat">  </span>   

<a class="lift" name="serialize_to_disk" href="#serialize_to_disk">serialize_to_disk</a>



`serialize_to_disk(_destination_path:String) : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="start" href="#start">start</a>



`start() : Void`

<span class="small_desc_flat">  </span>   

<a class="lift" name="toString" href="#toString">toString</a>



`toString() : String`

<span class="small_desc_flat">  </span>   

<a class="lift" name="update" href="#update">update</a>



`update(dt:Float) : Void`

<span class="small_desc_flat">  </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   