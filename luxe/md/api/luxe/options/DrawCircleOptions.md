
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.Audio,luxe.AudioEvent,luxe.AudioHandle,luxe.AudioInstance,luxe.AudioSource,luxe.AudioState,luxe.BitmapFontInfo,luxe.BytesInfo,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Engine,luxe.Entity,luxe.Ev,luxe.Events,luxe.Game,luxe.GameConfig,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputEventType,luxe.InteractState,luxe.ItemInfo,luxe.JSONInfo,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelChange,luxe.ParcelEvent,luxe.ParcelList,luxe.ParcelProgress,luxe.ParcelState,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.PhysicsEvent,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.ResourceEvent,luxe.ResourceState,luxe.ResourceStats,luxe.ResourceType,luxe.Resources,luxe.Scan,luxe.Scene,luxe.Screen,luxe.ShaderInfo,luxe.SizeMode,luxe.SoundInfo,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.TextInfo,luxe.TextureInfo,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.UserConfig,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Ev.Ev_Impl_,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.ParcelEvent_Impl_,luxe._Parcel.ParcelState_Impl_,luxe._Particles.ParticleEmitterInitData,luxe._Physics.PhysicsEvent_Impl_,luxe._Resources.ResourceEvent_Impl_,luxe._Resources.ResourceState_Impl_,luxe._Resources.ResourceType_Impl_,luxe.collision.Collision,luxe.collision.Results,luxe.collision.ResultsIterator,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision._Collision.Constructible,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.InfiniteState,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.physics.nape.BoxCollider,luxe.components.physics.nape.BoxColliderOptions,luxe.components.physics.nape.CircleCollider,luxe.components.physics.nape.CircleColliderOptions,luxe.components.physics.nape.NapeBody,luxe.components.physics.nape.NapeBodyOptions,luxe.components.physics.nape.PolygonCollider,luxe.components.physics.nape.PolygonColliderOptions,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.SceneDebugView,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerGraph,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.bitmapfont.BitmapFontData,luxe.importers.bitmapfont.BitmapFontParser,luxe.importers.bitmapfont.Character,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledImage,luxe.importers.tiled.TiledImageLayer,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.AudioResourceOptions,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.BytesResourceOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawPolygonOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.JSONResourceOptions,luxe.options.LineGeometryOptions,luxe.options.LoadAudioOptions,luxe.options.LoadFontOptions,luxe.options.LoadShaderOptions,luxe.options.LoadTextureOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.RenderTextureOptions,luxe.options.ResourceOptions,luxe.options.ShaderOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextResourceOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.physics.nape.DebugDraw,luxe.physics.nape.PhysicsNape,luxe.physics.nape._DebugDraw.CachedGeometry,luxe.resource.AudioResource,luxe.resource.BytesResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.TextResource,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTIterator,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Cache,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.types.user.Game,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf16.Utf16_Impl_,luxe.utils.unifill._Utf32.Utf32_Impl_,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,luxe.utils.unifill._Utf8.Utf8_Impl_,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherEventType,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.TextureDataType,phoenix.TextureFormat,phoenix.TextureID,phoenix.TextureSubmitTarget,phoenix.TextureType,phoenix.Transform,phoenix.Uniforms,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BatcherEventType_Impl_,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.Uniform,phoenix._Texture.ClampSlot,phoenix._Texture.ClampSlot_Impl_,phoenix._Texture.ClampType_Impl_,phoenix._Texture.FilterSlot,phoenix._Texture.FilterSlot_Impl_,phoenix._Texture.FilterType_Impl_,phoenix._Texture.TextureSubmitTarget_Impl_,phoenix._Texture.TextureType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>DrawCircleOptions</h1>
<small>`luxe.options.DrawCircleOptions`
 defined in `luxe.options.DrawOptions`
</small>



<hr/>

`typedef`&nbsp;alias of <code><a href="../../../api/luxe/options/CircleGeometryOptions.html">luxe.options.CircleGeometryOptions</a></code>   


<hr/>

&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="y"><a class="lift" href="#y">y</a></a><div class="clear"></div>
                <code class="signature apipage">y : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">y position</span><br/><span class="member apipage">
                <a name="x"><a class="lift" href="#x">x</a></a><div class="clear"></div>
                <code class="signature apipage">x : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">x position</span><br/><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div>
                <code class="signature apipage">visible : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the visibility</span><br/><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Texture](../../../api/phoenix/Texture.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><br/><span class="member apipage">
                <a name="steps"><a class="lift" href="#steps">steps</a></a><div class="clear"></div>
                <code class="signature apipage">steps : [Null](http://api.haxe.org/Null.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/></span>
            <span class="small_desc_flat">a fixed number of steps/sides, will auto step smoothly if not specified (using smooth above)</span><br/><span class="member apipage">
                <a name="start_angle"><a class="lift" href="#start_angle">start\_angle</a></a><div class="clear"></div>
                <code class="signature apipage">start\_angle : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">Starting angle of circle, in degrees (pie/arc)</span><br/><span class="member apipage">
                <a name="smooth"><a class="lift" href="#smooth">smooth</a></a><div class="clear"></div>
                <code class="signature apipage">smooth : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the smoothing factor to auto calculate steps</span><br/><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Shader](../../../api/phoenix/Shader.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the shader for the geometry</span><br/><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Vector](../../../api/phoenix/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform scale</span><br/><span class="member apipage">
                <a name="ry"><a class="lift" href="#ry">ry</a></a><div class="clear"></div>
                <code class="signature apipage">ry : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">y radius. For an ellipse, optional.</span><br/><span class="member apipage">
                <a name="rx"><a class="lift" href="#rx">rx</a></a><div class="clear"></div>
                <code class="signature apipage">rx : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">x radius. For an ellipse, optional.</span><br/><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Quaternion](../../../api/phoenix/Quaternion.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform rotation</span><br/><span class="member apipage">
                <a name="r"><a class="lift" href="#r">r</a></a><div class="clear"></div>
                <code class="signature apipage">r : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">radius</span><br/><span class="member apipage">
                <a name="primitive_type"><a class="lift" href="#primitive_type">primitive\_type</a></a><div class="clear"></div>
                <code class="signature apipage">primitive\_type : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.PrimitiveType](../../../api/phoenix/PrimitiveType.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the primitive type of the geometry. lines, triangles, point etc</span><br/><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Vector](../../../api/phoenix/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform position</span><br/><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><div class="clear"></div>
                <code class="signature apipage">origin : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Vector](../../../api/phoenix/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform origin</span><br/><span class="member apipage">
                <a name="no_batcher_add"><a class="lift" href="#no_batcher_add">no\_batcher\_add</a></a><div class="clear"></div>
                <code class="signature apipage">no\_batcher\_add : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, the geometry will not be added to any batcher.</span><br/><span class="member apipage">
                <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><div class="clear"></div>
                <code class="signature apipage">immediate : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if immediate, this geometry is dropped from the batcher at the end of the frame.</span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div>
                <code class="signature apipage">id : [Null](http://api.haxe.org/Null.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The geometry id. if none given, a unique id is generated.</span><br/><span class="member apipage">
                <a name="end_angle"><a class="lift" href="#end_angle">end\_angle</a></a><div class="clear"></div>
                <code class="signature apipage">end\_angle : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">Ending angle of circle, in degrees (pie/arc)</span><br/><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
                <code class="signature apipage">depth : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><br/><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><div class="clear"></div>
                <code class="signature apipage">color : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Color](../../../api/luxe/Color.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the base color</span><br/><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><div class="clear"></div>
                <code class="signature apipage">clip\_rect : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Rectangle](../../../api/luxe/Rectangle.html)&gt;</code><br/></span>
            <span class="small_desc_flat">If specified, the geometry will be clipped to this rectangle region (in world space).</span><br/><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div>
                <code class="signature apipage">batcher : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Batcher](../../../api/phoenix/Batcher.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the batcher to add the geometry to. If not specified, the default batcher is used.</span><br/>






<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;