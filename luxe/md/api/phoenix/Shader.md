
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Shader</h1>
<small>`phoenix.Shader`</small>



<hr/>

`class`extends <code><span>luxe.resource.Resource</span></code><br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="color_attribute"><a class="lift" href="#color_attribute">color\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">color\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="errors"><a class="lift" href="#errors">errors</a></a><div class="clear"></div>
                <code class="signature apipage">errors : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="frag_shader"><a class="lift" href="#frag_shader">frag\_shader</a></a><div class="clear"></div>
                <code class="signature apipage">frag\_shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="frag_source"><a class="lift" href="#frag_source">frag\_source</a></a><div class="clear"></div>
                <code class="signature apipage">frag\_source : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="frag_source_name"><a class="lift" href="#frag_source_name">frag\_source\_name</a></a><div class="clear"></div>
                <code class="signature apipage">frag\_source\_name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="log"><a class="lift" href="#log">log</a></a><div class="clear"></div>
                <code class="signature apipage">log : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="modelviewmatrix_attribute"><a class="lift" href="#modelviewmatrix_attribute">modelviewmatrix\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">modelviewmatrix\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="normal_attribute"><a class="lift" href="#normal_attribute">normal\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">normal\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="program"><a class="lift" href="#program">program</a></a><div class="clear"></div>
                <code class="signature apipage">program : [snow.render.opengl.GLProgram](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="projectionmatrix_attribute"><a class="lift" href="#projectionmatrix_attribute">projectionmatrix\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">projectionmatrix\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tcoord_attribute"><a class="lift" href="#tcoord_attribute">tcoord\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tcoord\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex0_attribute"><a class="lift" href="#tex0_attribute">tex0\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex0\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex1_attribute"><a class="lift" href="#tex1_attribute">tex1\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex1\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex2_attribute"><a class="lift" href="#tex2_attribute">tex2\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex2\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex3_attribute"><a class="lift" href="#tex3_attribute">tex3\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex3\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex4_attribute"><a class="lift" href="#tex4_attribute">tex4\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex4\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex5_attribute"><a class="lift" href="#tex5_attribute">tex5\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex5\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex6_attribute"><a class="lift" href="#tex6_attribute">tex6\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex6\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex7_attribute"><a class="lift" href="#tex7_attribute">tex7\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex7\_attribute : [phoenix._Shader.Location](../../api/phoenix/_Shader/Location.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="uniforms"><a class="lift" href="#uniforms">uniforms</a></a><div class="clear"></div>
                <code class="signature apipage">uniforms : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.Uniform](../../api/phoenix/Uniform.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vert_attribute"><a class="lift" href="#vert_attribute">vert\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">vert\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vert_shader"><a class="lift" href="#vert_shader">vert\_shader</a></a><div class="clear"></div>
                <code class="signature apipage">vert\_shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vertex_source"><a class="lift" href="#vertex_source">vertex\_source</a></a><div class="clear"></div>
                <code class="signature apipage">vertex\_source : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vertex_source_name"><a class="lift" href="#vertex_source_name">vertex\_source\_name</a></a><div class="clear"></div>
                <code class="signature apipage">vertex\_source\_name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activate"><a class="lift" href="#activate">activate</a></a><div class="clear"></div>
            <code class="signature apipage">activate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><div class="clear"></div>
            <code class="signature apipage">clone() : [phoenix.Shader](../../api/phoenix/Shader.html)</code><br/><span class="small_desc_flat">Create a new shader based on the source of this shader.</span>


</span>
<span class="method apipage">
            <a name="compile"><a class="lift" href="#compile">compile</a></a><div class="clear"></div>
            <code class="signature apipage">compile(\_type:[Int](http://api.haxe.org/Int.html)<span></span>, \_source:[String](http://api.haxe.org/String.html)<span></span>, \_verbose:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [snow.render.opengl.GLShader](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deactivate"><a class="lift" href="#deactivate">deactivate</a></a><div class="clear"></div>
            <code class="signature apipage">deactivate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><div class="clear"></div>
            <code class="signature apipage">drop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="from_string"><a class="lift" href="#from_string">from\_string</a></a><div class="clear"></div>
            <code class="signature apipage">from\_string(\_vertex\_source:[String](http://api.haxe.org/String.html)<span></span>, \_fragment\_source:[String](http://api.haxe.org/String.html)<span></span>, \_vertex\_name:[String](http://api.haxe.org/String.html)<span></span>, \_frag\_name:[String](http://api.haxe.org/String.html)<span></span>, \_verbose:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Loads shaders from a string, compiles, and links them</span>


</span>
<span class="method apipage">
            <a name="link"><a class="lift" href="#link">link</a></a><div class="clear"></div>
            <code class="signature apipage">link() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_psid:[String](http://api.haxe.org/String.html)<span></span>, \_vsid:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[phoenix.Shader](../../api/phoenix/Shader.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [phoenix.Shader](../../api/phoenix/Shader.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_manager:[luxe.resource.Resources](../../api/luxe/resource/Resources.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_color"><a class="lift" href="#set_color">set\_color</a></a><div class="clear"></div>
            <code class="signature apipage">set\_color(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Color](../../api/phoenix/Color.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_float"><a class="lift" href="#set_float">set\_float</a></a><div class="clear"></div>
            <code class="signature apipage">set\_float(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_int"><a class="lift" href="#set_int">set\_int</a></a><div class="clear"></div>
            <code class="signature apipage">set\_int(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_texture"><a class="lift" href="#set_texture">set\_texture</a></a><div class="clear"></div>
            <code class="signature apipage">set\_texture(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Texture](../../api/phoenix/Texture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_vector2"><a class="lift" href="#set_vector2">set\_vector2</a></a><div class="clear"></div>
            <code class="signature apipage">set\_vector2(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_vector3"><a class="lift" href="#set_vector3">set\_vector3</a></a><div class="clear"></div>
            <code class="signature apipage">set\_vector3(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_vector4"><a class="lift" href="#set_vector4">set\_vector4</a></a><div class="clear"></div>
            <code class="signature apipage">set\_vector4(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;