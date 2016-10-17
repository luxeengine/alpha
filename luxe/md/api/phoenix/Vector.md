
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.Audio,luxe.AudioEvent,luxe.AudioHandle,luxe.AudioInstance,luxe.AudioSource,luxe.AudioState,luxe.BitmapFontInfo,luxe.BytesInfo,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Engine,luxe.Entity,luxe.Ev,luxe.Events,luxe.Game,luxe.GameConfig,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputEventType,luxe.InteractState,luxe.ItemInfo,luxe.JSONInfo,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelChange,luxe.ParcelEvent,luxe.ParcelList,luxe.ParcelProgress,luxe.ParcelState,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.PhysicsEvent,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.ResourceEvent,luxe.ResourceState,luxe.ResourceStats,luxe.ResourceType,luxe.Resources,luxe.Scan,luxe.Scene,luxe.Screen,luxe.ShaderInfo,luxe.SizeMode,luxe.SoundInfo,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.TextInfo,luxe.TextureInfo,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.UserConfig,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Ev.Ev_Impl_,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.ParcelEvent_Impl_,luxe._Parcel.ParcelState_Impl_,luxe._Particles.ParticleEmitterInitData,luxe._Physics.PhysicsEvent_Impl_,luxe._Resources.ResourceEvent_Impl_,luxe._Resources.ResourceState_Impl_,luxe._Resources.ResourceType_Impl_,luxe.collision.Collision,luxe.collision.Results,luxe.collision.ResultsIterator,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision._Collision.Constructible,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.InfiniteState,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.physics.nape.BoxCollider,luxe.components.physics.nape.BoxColliderOptions,luxe.components.physics.nape.CircleCollider,luxe.components.physics.nape.CircleColliderOptions,luxe.components.physics.nape.NapeBody,luxe.components.physics.nape.NapeBodyOptions,luxe.components.physics.nape.PolygonCollider,luxe.components.physics.nape.PolygonColliderOptions,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.SceneDebugView,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerGraph,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.bitmapfont.BitmapFontData,luxe.importers.bitmapfont.BitmapFontParser,luxe.importers.bitmapfont.Character,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledImage,luxe.importers.tiled.TiledImageLayer,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.AudioResourceOptions,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.BytesResourceOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawPolygonOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.JSONResourceOptions,luxe.options.LineGeometryOptions,luxe.options.LoadAudioOptions,luxe.options.LoadFontOptions,luxe.options.LoadShaderOptions,luxe.options.LoadTextureOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.RenderTextureOptions,luxe.options.ResourceOptions,luxe.options.ShaderOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextResourceOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.physics.nape.DebugDraw,luxe.physics.nape.PhysicsNape,luxe.physics.nape._DebugDraw.CachedGeometry,luxe.resource.AudioResource,luxe.resource.BytesResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.TextResource,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTIterator,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Cache,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.types.user.Game,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf16.Utf16_Impl_,luxe.utils.unifill._Utf32.Utf32_Impl_,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,luxe.utils.unifill._Utf8.Utf8_Impl_,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherEventType,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.TextureDataType,phoenix.TextureFormat,phoenix.TextureID,phoenix.TextureSubmitTarget,phoenix.TextureType,phoenix.Transform,phoenix.Uniforms,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BatcherEventType_Impl_,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.Uniform,phoenix._Texture.ClampSlot,phoenix._Texture.ClampSlot_Impl_,phoenix._Texture.ClampType_Impl_,phoenix._Texture.FilterSlot,phoenix._Texture.FilterSlot_Impl_,phoenix._Texture.FilterType_Impl_,phoenix._Texture.TextureSubmitTarget_Impl_,phoenix._Texture.TextureType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Vector</h1>
<small>
<code><a target="_blank" href="https:/github.com/underscorediscovery/luxe/blob/master/phoenix/Vector.hx">phoenix.Vector</a></code>
</small>



<hr/>

`class`

<hr/>

&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="ignore_listeners"><a class="lift" href="#ignore_listeners">ignore\_listeners</a></a><div class="clear"></div>
                <code class="signature apipage">ignore\_listeners : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="w"><a class="lift" href="#w">w</a></a><div class="clear"></div>
                <code class="signature apipage">w : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="angle2D"><a class="lift" href="#angle2D">angle2D</a></a><div class="clear"></div>
                <code class="signature apipage">angle2D : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="inverted"><a class="lift" href="#inverted">inverted</a></a><div class="clear"></div>
                <code class="signature apipage">inverted : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="length"><a class="lift" href="#length">length</a></a><div class="clear"></div>
                <code class="signature apipage">length : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="lengthsq"><a class="lift" href="#lengthsq">lengthsq</a></a><div class="clear"></div>
                <code class="signature apipage">lengthsq : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="normalized"><a class="lift" href="#normalized">normalized</a></a><div class="clear"></div>
                <code class="signature apipage">normalized : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/></span>
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
            <a name="Add"><a class="lift" href="#Add">Add</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Add(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="AddScalar"><a class="lift" href="#AddScalar">AddScalar</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">AddScalar(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Cross"><a class="lift" href="#Cross">Cross</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Cross(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Degrees"><a class="lift" href="#Degrees">Degrees</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Degrees(\_radian\_vector:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Divide"><a class="lift" href="#Divide">Divide</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Divide(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="DivideVector"><a class="lift" href="#DivideVector">DivideVector</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">DivideVector(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Listen"><a class="lift" href="#Listen">Listen</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Listen(\_v:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, listener:[Float](http://api.haxe.org/Float.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Multiply"><a class="lift" href="#Multiply">Multiply</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Multiply(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="MultiplyVector"><a class="lift" href="#MultiplyVector">MultiplyVector</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">MultiplyVector(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Radians"><a class="lift" href="#Radians">Radians</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Radians(\_degree\_vector:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="RotationTo"><a class="lift" href="#RotationTo">RotationTo</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">RotationTo(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="Subtract"><a class="lift" href="#Subtract">Subtract</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">Subtract(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="SubtractScalar"><a class="lift" href="#SubtractScalar">SubtractScalar</a></a><span class="inline-block static">inline</span><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">SubtractScalar(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">add(other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="addScalar"><a class="lift" href="#addScalar">addScalar</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">addScalar(v:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_xyz"><a class="lift" href="#add_xyz">add\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">add\_xyz(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="applyProjection"><a class="lift" href="#applyProjection">applyProjection</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">applyProjection(m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="applyQuaternion"><a class="lift" href="#applyQuaternion">applyQuaternion</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">applyQuaternion(q:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">clone() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="copy_from"><a class="lift" href="#copy_from">copy\_from</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">copy\_from(\_other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="cross"><a class="lift" href="#cross">cross</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">cross(a:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, b:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="degrees"><a class="lift" href="#degrees">degrees</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">degrees() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="divide"><a class="lift" href="#divide">divide</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">divide(other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="divideScalar"><a class="lift" href="#divideScalar">divideScalar</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">divideScalar(v:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="divide_xyz"><a class="lift" href="#divide_xyz">divide\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">divide\_xyz(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="dot"><a class="lift" href="#dot">dot</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">dot(other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="equals"><a class="lift" href="#equals">equals</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">equals(other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="int"><a class="lift" href="#int">int</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">int() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="int_x"><a class="lift" href="#int_x">int\_x</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">int\_x() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="int_y"><a class="lift" href="#int_y">int\_y</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">int\_y() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="int_z"><a class="lift" href="#int_z">int\_z</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">int\_z() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="invert"><a class="lift" href="#invert">invert</a></a><div class="clear"></div>
            <code class="signature apipage">invert() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lerp"><a class="lift" href="#lerp">lerp</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">lerp(\_other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_t:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lerp_xy"><a class="lift" href="#lerp_xy">lerp\_xy</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">lerp\_xy(\_dest\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_dest\_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_t:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lerp_xyz"><a class="lift" href="#lerp_xyz">lerp\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">lerp\_xyz(\_dest\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_dest\_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_dest\_z:[Float](http://api.haxe.org/Float.html)<span></span>, \_t:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


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
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiply(other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiplyScalar"><a class="lift" href="#multiplyScalar">multiplyScalar</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiplyScalar(v:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiply_xyz"><a class="lift" href="#multiply_xyz">multiply\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiply\_xyz(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">new(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>, \_w:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="normalize"><a class="lift" href="#normalize">normalize</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">normalize() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="radians"><a class="lift" href="#radians">radians</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">radians() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="rotationTo"><a class="lift" href="#rotationTo">rotationTo</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">rotationTo(other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">set(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>, \_w:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="setEulerFromQuaternion"><a class="lift" href="#setEulerFromQuaternion">setEulerFromQuaternion</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">setEulerFromQuaternion(q:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, order:[phoenix.ComponentOrder](../../api/phoenix/ComponentOrder.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="setEulerFromRotationMatrix"><a class="lift" href="#setEulerFromRotationMatrix">setEulerFromRotationMatrix</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">setEulerFromRotationMatrix(m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>, order:[phoenix.ComponentOrder](../../api/phoenix/ComponentOrder.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_xy"><a class="lift" href="#set_xy">set\_xy</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">set\_xy(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_xyz"><a class="lift" href="#set_xyz">set\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">set\_xyz(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="subtract"><a class="lift" href="#subtract">subtract</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">subtract(other:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="subtractScalar"><a class="lift" href="#subtractScalar">subtractScalar</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">subtractScalar(v:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="subtract_xyz"><a class="lift" href="#subtract_xyz">subtract\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">subtract\_xyz(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="transform"><a class="lift" href="#transform">transform</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">transform(\_m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="transformDirection"><a class="lift" href="#transformDirection">transformDirection</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">transformDirection(m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="truncate"><a class="lift" href="#truncate">truncate</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">truncate(max:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="weighted_average_xy"><a class="lift" href="#weighted_average_xy">weighted\_average\_xy</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">weighted\_average\_xy(\_dest\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_dest\_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_slowness:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="weighted_average_xyz"><a class="lift" href="#weighted_average_xyz">weighted\_average\_xyz</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">weighted\_average\_xyz(\_dest\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_dest\_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_dest\_z:[Float](http://api.haxe.org/Float.html)<span></span>, \_slowness:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;