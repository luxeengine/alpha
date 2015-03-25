
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Utils</h1>
<small>`luxe.utils.Utils`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><div class="clear"></div>
                <code class="signature apipage">geometry : [luxe.utils.GeometryUtils](../../../api/luxe/utils/GeometryUtils.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="random"><a class="lift" href="#random">random</a></a><div class="clear"></div>
                <code class="signature apipage">random : [luxe.utils.Random](../../../api/luxe/utils/Random.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="array_to_bytes"><a class="lift" href="#array_to_bytes">array\_to\_bytes</a></a><div class="clear"></div>
            <code class="signature apipage">array\_to\_bytes(array:[Array](http://api.haxe.org/Array.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;<span></span>) : [haxe.io.Bytes](http://api.haxe.org/haxe/io/Bytes.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bytes_to_string"><a class="lift" href="#bytes_to_string">bytes\_to\_string</a></a><div class="clear"></div>
            <code class="signature apipage">bytes\_to\_string(bytes:[Int](http://api.haxe.org/Int.html)<span></span>, precision:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="find_assets_image_sequence"><a class="lift" href="#find_assets_image_sequence">find\_assets\_image\_sequence</a></a><div class="clear"></div>
            <code class="signature apipage">find\_assets\_image\_sequence(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_ext:[String](http://api.haxe.org/String.html)<span></span>, \_start:[String](http://api.haxe.org/String.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="hash"><a class="lift" href="#hash">hash</a></a><div class="clear"></div>
            <code class="signature apipage">hash(string:[String](http://api.haxe.org/String.html)<span></span>) : [UInt](#)</code><br/><span class="small_desc_flat">Generates a integer hash from a string using the default algorithm (murmur3)</span>


</span>
<span class="method apipage">
            <a name="hashdjb2"><a class="lift" href="#hashdjb2">hashdjb2</a></a><div class="clear"></div>
            <code class="signature apipage">hashdjb2(string:[String](http://api.haxe.org/String.html)<span></span>) : [UInt](#)</code><br/><span class="small_desc_flat">Generates an integer hash of a string using the djb2 algorithm</span>


</span>
<span class="method apipage">
            <a name="path_is_relative"><a class="lift" href="#path_is_relative">path\_is\_relative</a></a><div class="clear"></div>
            <code class="signature apipage">path\_is\_relative(\_path:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="pos_info"><a class="lift" href="#pos_info">pos\_info</a></a><div class="clear"></div>
            <code class="signature apipage">pos\_info(pos:[haxe.PosInfos](http://api.haxe.org/haxe/PosInfos.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Return a formatted string from a PosInfos</span>


</span>
<span class="method apipage">
            <a name="stacktrace"><a class="lift" href="#stacktrace">stacktrace</a></a><div class="clear"></div>
            <code class="signature apipage">stacktrace(\_depth:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="text_wrap_column"><a class="lift" href="#text_wrap_column">text\_wrap\_column</a></a><div class="clear"></div>
            <code class="signature apipage">text\_wrap\_column(\_text:[String](http://api.haxe.org/String.html)<span></span>, \_brk:[String](http://api.haxe.org/String.html)<span></span>, \_column:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Soft wrap a string by maximum character count. brk default:'\n', col default:80</span>


</span>
<span class="method apipage">
            <a name="text_wrap_column_knuth_plass"><a class="lift" href="#text_wrap_column_knuth_plass">text\_wrap\_column\_knuth\_plass</a></a><div class="clear"></div>
            <code class="signature apipage">text\_wrap\_column\_knuth\_plass(\_string:[String](http://api.haxe.org/String.html)<span></span>, \_column:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/><span class="small_desc_flat">:WIP: Wrap text using a knuth plass algorithm for column breaking.</span>


</span>
<span class="method apipage">
            <a name="uniquehash"><a class="lift" href="#uniquehash">uniquehash</a></a><div class="clear"></div>
            <code class="signature apipage">uniquehash() : [UInt](#)</code><br/><span class="small_desc_flat">Generates and returns a uniqueid converted to a hashed integer for convenience.
            Uses the default `uniqueid` and `hash` implementation detail.</span>


</span>
<span class="method apipage">
            <a name="uniqueid"><a class="lift" href="#uniqueid">uniqueid</a></a><div class="clear"></div>
            <code class="signature apipage">uniqueid(val:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat">Generate a short, unique string ID for use ("base62").</span>


</span>
<span class="method apipage">
            <a name="uniqueid2"><a class="lift" href="#uniqueid2">uniqueid2</a></a><div class="clear"></div>
            <code class="signature apipage">uniqueid2() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;