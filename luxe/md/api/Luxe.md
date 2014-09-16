
[![Logo](../images/logo.png)](../api/index.html)

---



<h1>Luxe</h1>
<small>`Luxe`</small>



---

`class`
<span class="meta">
<br/>meta: @:keep
</span>


---


&nbsp;
&nbsp;






<h3>Members</h3> <hr/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audio : [luxe.Audio](#)</code><br/></span>
            <span class="small_desc_flat">Access to the audio features</span><span class="member apipage">
                <a name="build"><a class="lift" href="#build">build</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">build : [String](#)</code><br/></span>
            <span class="small_desc_flat">The version + build meta information, generated at compile time from a macro (luxe.BuildVersion)</span><span class="member apipage">
                <a name="camera"><a class="lift" href="#camera">camera</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">camera : [luxe.Camera](#)</code><br/></span>
            <span class="small_desc_flat">Access to the default camera</span><span class="member apipage">
                <a name="core"><a class="lift" href="#core">core</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">core : [luxe.Core](#)</code><br/></span>
            <span class="small_desc_flat">Direct access to the core engine</span><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">debug : [luxe.Debug](#)</code><br/></span>
            <span class="small_desc_flat">Access to the core debug features</span><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">draw : [luxe.Draw](#)</code><br/></span>
            <span class="small_desc_flat">Access to the drawing features</span><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](#)</code><br/></span>
            <span class="small_desc_flat">Access to the global event system</span><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">input : [luxe.Input](#)</code><br/></span>
            <span class="small_desc_flat">Access to the input features</span><span class="member apipage">
                <a name="mouse"><a class="lift" href="#mouse">mouse</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">mouse : [luxe.Vector](#)</code><br/></span>
            <span class="small_desc_flat">The last known mouse position</span><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">physics : [luxe.Physics](#)</code><br/></span>
            <span class="small_desc_flat">Access to the physics bindings, if any</span><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">renderer : [phoenix.Renderer](#)</code><br/></span>
            <span class="small_desc_flat">Access to the rendering system</span><span class="member apipage">
                <a name="resources"><a class="lift" href="#resources">resources</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">resources : [luxe.resource.ResourceManager](#)</code><br/></span>
            <span class="small_desc_flat">Access to the default resource manager</span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](#)</code><br/></span>
            <span class="small_desc_flat">Access to the default luxe scene</span><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">timer : [luxe.Timer](#)</code><br/></span>
            <span class="small_desc_flat">Access to the timing features</span><span class="member apipage">
                <a name="utils"><a class="lift" href="#utils">utils</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">utils : [luxe.utils.Utils](#)</code><br/></span>
            <span class="small_desc_flat">Access to the different utilities</span><span class="member apipage">
                <a name="version"><a class="lift" href="#version">version</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">version : [String](#)</code><br/></span>
            <span class="small_desc_flat">The version of the engine</span>





<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="loadData"><a class="lift" href="#loadData">loadData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadData(\_id:[String](#)<span></span>, \_onloaded:[luxe.resource.DataResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.resource.DataResource](#)</code><br/><span class="small_desc_flat">Load a bytes/data resource</span>
        </span>
    <span class="method apipage">
            <a name="loadFont"><a class="lift" href="#loadFont">loadFont</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadFont(\_id:[String](#)<span></span>, \_path:[String](#)<span>=null</span>, \_onloaded:[phoenix.BitmapFont](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [phoenix.BitmapFont](#)</code><br/><span class="small_desc_flat">Load a font resource</span>
        </span>
    <span class="method apipage">
            <a name="loadJSON"><a class="lift" href="#loadJSON">loadJSON</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadJSON(\_id:[String](#)<span></span>, \_onloaded:[luxe.resource.JSONResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.resource.JSONResource](#)</code><br/><span class="small_desc_flat">Load a text resource</span>
        </span>
    <span class="method apipage">
            <a name="loadShader"><a class="lift" href="#loadShader">loadShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadShader(\_ps\_id:[String](#)<span>=&#x27;default&#x27;</span>, \_vs\_id:[String](#)<span>=&#x27;default&#x27;</span>, \_onloaded:[phoenix.Shader](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [phoenix.Shader](#)</code><br/><span class="small_desc_flat">Load a shader resource</span>
        </span>
    <span class="method apipage">
            <a name="loadSound"><a class="lift" href="#loadSound">loadSound</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadSound(\_name:[String](#)<span></span>, \_id:[String](#)<span></span>, \_is\_music:[Bool](#)<span>=false</span>, \_onloaded:[luxe.resource.SoundResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.resource.SoundResource](#)</code><br/><span class="small_desc_flat">Load a sound resource</span>
        </span>
    <span class="method apipage">
            <a name="loadText"><a class="lift" href="#loadText">loadText</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadText(\_id:[String](#)<span></span>, \_onloaded:[luxe.resource.TextResource](#)&nbsp;-&gt; [Void](#)<span>=null</span>) : [luxe.resource.TextResource](#)</code><br/><span class="small_desc_flat"></span>
        </span>
    <span class="method apipage">
            <a name="loadTexture"><a class="lift" href="#loadTexture">loadTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadTexture(\_id:[String](#)<span></span>, \_onloaded:[phoenix.Texture](#)&nbsp;-&gt; [Void](#)<span>=null</span>, \_silent:[Bool](#)<span>=false</span>) : [phoenix.Texture](#)</code><br/><span class="small_desc_flat">Load a texture/image resource</span>
        </span>
    <span class="method apipage">
            <a name="loadTextures"><a class="lift" href="#loadTextures">loadTextures</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadTextures(\_ids:[Array](#)&lt;[String](#)&gt;<span></span>, \_onloaded:[Array](#)&nbsp;-&gt; [Void](#)<span>=null</span>, \_silent:[Bool](#)<span>=false</span>) : [Void](#)</code><br/><span class="small_desc_flat">Load multiple texture/image resources, useful for preloading</span>
        </span>
    <span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">off&lt;T&gt;(event:[String](#)<span></span>, handler:[off.T](#)&nbsp;-&gt; [Void](#)<span></span>) : [Bool](#)</code><br/><span class="small_desc_flat">stop listening for core eventsinput</span>
        </span>
    <span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">on&lt;T&gt;(event:[String](#)<span></span>, handler:[on.T](#)&nbsp;-&gt; [Void](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">listen for core events</span>
        </span>
    <span class="method apipage">
            <a name="openURL"><a class="lift" href="#openURL">openURL</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">openURL(\_url:[String](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">Open the system default browser with the given URL</span>
        </span>
    <span class="method apipage">
            <a name="showConsole"><a class="lift" href="#showConsole">showConsole</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">showConsole(\_show:[Bool](#)<span></span>) : [Void](#)</code><br/><span class="small_desc_flat">show/hide the debug console programmatically</span>
        </span>
    <span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">shutdown() : [Void](#)</code><br/><span class="small_desc_flat">shutdown the engine and quit</span>
        </span>
    






---

&nbsp;
&nbsp;
&nbsp;
&nbsp;