
[![Logo](../../../images/logo.png)](../../../index.html)

---

#Actuate


&emsp;&emsp;&emsp;home   
[API Index](../../../api/index.html#luxe.tween)   
&emsp;&emsp;&emsp;parent    
[luxe](../)     
&emsp;&emsp;&emsp;current    
[luxe.tween](./) / Actuate

<br/>

---


[Members](#Members)   
[StaticMethods](#StaticMethods)   


---

&nbsp;   

<a class="lift" name="Members" ></a>
###Members   
---
<a class="lift" name="defaultActuator" href="#defaultActuator">defaultActuator</a>



<span class="inline-block static">static</span>`defaultActuator : Class<luxe.tween.actuators.GenericActuator>`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="defaultEase" href="#defaultEase">defaultEase</a>



<span class="inline-block static">static</span>`defaultEase : luxe.tween.easing.IEasing`

<span class="small_desc_flat"> no description </span>   

&nbsp;   

<a class="lift" name="StaticMethods" ></a>
###StaticMethods   
---
<a class="lift" name="apply" href="#apply">apply</a>



`apply(target:Dynamic, properties:Dynamic, ?customActuator:Class<luxe.tween.actuators.GenericActuator>) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> <![CDATA[* Copies properties from one object to another. Conflicting tweens are stopped automatically
     * @example     <code>Actuate.apply (MyClip, { alpha: 1 } );</code>
     * @param   target      The object to copy to
     * @param   properties      The object to copy from
     * @param   customActuator      A custom actuator to use instead of the default (Optional)
     * @return      The current actuator instance, which can be used to apply properties like onComplete or onUpdate handlers]]> </span>   

<a class="lift" name="motionPath" href="#motionPath">motionPath</a>



`motionPath(target:Dynamic, duration:Float, properties:Dynamic, ?overwrite:Bool=true) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> * Creates a new MotionPath tween
     * @param   target      The object to tween
     * @param   duration        The length of the tween in seconds
     * @param   properties      An object containing a motion path for each property you wish to tween
     * @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate </span>   

<a class="lift" name="pause" href="#pause">pause</a>



`pause(target:Dynamic) : Void`

<span class="small_desc_flat"> * Pauses tweens for the specified target objects
     * @param   ... targets     The target objects which will have their tweens paused. Passing no value pauses tweens for all objects </span>   

<a class="lift" name="pauseAll" href="#pauseAll">pauseAll</a>



`pauseAll() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="reset" href="#reset">reset</a>



`reset() : Void`

<span class="small_desc_flat"> * Resets Actuate by stopping and removing tweens for all objects </span>   

<a class="lift" name="resume" href="#resume">resume</a>



`resume(target:Dynamic) : Void`

<span class="small_desc_flat"> * Resumes paused tweens for the specified target objects
     * @param   ... targets     The target objects which will have their tweens resumed. Passing no value resumes tweens for all objects </span>   

<a class="lift" name="resumeAll" href="#resumeAll">resumeAll</a>



`resumeAll() : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="stop" href="#stop">stop</a>



`stop(target:Dynamic, ?properties:Dynamic, ?complete:Bool=false, ?sendEvent:Bool=true) : Void`

<span class="small_desc_flat"> * Stops all tweens for an individual object
     * @param   target      The target object which will have its tweens stopped, or a generic actuator instance
     * @param   properties      A string, array or object which contains the properties you wish to stop, like "alpha", [ "x", "y" ] or { alpha: null }. Passing no value removes all tweens for the object (Optional)
     * @param   complete        If tweens should apply their final target values before stopping. Default is false (Optional) 
     * @param   sendEvent   If a complete() event should be dispatched for the specified target. Default is true (Optional) </span>   

<a class="lift" name="timer" href="#timer">timer</a>



`timer(duration:Float, ?customActuator:Class<luxe.tween.actuators.GenericActuator>) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> <![CDATA[* Creates a tween-based timer, which is useful for synchronizing function calls with other animations
     * @example     <code>Actuate.timer (1).onComplete (trace, [ "Timer is now complete" ]);</code>
     * @param   duration        The length of the timer in seconds
     * @param   customActuator      A custom actuator to use instead of the default (Optional)
     * @return      The current actuator instance, which can be used to apply properties like onComplete or to gain a reference to the target timer object]]> </span>   

<a class="lift" name="tween" href="#tween">tween</a>



`tween(target:Dynamic, duration:Float, properties:Dynamic, ?overwrite:Bool=true, ?customActuator:Class<luxe.tween.actuators.GenericActuator>) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> <![CDATA[* Creates a new tween
     * @example     <code>Actuate.tween (MyClip, 1, { alpha: 1 } ).onComplete (trace, [ "MyClip is now visible" ]);</code>
     * @param   target      The object to tween
     * @param   duration        The length of the tween in seconds
     * @param   properties      The end values to tween the target to
     * @param   overwrite           Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
     * @param   customActuator      A custom actuator to use instead of the default (Optional)
     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate]]> </span>   

<a class="lift" name="unload" href="#unload">unload</a>



`unload(actuator:luxe.tween.actuators.GenericActuator) : Void`

<span class="small_desc_flat"> no description </span>   

<a class="lift" name="update" href="#update">update</a>



`update(target:Dynamic, duration:Float, ?start:Array<Dynamic>, ?end:Array<Dynamic>, ?overwrite:Bool=true) : luxe.tween.actuators.IGenericActuator`

<span class="small_desc_flat"> <![CDATA[* Creates a new tween that updates a method rather than setting the properties of an object
     * @example     <code>Actuate.update (trace, 1, ["Value: ", 0], ["", 1]).onComplete (trace, [ "Finished tracing values between 0 and 1" ]);</code>
     * @param   target      The method to update        
     * @param   duration        The length of the tween in seconds
     * @param   start       The starting parameters of the method call. You may use both numeric and non-numeric values
     * @param   end     The ending parameters of the method call. You may use both numeric and non-numeric values, but the signature should match the start parameters
     * @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate]]> </span>   

&nbsp;   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   