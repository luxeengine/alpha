
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Game</h1>
<small>`luxe.Game`</small>



<hr/>

`class`extends <code><span>luxe.Emitter</span></code><br/><span class="meta">
meta: @:keep, @:noCompletion, @:keepSub</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div>
            <code class="signature apipage">config(config:[luxe.AppConfig](../../api/luxe/AppConfig.html)<span></span>) : [luxe.AppConfig](../../api/luxe/AppConfig.html)</code><br/><span class="small_desc_flat">Called by luxe to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called.</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Empty constructor. Use `ready` instead.</span>


</span>
<span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your exit point. Called for you when you should shut down your application</span>


</span>
<span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadaxis(event:[luxe.GamepadEvent](../../api/luxe/GamepadEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad axis moves, use `gamepad` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddevice(event:[luxe.GamepadEvent](../../api/luxe/GamepadEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a gamepad is connected or disconnected, use `gamepad` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="ongamepaddown"><a class="lift" href="#ongamepaddown">ongamepaddown</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddown(event:[luxe.GamepadEvent](../../api/luxe/GamepadEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is pressed, use `gamepad` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="ongamepadup"><a class="lift" href="#ongamepadup">ongamepadup</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadup(event:[luxe.GamepadEvent](../../api/luxe/GamepadEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a connected gamepad button is released, use `gamepad` to determine gamepad id</span>


</span>
<span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a><div class="clear"></div>
            <code class="signature apipage">oninputdown(\_name:[String](http://api.haxe.org/String.html)<span></span>, e:[luxe.InputEvent](../../api/luxe/InputEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called when a named input down event occurs</span>


</span>
<span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a><div class="clear"></div>
            <code class="signature apipage">oninputup(\_name:[String](http://api.haxe.org/String.html)<span></span>, e:[luxe.InputEvent](../../api/luxe/InputEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called when a named input up event occurs</span>


</span>
<span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><div class="clear"></div>
            <code class="signature apipage">onkeydown(event:[luxe.KeyEvent](../../api/luxe/KeyEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a key is pressed down</span>


</span>
<span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><div class="clear"></div>
            <code class="signature apipage">onkeyup(event:[luxe.KeyEvent](../../api/luxe/KeyEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a key is released</span>


</span>
<span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><div class="clear"></div>
            <code class="signature apipage">onmousedown(event:[luxe.MouseEvent](../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a mouse button is pressed</span>


</span>
<span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><div class="clear"></div>
            <code class="signature apipage">onmousemove(event:[luxe.MouseEvent](../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when the mouse moves</span>


</span>
<span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><div class="clear"></div>
            <code class="signature apipage">onmouseup(event:[luxe.MouseEvent](../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a mouse button is released</span>


</span>
<span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(event:[luxe.MouseEvent](../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when the mouse wheel moves</span>


</span>
<span class="method apipage">
            <a name="onpostrender"><a class="lift" href="#onpostrender">onpostrender</a></a><div class="clear"></div>
            <code class="signature apipage">onpostrender() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called when the application is done rendering</span>


</span>
<span class="method apipage">
            <a name="onprerender"><a class="lift" href="#onprerender">onprerender</a></a><div class="clear"></div>
            <code class="signature apipage">onprerender() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called when the application is about to render</span>


</span>
<span class="method apipage">
            <a name="onrender"><a class="lift" href="#onrender">onrender</a></a><div class="clear"></div>
            <code class="signature apipage">onrender() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called when the application is rendering</span>


</span>
<span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a><div class="clear"></div>
            <code class="signature apipage">ontextinput(event:[luxe.TextEvent](../../api/luxe/TextEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when text input is happening. Use this for textfields, as it handles the complexity of unicode etc.</span>


</span>
<span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchdown(event:[luxe.TouchEvent](../../api/luxe/TouchEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is first pressed, use the `touch_id` to track which</span>


</span>
<span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchmove(event:[luxe.TouchEvent](../../api/luxe/TouchEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is moved, use the `touch_id` to track which</span>


</span>
<span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchup(event:[luxe.TouchEvent](../../api/luxe/TouchEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a touch is released, use the `touch_id` to track which</span>


</span>
<span class="method apipage">
            <a name="onwindowminimized"><a class="lift" href="#onwindowminimized">onwindowminimized</a></a><div class="clear"></div>
            <code class="signature apipage">onwindowminimized(event:[luxe.WindowEvent](../../api/luxe/WindowEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a window is minimized.</span>


</span>
<span class="method apipage">
            <a name="onwindowmoved"><a class="lift" href="#onwindowmoved">onwindowmoved</a></a><div class="clear"></div>
            <code class="signature apipage">onwindowmoved(event:[luxe.WindowEvent](../../api/luxe/WindowEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a window is moved, with the data containing the new x/y position</span>


</span>
<span class="method apipage">
            <a name="onwindowresized"><a class="lift" href="#onwindowresized">onwindowresized</a></a><div class="clear"></div>
            <code class="signature apipage">onwindowresized(event:[luxe.WindowEvent](../../api/luxe/WindowEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a window is resized by the user, with the data containing the new x/y size</span>


</span>
<span class="method apipage">
            <a name="onwindowrestored"><a class="lift" href="#onwindowrestored">onwindowrestored</a></a><div class="clear"></div>
            <code class="signature apipage">onwindowrestored(event:[luxe.WindowEvent](../../api/luxe/WindowEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a window is restored.</span>


</span>
<span class="method apipage">
            <a name="onwindowsized"><a class="lift" href="#onwindowsized">onwindowsized</a></a><div class="clear"></div>
            <code class="signature apipage">onwindowsized(event:[luxe.WindowEvent](../../api/luxe/WindowEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Called for you when a window is resized by the system or code or the user, with the data containing the new x/y size</span>


</span>
<span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a><div class="clear"></div>
            <code class="signature apipage">ready() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your entry point. Called for you when you can initialize your application</span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide})</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;