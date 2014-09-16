
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Events</h1>
<small>`luxe.Events`</small>



---

`class`
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><div class="clear"></div>
            <code class="signature apipage">clear() : [Void](#)</code><br/><span class="small_desc_flat">clear any scheduled or bound events. called on destroy.</span>
        </span>
    <span class="method apipage">
            <a name="dequeue"><a class="lift" href="#dequeue">dequeue</a></a><div class="clear"></div>
            <code class="signature apipage">dequeue(event\_id:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">Remove an event from the queue by id returned from queue.</span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](#)</code><br/><span class="small_desc_flat">destroy this `Events` instance</span>
        </span>
    <span class="method apipage">
            <a name="disconnect"><a class="lift" href="#disconnect">disconnect</a></a><div class="clear"></div>
            <code class="signature apipage">disconnect(event\_id:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">Disconnect a vound signal   
            event connection id, returned from connect()   
            returns true if the event existed and was removed</span>
        </span>
    <span class="method apipage">
            <a name="does_filter_event"><a class="lift" href="#does_filter_event">does\_filter\_event</a></a><div class="clear"></div>
            <code class="signature apipage">does\_filter\_event(\_filter:[String](#)<span></span>, \_event:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">helper. Exposed for learning/testing api.</span>
        </span>
    <span class="method apipage">
            <a name="fire"><a class="lift" href="#fire">fire</a></a><div class="clear"></div>
            <code class="signature apipage">fire&lt;T&gt;(\_event\_name:[String](#)<span></span>, \_properties:[fire.T](#)<span>=null</span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen"><a class="lift" href="#listen">listen</a></a><div class="clear"></div>
            <code class="signature apipage">listen&lt;T&gt;(\_event\_name:[String](#)<span></span>, \_listener:[listen.T](#)&nbsp;-&gt; [Void](#)<span></span>) : [String](#)</code><br/><span class="small_desc_flat">Bind a signal (listener) to a slot (event_name)   
            event_name : The event id   
            listener : A function handler that should get called on event firing</span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](#)</code><br/><span class="small_desc_flat">create a new instance for sending/receiving events</span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a><div class="clear"></div>
            <code class="signature apipage">process() : [Void](#)</code><br/><span class="small_desc_flat">Process/update the events, firing any events in the queue. if you create a custom instance, call this when you want to process.</span>
        </span>
    <span class="method apipage">
            <a name="queue"><a class="lift" href="#queue">queue</a></a><div class="clear"></div>
            <code class="signature apipage">queue&lt;T&gt;(event\_name:[String](#)<span></span>, properties:[queue.T](#)<span>=null</span>) : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="schedule"><a class="lift" href="#schedule">schedule</a></a><div class="clear"></div>
            <code class="signature apipage">schedule&lt;T&gt;(time:[Float](#)<span></span>, event\_name:[String](#)<span></span>, properties:[schedule.T](#)<span>=null</span>) : [String](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unschedule"><a class="lift" href="#unschedule">unschedule</a></a><div class="clear"></div>
            <code class="signature apipage">unschedule(schedule\_id:[String](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;