
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



#GenericActuator



---

`class`<br/>implements <code><span>[luxe.tween.actuators.IGenericActuator]()</span></code>
<span class="meta">
<br/>meta: @:keepSub
</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="duration"><a class="lift" href="#duration">duration</a></a><code class="signature apipage">duration : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="id"><a class="lift" href="#id">id</a></a><code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="properties"><a class="lift" href="#properties">properties</a></a><code class="signature apipage">properties : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="target"><a class="lift" href="#target">target</a></a><code class="signature apipage">target : [Dynamic](http://api.haxe.org/Dynamic.html)</code><br/></span>
        <span class="small_desc_flat"></span><span class="member apipage">
            <a name="timescaled"><a class="lift" href="#timescaled">timescaled</a></a><code class="signature apipage">timescaled : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
        <span class="small_desc_flat">* Specify whether this should be scaled by the global timescale
     * @param   _value      Whether or not it should be
     * @return      The current actuator instance</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="apply"><a class="lift" href="#apply">apply</a></a><code class="signature apipage">apply() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="autoVisible"><a class="lift" href="#autoVisible">autoVisible</a></a><code class="signature apipage">autoVisible(?value:<span>[Bool](http://api.haxe.org/Bool.html)=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Sometimes drawing performs faster when objects are set to visible = false rather than only alpha = 0. autoVisible toggles automatically based on alpha values
     * @param   value       Whether autoVisible should be enabled (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="delay"><a class="lift" href="#delay">delay</a></a><code class="signature apipage">delay(duration:<span>[Float](http://api.haxe.org/Float.html)</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Increases the delay before a tween is executed
     * @param   duration        The amount of seconds to delay
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="ease"><a class="lift" href="#ease">ease</a></a><code class="signature apipage">ease(easing:<span>[luxe.tween.easing.IEasing](#luxe.tween.easing.IEasing)</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Sets the easing which is used when running the tween
     * @param   easing      An easing equation, like Elastic.easeIn or Quad.easeOut
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="move"><a class="lift" href="#move">move</a></a><code class="signature apipage">move() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new(target:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, duration:<span>[Float](http://api.haxe.org/Float.html)</span>, properties:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onComplete"><a class="lift" href="#onComplete">onComplete</a></a><code class="signature apipage">onComplete(handler:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, ?parameters:<span>[Array](http://api.haxe.org/Array.html)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&gt;=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Defines a function which will be called when the tween finishes
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="onRepeat"><a class="lift" href="#onRepeat">onRepeat</a></a><code class="signature apipage">onRepeat(handler:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, ?parameters:<span>[Array](http://api.haxe.org/Array.html)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&gt;=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Defines a function which will be called when the tween repeats
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="onUpdate"><a class="lift" href="#onUpdate">onUpdate</a></a><code class="signature apipage">onUpdate(handler:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, ?parameters:<span>[Array](http://api.haxe.org/Array.html)&lt;[Dynamic](http://api.haxe.org/Dynamic.html)&gt;=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Defines a function which will be called when the tween updates
     * @param   handler     The function you would like to be called
     * @param   parameters      Parameters you would like to pass to the handler function when it is called
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><code class="signature apipage">pause() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="reflect"><a class="lift" href="#reflect">reflect</a></a><code class="signature apipage">reflect(?value:<span>[Bool](http://api.haxe.org/Bool.html)=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Automatically changes the reverse value when the tween repeats. Repeat must be enabled for this to have any effect
     * @param   value       Whether reflect should be enabled (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="repeat"><a class="lift" href="#repeat">repeat</a></a><code class="signature apipage">repeat(?times:<span>[Int](http://api.haxe.org/Int.html)=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Repeats the tween after it finishes
     * @param   times       The number of times you would like the tween to repeat, or -1 if you would like to repeat the tween indefinitely (Default is -1)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="resume"><a class="lift" href="#resume">resume</a></a><code class="signature apipage">resume() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="reverse"><a class="lift" href="#reverse">reverse</a></a><code class="signature apipage">reverse(?value:<span>[Bool](http://api.haxe.org/Bool.html)=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Sets if the tween should be handled in reverse
     * @param   value       Whether the tween should be reversed (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="smartRotation"><a class="lift" href="#smartRotation">smartRotation</a></a><code class="signature apipage">smartRotation(?value:<span>[Bool](http://api.haxe.org/Bool.html)=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Enabling smartRotation can prevent undesired results when tweening rotation values
     * @param   value       Whether smart rotation should be enabled (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="snapping"><a class="lift" href="#snapping">snapping</a></a><code class="signature apipage">snapping(?value:<span>[Bool](http://api.haxe.org/Bool.html)=null</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat">* Snapping causes tween values to be rounded automatically
     * @param   value       Whether tween values should be rounded (Default is true)
     * @return      The current actuator instance</span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><code class="signature apipage">stop(properties:<span>[Dynamic](http://api.haxe.org/Dynamic.html)</span>, complete:<span>[Bool](http://api.haxe.org/Bool.html)</span>, sendEvent:<span>[Bool](http://api.haxe.org/Bool.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="timescale"><a class="lift" href="#timescale">timescale</a></a><code class="signature apipage">timescale(?\_value:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [luxe.tween.actuators.IGenericActuator](#luxe.tween.actuators.IGenericActuator)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;