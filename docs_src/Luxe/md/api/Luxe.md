
[![Logo](../images/logo.png)](../api/index.html)

---



#Luxe



---

`class`
<span class="meta">

</span>


---

&nbsp;
&nbsp;

<h3>Members</h3> <hr/><span class="member apipage">
            <a name="audio"><a class="lift" href="#audio">audio</a></a><span class="inline-block static">static</span><code class="signature apipage">audio : [luxe.Audio](#luxe.Audio)</code><br/></span>
        <span class="small_desc_flat">Access to the audio features</span><span class="member apipage">
            <a name="camera"><a class="lift" href="#camera">camera</a></a><span class="inline-block static">static</span><code class="signature apipage">camera : [luxe.Camera](#luxe.Camera)</code><br/></span>
        <span class="small_desc_flat">Access to the default camera</span><span class="member apipage">
            <a name="core"><a class="lift" href="#core">core</a></a><span class="inline-block static">static</span><code class="signature apipage">core : [luxe.Core](#luxe.Core)</code><br/></span>
        <span class="small_desc_flat">Direct access to the core engine</span><span class="member apipage">
            <a name="debug"><a class="lift" href="#debug">debug</a></a><span class="inline-block static">static</span><code class="signature apipage">debug : [luxe.Debug](#luxe.Debug)</code><br/></span>
        <span class="small_desc_flat">Access to the core debug features</span><span class="member apipage">
            <a name="draw"><a class="lift" href="#draw">draw</a></a><span class="inline-block static">static</span><code class="signature apipage">draw : [luxe.Draw](#luxe.Draw)</code><br/></span>
        <span class="small_desc_flat">Access to the drawing features</span><span class="member apipage">
            <a name="dt"><a class="lift" href="#dt">dt</a></a><span class="inline-block static">static</span><code class="signature apipage">dt : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">The time the last frame took, this value can be altered or fixed using `Luxe.timescale` or `Luxe.fixed_timestep`</span><span class="member apipage">
            <a name="events"><a class="lift" href="#events">events</a></a><span class="inline-block static">static</span><code class="signature apipage">events : [luxe.Events](#luxe.Events)</code><br/></span>
        <span class="small_desc_flat">Access to the global event system</span><span class="member apipage">
            <a name="fixed_timestep"><a class="lift" href="#fixed_timestep">fixed\_timestep</a></a><span class="inline-block static">static</span><code class="signature apipage">fixed\_timestep : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">Set this for a fixed timestep value</span><span class="member apipage">
            <a name="input"><a class="lift" href="#input">input</a></a><span class="inline-block static">static</span><code class="signature apipage">input : [luxe.Input](#luxe.Input)</code><br/></span>
        <span class="small_desc_flat">Access to the input features</span><span class="member apipage">
            <a name="mouse"><a class="lift" href="#mouse">mouse</a></a><span class="inline-block static">static</span><code class="signature apipage">mouse : [luxe.Vector](#luxe.Vector)</code><br/></span>
        <span class="small_desc_flat">The last known mouse position</span><span class="member apipage">
            <a name="physics"><a class="lift" href="#physics">physics</a></a><span class="inline-block static">static</span><code class="signature apipage">physics : [luxe.Physics](#luxe.Physics)</code><br/></span>
        <span class="small_desc_flat">Access to the physics bindings, if any</span><span class="member apipage">
            <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><span class="inline-block static">static</span><code class="signature apipage">renderer : [phoenix.Renderer](#phoenix.Renderer)</code><br/></span>
        <span class="small_desc_flat">Access to the rendering system</span><span class="member apipage">
            <a name="resources"><a class="lift" href="#resources">resources</a></a><span class="inline-block static">static</span><code class="signature apipage">resources : [luxe.ResourceManager](#luxe.ResourceManager)</code><br/></span>
        <span class="small_desc_flat">Access to the default resource manager</span><span class="member apipage">
            <a name="scene"><a class="lift" href="#scene">scene</a></a><span class="inline-block static">static</span><code class="signature apipage">scene : [luxe.Scene](#luxe.Scene)</code><br/></span>
        <span class="small_desc_flat">Access to the default luxe scene</span><span class="member apipage">
            <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><code class="signature apipage">timer : [luxe.Timer](#luxe.Timer)</code><br/></span>
        <span class="small_desc_flat">Access to the timing features</span><span class="member apipage">
            <a name="timescale"><a class="lift" href="#timescale">timescale</a></a><span class="inline-block static">static</span><code class="signature apipage">timescale : [Float](http://api.haxe.org/Float.html)</code><br/></span>
        <span class="small_desc_flat">The scale of time that affects the update rates and deltas</span><span class="member apipage">
            <a name="utils"><a class="lift" href="#utils">utils</a></a><span class="inline-block static">static</span><code class="signature apipage">utils : [luxe.utils.Utils](#luxe.utils.Utils)</code><br/></span>
        <span class="small_desc_flat">Access to the different utilities</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="addGeometry"><a class="lift" href="#addGeometry">addGeometry</a></a><span class="inline-block static">static</span><code class="signature apipage">addGeometry(\_geom:<span>[phoenix.geometry.Geometry](#phoenix.geometry.Geometry)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Add geometry to the default batcher</span>
        </span>
    <span class="method apipage">
            <a name="addGroup"><a class="lift" href="#addGroup">addGroup</a></a><span class="inline-block static">static</span><code class="signature apipage">addGroup(\_group:<span>[Int](http://api.haxe.org/Int.html)</span>, ?\_pre\_render:<span>[phoenix.Batcher-&gt;Void](#phoenix.Batcher->Void)=null</span>, ?\_post\_render:<span>[phoenix.Batcher-&gt;Void](#phoenix.Batcher->Void)=null</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Add a geometry group to the default batcher</span>
        </span>
    <span class="method apipage">
            <a name="createBatcher"><a class="lift" href="#createBatcher">createBatcher</a></a><span class="inline-block static">static</span><code class="signature apipage">createBatcher(?\_name:<span>[String](http://api.haxe.org/String.html)=&#x27;batcher&#x27;</span>, ?\_camera:<span>[luxe.Camera](#luxe.Camera)=null</span>, ?\_add:<span>[Bool](http://api.haxe.org/Bool.html)=true</span>) : [phoenix.Batcher](#phoenix.Batcher)</code><br/><span class="small_desc_flat">Create a batcher, convenience for create batcher, add batcher, and create camera for the batcher.</span>
        </span>
    <span class="method apipage">
            <a name="fileDialogFolder"><a class="lift" href="#fileDialogFolder">fileDialogFolder</a></a><span class="inline-block static">static</span><code class="signature apipage">fileDialogFolder(\_title:<span>[String](http://api.haxe.org/String.html)</span>, \_text:<span>[String](http://api.haxe.org/String.html)</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Open the system folder dialog picker</span>
        </span>
    <span class="method apipage">
            <a name="fileDialogOpen"><a class="lift" href="#fileDialogOpen">fileDialogOpen</a></a><span class="inline-block static">static</span><code class="signature apipage">fileDialogOpen(\_title:<span>[String](http://api.haxe.org/String.html)</span>, \_text:<span>[String](http://api.haxe.org/String.html)</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Open the system file open dialog picker</span>
        </span>
    <span class="method apipage">
            <a name="fileDialogSave"><a class="lift" href="#fileDialogSave">fileDialogSave</a></a><span class="inline-block static">static</span><code class="signature apipage">fileDialogSave(\_title:<span>[String](http://api.haxe.org/String.html)</span>, \_text:<span>[String](http://api.haxe.org/String.html)</span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Open the system file save dialog picker</span>
        </span>
    <span class="method apipage">
            <a name="loadData"><a class="lift" href="#loadData">loadData</a></a><span class="inline-block static">static</span><code class="signature apipage">loadData(\_id:<span>[String](http://api.haxe.org/String.html)</span>, ?\_onloaded:<span>[luxe.DataResource-&gt;Void](#luxe.DataResource->Void)=null</span>) : [luxe.DataResource](#luxe.DataResource)</code><br/><span class="small_desc_flat">Load a bytes/data resource</span>
        </span>
    <span class="method apipage">
            <a name="loadFont"><a class="lift" href="#loadFont">loadFont</a></a><span class="inline-block static">static</span><code class="signature apipage">loadFont(\_id:<span>[String](http://api.haxe.org/String.html)</span>, ?\_path:<span>[String](http://api.haxe.org/String.html)=null</span>, ?\_onloaded:<span>[phoenix.BitmapFont-&gt;Void](#phoenix.BitmapFont->Void)=null</span>) : [phoenix.BitmapFont](#phoenix.BitmapFont)</code><br/><span class="small_desc_flat">Load a font resource</span>
        </span>
    <span class="method apipage">
            <a name="loadShader"><a class="lift" href="#loadShader">loadShader</a></a><span class="inline-block static">static</span><code class="signature apipage">loadShader(?\_ps\_id:<span>[String](http://api.haxe.org/String.html)=&#x27;default&#x27;</span>, ?\_vs\_id:<span>[String](http://api.haxe.org/String.html)=&#x27;default&#x27;</span>, ?\_onloaded:<span>[phoenix.Shader-&gt;Void](#phoenix.Shader->Void)=null</span>) : [phoenix.Shader](#phoenix.Shader)</code><br/><span class="small_desc_flat">Load a shader resource</span>
        </span>
    <span class="method apipage">
            <a name="loadSound"><a class="lift" href="#loadSound">loadSound</a></a><span class="inline-block static">static</span><code class="signature apipage">loadSound(\_name:<span>[String](http://api.haxe.org/String.html)</span>, \_id:<span>[String](http://api.haxe.org/String.html)</span>, ?\_is\_music:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>, ?\_onloaded:<span>[luxe.SoundResource-&gt;Void](#luxe.SoundResource->Void)=null</span>) : [luxe.SoundResource](#luxe.SoundResource)</code><br/><span class="small_desc_flat">Load a sound resource</span>
        </span>
    <span class="method apipage">
            <a name="loadText"><a class="lift" href="#loadText">loadText</a></a><span class="inline-block static">static</span><code class="signature apipage">loadText(\_id:<span>[String](http://api.haxe.org/String.html)</span>, ?\_onloaded:<span>[luxe.TextResource-&gt;Void](#luxe.TextResource->Void)=null</span>) : [luxe.TextResource](#luxe.TextResource)</code><br/><span class="small_desc_flat">Load a text resource</span>
        </span>
    <span class="method apipage">
            <a name="loadTexture"><a class="lift" href="#loadTexture">loadTexture</a></a><span class="inline-block static">static</span><code class="signature apipage">loadTexture(\_id:<span>[String](http://api.haxe.org/String.html)</span>, ?\_onloaded:<span>[phoenix.Texture-&gt;Void](#phoenix.Texture->Void)=null</span>, ?\_silent:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>, ?\_asset\_bytes:<span>[lime.utils.ByteArray]()=null</span>) : [phoenix.Texture](#phoenix.Texture)</code><br/><span class="small_desc_flat">Load a texture/image resource</span>
        </span>
    <span class="method apipage">
            <a name="loadTextures"><a class="lift" href="#loadTextures">loadTextures</a></a><span class="inline-block static">static</span><code class="signature apipage">loadTextures(\_ids:<span>[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</span>, ?\_onloaded:<span>[Array-&gt;Void]()=null</span>, ?\_silent:<span>[Bool](http://api.haxe.org/Bool.html)=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Load multiple texture/image resources, useful for preloading</span>
        </span>
    <span class="method apipage">
            <a name="openURL"><a class="lift" href="#openURL">openURL</a></a><span class="inline-block static">static</span><code class="signature apipage">openURL(\_url:<span>[String](http://api.haxe.org/String.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Open the system browser with the given URL</span>
        </span>
    <span class="method apipage">
            <a name="removeGeometry"><a class="lift" href="#removeGeometry">removeGeometry</a></a><span class="inline-block static">static</span><code class="signature apipage">removeGeometry(\_geom:<span>[phoenix.geometry.Geometry](#phoenix.geometry.Geometry)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Remove geometry to the default batcher</span>
        </span>
    <span class="method apipage">
            <a name="showConsole"><a class="lift" href="#showConsole">showConsole</a></a><span class="inline-block static">static</span><code class="signature apipage">showConsole(\_show:<span>[Bool](http://api.haxe.org/Bool.html)</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">show/hide the debug console programmatically</span>
        </span>
    <span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><span class="inline-block static">static</span><code class="signature apipage">shutdown() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">shutdown the engine and quit</span>
        </span>
    

<h3>Properties</h3> <hr/><span class="property apipage">
            <a name="screen"><a class="lift" href="#screen">screen</a></a><span class="inline-block static">static</span><code class="signature apipage">screen : [luxe.Screen]()</code><br/><span class="small_desc_flat">Access to information about the game window (sizes, cursor etc)</span>
        </span><span class="property apipage">
            <a name="time"><a class="lift" href="#time">time</a></a><span class="inline-block static">static</span><code class="signature apipage">time : [Float]()</code><br/><span class="small_desc_flat">The current time in seconds, highest precision from the platform</span>
        </span>

&nbsp;
&nbsp;
&nbsp;