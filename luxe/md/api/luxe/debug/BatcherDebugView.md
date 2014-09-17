
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.ID,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelProgress,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleEmitterInitData,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.Sound,luxe.Sprite,luxe.State,luxe.States,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe._Core.CoreThreadRequest,luxe._Core.LoadShaderInfo,luxe._Core.LoadTextureInfo,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._NineSlice.Slice,luxe._Parcel.FontInfo,luxe._Parcel.ShaderInfo,luxe._Parcel.SoundInfo,luxe.collision.Collision,luxe.collision.CollisionData,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.FontOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.ResourceOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceManager,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.structural.Bag,luxe.structural.BalancedBinarySearchTraverseMethod,luxe.structural.BalancedBinarySearchTree,luxe.structural.BalancedBinarySearchTreeNode,luxe.structural.BinarySearchTraverseMethod,luxe.structural.BinarySearchTree,luxe.structural.BinarySearchTreeNode,luxe.structural.Heap,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisuals,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisuals,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.TiledMap,luxe.tilemaps.TiledMapOptions,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisuals,luxe.tilemaps.TilemapVisualsLayerGeometry,luxe.tilemaps.Tileset,luxe.tilemaps.tiled.TiledLayer,luxe.tilemaps.tiled.TiledMapData,luxe.tilemaps.tiled.TiledObject,luxe.tilemaps.tiled.TiledObjectGroup,luxe.tilemaps.tiled.TiledObjectType,luxe.tilemaps.tiled.TiledPolyObject,luxe.tilemaps.tiled.TiledPropertyTile,luxe.tilemaps.tiled.TiledTile,luxe.tilemaps.tiled.TiledTileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.JSON,luxe.utils.Maths,luxe.utils.UUID,luxe.utils.Utils,luxe.utils._UUID.Rule30,luxe.utils.json.JSONDecoder,luxe.utils.json.JSONEncoder,luxe.utils.json.JSONParseError,luxe.utils.json.JSONToken,luxe.utils.json.JSONTokenType,luxe.utils.json.JSONTokenizer,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.DualQuaternion,phoenix.FilterType,phoenix.KerningKey,phoenix.KeyValuePair,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PageInfo,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.UniformValue,phoenix.UniformValueType,phoenix.Vec,phoenix.Vector,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.ComplexGeometry,phoenix.geometry.ComplexQuad,phoenix.geometry.CompositeGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.utils.Rendering"></script>


<h1>BatcherDebugView</h1>
<small>`luxe.debug.BatcherDebugView`</small>



<hr/>

`class`extends <code><span>luxe.debug.DebugView</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#id'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the id</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#name'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat">the name</span><br/><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#visible'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
                <code class="signature apipage">visible : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="clear_batcher_tree"><a class="lift" href="#clear_batcher_tree">clear\_batcher\_tree</a></a><div class="clear"></div>
            <code class="signature apipage">clear\_batcher\_tree() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="create"><a class="lift" href="#create">create</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#create'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">create() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="draw_batcher_tree"><a class="lift" href="#draw_batcher_tree">draw\_batcher\_tree</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_batcher\_tree() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="draw_geom_leaf"><a class="lift" href="#draw_geom_leaf">draw\_geom\_leaf</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_geom\_leaf(L:[Bool](http://api.haxe.org/Bool.html)<span></span>, \_leaf:[luxe.structural.BalancedBinarySearchTreeNode](../../../api/luxe/structural/BalancedBinarySearchTreeNode.html)&lt;[phoenix.geometry.GeometryKey](../../../api/phoenix/geometry/GeometryKey.html), [phoenix.geometry.Geometry](../../../api/phoenix/geometry/Geometry.html)&gt;<span></span>, \_p:[luxe.Vector](../../../api/luxe/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="draw_geom_node"><a class="lift" href="#draw_geom_node">draw\_geom\_node</a></a><div class="clear"></div>
            <code class="signature apipage">draw\_geom\_node(l:[Bool](http://api.haxe.org/Bool.html)<span></span>, \_leaf:[luxe.structural.BalancedBinarySearchTreeNode](../../../api/luxe/structural/BalancedBinarySearchTreeNode.html)&lt;[phoenix.geometry.GeometryKey](../../../api/phoenix/geometry/GeometryKey.html), [phoenix.geometry.Geometry](../../../api/phoenix/geometry/Geometry.html)&gt;<span></span>, \_p:[luxe.Vector](../../../api/luxe/Vector.html)<span></span>, \_bbw:[Float](http://api.haxe.org/Float.html)<span>=20</span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="hide"><a class="lift" href="#hide">hide</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#hide'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">hide() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeydown"><a class="lift" href="#onkeydown">onkeydown</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#onkeydown'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeydown(e:[luxe.KeyEvent](../../../api/luxe/KeyEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onkeyup"><a class="lift" href="#onkeyup">onkeyup</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#onkeyup'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onkeyup(e:[luxe.KeyEvent](../../../api/luxe/KeyEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousedown"><a class="lift" href="#onmousedown">onmousedown</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#onmousedown'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousedown(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousemove"><a class="lift" href="#onmousemove">onmousemove</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#onmousemove'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousemove(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmouseup"><a class="lift" href="#onmouseup">onmouseup</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#onmouseup'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmouseup(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="onmousewheel"><a class="lift" href="#onmousewheel">onmousewheel</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#onmousewheel'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">onmousewheel(e:[luxe.MouseEvent](../../../api/luxe/MouseEvent.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="process"><a class="lift" href="#process">process</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#process'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">process() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="refresh"><a class="lift" href="#refresh">refresh</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#refresh'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">refresh() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="show"><a class="lift" href="#show">show</a></a><a data-tooltip="inherited from <a href='../../../api/luxe/debug/DebugView.html#show'>luxe.debug.DebugView</a>" class="tooltip inherited">&gt;</a><div class="clear"></div>
            <code class="signature apipage">show() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;