
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>IGenericActuator</h1>
<small>`luxe.tween.actuators.IGenericActuator`</small>



---

`class`
<span class="meta">
<br/>meta: @:noCompletion
</span>


---

&nbsp;
&nbsp;







<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="autoVisible"><a class="lift" href="#autoVisible">autoVisible</a></a><code class="signature apipage">autoVisible(value:Bool<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Flash performs faster when objects are set to visible = false rather than only alpha = 0. autoVisible toggles automatically based on alpha values
     * @param   value       Whether autoVisible should be enabled (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="delay"><a class="lift" href="#delay">delay</a></a><code class="signature apipage">delay(duration:Float<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Increases the delay before a tween is executed
     * @param   duration        The amount of seconds to delay
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="ease"><a class="lift" href="#ease">ease</a></a><code class="signature apipage">ease(easing:luxe.tween.easing.IEasing<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Sets the easing which is used when running the tween
     * @param   easing      An easing equation, like Elastic.easeIn or Quad.easeOut
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="onComplete"><a class="lift" href="#onComplete">onComplete</a></a><code class="signature apipage">onComplete(handler:<span></span>, parameters:Array<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Defines a function which will be called when the tween finishes
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="onRepeat"><a class="lift" href="#onRepeat">onRepeat</a></a><code class="signature apipage">onRepeat(handler:<span></span>, parameters:Array<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Defines a function which will be called when the tween repeats
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="onUpdate"><a class="lift" href="#onUpdate">onUpdate</a></a><code class="signature apipage">onUpdate(handler:<span></span>, parameters:Array<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Defines a function which will be called when the tween updates
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="reflect"><a class="lift" href="#reflect">reflect</a></a><code class="signature apipage">reflect(value:Bool<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Automatically changes the reverse value when the tween repeats. Repeat must be enabled for this to have any effect
     * @param   value       Whether reflect should be enabled (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="repeat"><a class="lift" href="#repeat">repeat</a></a><code class="signature apipage">repeat(times:Int<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Repeats the tween after it finishes
     * @param   times       The number of times you would like the tween to repeat, or -1 if you would like to repeat the tween indefinitely (Default is -1)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="reverse"><a class="lift" href="#reverse">reverse</a></a><code class="signature apipage">reverse(value:Bool<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Sets if the tween should be handled in reverse
     * @param   value       Whether the tween should be reversed (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="timescale"><a class="lift" href="#timescale">timescale</a></a><code class="signature apipage">timescale(\_value:Bool<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Specify whether this should be scaled by the global timescale
     * @param   _value      Whether or not it should be
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="smartRotation"><a class="lift" href="#smartRotation">smartRotation</a></a><code class="signature apipage">smartRotation(value:Bool<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Enabling smartRotation can prevent undesired results when tweening rotation values
     * @param   value       Whether smart rotation should be enabled (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="snapping"><a class="lift" href="#snapping">snapping</a></a><code class="signature apipage">snapping(value:Bool<span></span>) : luxe.tween.actuators.IGenericActuator</code><br/><span class="small_desc_flat">* Snapping causes tween values to be rounded automatically
     * @param   value       Whether tween values should be rounded (Default is true)
     * @return      The current actuator instance</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;