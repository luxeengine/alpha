
[![Logo](../images/logo.png)](../api/index.html)

---



<h1>Luxe</h1>
<small>`Luxe`</small>



---

`class`

---

&nbsp;
&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="mouse"><a class="lift" href="#mouse">mouse</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">mouse : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The last known mouse position</span><span class="member apipage">
                <a name="core"><a class="lift" href="#core">core</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">core : [luxe.Core](#)</code><br/></span>
            <span class="small_desc_flat">Direct access to the core engine</span><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">debug : [luxe.Debug](#)</code><br/></span>
            <span class="small_desc_flat">Access to the core debug features</span><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">draw : [luxe.Draw](#)</code><br/></span>
            <span class="small_desc_flat">Access to the drawing features</span><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">audio : [luxe.Audio](#)</code><br/></span>
            <span class="small_desc_flat">Access to the audio features</span><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">timer : [luxe.Timer](#)</code><br/></span>
            <span class="small_desc_flat">Access to the timing features</span><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat">Access to the global event system</span><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">input : [luxe.Input](#)</code><br/></span>
            <span class="small_desc_flat">Access to the input features</span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat">Access to the default luxe scene</span><span class="member apipage">
                <a name="utils"><a class="lift" href="#utils">utils</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">utils : [luxe.utils.Utils](#)</code><br/></span>
            <span class="small_desc_flat">Access to the different utilities</span><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">physics : [luxe.Physics](#)</code><br/></span>
            <span class="small_desc_flat">Access to the physics bindings, if any</span><span class="member apipage">
                <a name="camera"><a class="lift" href="#camera">camera</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">camera : [luxe.Camera](#)</code><br/></span>
            <span class="small_desc_flat">Access to the default camera</span><span class="member apipage">
                <a name="resources"><a class="lift" href="#resources">resources</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">resources : [luxe.ResourceManager](#)</code><br/></span>
            <span class="small_desc_flat">Access to the default resource manager</span><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">renderer : [phoenix.Renderer](#)</code><br/></span>
            <span class="small_desc_flat">Access to the rendering system</span><span class="member apipage">
                <a name="version"><a class="lift" href="#version">version</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">version : [String](#)</code><br/></span>
            <span class="small_desc_flat">The version of the engine</span><span class="member apipage">
                <a name="build"><a class="lift" href="#build">build</a></a><span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">build : [String](#)</code><br/></span>
            <span class="small_desc_flat">The version + build meta information, generated at compile time from a macro (luxe.BuildVersion)</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="get_screen"><a class="lift" href="#get_screen">get\_screen</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_screen() : [luxe.Screen](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="get_time"><a class="lift" href="#get_time">get\_time</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_time() : [Float](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">shutdown() : [Void](#)</code><br/><span class="small_desc_flat">shutdown the engine and quit</span>
        </span>
    <span class="method apipage">
            <a name="showConsole"><a class="lift" href="#showConsole">showConsole</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">showConsole(\_show:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">show/hide the debug console programmatically</span>
        </span>
    <span class="method apipage">
            <a name="loadJSON"><a class="lift" href="#loadJSON">loadJSON</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadJSON(\_id:[String](#)<span></span>, \_onloaded:[luxe.JSONResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.JSONResource](#)</code><br/><span class="small_desc_flat">Load a text resource</span>
        </span>
    <span class="method apipage">
            <a name="loadText"><a class="lift" href="#loadText">loadText</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadText(\_id:[String](#)<span></span>, \_onloaded:[luxe.TextResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.TextResource](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="loadData"><a class="lift" href="#loadData">loadData</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadData(\_id:[String](#)<span></span>, \_onloaded:[luxe.DataResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.DataResource](#)</code><br/><span class="small_desc_flat">Load a bytes/data resource</span>
        </span>
    <span class="method apipage">
            <a name="loadSound"><a class="lift" href="#loadSound">loadSound</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadSound(\_name:[String](#)<span></span>, \_id:[String](#)<span></span>, \_is\_music:[Bool](#)<span>=false</span>, \_onloaded:[luxe.SoundResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.SoundResource](#)</code><br/><span class="small_desc_flat">Load a sound resource</span>
        </span>
    <span class="method apipage">
            <a name="loadTexture"><a class="lift" href="#loadTexture">loadTexture</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadTexture(\_id:[String](#)<span></span>, \_onloaded:[phoenix.Texture](#)&nbsp;-&gt; [Void](#)<span>=null</span>, \_silent:[Bool](#)<span>=false</span>) : [phoenix.Texture](#)</code><br/><span class="small_desc_flat">Load a texture/image resource</span>
        </span>
    <span class="method apipage">
            <a name="loadTextures"><a class="lift" href="#loadTextures">loadTextures</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadTextures(\_ids:[Array](#)&lt;[String](#)&gt;<span></span>, \_onloaded:[Array](#)&nbsp;-&gt; [Void](#)<span>=null</span>, \_silent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">Load multiple texture/image resources, useful for preloading</span>
        </span>
    <span class="method apipage">
            <a name="loadFont"><a class="lift" href="#loadFont">loadFont</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadFont(\_id:[String](#)<span></span>, \_path:[String](#)<span>=null</span>, \_onloaded:[phoenix.BitmapFont](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [phoenix.BitmapFont](#)</code><br/><span class="small_desc_flat">Load a font resource</span>
        </span>
    <span class="method apipage">
            <a name="loadShader"><a class="lift" href="#loadShader">loadShader</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">loadShader(\_ps\_id:[String](#)<span>=&#x27;default&#x27;</span>, \_vs\_id:[String](#)<span>=&#x27;default&#x27;</span>, \_onloaded:[phoenix.Shader](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [phoenix.Shader](#)</code><br/><span class="small_desc_flat">Load a shader resource</span>
        </span>
    <span class="method apipage">
            <a name="openURL"><a class="lift" href="#openURL">openURL</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">openURL(\_url:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Open the system default browser with the given URL</span>
        </span>
    <span class="method apipage">
            <a name="get_timescale"><a class="lift" href="#get_timescale">get\_timescale</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_timescale() : [Float](#)</code><br/><span class="small_desc_flat">the scale of time</span>
        </span>
    <span class="method apipage">
            <a name="get_fixed_delta"><a class="lift" href="#get_fixed_delta">get\_fixed\_delta</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_fixed\_delta() : [Float](#)</code><br/><span class="small_desc_flat">if this is non zero this will be passed in</span>
        </span>
    <span class="method apipage">
            <a name="get_update_rate"><a class="lift" href="#get_update_rate">get\_update\_rate</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_update\_rate() : [Float](#)</code><br/><span class="small_desc_flat">if this is non zero, updates will be forced to this rate</span>
        </span>
    <span class="method apipage">
            <a name="get_max_frame_time"><a class="lift" href="#get_max_frame_time">get\_max\_frame\_time</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_max\_frame\_time() : [Float](#)</code><br/><span class="small_desc_flat">the maximum frame time</span>
        </span>
    <span class="method apipage">
            <a name="get_dt"><a class="lift" href="#get_dt">get\_dt</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_dt() : [Float](#)</code><br/><span class="small_desc_flat">the time the last frame took to run</span>
        </span>
    <span class="method apipage">
            <a name="get_delta_sim"><a class="lift" href="#get_delta_sim">get\_delta\_sim</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_delta\_sim() : [Float](#)</code><br/><span class="small_desc_flat">the simulated time the last frame took to run, relative to scale etc</span>
        </span>
    <span class="method apipage">
            <a name="get_last_frame_start"><a class="lift" href="#get_last_frame_start">get\_last\_frame\_start</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_last\_frame\_start() : [Float](#)</code><br/><span class="small_desc_flat">the start time of the last frame</span>
        </span>
    <span class="method apipage">
            <a name="get_current_time"><a class="lift" href="#get_current_time">get\_current\_time</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_current\_time() : [Float](#)</code><br/><span class="small_desc_flat">the current simulation time</span>
        </span>
    <span class="method apipage">
            <a name="get_cur_frame_start"><a class="lift" href="#get_cur_frame_start">get\_cur\_frame\_start</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_cur\_frame\_start() : [Float](#)</code><br/><span class="small_desc_flat">the start time of this frame</span>
        </span>
    <span class="method apipage">
            <a name="get_alpha"><a class="lift" href="#get_alpha">get\_alpha</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">get\_alpha() : [Float](#)</code><br/><span class="small_desc_flat">the alpha time for a render between frame updates</span>
        </span>
    <span class="method apipage">
            <a name="set_timescale"><a class="lift" href="#set_timescale">set\_timescale</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_timescale(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the scale of time</span>
        </span>
    <span class="method apipage">
            <a name="set_fixed_delta"><a class="lift" href="#set_fixed_delta">set\_fixed\_delta</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_fixed\_delta(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">if this is non zero this will be passed in</span>
        </span>
    <span class="method apipage">
            <a name="set_update_rate"><a class="lift" href="#set_update_rate">set\_update\_rate</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_update\_rate(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">if this is non zero, updates will be forced to this rate</span>
        </span>
    <span class="method apipage">
            <a name="set_max_frame_time"><a class="lift" href="#set_max_frame_time">set\_max\_frame\_time</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_max\_frame\_time(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the maximum frame time</span>
        </span>
    <span class="method apipage">
            <a name="set_dt"><a class="lift" href="#set_dt">set\_dt</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_dt(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the time the last frame took to run</span>
        </span>
    <span class="method apipage">
            <a name="set_delta_sim"><a class="lift" href="#set_delta_sim">set\_delta\_sim</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_delta\_sim(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the simulated time the last frame took to run, relative to scale etc</span>
        </span>
    <span class="method apipage">
            <a name="set_last_frame_start"><a class="lift" href="#set_last_frame_start">set\_last\_frame\_start</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_last\_frame\_start(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the start time of the last frame</span>
        </span>
    <span class="method apipage">
            <a name="set_current_time"><a class="lift" href="#set_current_time">set\_current\_time</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_current\_time(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the current simulation time</span>
        </span>
    <span class="method apipage">
            <a name="set_cur_frame_start"><a class="lift" href="#set_cur_frame_start">set\_cur\_frame\_start</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_cur\_frame\_start(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the start time of this frame</span>
        </span>
    <span class="method apipage">
            <a name="set_alpha"><a class="lift" href="#set_alpha">set\_alpha</a></a> <span class="inline-block static">static</span><div class="clear"></div><code class="signature apipage">set\_alpha(value:[Float](#)<span></span>) : [Float](#)</code><br/><span class="small_desc_flat">the alpha time for a render between frame updates</span>
        </span>
    





---

&nbsp;
&nbsp;
&nbsp;
&nbsp;