
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



<h1>Actuate</h1>
<small>`luxe.tween.Actuate`</small>



---

`class`
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="defaultActuator"><a class="lift" href="#defaultActuator">defaultActuator</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">defaultActuator : [Class](#)&lt;[luxe.tween.actuators.GenericActuator](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="defaultEase"><a class="lift" href="#defaultEase">defaultEase</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">defaultEase : [luxe.tween.easing.IEasing](#)</code><br/></span>
            <span class="small_desc_flat"></span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="apply"><a class="lift" href="#apply">apply</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">apply(target:[Dynamic](#)<span></span>, properties:[Dynamic](#)<span></span>, customActuator:[Class](#)&lt;[luxe.tween.actuators.GenericActuator](#)&gt;<span>=null</span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* Copies properties from one object to another. Conflicting tweens are stopped automatically
     * @example     <code>Actuate.apply (MyClip, { alpha: 1 } );</code>
     * @param   target      The object to copy to
     * @param   properties      The object to copy from
     * @param   customActuator      A custom actuator to use instead of the default (Optional)
     * @return      The current actuator instance, which can be used to apply properties like onComplete or onUpdate handlers</span>
        </span>
    <span class="method apipage">
            <a name="motionPath"><a class="lift" href="#motionPath">motionPath</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">motionPath(target:[Dynamic](#)<span></span>, duration:[Float](#)<span></span>, properties:[Dynamic](#)<span></span>, overwrite:[Bool](#)<span>=true</span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* Creates a new MotionPath tween
     * @param   target      The object to tween
     * @param   duration        The length of the tween in seconds
     * @param   properties      An object containing a motion path for each property you wish to tween
     * @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate</span>
        </span>
    <span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">pause(target:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">* Pauses tweens for the specified target objects
     * @param   ... targets     The target objects which will have their tweens paused. Passing no value pauses tweens for all objects</span>
        </span>
    <span class="method apipage">
            <a name="pauseAll"><a class="lift" href="#pauseAll">pauseAll</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">pauseAll() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](#)</code><br/><span class="small_desc_flat">* Resets Actuate by stopping and removing tweens for all objects</span>
        </span>
    <span class="method apipage">
            <a name="resume"><a class="lift" href="#resume">resume</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">resume(target:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">* Resumes paused tweens for the specified target objects
     * @param   ... targets     The target objects which will have their tweens resumed. Passing no value resumes tweens for all objects</span>
        </span>
    <span class="method apipage">
            <a name="resumeAll"><a class="lift" href="#resumeAll">resumeAll</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">resumeAll() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stop(target:[Dynamic](#)<span></span>, properties:[Dynamic](#)<span>=null</span>, complete:[Bool](#)<span>=false</span>, sendEvent:[Bool](#)<span>=true</span>) : [Void](#)</code><br/><span class="small_desc_flat">* Stops all tweens for an individual object
     * @param   target      The target object which will have its tweens stopped, or a generic actuator instance
     * @param   properties      A string, array or object which contains the properties you wish to stop, like "alpha", [ "x", "y" ] or { alpha: null }. Passing no value removes all tweens for the object (Optional)
     * @param   complete        If tweens should apply their final target values before stopping. Default is false (Optional)
     * @param   sendEvent   If a complete() event should be dispatched for the specified target. Default is true (Optional)</span>
        </span>
    <span class="method apipage">
            <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">timer(duration:[Float](#)<span></span>, customActuator:[Class](#)&lt;[luxe.tween.actuators.GenericActuator](#)&gt;<span>=null</span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* Creates a tween-based timer, which is useful for synchronizing function calls with other animations
     * @example     <code>Actuate.timer (1).onComplete (trace, [ "Timer is now complete" ]);</code>
     * @param   duration        The length of the timer in seconds
     * @param   customActuator      A custom actuator to use instead of the default (Optional)
     * @return      The current actuator instance, which can be used to apply properties like onComplete or to gain a reference to the target timer object</span>
        </span>
    <span class="method apipage">
            <a name="tween"><a class="lift" href="#tween">tween</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">tween(target:[Dynamic](#)<span></span>, duration:[Float](#)<span></span>, properties:[Dynamic](#)<span></span>, overwrite:[Bool](#)<span>=true</span>, customActuator:[Class](#)&lt;[luxe.tween.actuators.GenericActuator](#)&gt;<span>=null</span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* Creates a new tween
     * @example     <code>Actuate.tween (MyClip, 1, { alpha: 1 } ).onComplete (trace, [ "MyClip is now visible" ]);</code>
     * @param   target      The object to tween
     * @param   duration        The length of the tween in seconds
     * @param   properties      The end values to tween the target to
     * @param   overwrite           Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
     * @param   customActuator      A custom actuator to use instead of the default (Optional)
     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate</span>
        </span>
    <span class="method apipage">
            <a name="unload"><a class="lift" href="#unload">unload</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">unload(actuator:[luxe.tween.actuators.GenericActuator](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">update(target:[Dynamic](#)<span></span>, duration:[Float](#)<span></span>, start:[Array](#)&lt;[](#)&gt;<span>=null</span>, end:[Array](#)&lt;[](#)&gt;<span>=null</span>, overwrite:[Bool](#)<span>=true</span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* Creates a new tween that updates a method rather than setting the properties of an object
     * @example     <code>Actuate.update (trace, 1, ["Value: ", 0], ["", 1]).onComplete (trace, [ "Finished tracing values between 0 and 1" ]);</code>
     * @param   target      The method to update
     * @param   duration        The length of the tween in seconds
     * @param   start       The starting parameters of the method call. You may use both numeric and non-numeric values
     * @param   end     The ending parameters of the method call. You may use both numeric and non-numeric values, but the signature should match the start parameters
     * @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)
     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;