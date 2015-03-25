
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>BitmapFont</h1>
<small>`phoenix.BitmapFont`</small>



<hr/>

`class`extends <code><span>luxe.resource.Resource</span></code><br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="info"><a class="lift" href="#info">info</a></a><div class="clear"></div>
                <code class="signature apipage">info : [phoenix.FontInfo](../../api/phoenix/FontInfo.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><div class="clear"></div>
                <code class="signature apipage">loaded : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="options"><a class="lift" href="#options">options</a></a><div class="clear"></div>
                <code class="signature apipage">options : [luxe.options.BitmapFontOptions](../../api/luxe/options/BitmapFontOptions.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="pages"><a class="lift" href="#pages">pages</a></a><div class="clear"></div>
                <code class="signature apipage">pages : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [phoenix.Texture](../../api/phoenix/Texture.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="space_char"><a class="lift" href="#space_char">space\_char</a></a><div class="clear"></div>
                <code class="signature apipage">space\_char : [phoenix.Character](../../api/phoenix/Character.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="dimensions_of"><a class="lift" href="#dimensions_of">dimensions\_of</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">dimensions\_of(\_string:[String](http://api.haxe.org/String.html)<span></span>, \_point\_size:[Float](http://api.haxe.org/Float.html)<span></span>, \_into:[luxe.Vector](../../api/luxe/Vector.html)<span></span>, \_letter\_spc:[Float](http://api.haxe.org/Float.html)<span></span>, \_line\_spc:[Float](http://api.haxe.org/Float.html)<span></span>) : [luxe.Vector](../../api/luxe/Vector.html)</code><br/><span class="small_desc_flat">Return the dimensions of a given string, at the specified point size.
            You can also use width_of or height_of, this is a convenience for those</span>


</span>
<span class="method apipage">
            <a name="draw_text"><a class="lift" href="#draw_text">draw\_text</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_text(opt:[phoenix.geometry.TextGeometryOptions](../../api/phoenix/geometry/TextGeometryOptions.html)<span></span>) : [phoenix.geometry.TextGeometry](../../api/phoenix/geometry/TextGeometry.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="from_string"><a class="lift" href="#from_string">from\_string</a></a><div class="clear"></div>
            <code class="signature apipage">from\_string(\_bitmapfont\_data:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_custom\_pages:[Array](http://api.haxe.org/Array.html)&lt;[phoenix.Texture](../../api/phoenix/Texture.html)&gt;<span></span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Create this bitmap font from the given string data, using the options given in the constructor. 
                optional: onload callback and custom texture pages, if already loaded.</span>


</span>
<span class="method apipage">
            <a name="height_of"><a class="lift" href="#height_of">height\_of</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">height\_of(\_string:[String](http://api.haxe.org/String.html)<span></span>, \_point\_size:[Float](http://api.haxe.org/Float.html)<span></span>, \_line\_spc:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="height_of_lines"><a class="lift" href="#height_of_lines">height\_of\_lines</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">height\_of\_lines(\_lines:[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;<span></span>, \_point\_size:[Float](http://api.haxe.org/Float.html)<span></span>, \_line\_spc:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="kerning"><a class="lift" href="#kerning">kerning</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">kerning(\_first:[Int](http://api.haxe.org/Int.html)<span></span>, \_second:[Int](http://api.haxe.org/Int.html)<span></span>) : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat">Get the kerning between two glyphs, 0 if none.
                A glyph int id is the value from 'c'.charCodeAt(0)</span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_options:[luxe.options.BitmapFontOptions](../../api/luxe/options/BitmapFontOptions.html)<span></span>) : [phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.BitmapFontOptions](../../api/luxe/options/BitmapFontOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onload"><a class="lift" href="#onload">onload</a></a><div class="clear"></div>
            <code class="signature apipage">onload(:[phoenix.BitmapFont](../../api/phoenix/BitmapFont.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="width_of"><a class="lift" href="#width_of">width\_of</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">width\_of(\_string:[String](http://api.haxe.org/String.html)<span></span>, \_point\_size:[Float](http://api.haxe.org/Float.html)<span></span>, \_letter\_spc:[Float](http://api.haxe.org/Float.html)<span></span>, \_line\_widths:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="width_of_line"><a class="lift" href="#width_of_line">width\_of\_line</a></a><div class="clear"></div>
            <code class="signature apipage">width\_of\_line(\_string:[String](http://api.haxe.org/String.html)<span></span>, \_point\_size:[Float](http://api.haxe.org/Float.html)<span></span>, \_letter\_spc:[Float](http://api.haxe.org/Float.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="wrap_string_to_bounds"><a class="lift" href="#wrap_string_to_bounds">wrap\_string\_to\_bounds</a></a><div class="clear"></div>
            <code class="signature apipage">wrap\_string\_to\_bounds(\_string:[String](http://api.haxe.org/String.html)<span></span>, \_bounds:[phoenix.Rectangle](../../api/phoenix/Rectangle.html)<span></span>, \_point\_size:[Float](http://api.haxe.org/Float.html)<span></span>, \_letter\_spc:[Float](http://api.haxe.org/Float.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;