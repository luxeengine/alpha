
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Unifill</h1>
<small>`luxe.utils.unifill.Unifill`</small>

Unifill provides Unicode-code-point-wise methods on Strings. It is
   ideally used with 'using Unifill' and then acts as an extension to
   the String class.

<hr/>

`class`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;






<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="uCharAt"><a class="lift" href="#uCharAt">uCharAt</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uCharAt(s:[String](http://api.haxe.org/String.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Returns the character at position `index` by code points of String `s`.</span>


</span>
<span class="method apipage">
            <a name="uCharCodeAt"><a class="lift" href="#uCharCodeAt">uCharCodeAt</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uCharCodeAt(s:[String](http://api.haxe.org/String.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Returns the code point as Int at position `index` by code points of String `s`.</span>


</span>
<span class="method apipage">
            <a name="uCodePointAt"><a class="lift" href="#uCodePointAt">uCodePointAt</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uCodePointAt(s:[String](http://api.haxe.org/String.html)<span></span>, index:[Int](http://api.haxe.org/Int.html)<span></span>) : [luxe.utils.unifill.CodePoint](../../../../api/luxe/utils/unifill/CodePoint.html)</code><br/><span class="small_desc_flat">Returns the code point at position `index` by code points of String `s`.</span>


</span>
<span class="method apipage">
            <a name="uCompare"><a class="lift" href="#uCompare">uCompare</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uCompare(a:[String](http://api.haxe.org/String.html)<span></span>, b:[String](http://api.haxe.org/String.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Compares String `a` and `b`.</span>


</span>
<span class="method apipage">
            <a name="uIndexOf"><a class="lift" href="#uIndexOf">uIndexOf</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uIndexOf(s:[String](http://api.haxe.org/String.html)<span></span>, value:[String](http://api.haxe.org/String.html)<span></span>, startIndex:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Returns the position of the leftmost occurence of the str within String `s`.

       `startIndex` is counted by code points.</span>


</span>
<span class="method apipage">
            <a name="uIterator"><a class="lift" href="#uIterator">uIterator</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uIterator(s:[String](http://api.haxe.org/String.html)<span></span>) : [Iterator](#)&lt;[luxe.utils.unifill.CodePoint](../../../../api/luxe/utils/unifill/CodePoint.html)&gt;</code><br/><span class="small_desc_flat">Returns an iterator of the code points of String `s`.</span>


</span>
<span class="method apipage">
            <a name="uLastIndexOf"><a class="lift" href="#uLastIndexOf">uLastIndexOf</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uLastIndexOf(s:[String](http://api.haxe.org/String.html)<span></span>, value:[String](http://api.haxe.org/String.html)<span></span>, startIndex:[Int](http://api.haxe.org/Int.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Returns the position of the rightmost occurence of the str within String `s`.

       `startIndex` is counted by code points.</span>


</span>
<span class="method apipage">
            <a name="uLength"><a class="lift" href="#uLength">uLength</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uLength(s:[String](http://api.haxe.org/String.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Returns the number of Unicode code points of String `s`.</span>


</span>
<span class="method apipage">
            <a name="uSplit"><a class="lift" href="#uSplit">uSplit</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uSplit(s:[String](http://api.haxe.org/String.html)<span></span>, delimiter:[String](http://api.haxe.org/String.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat">Splits String `s` at each occurence of `delimiter`.</span>


</span>
<span class="method apipage">
            <a name="uSubstr"><a class="lift" href="#uSubstr">uSubstr</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uSubstr(s:[String](http://api.haxe.org/String.html)<span></span>, startIndex:[Int](http://api.haxe.org/Int.html)<span></span>, length:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Returns `length` characters of String `s`, starting at position `startIndex`.

       `startIndex` and `length` are counted by code points.</span>


</span>
<span class="method apipage">
            <a name="uSubstring"><a class="lift" href="#uSubstring">uSubstring</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uSubstring(s:[String](http://api.haxe.org/String.html)<span></span>, startIndex:[Int](http://api.haxe.org/Int.html)<span></span>, endIndex:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Returns the part of String `s` from `startIndex` to `endIndex`.

       `startIndex` and `endIndex` are counted by code points.</span>


</span>
<span class="method apipage">
            <a name="uToString"><a class="lift" href="#uToString">uToString</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">uToString(codePoints:[Iterable](#)&lt;[luxe.utils.unifill.CodePoint](../../../../api/luxe/utils/unifill/CodePoint.html)&gt;<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Converts `codePoints` to string.</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;