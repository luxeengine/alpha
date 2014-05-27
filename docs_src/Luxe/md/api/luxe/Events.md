
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Events



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="clear"><a class="lift" href="#clear">clear</a></a><code class="signature apipage">clear() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="dequeue"><a class="lift" href="#dequeue">dequeue</a></a><code class="signature apipage">dequeue(event\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="disconnect"><a class="lift" href="#disconnect">disconnect</a></a><code class="signature apipage">disconnect(event\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="does_filter_event"><a class="lift" href="#does_filter_event">does\_filter\_event</a></a><code class="signature apipage">does\_filter\_event(\_filter:<span>[String](http://api.haxe.org/String.html)</span>, \_event:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="fire"><a class="lift" href="#fire">fire</a></a><code class="signature apipage">fire(\_event\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_properties:<span>[fire.T]()=null</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="listen"><a class="lift" href="#listen">listen</a></a><code class="signature apipage">listen(\_event\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_listener:<span>[listen.T-&gt;Void]()</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a><code class="signature apipage">process() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="queue"><a class="lift" href="#queue">queue</a></a><code class="signature apipage">queue(event\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?properties:<span>[queue.T]()=null</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="schedule"><a class="lift" href="#schedule">schedule</a></a><code class="signature apipage">schedule(time:<span>[Float](http://api.haxe.org/Float.html)</span>, event\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?properties:<span>[schedule.T]()=null</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="unschedule"><a class="lift" href="#unschedule">unschedule</a></a><code class="signature apipage">unschedule(schedule\_id:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;