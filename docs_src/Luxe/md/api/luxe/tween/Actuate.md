
[![Logo](../../../images/logo.png)](../../../api/index.html)

---



#Actuate



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="defaultActuator"><a class="lift" href="#defaultActuator">defaultActuator</a></a><span class="inline-block static">static</span><code class="signature apipage">defaultActuator : [Class]()&lt;[luxe.tween.actuators.GenericActuator](#luxe.tween.actuators.GenericActuator)&gt;</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="defaultEase"><a class="lift" href="#defaultEase">defaultEase</a></a><span class="inline-block static">static</span><code class="signature apipage">defaultEase : [luxe.tween.easing.IEasing](#luxe.tween.easing.IEasing)</code><br/></span>
        <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="apply"><a class="lift" href="#apply">apply</a></a><span class="inline-block static">static</span><code class="signature apipage">apply(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, properties:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, ?customActuator:<span>[Class]()&lt;[luxe.tween.actuators.GenericActuator](#luxe.tween.actuators.GenericActuator)&gt;=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat"><![CDATA[* Copies properties from one object to another. Conflicting tweens are stopped automatically\n     * @example     <code>Actuate.apply (MyClip, { alpha: 1 } );</code>\n     * @param   target      The object to copy to\n     * @param   properties      The object to copy from\n     * @param   customActuator      A custom actuator to use instead of the default (Optional)\n     * @return      The current actuator instance, which can be used to apply properties like onComplete or onUpdate handlers]]></span>
        </span>
    <span class="method apipage">
            <a name="motionPath"><a class="lift" href="#motionPath">motionPath</a></a><span class="inline-block static">static</span><code class="signature apipage">motionPath(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, duration:<span>[Float](http://api.haxe.org/Float.html)</span>, properties:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, ?overwrite:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Creates a new MotionPath tween\n     * @param   target      The object to tween\n     * @param   duration        The length of the tween in seconds\n     * @param   properties      An object containing a motion path for each property you wish to tween\n     * @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)\n     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate</span>
        </span>
    <span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><span class="inline-block static">static</span><code class="signature apipage">pause(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">* Pauses tweens for the specified target objects\n     * @param   ... targets     The target objects which will have their tweens paused. Passing no value pauses tweens for all objects</span>
        </span>
    <span class="method apipage">
            <a name="pauseAll"><a class="lift" href="#pauseAll">pauseAll</a></a><span class="inline-block static">static</span><code class="signature apipage">pauseAll() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><span class="inline-block static">static</span><code class="signature apipage">reset() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">* Resets Actuate by stopping and removing tweens for all objects</span>
        </span>
    <span class="method apipage">
            <a name="resume"><a class="lift" href="#resume">resume</a></a><span class="inline-block static">static</span><code class="signature apipage">resume(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">* Resumes paused tweens for the specified target objects\n     * @param   ... targets     The target objects which will have their tweens resumed. Passing no value resumes tweens for all objects</span>
        </span>
    <span class="method apipage">
            <a name="resumeAll"><a class="lift" href="#resumeAll">resumeAll</a></a><span class="inline-block static">static</span><code class="signature apipage">resumeAll() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><span class="inline-block static">static</span><code class="signature apipage">stop(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, ?properties:<span>[Dynamic](http://api.haxe.org/Dynamic.html)=null</span>, ?complete:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>, ?sendEvent:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">* Stops all tweens for an individual object\n     * @param   target      The target object which will have its tweens stopped, or a generic actuator instance\n     * @param   properties      A string, array or object which contains the properties you wish to stop, like "alpha", [ "x", "y" ] or { alpha: null }. Passing no value removes all tweens for the object (Optional)\n     * @param   complete        If tweens should apply their final target values before stopping. Default is false (Optional) \n     * @param   sendEvent   If a complete() event should be dispatched for the specified target. Default is true (Optional)</span>
        </span>
    <span class="method apipage">
            <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><code class="signature apipage">timer(duration:<span>[Float](http://api.haxe.org/Float.html)</span>, ?customActuator:<span>[Class]()&lt;[luxe.tween.actuators.GenericActuator](#luxe.tween.actuators.GenericActuator)&gt;=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat"><![CDATA[* Creates a tween-based timer, which is useful for synchronizing function calls with other animations\n     * @example     <code>Actuate.timer (1).onComplete (trace, [ "Timer is now complete" ]);</code>\n     * @param   duration        The length of the timer in seconds\n     * @param   customActuator      A custom actuator to use instead of the default (Optional)\n     * @return      The current actuator instance, which can be used to apply properties like onComplete or to gain a reference to the target timer object]]></span>
        </span>
    <span class="method apipage">
            <a name="tween"><a class="lift" href="#tween">tween</a></a><span class="inline-block static">static</span><code class="signature apipage">tween(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, duration:<span>[Float](http://api.haxe.org/Float.html)</span>, properties:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, ?overwrite:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>, ?customActuator:<span>[Class]()&lt;[luxe.tween.actuators.GenericActuator](#luxe.tween.actuators.GenericActuator)&gt;=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat"><![CDATA[* Creates a new tween\n     * @example     <code>Actuate.tween (MyClip, 1, { alpha: 1 } ).onComplete (trace, [ "MyClip is now visible" ]);</code>\n     * @param   target      The object to tween\n     * @param   duration        The length of the tween in seconds\n     * @param   properties      The end values to tween the target to\n     * @param   overwrite           Sets whether previous tweens for the same target and properties will be overwritten (Default is true)\n     * @param   customActuator      A custom actuator to use instead of the default (Optional)\n     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate]]></span>
        </span>
    <span class="method apipage">
            <a name="unload"><a class="lift" href="#unload">unload</a></a><span class="inline-block static">static</span><code class="signature apipage">unload(actuator:<span>[luxe.tween.actuators.GenericActuator](#luxe.tween.actuators.GenericActuator)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><span class="inline-block static">static</span><code class="signature apipage">update(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, duration:<span>[Float](http://api.haxe.org/Float.html)</span>, ?start:<span>[Array](http://api.haxe.org/Array.html)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&gt;=null</span>, ?end:<span>[Array](http://api.haxe.org/Array.html)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&gt;=null</span>, ?overwrite:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat"><![CDATA[* Creates a new tween that updates a method rather than setting the properties of an object\n     * @example     <code>Actuate.update (trace, 1, ["Value: ", 0], ["", 1]).onComplete (trace, [ "Finished tracing values between 0 and 1" ]);</code>\n     * @param   target      The method to update        \n     * @param   duration        The length of the tween in seconds\n     * @param   start       The starting parameters of the method call. You may use both numeric and non-numeric values\n     * @param   end     The ending parameters of the method call. You may use both numeric and non-numeric values, but the signature should match the start parameters\n     * @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)\n     * @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate]]></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;