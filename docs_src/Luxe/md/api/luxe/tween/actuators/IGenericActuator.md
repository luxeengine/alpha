
[![Logo](../../../../images/logo.png)](../../../../index.html)

---

#IGenericActuator


&emsp;&emsp;&emsp;home   
[API Index](../../../../api/index.html#luxe.tween)   
&emsp;&emsp;&emsp;parent    
[luxe.tween](../)     
&emsp;&emsp;&emsp;current    
[luxe.tween.actuators](./) / IGenericActuator

<br/>

---


[Methods](#Methods)   


---

&nbsp;   

&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="autoVisible" href="#autoVisible">autoVisible</a>



`autoVisible(?value:Bool) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Flash performs faster when objects are set to visible = false rather than only alpha = 0. autoVisible toggles automatically based on alpha values
     * @param   value       Whether autoVisible should be enabled (Default is true)
     * @return      The current actuator instance </span>   

<a class="lift" name="delay" href="#delay">delay</a>



`delay(duration:Float) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Increases the delay before a tween is executed
     * @param   duration        The amount of seconds to delay
     * @return      The current actuator instance </span>   

<a class="lift" name="ease" href="#ease">ease</a>



`ease(easing:luxe.tween.easing.IEasing) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Sets the easing which is used when running the tween
     * @param   easing      An easing equation, like Elastic.easeIn or Quad.easeOut
     * @return      The current actuator instance </span>   

<a class="lift" name="onComplete" href="#onComplete">onComplete</a>



`onComplete(handler:Dynamic, ?parameters:Array<Dynamic>) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Defines a function which will be called when the tween finishes
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance </span>   

<a class="lift" name="onRepeat" href="#onRepeat">onRepeat</a>



`onRepeat(handler:Dynamic, ?parameters:Array<Dynamic>) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Defines a function which will be called when the tween repeats
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance </span>   

<a class="lift" name="onUpdate" href="#onUpdate">onUpdate</a>



`onUpdate(handler:Dynamic, ?parameters:Array<Dynamic>) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Defines a function which will be called when the tween updates
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance </span>   

<a class="lift" name="reflect" href="#reflect">reflect</a>



`reflect(?value:Bool) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Automatically changes the reverse value when the tween repeats. Repeat must be enabled for this to have any effect
     * @param   value       Whether reflect should be enabled (Default is true)
     * @return      The current actuator instance </span>   

<a class="lift" name="repeat" href="#repeat">repeat</a>



`repeat(?times:Int) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Repeats the tween after it finishes
     * @param   times       The number of times you would like the tween to repeat, or -1 if you would like to repeat the tween indefinitely (Default is -1)
     * @return      The current actuator instance </span>   

<a class="lift" name="reverse" href="#reverse">reverse</a>



`reverse(?value:Bool) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Sets if the tween should be handled in reverse
     * @param   value       Whether the tween should be reversed (Default is true)
     * @return      The current actuator instance </span>   

<a class="lift" name="smartRotation" href="#smartRotation">smartRotation</a>



`smartRotation(?value:Bool) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Enabling smartRotation can prevent undesired results when tweening rotation values
     * @param   value       Whether smart rotation should be enabled (Default is true)
     * @return      The current actuator instance </span>   

<a class="lift" name="snapping" href="#snapping">snapping</a>



`snapping(?value:Bool) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Snapping causes tween values to be rounded automatically
     * @param   value       Whether tween values should be rounded (Default is true)
     * @return      The current actuator instance </span>   

<a class="lift" name="timescale" href="#timescale">timescale</a>



`timescale(?_value:Bool) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Specify whether this should be scaled by the global timescale
     * @param   _value      Whether or not it should be
     * @return      The current actuator instance </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   