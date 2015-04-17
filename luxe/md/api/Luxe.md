
[![Logo](../images/logo.png)](../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelProgress,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleEmitterInitData,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.DataInfo,luxe._Parcel.FontInfo,luxe._Parcel.JSONInfo,luxe._Parcel.ShaderInfo,luxe._Parcel.SoundInfo,luxe._Parcel.TextInfo,luxe.collision.Collision,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.Common,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.FontOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.ResourceOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill.UtfIter,luxe.utils.unifill.UtfTools,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Luxe</h1>
<small>`Luxe`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="audio"><a class="lift" href="#audio">audio</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">audio : [luxe.Audio](../api/luxe/Audio.html)</code><br/></span>
            <span class="small_desc_flat">Access to the audio features</span><br/><span class="member apipage">
                <a name="build"><a class="lift" href="#build">build</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">build : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The version + build meta information, generated at compile time from a macro (luxe.BuildVersion)</span><br/><span class="member apipage">
                <a name="camera"><a class="lift" href="#camera">camera</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">camera : [luxe.Camera](../api/luxe/Camera.html)</code><br/></span>
            <span class="small_desc_flat">Access to the default camera</span><br/><span class="member apipage">
                <a name="core"><a class="lift" href="#core">core</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">core : [luxe.Core](../api/luxe/Core.html)</code><br/></span>
            <span class="small_desc_flat">Direct access to the core engine</span><br/><span class="member apipage">
                <a name="debug"><a class="lift" href="#debug">debug</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">debug : [luxe.Debug](../api/luxe/Debug.html)</code><br/></span>
            <span class="small_desc_flat">Access to the core debug features</span><br/><span class="member apipage">
                <a name="draw"><a class="lift" href="#draw">draw</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">draw : [luxe.Draw](../api/luxe/Draw.html)</code><br/></span>
            <span class="small_desc_flat">Access to the drawing features</span><br/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](../api/luxe/Events.html)</code><br/></span>
            <span class="small_desc_flat">Access to the global event system</span><br/><span class="member apipage">
                <a name="input"><a class="lift" href="#input">input</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">input : [luxe.Input](../api/luxe/Input.html)</code><br/></span>
            <span class="small_desc_flat">Access to the input features</span><br/><span class="member apipage">
                <a name="io"><a class="lift" href="#io">io</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">io : [luxe.IO](../api/luxe/IO.html)</code><br/></span>
            <span class="small_desc_flat">Access to the io features</span><br/><span class="member apipage">
                <a name="physics"><a class="lift" href="#physics">physics</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">physics : [luxe.Physics](../api/luxe/Physics.html)</code><br/></span>
            <span class="small_desc_flat">Access to the physics bindings, if any</span><br/><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">renderer : [phoenix.Renderer](../api/phoenix/Renderer.html)</code><br/></span>
            <span class="small_desc_flat">Access to the rendering system</span><br/><span class="member apipage">
                <a name="resources"><a class="lift" href="#resources">resources</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">resources : [luxe.resource.Resources](../api/luxe/resource/Resources.html)</code><br/></span>
            <span class="small_desc_flat">Access to the default resource manager</span><br/><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](../api/luxe/Scene.html)</code><br/></span>
            <span class="small_desc_flat">Access to the default luxe scene</span><br/><span class="member apipage">
                <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">timer : [luxe.Timer](../api/luxe/Timer.html)</code><br/></span>
            <span class="small_desc_flat">Access to the timing features</span><br/><span class="member apipage">
                <a name="utils"><a class="lift" href="#utils">utils</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">utils : [luxe.utils.Utils](../api/luxe/utils/Utils.html)</code><br/></span>
            <span class="small_desc_flat">Access to the different utilities</span><br/><span class="member apipage">
                <a name="version"><a class="lift" href="#version">version</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">version : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">The version of the engine</span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="loadData"><a class="lift" href="#loadData">loadData</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadData(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[luxe.resource.DataResource](../api/luxe/resource/DataResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [luxe.resource.DataResource](../api/luxe/resource/DataResource.html)</code><br/><span class="small_desc_flat">Load a bytes/data resource</span>


</span>
<span class="method apipage">
            <a name="loadFont"><a class="lift" href="#loadFont">loadFont</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadFont(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_texture\_path:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[phoenix.BitmapFont](../api/phoenix/BitmapFont.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [phoenix.BitmapFont](../api/phoenix/BitmapFont.html)</code><br/><span class="small_desc_flat">Load a font resource</span>


</span>
<span class="method apipage">
            <a name="loadJSON"><a class="lift" href="#loadJSON">loadJSON</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadJSON(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[luxe.resource.JSONResource](../api/luxe/resource/JSONResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [luxe.resource.JSONResource](../api/luxe/resource/JSONResource.html)</code><br/><span class="small_desc_flat">Load a text resource</span>


</span>
<span class="method apipage">
            <a name="loadShader"><a class="lift" href="#loadShader">loadShader</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadShader(\_ps\_id:[String](http://api.haxe.org/String.html)<span></span>, \_vs\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[phoenix.Shader](../api/phoenix/Shader.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [phoenix.Shader](../api/phoenix/Shader.html)</code><br/><span class="small_desc_flat">Load a shader resource</span>


</span>
<span class="method apipage">
            <a name="loadSound"><a class="lift" href="#loadSound">loadSound</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadSound(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_id:[String](http://api.haxe.org/String.html)<span></span>, \_is\_music:[Bool](http://api.haxe.org/Bool.html)<span></span>, \_onload:[luxe.resource.SoundResource](../api/luxe/resource/SoundResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [luxe.resource.SoundResource](../api/luxe/resource/SoundResource.html)</code><br/><span class="small_desc_flat">Load a sound resource</span>


</span>
<span class="method apipage">
            <a name="loadText"><a class="lift" href="#loadText">loadText</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadText(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[luxe.resource.TextResource](../api/luxe/resource/TextResource.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [luxe.resource.TextResource](../api/luxe/resource/TextResource.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="loadTexture"><a class="lift" href="#loadTexture">loadTexture</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadTexture(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_onload:[phoenix.Texture](../api/phoenix/Texture.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [phoenix.Texture](../api/phoenix/Texture.html)</code><br/><span class="small_desc_flat">Load a texture/image resource</span>


</span>
<span class="method apipage">
            <a name="loadTextures"><a class="lift" href="#loadTextures">loadTextures</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">loadTextures(\_ids:[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;<span></span>, \_onload:[Array](http://api.haxe.org/Array.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_silent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Load multiple texture/image resources, useful for preloading</span>


</span>
<span class="method apipage">
            <a name="off"><a class="lift" href="#off">off</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">off&lt;T&gt;(event:[Ev](#)<span></span>, handler:[off.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">stop listening for core events</span>


</span>
<span class="method apipage">
            <a name="on"><a class="lift" href="#on">on</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">on&lt;T&gt;(event:[Ev](#)<span></span>, handler:[on.T](#)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">listen for core events</span>


</span>
<span class="method apipage">
            <a name="showConsole"><a class="lift" href="#showConsole">showConsole</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">showConsole(\_show:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">show/hide the debug console programmatically</span>


</span>
<span class="method apipage">
            <a name="shutdown"><a class="lift" href="#shutdown">shutdown</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">shutdown() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">shutdown the engine and quit</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;