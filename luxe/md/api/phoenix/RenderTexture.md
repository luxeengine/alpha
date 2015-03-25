
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>RenderTexture</h1>
<small>`phoenix.RenderTexture`</small>



<hr/>

`class`extends <code><span>phoenix.Texture</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="_onload_handlers"><a class="lift" href="#_onload_handlers">\_onload\_handlers</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#\_onload\_handlers'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">\_onload\_handlers : [Array](http://api.haxe.org/Array.html)&lt;[](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="asset"><a class="lift" href="#asset">asset</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#asset'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">asset : [snow.assets.AssetImage](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="fbo"><a class="lift" href="#fbo">fbo</a></a><div class="clear"></div>
                <code class="signature apipage">fbo : [snow.render.opengl.GLFramebuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#height'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="height_actual"><a class="lift" href="#height_actual">height\_actual</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#height\_actual'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">height\_actual : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="loaded"><a class="lift" href="#loaded">loaded</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#loaded'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">loaded : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="renderbuffer"><a class="lift" href="#renderbuffer">renderbuffer</a></a><div class="clear"></div>
                <code class="signature apipage">renderbuffer : [snow.render.opengl.GLRenderbuffer](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="slot"><a class="lift" href="#slot">slot</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#slot'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">slot : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#texture'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">texture : [snow.render.opengl.GLTexture](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#width'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="width_actual"><a class="lift" href="#width_actual">width\_actual</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#width\_actual'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">width\_actual : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="clamp"><a class="lift" href="#clamp">clamp</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#clamp'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">clamp : [phoenix.ClampType](../../api/phoenix/ClampType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter"><a class="lift" href="#filter">filter</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#filter'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">filter : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter_mag"><a class="lift" href="#filter_mag">filter\_mag</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#filter\_mag'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">filter\_mag : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="filter_min"><a class="lift" href="#filter_min">filter\_min</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#filter\_min'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">filter\_min : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activate"><a class="lift" href="#activate">activate</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#activate'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">activate(att:[snow.render.opengl.GLUniformLocation](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="bind"><a class="lift" href="#bind">bind</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#bind'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">bind() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#destroy'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="do_onload"><a class="lift" href="#do_onload">do\_onload</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#do\_onload'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">do\_onload() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#drop'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">drop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="estimated_memory"><a class="lift" href="#estimated_memory">estimated\_memory</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#estimated\_memory'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">estimated\_memory() : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="from_asset"><a class="lift" href="#from_asset">from\_asset</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#from\_asset'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">from\_asset(\_asset:[snow.assets.AssetImage](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="generate_mipmaps"><a class="lift" href="#generate_mipmaps">generate\_mipmaps</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#generate\_mipmaps'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">generate\_mipmaps() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="get_pixel"><a class="lift" href="#get_pixel">get\_pixel</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#get\_pixel'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_pixel(\_pos:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#load'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onloaded:[phoenix.Texture](../../api/phoenix/Texture.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Texture](../../api/phoenix/Texture.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load_from_bytes"><a class="lift" href="#load_from_bytes">load\_from\_bytes</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#load\_from\_bytes'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load\_from\_bytes(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_bytes:[snow.io.typedarray.Uint8Array](#)<span></span>, \_cache:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [phoenix.Texture](../../api/phoenix/Texture.html)</code><br/><span class="small_desc_flat">create and load a texture from a Uint8Array. Take note this accepts encoded image formats, not decoded/raw pixels. Use load_from_pixels for that.</span>


</span>
<span class="method apipage">
            <a name="load_from_pixels"><a class="lift" href="#load_from_pixels">load\_from\_pixels</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#load\_from\_pixels'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load\_from\_pixels(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_width:[Int](http://api.haxe.org/Int.html)<span></span>, \_height:[Int](http://api.haxe.org/Int.html)<span></span>, \_pixels:[snow.io.typedarray.Uint8Array](#)<span></span>, \_cache:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [phoenix.Texture](../../api/phoenix/Texture.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load_from_resource"><a class="lift" href="#load_from_resource">load\_from\_resource</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#load\_from\_resource'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load\_from\_resource(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_cache:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [phoenix.Texture](../../api/phoenix/Texture.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lock"><a class="lift" href="#lock">lock</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#lock'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">lock() : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_manager:[luxe.resource.Resources](../../api/luxe/resource/Resources.html)<span></span>, \_size:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onload"><a class="lift" href="#onload">onload</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#onload'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onload(:[phoenix.Texture](../../api/phoenix/Texture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#reset'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_onload"><a class="lift" href="#set_onload">set\_onload</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#set\_onload'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_onload(f:[phoenix.Texture](../../api/phoenix/Texture.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Dynamic](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_pixel"><a class="lift" href="#set_pixel">set\_pixel</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#set\_pixel'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">set\_pixel(\_pos:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_color:[phoenix.Color](../../api/phoenix/Color.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="unlock"><a class="lift" href="#unlock">unlock</a></a><a data-tooltip="inherited from <a href='../../api/phoenix/Texture.html#unlock'>phoenix.Texture</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">unlock() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;