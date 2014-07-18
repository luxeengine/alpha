
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>SpriteAnimation</h1>
<small>`luxe.components.sprite.SpriteAnimation`</small>



---

`class`extends <code><span>luxe.Component</span></code>
<span class="meta">
<br/>meta: @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)
</span>


---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="animation_list"><a class="lift" href="#animation_list">animation\_list</a></a><code class="signature apipage">animation\_list : [Map](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current"><a class="lift" href="#current">current</a></a><code class="signature apipage">current : [luxe.components.sprite.SpriteAnimationData](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="current_frame"><a class="lift" href="#current_frame">current\_frame</a></a><code class="signature apipage">current\_frame : [luxe.components.sprite.SpriteAnimationFrame](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame"><a class="lift" href="#frame">frame</a></a><code class="signature apipage">frame : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="image_frame"><a class="lift" href="#image_frame">image\_frame</a></a><code class="signature apipage">image\_frame : [Int](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="frame_time"><a class="lift" href="#frame_time">frame\_time</a></a><code class="signature apipage">frame\_time : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="loop"><a class="lift" href="#loop">loop</a></a><code class="signature apipage">loop : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pingpong"><a class="lift" href="#pingpong">pingpong</a></a><code class="signature apipage">pingpong : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="reverse"><a class="lift" href="#reverse">reverse</a></a><code class="signature apipage">reverse : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="playing"><a class="lift" href="#playing">playing</a></a><code class="signature apipage">playing : [Bool](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="animation"><a class="lift" href="#animation">animation</a></a><code class="signature apipage">animation : [String](#)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="speed"><a class="lift" href="#speed">speed</a></a><code class="signature apipage">speed : [Float](#)</code><br/></span>
            <span class="small_desc_flat"></span>



<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><code class="signature apipage">init() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_from_json_object"><a class="lift" href="#add_from_json_object">add\_from\_json\_object</a></a><code class="signature apipage">add\_from\_json\_object(\_json\_object:<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_from_json"><a class="lift" href="#add_from_json">add\_from\_json</a></a><code class="signature apipage">add\_from\_json(\_json\_string:String<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_event"><a class="lift" href="#remove_event">remove\_event</a></a><code class="signature apipage">remove\_event(\_animation:String<span></span>, \_image\_frame:Int<span></span>, \_event:String<span>=&#x27;&#x27;</span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="remove_events"><a class="lift" href="#remove_events">remove\_events</a></a><code class="signature apipage">remove\_events(\_animation:String<span></span>, \_image\_frame:Int<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="add_event"><a class="lift" href="#add_event">add\_event</a></a><code class="signature apipage">add\_event(\_animation:String<span></span>, \_image\_frame:Int<span></span>, \_event:String<span>=&#x27;&#x27;</span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="restart"><a class="lift" href="#restart">restart</a></a><code class="signature apipage">restart() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><code class="signature apipage">play() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><code class="signature apipage">stop() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="set_frame"><a class="lift" href="#set_frame">set\_frame</a></a><code class="signature apipage">set\_frame(\_frame:Int<span></span>) : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_serialize_data"><a class="lift" href="#get_serialize_data">get\_serialize\_data</a></a><code class="signature apipage">get\_serialize\_data() : Dynamic</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><code class="signature apipage">new() : Void</code><br/><span class="small_desc_flat"></span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;