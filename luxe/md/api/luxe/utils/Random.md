
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Random</h1>
<small>`luxe.utils.Random`</small>

Given an `initial` value for the seed, subsequent generated numbers will be predictable,
 and the `seed` value updated to reflect the current seed which can be used to resume predictability
 from an ongoing set. Uses a Park–Miller pseudo random number generator.

 Accessible through Luxe.utils.random.get(), or used as a class in your own code.

<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="seed"><a class="lift" href="#seed">seed</a></a><div class="clear"></div>
                <code class="signature apipage">seed : [UInt](#)</code><br/></span>
            <span class="small_desc_flat">get the current seed (read only, change via `initial`)</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="initial"><a class="lift" href="#initial">initial</a></a><div class="clear"></div>
                <code class="signature apipage">initial : [UInt](#)</code><br/></span>
            <span class="small_desc_flat">get/set the initial base seed</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="bit"><a class="lift" href="#bit">bit</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">bit(chance:[Float](http://api.haxe.org/Float.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Returns 1 or 0 based on a chance of [0..1] percent.
            Given 0.5, 50% chance of 1, with 0.9, 90% chance of 1 and so on.</span>


</span>
<span class="method apipage">
            <a name="bool"><a class="lift" href="#bool">bool</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">bool(chance:[Float](http://api.haxe.org/Float.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Returns true or false based on a chance of [0..1] percent.
            Given 0.5, 50% chance of true, with 0.9, 90% chance of true and so on.</span>


</span>
<span class="method apipage">
            <a name="float"><a class="lift" href="#float">float</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">float(min:[Float](http://api.haxe.org/Float.html)<span></span>, max:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">Returns a number between [min,max).
            max is optional, returning a number between [0,min)</span>


</span>
<span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">get() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat">Returns a float number between [0,1)</span>


</span>
<span class="method apipage">
            <a name="int"><a class="lift" href="#int">int</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">int(min:[Float](http://api.haxe.org/Float.html)<span></span>, max:[Float](http://api.haxe.org/Float.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Return a number between [min, max).
            max is optional, returning a number between [0,min)</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_initial\_seed:[UInt](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Reset the initial value to that of the current seed.</span>


</span>
<span class="method apipage">
            <a name="sign"><a class="lift" href="#sign">sign</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">sign(chance:[Float](http://api.haxe.org/Float.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Returns 1 or -1 based on a chance of [0..1] percent.
            Given 0.5, 50% chance of 1, with 0.9, 90% chance of 1 and so on.</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;