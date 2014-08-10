
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>SimpleActuator</h1>
<small>`luxe.tween.actuators.SimpleActuator`</small>

* @author Joshua Granick
 * @version 1.2

---

`class`extends <code><span>luxe.tween.actuators.GenericActuator</span></code>

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="timeOffset"><a class="lift" href="#timeOffset">timeOffset</a></a><div class="clear"></div><code class="signature apipage">timeOffset : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><div class="clear"></div><code class="signature apipage">active : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="cacheVisible"><a class="lift" href="#cacheVisible">cacheVisible</a></a><div class="clear"></div><code class="signature apipage">cacheVisible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="detailsLength"><a class="lift" href="#detailsLength">detailsLength</a></a><div class="clear"></div><code class="signature apipage">detailsLength : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="initialized"><a class="lift" href="#initialized">initialized</a></a><div class="clear"></div><code class="signature apipage">initialized : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="paused"><a class="lift" href="#paused">paused</a></a><div class="clear"></div><code class="signature apipage">paused : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pauseTime"><a class="lift" href="#pauseTime">pauseTime</a></a><div class="clear"></div><code class="signature apipage">pauseTime : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="propertyDetails"><a class="lift" href="#propertyDetails">propertyDetails</a></a><div class="clear"></div><code class="signature apipage">propertyDetails : [Array](#)&lt;[luxe.tween.actuators.PropertyDetails](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="sendChange"><a class="lift" href="#sendChange">sendChange</a></a><div class="clear"></div><code class="signature apipage">sendChange : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setVisible"><a class="lift" href="#setVisible">setVisible</a></a><div class="clear"></div><code class="signature apipage">setVisible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="startTime"><a class="lift" href="#startTime">startTime</a></a><div class="clear"></div><code class="signature apipage">startTime : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="toggleVisible"><a class="lift" href="#toggleVisible">toggleVisible</a></a><div class="clear"></div><code class="signature apipage">toggleVisible : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="has_timescaled_starttime"><a class="lift" href="#has_timescaled_starttime">has\_timescaled\_starttime</a></a><div class="clear"></div><code class="signature apipage">has\_timescaled\_starttime : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="actuators"><a class="lift" href="#actuators">actuators</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">actuators : [Array](#)&lt;[luxe.tween.actuators.SimpleActuator](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="actuatorsLength"><a class="lift" href="#actuatorsLength">actuatorsLength</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">actuatorsLength : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="addedEvent"><a class="lift" href="#addedEvent">addedEvent</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">addedEvent : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">timer : [haxe.Timer](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="update_timer"><a class="lift" href="#update_timer">update\_timer</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">update\_timer : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current_time"><a class="lift" href="#current_time">current\_time</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">current\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="getField"><a class="lift" href="#getField">getField</a></a> <div class="clear"></div><code class="signature apipage">getField : [](#)&nbsp; -&gt; [String](#)&nbsp;-&gt; [](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setField"><a class="lift" href="#setField">setField</a></a> <div class="clear"></div><code class="signature apipage">setField : [](#)&nbsp; -&gt; [String](#)&nbsp; -&gt; [](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="setProperty"><a class="lift" href="#setProperty">setProperty</a></a> <div class="clear"></div><code class="signature apipage">setProperty : [luxe.tween.actuators.PropertyDetails](#)&nbsp; -&gt; [](#)&nbsp;-&gt; [Void](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="autoVisible"><a class="lift" href="#autoVisible">autoVisible</a></a> <div class="clear"></div><code class="signature apipage">autoVisible(value:[Bool](#)<span>=null</span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* @inheritDoc</span>
        </span>
    <span class="method apipage">
            <a name="delay"><a class="lift" href="#delay">delay</a></a> <div class="clear"></div><code class="signature apipage">delay(duration:[Float](#)<span></span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* @inheritDoc</span>
        </span>
    <span class="method apipage">
            <a name="initialize"><a class="lift" href="#initialize">initialize</a></a> <div class="clear"></div><code class="signature apipage">initialize() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="move"><a class="lift" href="#move">move</a></a> <div class="clear"></div><code class="signature apipage">move() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="onUpdate"><a class="lift" href="#onUpdate">onUpdate</a></a> <div class="clear"></div><code class="signature apipage">onUpdate(handler:[Dynamic](#)<span></span>, parameters:[Array](#)&lt;[](#)&gt;<span>=null</span>) : [luxe.tween.actuators.IGenericActuator](#)</code><br/><span class="small_desc_flat">* @inheritDoc</span>
        </span>
    <span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a> <div class="clear"></div><code class="signature apipage">pause() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="resume"><a class="lift" href="#resume">resume</a></a> <div class="clear"></div><code class="signature apipage">resume() : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a> <div class="clear"></div><code class="signature apipage">stop(properties:[Dynamic](#)<span></span>, complete:[Bool](#)<span></span>, sendEvent:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a> <div class="clear"></div><code class="signature apipage">update(currentTime:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a> <div class="clear"></div><code class="signature apipage">new(target:[Dynamic](#)<span></span>, duration:[Float](#)<span></span>, properties:[Dynamic](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="on_internal_update"><a class="lift" href="#on_internal_update">on\_internal\_update</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">on\_internal\_update(dt:[Float](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;