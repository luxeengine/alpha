
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Maths</h1>
<small>`luxe.utils.Maths`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="_180_OVER_PI"><a class="lift" href="#_180_OVER_PI">\_180\_OVER\_PI</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">\_180\_OVER\_PI : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">Used by `degrees()` and `radians()`, use those to convert, unless needed</span><br/><span class="member apipage">
                <a name="_PI_OVER_180"><a class="lift" href="#_PI_OVER_180">\_PI\_OVER\_180</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">\_PI\_OVER\_180 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">Used by `degrees()` and `radians()`, use those to convert, unless needed</span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="clamp"><a class="lift" href="#clamp">clamp</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">clamp(value:[Float](http://api.haxe.org/Float.html)<span></span>, a:[Float](http://api.haxe.org/Float.html)<span></span>, b:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clamp_bottom"><a class="lift" href="#clamp_bottom">clamp\_bottom</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">clamp\_bottom(value:[Float](http://api.haxe.org/Float.html)<span></span>, a:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="degrees"><a class="lift" href="#degrees">degrees</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">degrees(radians:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fixed"><a class="lift" href="#fixed">fixed</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">fixed(value:[Float](http://api.haxe.org/Float.html)<span></span>, precision:[Int](http://api.haxe.org/Int.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lerp"><a class="lift" href="#lerp">lerp</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">lerp(value:[Float](http://api.haxe.org/Float.html)<span></span>, target:[Float](http://api.haxe.org/Float.html)<span></span>, t:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="map_linear"><a class="lift" href="#map_linear">map\_linear</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">map\_linear(value:[Float](http://api.haxe.org/Float.html)<span></span>, a1:[Float](http://api.haxe.org/Float.html)<span></span>, a2:[Float](http://api.haxe.org/Float.html)<span></span>, b1:[Float](http://api.haxe.org/Float.html)<span></span>, b2:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="nearest_power_of_two"><a class="lift" href="#nearest_power_of_two">nearest\_power\_of\_two</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">nearest\_power\_of\_two(\_value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="radians"><a class="lift" href="#radians">radians</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">radians(degrees:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="random16"><a class="lift" href="#random16">random16</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">random16() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="random_float"><a class="lift" href="#random_float">random\_float</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">random\_float(low:[Float](http://api.haxe.org/Float.html)<span></span>, high:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="random_float_spread"><a class="lift" href="#random_float_spread">random\_float\_spread</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">random\_float\_spread(range:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="random_int"><a class="lift" href="#random_int">random\_int</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">random\_int(low:[Int](http://api.haxe.org/Int.html)<span></span>, high:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="sign"><a class="lift" href="#sign">sign</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">sign(x:[Float](http://api.haxe.org/Float.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="smootherstep"><a class="lift" href="#smootherstep">smootherstep</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">smootherstep(x:[Float](http://api.haxe.org/Float.html)<span></span>, min:[Float](http://api.haxe.org/Float.html)<span></span>, max:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="smoothstep"><a class="lift" href="#smoothstep">smoothstep</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">smoothstep(x:[Float](http://api.haxe.org/Float.html)<span></span>, min:[Float](http://api.haxe.org/Float.html)<span></span>, max:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="weighted_avg"><a class="lift" href="#weighted_avg">weighted\_avg</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">weighted\_avg(value:[Float](http://api.haxe.org/Float.html)<span></span>, target:[Float](http://api.haxe.org/Float.html)<span></span>, slowness:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="within_range"><a class="lift" href="#within_range">within\_range</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">within\_range(value:[Float](http://api.haxe.org/Float.html)<span></span>, start\_range:[Float](http://api.haxe.org/Float.html)<span></span>, end\_range:[Float](http://api.haxe.org/Float.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="wrap_angle"><a class="lift" href="#wrap_angle">wrap\_angle</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">wrap\_angle(degrees:[Float](http://api.haxe.org/Float.html)<span></span>, lower:[Float](http://api.haxe.org/Float.html)<span></span>, upper:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;