
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Audio</h1>
<small>`luxe.Audio`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><div class="clear"></div>
            <code class="signature apipage">create(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_name:[String](http://api.haxe.org/String.html)<span></span>, \_streaming:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [luxe.Sound](../../api/luxe/Sound.html)</code><br/><span class="small_desc_flat">Create a named audio reference, with optional streaming flag   
            **id** The asset file id from which the audio is loaded/streamed.   
            **name** The name to assign the sound for the named api    
            **streaming** Whether or not to stream the audio, default `false`   
            **returns** The `Sound` instance, if needed. can be manipulated through named api as well.</span>


</span>
<span class="method apipage">
            <a name="duration"><a class="lift" href="#duration">duration</a></a><div class="clear"></div>
            <code class="signature apipage">duration(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get the position in seconds of a named audio reference   
            **name** The audio reference name to get</span>


</span>
<span class="method apipage">
            <a name="exists"><a class="lift" href="#exists">exists</a></a><div class="clear"></div>
            <code class="signature apipage">exists(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Determine whether a named audio reference exists   
            **name** The audio reference name to check   
            **returns** true/false</span>


</span>
<span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><div class="clear"></div>
            <code class="signature apipage">get(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [luxe.Sound](../../api/luxe/Sound.html)</code><br/><span class="small_desc_flat">Fetch a named audio reference   
            **name** The name to acquire audio reference   
            **returns** The `Sound` instance</span>


</span>
<span class="method apipage">
            <a name="loop"><a class="lift" href="#loop">loop</a></a><div class="clear"></div>
            <code class="signature apipage">loop(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Loop a named audio reference indefinitely. Use `stop` if needed.   
            **name** The audio reference name to loop   
            **returns** nothing</span>


</span>
<span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a><div class="clear"></div>
            <code class="signature apipage">off(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_event:[String](http://api.haxe.org/String.html)<span></span>, \_handler:[luxe.Sound](../../api/luxe/Sound.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Stop listening for an event on a named sound. See `on`</span>


</span>
<span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a><div class="clear"></div>
            <code class="signature apipage">on(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_event:[String](http://api.haxe.org/String.html)<span></span>, \_handler:[luxe.Sound](../../api/luxe/Sound.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Listen for an event on a named sound. `load` and `end` are valid</span>


</span>
<span class="method apipage">
            <a name="on_complete"><a class="lift" href="#on_complete">on\_complete</a></a><div class="clear"></div>
            <code class="signature apipage">on\_complete(\_name:[String](http://api.haxe.org/String.html)<span></span>, handler:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Set the on complete handler for a named audio reference   
            **name** The audio reference name to assign to   
            **handler** The callback to call when playback is complete   
            **returns** nothing</span>


</span>
<span class="method apipage">
            <a name="pan"><a class="lift" href="#pan">pan</a></a><div class="clear"></div>
            <code class="signature apipage">pan(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_pan:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get/set the pan of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **pan** A new pan value</span>


</span>
<span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><div class="clear"></div>
            <code class="signature apipage">pause(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Pause a named audio reference   
            **name** The audio reference name to pause   
            **returns** nothing</span>


</span>
<span class="method apipage">
            <a name="pitch"><a class="lift" href="#pitch">pitch</a></a><div class="clear"></div>
            <code class="signature apipage">pitch(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_pitch:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get/set the pitch of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **pitch** A new pitch value</span>


</span>
<span class="method apipage">
            <a name="play"><a class="lift" href="#play">play</a></a><div class="clear"></div>
            <code class="signature apipage">play(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Play a named audio reference   
            **name** The audio reference name to play   
            **returns** nothing</span>


</span>
<span class="method apipage">
            <a name="position"><a class="lift" href="#position">position</a></a><div class="clear"></div>
            <code class="signature apipage">position(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_position:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get/set the position in `seconds` of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **pan** A new pan value</span>


</span>
<span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><div class="clear"></div>
            <code class="signature apipage">stop(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Stop a named audio reference from playing (or looping)   
            **name** The audio reference name to stop   
            **returns** nothing</span>


</span>
<span class="method apipage">
            <a name="toggle"><a class="lift" href="#toggle">toggle</a></a><div class="clear"></div>
            <code class="signature apipage">toggle(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Toggle a sound instance by name, pausing the sound or resuming it</span>


</span>
<span class="method apipage">
            <a name="uncreate"><a class="lift" href="#uncreate">uncreate</a></a><div class="clear"></div>
            <code class="signature apipage">uncreate(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Destroy a named audio reference.
            Use the reference directly with sound.destroy if you have an instance.</span>


</span>
<span class="method apipage">
            <a name="volume"><a class="lift" href="#volume">volume</a></a><div class="clear"></div>
            <code class="signature apipage">volume(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_volume:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">get/set the volume of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **volume** A new volume value</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;