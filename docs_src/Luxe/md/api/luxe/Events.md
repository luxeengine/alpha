
[![Logo](../../images/logo.png)](../../index.html)

---

#Events


&emsp;&emsp;&emsp;home   
[API Index](../../api/index.html#luxe)   
&emsp;&emsp;&emsp;parent    
_none_   
&emsp;&emsp;&emsp;current    
[luxe](./) / Events

<br/>

---


[Methods](#Methods)   


---

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="clear" href="#clear">clear</a>



`clear() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="dequeue" href="#dequeue">dequeue</a>



`dequeue(event_id:String) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="destroy" href="#destroy">destroy</a>



`destroy() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="disconnect" href="#disconnect">disconnect</a>



`disconnect(event_id:String) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="does_filter_event" href="#does_filter_event">does_filter_event</a>



`does_filter_event(_filter:String, _event:String) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="fire" href="#fire">fire</a>



`fire(_event_name:String, ?_properties:fire.T) : Bool`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="listen" href="#listen">listen</a>



`listen(_event_name:String, _listener:listen.T->Void) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="new" href="#new">new</a>



`new() `

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="process" href="#process">process</a>



`process() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="queue" href="#queue">queue</a>



`queue(event_name:String, ?properties:queue.T) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="schedule" href="#schedule">schedule</a>



`schedule(time:Float, event_name:String, ?properties:schedule.T) : String`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="unschedule" href="#unschedule">unschedule</a>



`unschedule(schedule_id:String) : Bool`

<span class="small_desc_flat"> no description </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   