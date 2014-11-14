
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.ID,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelProgress,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleEmitterInitData,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.State,luxe.States,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe._Core.CoreThreadRequest,luxe._Core.LoadShaderInfo,luxe._Core.LoadTextureInfo,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._NineSlice.Slice,luxe._Parcel.DataInfo,luxe._Parcel.FontInfo,luxe._Parcel.ShaderInfo,luxe._Parcel.SoundInfo,luxe._Parcel.TextInfo,luxe.collision.Collision,luxe.collision.CollisionData,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.FontOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.ResourceOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceManager,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTNode_phoenix_geometry_GeometryKey_phoenix_geometry_Geometry,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.BalancedBST_phoenix_geometry_GeometryKey_phoenix_geometry_Geometry,luxe.structural.Heap,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.JSON,luxe.utils.Maths,luxe.utils.UUID,luxe.utils.Utils,luxe.utils._UUID.Rule30,luxe.utils.json.JSONDecoder,luxe.utils.json.JSONEncoder,luxe.utils.json.JSONParseError,luxe.utils.json.JSONToken,luxe.utils.json.JSONTokenType,luxe.utils.json.JSONTokenizer,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.UniformValue,phoenix.UniformValueType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Character,phoenix._BitmapFont.Parser,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.ComplexGeometry,phoenix.geometry.ComplexQuad,phoenix.geometry.CompositeGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.utils.Rendering"></script>


<h1>Sprite</h1>
<small>`luxe.Sprite`</small>



<hr/>

`class`extends <code><span>luxe.Visual</span></code><br/><span class="meta">
meta: @:keep, @:build(&#x27;???&#x27;), @:autoBuild(&#x27;???&#x27;)</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="children"><a class="lift" href="#children">children</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#children'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">children : [Array](http://api.haxe.org/Array.html)&lt;[luxe.Entity](../../api/luxe/Entity.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The list of children this entity is parenting. Use `child.parent = null;` to remove, or `child.parent = entity;` to assign.</span><br/><span class="member apipage">
                <a name="destroyed"><a class="lift" href="#destroyed">destroyed</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#destroyed'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">destroyed : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been destroyed</span><br/><span class="member apipage">
                <a name="events"><a class="lift" href="#events">events</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#events'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">events : [luxe.Events](../../api/luxe/Events.html)</code><br/></span>
            <span class="small_desc_flat">A local event system for sending and receiving named events through the entity. Helps communicate between components, and more.</span><br/><span class="member apipage">
                <a name="geometry_quad"><a class="lift" href="#geometry_quad">geometry\_quad</a></a><div class="clear"></div>
                <code class="signature apipage">geometry\_quad : [phoenix.geometry.QuadGeometry](../../api/phoenix/geometry/QuadGeometry.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#id'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the id</span><br/><span class="member apipage">
                <a name="inited"><a class="lift" href="#inited">inited</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#inited'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">inited : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been inited yet</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#name'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the name</span><br/><span class="member apipage">
                <a name="started"><a class="lift" href="#started">started</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#started'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">started : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">whether or not this entity has been started/reset by the scene</span><br/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#transform'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">transform : [luxe.Transform](../../api/luxe/Transform.html)</code><br/></span>
            <span class="small_desc_flat">The spatial transform of the entity.</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="active"><a class="lift" href="#active">active</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#active'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">active : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">if the entity is active in the scene or not. set to inactive to stop scene events propogating into this entity and it's components and children</span><span class="member apipage">
                <a name="centered"><a class="lift" href="#centered">centered</a></a><div class="clear"></div>
                <code class="signature apipage">centered : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="clip_rect"><a class="lift" href="#clip_rect">clip\_rect</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#clip\_rect'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">clip\_rect : [luxe.Rectangle](../../api/luxe/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat">If note null, the geometry will be clipped to this rectangle region (in world space).</span><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#color'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">color : [luxe.Color](../../api/luxe/Color.html)</code><br/></span>
            <span class="small_desc_flat">the base color</span><span class="member apipage">
                <a name="components"><a class="lift" href="#components">components</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#components'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">components : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [luxe.Component](../../api/luxe/Component.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The map of attached components, by name. use .get to find components in children and from other components instead of accessing this unless you need to</span><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#depth'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">depth : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><span class="member apipage">
                <a name="fixed_rate"><a class="lift" href="#fixed_rate">fixed\_rate</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#fixed\_rate'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">fixed\_rate : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">per entity fixed rate timer, if any. if 0 (default) no fixed update is called on this entity.</span><span class="member apipage">
                <a name="flipx"><a class="lift" href="#flipx">flipx</a></a><div class="clear"></div>
                <code class="signature apipage">flipx : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="flipy"><a class="lift" href="#flipy">flipy</a></a><div class="clear"></div>
                <code class="signature apipage">flipy : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#geometry'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">geometry : [phoenix.geometry.Geometry](../../api/phoenix/geometry/Geometry.html)</code><br/></span>
            <span class="small_desc_flat">the geometry this visual contains</span><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#group'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">group : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">the geometry group id (see guides)</span><span class="member apipage">
                <a name="locked"><a class="lift" href="#locked">locked</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#locked'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">locked : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">the geometry static flag. This is a hint on how to render the geometry for performance</span><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#origin'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">origin : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local origin of the spatial transform</span><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#parent'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">parent : [luxe.Entity](../../api/luxe/Entity.html)</code><br/></span>
            <span class="small_desc_flat">The parent entity if any, set to null for no parent</span><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#pos'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">pos : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local position of the spatial transform</span><span class="member apipage">
                <a name="radians"><a class="lift" href="#radians">radians</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#radians'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">radians : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">convenience: controls the rotation around the z axis, in radians.</span><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#rotation'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation : [luxe.Quaternion](../../api/luxe/Quaternion.html)</code><br/></span>
            <span class="small_desc_flat">The local rotation of the spatial transform</span><span class="member apipage">
                <a name="rotation_z"><a class="lift" href="#rotation_z">rotation\_z</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#rotation\_z'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">rotation\_z : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat">convenience: controls the rotation around the z axis, in degrees.</span><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#scale'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scale : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">The local scale of the spatial transform</span><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#scene'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">scene : [luxe.Scene](../../api/luxe/Scene.html)</code><br/></span>
            <span class="small_desc_flat">if the entity is in a scene, this is not null</span><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#shader'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">shader : [phoenix.Shader](../../api/phoenix/Shader.html)</code><br/></span>
            <span class="small_desc_flat">the shader for the geometry</span><span class="member apipage">
                <a name="size"><a class="lift" href="#size">size</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#size'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">size : [luxe.Vector](../../api/luxe/Vector.html)</code><br/></span>
            <span class="small_desc_flat">the size of this geometry (only makes sense for QuadGeometry)</span><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#texture'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.Texture](../../api/phoenix/Texture.html)</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><span class="member apipage">
                <a name="uv"><a class="lift" href="#uv">uv</a></a><div class="clear"></div>
                <code class="signature apipage">uv : [luxe.Rectangle](../../api/luxe/Rectangle.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#visible'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">visible : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">the visibility</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#add'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">add&lt;T&gt;(\_component:[add.T](#)<span></span>) : [add.T](#)</code><br/><span class="small_desc_flat">attach a component to the entity</span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#destroy'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">destroy(\_from\_parent:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">destroy this entity. removes it from the scene if any, from the parent etc.</span>


</span>
<span class="method apipage">
            <a name="get"><a class="lift" href="#get">get</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#get'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get&lt;T&gt;(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_in\_children:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [get.T](#)</code><br/><span class="small_desc_flat">get a component from the entity, by name</span>


</span>
<span class="method apipage">
            <a name="get_any"><a class="lift" href="#get_any">get\_any</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#get\_any'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">get\_any&lt;T&gt;(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_in\_children:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>, \_first\_only:[Bool](http://api.haxe.org/Bool.html)<span>=true</span>) : [Array](http://api.haxe.org/Array.html)&lt;[get_any.T](#)&gt;</code><br/><span class="small_desc_flat">get all component from the entity, by name</span>


</span>
<span class="method apipage">
            <a name="has"><a class="lift" href="#has">has</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#has'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">has(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">returns true if the entity has a component by the given name</span>


</span>
<span class="method apipage">
            <a name="init"><a class="lift" href="#init">init</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#init'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">init() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(options:[luxe.options.SpriteOptions](../../api/luxe/options/SpriteOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="ondestroy"><a class="lift" href="#ondestroy">ondestroy</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#ondestroy'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">ondestroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onfixedupdate"><a class="lift" href="#onfixedupdate">onfixedupdate</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#onfixedupdate'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onfixedupdate(rate:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">called once per fixed rate, only if fixed_rate != 0</span>


</span>
<span class="method apipage">
            <a name="point_inside"><a class="lift" href="#point_inside">point\_inside</a></a><div class="clear"></div>
            <code class="signature apipage">point\_inside(\_p:[luxe.Vector](../../api/luxe/Vector.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="point_inside_AABB"><a class="lift" href="#point_inside_AABB">point\_inside\_AABB</a></a><div class="clear"></div>
            <code class="signature apipage">point\_inside\_AABB(\_p:[luxe.Vector](../../api/luxe/Vector.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Returns true if a point is inside the AABB unrotated</span>


</span>
<span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#remove'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">remove(\_name:[String](http://api.haxe.org/String.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">remove a component from the entity</span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><a data-tooltip="inherited from <a href='../../api/luxe/Visual.html#update'>luxe.Visual</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">update(dt:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">called once per frame, passing the delta time</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;