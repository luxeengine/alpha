
[![Logo](../../images/logo.png)](../../api/index.html)

---



<h1>Audio</h1>
<small>`luxe.Audio`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><code class="signature apipage">create(\_name:String<span></span>, \_file:String<span></span>, \_stream:Bool<span>=false</span>) : lime.helpers.Sound</code><br/><span class="small_desc_flat">Create a named audio reference, with optional stream flag
            **name** The name to assign this audio reference
            **file** The asset file id from which the audio is loaded/streamed
            **stream** Whether or not to stream the audio, default `false`
            **returns** The `Sound` instance, but the audio API stores this, use the API to manipulate it by name.</span>
        </span>
    <span class="method apipage">
            <a name="sound"><a class="lift" href="#sound">sound</a></a><code class="signature apipage">sound(\_name:String<span></span>) : lime.helpers.Sound</code><br/><span class="small_desc_flat">Fetch a named audio reference
            **name** The name to acquire audio reference
            **returns** The `Sound` instance</span>
        </span>
    <span class="method apipage">
            <a name="exists"><a class="lift" href="#exists">exists</a></a><code class="signature apipage">exists(\_name:String<span></span>) : Bool</code><br/><span class="small_desc_flat">Determine whether a named audio reference exists
            **name** The audio reference name to check
            **returns** true/false</span>
        </span>
    <span class="method apipage">
            <a name="playing"><a class="lift" href="#playing">playing</a></a><code class="signature apipage">playing(\_name:String<span></span>) : Bool</code><br/><span class="small_desc_flat">Determine whether a named audio reference is playing
            **name** The audio reference name to check
            **returns** true/false</span>
        </span>
    <span class="method apipage">
            <a name="on_complete"><a class="lift" href="#on_complete">on\_complete</a></a><code class="signature apipage">on\_complete(\_name:String<span></span>, handler:<span></span>) : Void</code><br/><span class="small_desc_flat">Set the on complete handler for a named audio reference
            **name** The audio reference name to assign to
            **handler** The callback to call when playback is complete
            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="loop"><a class="lift" href="#loop">loop</a></a><code class="signature apipage">loop(\_name:String<span></span>) : Void</code><br/><span class="small_desc_flat">Loop a named audio reference indefinitely. Use `stop` if needed.
            **name** The audio reference name to loop
            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><code class="signature apipage">stop(\_name:String<span></span>) : Void</code><br/><span class="small_desc_flat">Stop a named audio reference from playing (or looping)
            **name** The audio reference name to stop
            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><code class="signature apipage">play(\_name:String<span></span>, \_number\_of\_times:Int<span>=1</span>, \_start\_position\_in\_s:Float<span>=0</span>) : Void</code><br/><span class="small_desc_flat">Play a named audio reference
            **name** The audio reference name to play
            **number_of_times** The exact number of times to play
            **start_position_in_s** The start time, in seconds
            **returns** nothing</span>
        </span>
    <span class="method apipage">
            <a name="volume"><a class="lift" href="#volume">volume</a></a><code class="signature apipage">volume(\_name:String<span></span>, \_volume:Float<span>=null</span>) : Float</code><br/><span class="small_desc_flat">get/set the volume of a named audio reference
            **name** The audio reference name to adjust
            **volume** A new volume value (set), or leave empty (get)
            **returns** The volume of `name` IF volume is unspecified</span>
        </span>
    <span class="method apipage">
            <a name="pan"><a class="lift" href="#pan">pan</a></a><code class="signature apipage">pan(\_name:String<span></span>, \_pan:Float<span>=null</span>) : Float</code><br/><span class="small_desc_flat">get/set the pan of a named audio reference
            **name** The audio reference name to adjust
            **pan** A new pan value (set), or leave empty (get)
            **returns** The pan of `name` IF pan is unspecified</span>
        </span>
    <span class="method apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><code class="signature apipage">position(\_name:String<span></span>, \_pos:Float<span>=null</span>) : Float</code><br/><span class="small_desc_flat">get/set the position of a named audio reference
            **name** The audio reference name to adjust
            **pos** A new position value (set), or leave empty (get)
            **returns** The position of `name` IF position is unspecified</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;