
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelProgress,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleEmitterInitData,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.DataInfo,luxe._Parcel.FontInfo,luxe._Parcel.JSONInfo,luxe._Parcel.ShaderInfo,luxe._Parcel.SoundInfo,luxe._Parcel.TextInfo,luxe.collision.Collision,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.Common,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.FontOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.ResourceOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill.UtfIter,luxe.utils.unifill.UtfTools,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Quaternion</h1>
<small>`phoenix.Quaternion`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="ignore_listeners"><a class="lift" href="#ignore_listeners">ignore\_listeners</a></a><div class="clear"></div>
                <code class="signature apipage">ignore\_listeners : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="w"><a class="lift" href="#w">w</a></a><div class="clear"></div>
                <code class="signature apipage">w : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="z"><a class="lift" href="#z">z</a></a><div class="clear"></div>
                <code class="signature apipage">z : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="Add"><a class="lift" href="#Add">Add</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Add(\_a:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_b:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Dot"><a class="lift" href="#Dot">Dot</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Dot(\_a:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_b:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Listen"><a class="lift" href="#Listen">Listen</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Listen(\_q:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, listener:[Float](http://api.haxe.org/Float.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Multiply"><a class="lift" href="#Multiply">Multiply</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Multiply(\_a:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_b:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="MultiplyScalar"><a class="lift" href="#MultiplyScalar">MultiplyScalar</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">MultiplyScalar(\_quaternion:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_scalar:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Slerp"><a class="lift" href="#Slerp">Slerp</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Slerp(\_qa:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_qb:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_qm:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_t:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add(\_quaternion:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="addQuaternions"><a class="lift" href="#addQuaternions">addQuaternions</a></a><div class="clear"></div>
            <code class="signature apipage">addQuaternions(\_a:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_b:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><div class="clear"></div>
            <code class="signature apipage">clone() : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="conjugate"><a class="lift" href="#conjugate">conjugate</a></a><div class="clear"></div>
            <code class="signature apipage">conjugate() : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="copy"><a class="lift" href="#copy">copy</a></a><div class="clear"></div>
            <code class="signature apipage">copy(\_quaternion:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="dot"><a class="lift" href="#dot">dot</a></a><div class="clear"></div>
            <code class="signature apipage">dot(\_other:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="equals"><a class="lift" href="#equals">equals</a></a><div class="clear"></div>
            <code class="signature apipage">equals(\_q:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fromArray"><a class="lift" href="#fromArray">fromArray</a></a><div class="clear"></div>
            <code class="signature apipage">fromArray(\_a:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="inverse"><a class="lift" href="#inverse">inverse</a></a><div class="clear"></div>
            <code class="signature apipage">inverse() : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="length"><a class="lift" href="#length">length</a></a><div class="clear"></div>
            <code class="signature apipage">length() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lengthSq"><a class="lift" href="#lengthSq">lengthSq</a></a><div class="clear"></div>
            <code class="signature apipage">lengthSq() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listen_w"><a class="lift" href="#listen_w">listen\_w</a></a><div class="clear"></div>
            <code class="signature apipage">listen\_w(:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listen_x"><a class="lift" href="#listen_x">listen\_x</a></a><div class="clear"></div>
            <code class="signature apipage">listen\_x(:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listen_y"><a class="lift" href="#listen_y">listen\_y</a></a><div class="clear"></div>
            <code class="signature apipage">listen\_y(:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="listen_z"><a class="lift" href="#listen_z">listen\_z</a></a><div class="clear"></div>
            <code class="signature apipage">listen\_z(:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><div class="clear"></div>
            <code class="signature apipage">multiply(\_quaternion:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiplyQuaternions"><a class="lift" href="#multiplyQuaternions">multiplyQuaternions</a></a><div class="clear"></div>
            <code class="signature apipage">multiplyQuaternions(\_a:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_b:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiplyScalar"><a class="lift" href="#multiplyScalar">multiplyScalar</a></a><div class="clear"></div>
            <code class="signature apipage">multiplyScalar(\_scalar:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>, \_w:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="normalize"><a class="lift" href="#normalize">normalize</a></a><div class="clear"></div>
            <code class="signature apipage">normalize() : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><div class="clear"></div>
            <code class="signature apipage">set(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>, \_w:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="setFromAxisAngle"><a class="lift" href="#setFromAxisAngle">setFromAxisAngle</a></a><div class="clear"></div>
            <code class="signature apipage">setFromAxisAngle(\_axis:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_angle:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="setFromEuler"><a class="lift" href="#setFromEuler">setFromEuler</a></a><div class="clear"></div>
            <code class="signature apipage">setFromEuler(\_euler:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_order:[phoenix.ComponentOrder](../../api/phoenix/ComponentOrder.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="setFromRotationMatrix"><a class="lift" href="#setFromRotationMatrix">setFromRotationMatrix</a></a><div class="clear"></div>
            <code class="signature apipage">setFromRotationMatrix(\_m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_xyz"><a class="lift" href="#set_xyz">set\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">set\_xyz(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_xyzw"><a class="lift" href="#set_xyzw">set\_xyzw</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">set\_xyzw(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>, \_w:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="slerp"><a class="lift" href="#slerp">slerp</a></a><div class="clear"></div>
            <code class="signature apipage">slerp(\_qb:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_t:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Quaternion](../../api/phoenix/Quaternion.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><div class="clear"></div>
            <code class="signature apipage">toArray() : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="toeuler"><a class="lift" href="#toeuler">toeuler</a></a><div class="clear"></div>
            <code class="signature apipage">toeuler() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;