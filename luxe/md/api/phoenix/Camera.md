
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Camera</h1>
<small>`phoenix.Camera`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="look_at_matrix"><a class="lift" href="#look_at_matrix">look\_at\_matrix</a></a><div class="clear"></div>
                <code class="signature apipage">look\_at\_matrix : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="minimum_zoom"><a class="lift" href="#minimum_zoom">minimum\_zoom</a></a><div class="clear"></div>
                <code class="signature apipage">minimum\_zoom : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="options"><a class="lift" href="#options">options</a></a><div class="clear"></div>
                <code class="signature apipage">options : [luxe.options.CameraOptions](../../api/luxe/options/CameraOptions.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="projection"><a class="lift" href="#projection">projection</a></a><div class="clear"></div>
                <code class="signature apipage">projection : [phoenix.ProjectionType](../../api/phoenix/ProjectionType.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="projection_matrix"><a class="lift" href="#projection_matrix">projection\_matrix</a></a><div class="clear"></div>
                <code class="signature apipage">projection\_matrix : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div>
                <code class="signature apipage">transform : [phoenix.Transform](../../api/phoenix/Transform.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="up"><a class="lift" href="#up">up</a></a><div class="clear"></div>
                <code class="signature apipage">up : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="view_matrix"><a class="lift" href="#view_matrix">view\_matrix</a></a><div class="clear"></div>
                <code class="signature apipage">view\_matrix : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="view_matrix_inverse"><a class="lift" href="#view_matrix_inverse">view\_matrix\_inverse</a></a><div class="clear"></div>
                <code class="signature apipage">view\_matrix\_inverse : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="aspect"><a class="lift" href="#aspect">aspect</a></a><div class="clear"></div>
                <code class="signature apipage">aspect : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="center"><a class="lift" href="#center">center</a></a><div class="clear"></div>
                <code class="signature apipage">center : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="far"><a class="lift" href="#far">far</a></a><div class="clear"></div>
                <code class="signature apipage">far : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fov"><a class="lift" href="#fov">fov</a></a><div class="clear"></div>
                <code class="signature apipage">fov : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="fov_type"><a class="lift" href="#fov_type">fov\_type</a></a><div class="clear"></div>
                <code class="signature apipage">fov\_type : [phoenix.FOVType](../../api/phoenix/FOVType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="near"><a class="lift" href="#near">near</a></a><div class="clear"></div>
                <code class="signature apipage">near : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="target"><a class="lift" href="#target">target</a></a><div class="clear"></div>
                <code class="signature apipage">target : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="viewport"><a class="lift" href="#viewport">viewport</a></a><div class="clear"></div>
                <code class="signature apipage">viewport : [phoenix.Rectangle](../../api/phoenix/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="zoom"><a class="lift" href="#zoom">zoom</a></a><div class="clear"></div>
                <code class="signature apipage">zoom : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.CameraOptions](../../api/luxe/options/CameraOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="project"><a class="lift" href="#project">project</a></a><div class="clear"></div>
            <code class="signature apipage">project(\_vector:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="screen_point_to_ray"><a class="lift" href="#screen_point_to_ray">screen\_point\_to\_ray</a></a><div class="clear"></div>
            <code class="signature apipage">screen\_point\_to\_ray(\_vector:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Ray](../../api/phoenix/Ray.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="screen_point_to_world"><a class="lift" href="#screen_point_to_world">screen\_point\_to\_world</a></a><div class="clear"></div>
            <code class="signature apipage">screen\_point\_to\_world(\_vector:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_ortho"><a class="lift" href="#set_ortho">set\_ortho</a></a><div class="clear"></div>
            <code class="signature apipage">set\_ortho(\_options:[luxe.options.CameraOptions](../../api/luxe/options/CameraOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_perspective"><a class="lift" href="#set_perspective">set\_perspective</a></a><div class="clear"></div>
            <code class="signature apipage">set\_perspective(\_options:[luxe.options.CameraOptions](../../api/luxe/options/CameraOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="unproject"><a class="lift" href="#unproject">unproject</a></a><div class="clear"></div>
            <code class="signature apipage">unproject(\_vector:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="world_point_to_screen"><a class="lift" href="#world_point_to_screen">world\_point\_to\_screen</a></a><div class="clear"></div>
            <code class="signature apipage">world\_point\_to\_screen(\_vector:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_viewport:[phoenix.Rectangle](../../api/phoenix/Rectangle.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;