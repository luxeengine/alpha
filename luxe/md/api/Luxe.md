
[![Logo](../images/logo.png)](../api/index.html)

---


<h1>Luxe</h1>
<small>`Luxe`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audio : [luxe.Audio](../api/luxe/Audio.html)</code><br/></span>
            <span class="small_desc_flat">Access to the audio features</span><br/><span class="member apipage">
                <a name="build"><a class="lift" href="#build">build</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">build : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The version + build meta information, generated at compile time from a macro (luxe.BuildVersion)</span><br/><span class="member apipage">
                <a name="camera"><a class="lift" href="#camera">camera</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">camera : [luxe.Camera](../api/luxe/Camera.html)</code><br/></span>
            <span class="small_desc_flat">Access to the default camera</span><br/><span class="member apipage">
                <a name="core"><a class="lift" href="#core">core</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">core : [luxe.Core](../api/luxe/Core.html)</code><br/></span>
            <span class="small_desc_flat">Direct access to the core engine</span><br/><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">debug : [luxe.Debug](../api/luxe/Debug.html)</code><br/></span>
            <span class="small_desc_flat">Access to the core debug features</span><br/><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">draw : [luxe.Draw](../api/luxe/Draw.html)</code><br/></span>
            <span class="small_desc_flat">Access to the drawing features</span><br/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](../api/luxe/Events.html)</code><br/></span>
            <span class="small_desc_flat">Access to the global event system</span><br/><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">input : [luxe.Input](../api/luxe/Input.html)</code><br/></span>
            <span class="small_desc_flat">Access to the input features</span><br/><span class="member apipage">
                <a name="mouse"><a class="lift" href="#mouse">mouse</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">mouse : [luxe.Vector](../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The last known mouse position</span><br/><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">physics : [luxe.Physics](../api/luxe/Physics.html)</code><br/></span>
            <span class="small_desc_flat">Access to the physics bindings, if any</span><br/><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">renderer : [phoenix.Renderer](../api/phoenix/Renderer.html)</code><br/></span>
            <span class="small_desc_flat">Access to the rendering system</span><br/><span class="member apipage">
                <a name="resources"><a class="lift" href="#resources">resources</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">resources : [luxe.resource.ResourceManager](../api/luxe/resource/ResourceManager.html)</code><br/></span>
            <span class="small_desc_flat">Access to the default resource manager</span><br/><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](../api/luxe/Scene.html)</code><br/></span>
            <span class="small_desc_flat">Access to the default luxe scene</span><br/><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">timer : [luxe.Timer](../api/luxe/Timer.html)</code><br/></span>
            <span class="small_desc_flat">Access to the timing features</span><br/><span class="member apipage">
                <a name="utils"><a class="lift" href="#utils">utils</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">utils : [luxe.utils.Utils](../api/luxe/utils/Utils.html)</code><br/></span>
            <span class="small_desc_flat">Access to the different utilities</span><br/><span class="member apipage">
                <a name="version"><a class="lift" href="#version">version</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">version : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The version of the engine</span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="loadData"><a class="lift" href="#loadData">loadData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadData(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onloaded:[luxe.resource.DataResource](../api/luxe/resource/DataResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [luxe.resource.DataResource](../api/luxe/resource/DataResource.html)</code><br/><span class="small_desc_flat">Load a bytes/data resource</span>


</span>
<span class="method apipage">
            <a name="loadFont"><a class="lift" href="#loadFont">loadFont</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadFont(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_path:[String](http://api.haxe.org/String.html)<span>=null</span>, \_onloaded:[phoenix.BitmapFont](../api/phoenix/BitmapFont.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [phoenix.BitmapFont](../api/phoenix/BitmapFont.html)</code><br/><span class="small_desc_flat">Load a font resource</span>


</span>
<span class="method apipage">
            <a name="loadJSON"><a class="lift" href="#loadJSON">loadJSON</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadJSON(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onloaded:[luxe.resource.JSONResource](../api/luxe/resource/JSONResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [luxe.resource.JSONResource](../api/luxe/resource/JSONResource.html)</code><br/><span class="small_desc_flat">Load a text resource</span>


</span>
<span class="method apipage">
            <a name="loadShader"><a class="lift" href="#loadShader">loadShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadShader(\_ps\_id:[String](http://api.haxe.org/String.html)<span>=&#x27;default&#x27;</span>, \_vs\_id:[String](http://api.haxe.org/String.html)<span>=&#x27;default&#x27;</span>, \_onloaded:[phoenix.Shader](../api/phoenix/Shader.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [phoenix.Shader](../api/phoenix/Shader.html)</code><br/><span class="small_desc_flat">Load a shader resource</span>


</span>
<span class="method apipage">
            <a name="loadSound"><a class="lift" href="#loadSound">loadSound</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadSound(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_id:[String](http://api.haxe.org/String.html)<span></span>, \_is\_music:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>, \_onloaded:[luxe.resource.SoundResource](../api/luxe/resource/SoundResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [luxe.resource.SoundResource](../api/luxe/resource/SoundResource.html)</code><br/><span class="small_desc_flat">Load a sound resource</span>


</span>
<span class="method apipage">
            <a name="loadText"><a class="lift" href="#loadText">loadText</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadText(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onloaded:[luxe.resource.TextResource](../api/luxe/resource/TextResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [luxe.resource.TextResource](../api/luxe/resource/TextResource.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="loadTexture"><a class="lift" href="#loadTexture">loadTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadTexture(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onloaded:[phoenix.Texture](../api/phoenix/Texture.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [phoenix.Texture](../api/phoenix/Texture.html)</code><br/><span class="small_desc_flat">Load a texture/image resource</span>


</span>
<span class="method apipage">
            <a name="loadTextures"><a class="lift" href="#loadTextures">loadTextures</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadTextures(\_ids:[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;<span></span>, \_onloaded:[Array](http://api.haxe.org/Array.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Load multiple texture/image resources, useful for preloading</span>


</span>
<span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">off&lt;T&gt;(event:[String](http://api.haxe.org/String.html)<span></span>, handler:[off.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">stop listening for core eventsinput</span>


</span>
<span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">on&lt;T&gt;(event:[String](http://api.haxe.org/String.html)<span></span>, handler:[on.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">listen for core events</span>


</span>
<span class="method apipage">
            <a name="openURL"><a class="lift" href="#openURL">openURL</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">openURL(\_url:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Open the system default browser with the given URL</span>


</span>
<span class="method apipage">
            <a name="showConsole"><a class="lift" href="#showConsole">showConsole</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">showConsole(\_show:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">show/hide the debug console programmatically</span>


</span>
<span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">shutdown() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">shutdown the engine and quit</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;