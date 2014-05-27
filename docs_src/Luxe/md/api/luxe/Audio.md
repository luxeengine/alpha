
[![Logo](../../images/logo.png)](../../api/index.html)

---



#Audio



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><code class="signature apipage">create(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_file:<span>[String](http://api.haxe.org/String.html)</span>, ?\_stream:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [lime.helpers.Sound]()</code><br/><span class="small_desc_flat">Create a named audio reference, with optional stream flag   \n            **name** The name to assign this audio reference    \n            **file** The asset file id from which the audio is loaded/streamed    \n            **stream** Whether or not to stream the audio, default `false`   \n            **returns** The `Sound` instance, but the audio API stores this, use the API to manipulate it by name.</span>
        </span>
    <span class="method apipage">
            <a name="exists"><a class="lift" href="#exists">exists</a></a><code class="signature apipage">exists(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Determine whether a named audio reference exists  \n            **name** The audio reference name to check    \n            **returns** true/false</span>
        </span>
    <span class="method apipage">
            <a name="loop"><a class="lift" href="#loop">loop</a></a><code class="signature apipage">loop(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Loop a named audio reference indefinitely. Use `stop` if needed.  \n            **name** The audio reference name to loop    \n            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="on_complete"><a class="lift" href="#on_complete">on\_complete</a></a><code class="signature apipage">on\_complete(\_name:<span>[String](http://api.haxe.org/String.html)</span>, handler:<span>[lime.helpers.Sound-&gt;Void]()</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Set the on complete handler for a named audio reference   \n            **name** The audio reference name to assign to   \n            **handler** The callback to call when playback is complete   \n            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="pan"><a class="lift" href="#pan">pan</a></a><code class="signature apipage">pan(\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_pan:<span>[Float](http://api.haxe.org/Float.html)=null</span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get/set the pan of a named audio reference    \n            **name** The audio reference name to adjust    \n            **pan** A new pan value (set), or leave empty (get)   \n            **returns** The pan of `name` IF pan is unspecified</span>
        </span>
    <span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><code class="signature apipage">play(\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_number\_of\_times:<span>[Int](http://api.haxe.org/Int.html)=1</span>, ?\_start\_position\_in\_s:<span>[Float](http://api.haxe.org/Float.html)=0</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Play a named audio reference   \n            **name** The audio reference name to play    \n            **number_of_times** The exact number of times to play    \n            **start_position_in_s** The start time, in seconds    \n            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="playing"><a class="lift" href="#playing">playing</a></a><code class="signature apipage">playing(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Determine whether a named audio reference is playing  \n            **name** The audio reference name to check    \n            **returns** true/false</span>
        </span>
    <span class="method apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><code class="signature apipage">position(\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_pos:<span>[Float](http://api.haxe.org/Float.html)=null</span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get/set the position of a named audio reference    \n            **name** The audio reference name to adjust    \n            **pos** A new position value (set), or leave empty (get)   \n            **returns** The position of `name` IF position is unspecified</span>
        </span>
    <span class="method apipage">
            <a name="sound"><a class="lift" href="#sound">sound</a></a><code class="signature apipage">sound(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [lime.helpers.Sound]()</code><br/><span class="small_desc_flat">Fetch a named audio reference   \n            **name** The name to acquire audio reference    \n            **returns** The `Sound` instance</span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><code class="signature apipage">stop(\_name:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Stop a named audio reference from playing (or looping)   \n            **name** The audio reference name to stop    \n            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="volume"><a class="lift" href="#volume">volume</a></a><code class="signature apipage">volume(\_name:<span>[String](http://api.haxe.org/String.html)</span>, ?\_volume:<span>[Float](http://api.haxe.org/Float.html)=null</span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get/set the volume of a named audio reference    \n            **name** The audio reference name to adjust    \n            **volume** A new volume value (set), or leave empty (get)    \n            **returns** The volume of `name` IF volume is unspecified</span>
        </span>
    

<h3>Properties</h3> <hr/>no public properties

&nbsp;
&nbsp;
&nbsp;