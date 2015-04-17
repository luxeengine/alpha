
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Core</h1>
<small>`luxe.Core`</small>



<hr/>

`class`extends <code><span>snow.App</span></code><br/><span class="meta">
meta: @:directlyUsed, @:keep, @:keep, @:noCompletion, @:log_as(&quot;luxe&quot;)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="appconfig"><a class="lift" href="#appconfig">appconfig</a></a><div class="clear"></div>
                <code class="signature apipage">appconfig : [luxe.AppConfig](../../api/luxe/AppConfig.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><div class="clear"></div>
                <code class="signature apipage">audio : [luxe.Audio](../../api/luxe/Audio.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="console_visible"><a class="lift" href="#console_visible">console\_visible</a></a><div class="clear"></div>
                <code class="signature apipage">console\_visible : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><div class="clear"></div>
                <code class="signature apipage">debug : [luxe.Debug](../../api/luxe/Debug.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><div class="clear"></div>
                <code class="signature apipage">draw : [luxe.Draw](../../api/luxe/Draw.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="emitter"><a class="lift" href="#emitter">emitter</a></a><div class="clear"></div>
                <code class="signature apipage">emitter : [luxe.Emitter](../../api/luxe/Emitter.html)&lt;[Ev](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](../../api/luxe/Events.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="game"><a class="lift" href="#game">game</a></a><div class="clear"></div>
                <code class="signature apipage">game : [luxe.Game](../../api/luxe/Game.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="has_shutdown"><a class="lift" href="#has_shutdown">has\_shutdown</a></a><div class="clear"></div>
                <code class="signature apipage">has\_shutdown : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="headless"><a class="lift" href="#headless">headless</a></a><div class="clear"></div>
                <code class="signature apipage">headless : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Set to true if the app is running without a window</span><br/><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><div class="clear"></div>
                <code class="signature apipage">input : [luxe.Input](../../api/luxe/Input.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="io"><a class="lift" href="#io">io</a></a><div class="clear"></div>
                <code class="signature apipage">io : [luxe.IO](../../api/luxe/IO.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><div class="clear"></div>
                <code class="signature apipage">physics : [luxe.Physics](../../api/luxe/Physics.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><div class="clear"></div>
                <code class="signature apipage">renderer : [phoenix.Renderer](../../api/phoenix/Renderer.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="resources"><a class="lift" href="#resources">resources</a></a><div class="clear"></div>
                <code class="signature apipage">resources : [luxe.resource.Resources](../../api/luxe/resource/Resources.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](../../api/luxe/Scene.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="screen"><a class="lift" href="#screen">screen</a></a><div class="clear"></div>
                <code class="signature apipage">screen : [luxe.Screen](../../api/luxe/Screen.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="shutting_down"><a class="lift" href="#shutting_down">shutting\_down</a></a><div class="clear"></div>
                <code class="signature apipage">shutting\_down : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><div class="clear"></div>
                <code class="signature apipage">timer : [luxe.Timer](../../api/luxe/Timer.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="config"><a class="lift" href="#config">config</a></a><div class="clear"></div>
            <code class="signature apipage">config(config:[luxe.AppConfig](../../api/luxe/AppConfig.html)<span></span>) : [luxe.AppConfig](../../api/luxe/AppConfig.html)</code><br/><span class="small_desc_flat">return what the game decides for runtime config</span>


</span>
<span class="method apipage">
            <a name="emit"><a class="lift" href="#emit">emit</a></a><div class="clear"></div>
            <code class="signature apipage">emit&lt;T&gt;(event:[Ev](#)<span></span>, data:[emit.T](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><div class="clear"></div>
            <code class="signature apipage">init(asset:[snow.system.assets.AssetImage](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a><div class="clear"></div>
            <code class="signature apipage">off&lt;T&gt;(event:[Ev](#)<span></span>, handler:[off.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a><div class="clear"></div>
            <code class="signature apipage">on&lt;T&gt;(event:[Ev](#)<span></span>, handler:[on.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onevent"><a class="lift" href="#onevent">onevent</a></a><div class="clear"></div>
            <code class="signature apipage">onevent(event:[snow.types.SystemEvent](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepadaxis"><a class="lift" href="#ongamepadaxis">ongamepadaxis</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadaxis(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, axis:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepaddevice"><a class="lift" href="#ongamepaddevice">ongamepaddevice</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddevice(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.GamepadDeviceEventType](#)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepaddown"><a class="lift" href="#ongamepaddown">ongamepaddown</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepaddown(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ongamepadup"><a class="lift" href="#ongamepadup">ongamepadup</a></a><div class="clear"></div>
            <code class="signature apipage">ongamepadup(gamepad:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, value:[Float](http://api.haxe.org/Float.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="oninputdown"><a class="lift" href="#oninputdown">oninputdown</a></a><div class="clear"></div>
            <code class="signature apipage">oninputdown(name:[String](http://api.haxe.org/String.html)<span></span>, event:[luxe.InputEvent](../../api/luxe/InputEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="oninputup"><a class="lift" href="#oninputup">oninputup</a></a><div class="clear"></div>
            <code class="signature apipage">oninputup(name:[String](http://api.haxe.org/String.html)<span></span>, event:[luxe.InputEvent](../../api/luxe/InputEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><div class="clear"></div>
            <code class="signature apipage">onkeydown(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[luxe.ModState](../../api/luxe/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><div class="clear"></div>
            <code class="signature apipage">onkeyup(keycode:[Int](http://api.haxe.org/Int.html)<span></span>, scancode:[Int](http://api.haxe.org/Int.html)<span></span>, repeat:[Bool](http://api.haxe.org/Bool.html)<span></span>, mod:[luxe.ModState](../../api/luxe/ModState.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><div class="clear"></div>
            <code class="signature apipage">onmousedown(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><div class="clear"></div>
            <code class="signature apipage">onmousemove(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, xrel:[Int](http://api.haxe.org/Int.html)<span></span>, yrel:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><div class="clear"></div>
            <code class="signature apipage">onmouseup(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, button:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(x:[Int](http://api.haxe.org/Int.html)<span></span>, y:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontextinput"><a class="lift" href="#ontextinput">ontextinput</a></a><div class="clear"></div>
            <code class="signature apipage">ontextinput(text:[String](http://api.haxe.org/String.html)<span></span>, start:[Int](http://api.haxe.org/Int.html)<span></span>, length:[Int](http://api.haxe.org/Int.html)<span></span>, type:[snow.types.TextEventType](#)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>, window\_id:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontouchdown"><a class="lift" href="#ontouchdown">ontouchdown</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchdown(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontouchmove"><a class="lift" href="#ontouchmove">ontouchmove</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchmove(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, dx:[Float](http://api.haxe.org/Float.html)<span></span>, dy:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ontouchup"><a class="lift" href="#ontouchup">ontouchup</a></a><div class="clear"></div>
            <code class="signature apipage">ontouchup(x:[Float](http://api.haxe.org/Float.html)<span></span>, y:[Float](http://api.haxe.org/Float.html)<span></span>, touch\_id:[Int](http://api.haxe.org/Int.html)<span></span>, timestamp:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ready"><a class="lift" href="#ready">ready</a></a><div class="clear"></div>
            <code class="signature apipage">ready() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="show_console"><a class="lift" href="#show_console">show\_console</a></a><div class="clear"></div>
            <code class="signature apipage">show\_console(\_show:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><div class="clear"></div>
            <code class="signature apipage">shutdown() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;