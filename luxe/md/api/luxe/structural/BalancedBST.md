
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelProgress,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleEmitterInitData,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.DataInfo,luxe._Parcel.FontInfo,luxe._Parcel.JSONInfo,luxe._Parcel.ShaderInfo,luxe._Parcel.SoundInfo,luxe._Parcel.TextInfo,luxe.collision.Collision,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.Common,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.FontOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.ResourceOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill.UtfIter,luxe.utils.unifill.UtfTools,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>BalancedBST</h1>
<small>`luxe.structural.BalancedBST`</small>

Copyright 2014 Sven Bergström

    A balanced binary search tree,
    implemented based on various stack overflow answers,
    wikipedia articles and books read over the years.
    some other references : https://github.com/polygonal/ds

    Part of the structural library for haxe
    http://github.com/underscorediscovery/structural

    MIT License

<hr/>

`class`<br/><span class="meta">
meta: @:generic</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="root"><a class="lift" href="#root">root</a></a><div class="clear"></div>
                <code class="signature apipage">root : [luxe.structural.BalancedBSTNode](../../../api/luxe/structural/BalancedBSTNode.html)&lt;[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html), [luxe.structural.BalancedBST.T](../../../api/luxe/structural/BalancedBST/T.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The tree root node</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="empty"><a class="lift" href="#empty">empty</a></a><div class="clear"></div>
                <code class="signature apipage">empty : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">Whether or not the tree is empty (i.e root == null)</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="ceil"><a class="lift" href="#ceil">ceil</a></a><div class="clear"></div>
            <code class="signature apipage">ceil(\_key:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)&gt;</code><br/><span class="small_desc_flat">tree ceiling http://en.wikipedia.org/wiki/Floor_and_ceiling_functions</span>


</span>
<span class="method apipage">
            <a name="compare"><a class="lift" href="#compare">compare</a></a><div class="clear"></div>
            <code class="signature apipage">compare(:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>, :[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">The current comparison functoin</span>


</span>
<span class="method apipage">
            <a name="contains"><a class="lift" href="#contains">contains</a></a><div class="clear"></div>
            <code class="signature apipage">contains(\_key:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Returns true if the tree contains the key for this node</span>


</span>
<span class="method apipage">
            <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
            <code class="signature apipage">depth() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Return the depth of the tree</span>


</span>
<span class="method apipage">
            <a name="find"><a class="lift" href="#find">find</a></a><div class="clear"></div>
            <code class="signature apipage">find(\_key:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>) : [luxe.structural.BalancedBST.T](../../../api/luxe/structural/BalancedBST/T.html)</code><br/><span class="small_desc_flat">Returns a node by key, if found. null otherwise</span>


</span>
<span class="method apipage">
            <a name="floor"><a class="lift" href="#floor">floor</a></a><div class="clear"></div>
            <code class="signature apipage">floor(\_key:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>) : [Null](http://api.haxe.org/Null.html)&lt;[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)&gt;</code><br/><span class="small_desc_flat">tree floor http://en.wikipedia.org/wiki/Floor_and_ceiling_functions</span>


</span>
<span class="method apipage">
            <a name="insert"><a class="lift" href="#insert">insert</a></a><div class="clear"></div>
            <code class="signature apipage">insert(\_key:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>, \_value:[luxe.structural.BalancedBST.T](../../../api/luxe/structural/BalancedBST/T.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Insert a node into the tree</span>


</span>
<span class="method apipage">
            <a name="iterator"><a class="lift" href="#iterator">iterator</a></a><div class="clear"></div>
            <code class="signature apipage">iterator() : [Iterator](#)&lt;[luxe.structural.BalancedBST.T](../../../api/luxe/structural/BalancedBST/T.html)&gt;</code><br/><span class="small_desc_flat">returns an iterator from a conversion to array of this tree. Usable as `for(item in tree)`   
            :todo: This should traverse directly and implement IIterator</span>


</span>
<span class="method apipage">
            <a name="keys"><a class="lift" href="#keys">keys</a></a><div class="clear"></div>
            <code class="signature apipage">keys() : [Array](http://api.haxe.org/Array.html)&lt;[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)&gt;</code><br/><span class="small_desc_flat">Return an array of the keys in this tree</span>


</span>
<span class="method apipage">
            <a name="largest"><a class="lift" href="#largest">largest</a></a><div class="clear"></div>
            <code class="signature apipage">largest() : [luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)</code><br/><span class="small_desc_flat">return the largest node (key) in the tree (most right)</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(compare\_function:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)&nbsp; -&gt; [luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)&nbsp;-&gt; [Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Create a new balanced BST with the given comparison function</span>


</span>
<span class="method apipage">
            <a name="rank"><a class="lift" href="#rank">rank</a></a><div class="clear"></div>
            <code class="signature apipage">rank(\_key:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Return the number of nodes to the left of this node, by key.   
            http://en.wikipedia.org/wiki/Order_statistic_tree</span>


</span>
<span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><div class="clear"></div>
            <code class="signature apipage">remove(\_key:[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)<span></span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">remove a node by key. return false if the operation fails (i.e the node is not stored in this tree)</span>


</span>
<span class="method apipage">
            <a name="remove_largest"><a class="lift" href="#remove_largest">remove\_largest</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_largest() : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">remove the largest node in the tree (most right)</span>


</span>
<span class="method apipage">
            <a name="remove_smallest"><a class="lift" href="#remove_smallest">remove\_smallest</a></a><div class="clear"></div>
            <code class="signature apipage">remove\_smallest() : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">remove the smallest node in the tree (most left)</span>


</span>
<span class="method apipage">
            <a name="select"><a class="lift" href="#select">select</a></a><div class="clear"></div>
            <code class="signature apipage">select(\_rank:[Int](http://api.haxe.org/Int.html)<span></span>) : [luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)</code><br/><span class="small_desc_flat">Find a key by rank in the tree, i.e given a number of nodes, the key at this point.   
            http://en.wikipedia.org/wiki/Order_statistic_tree</span>


</span>
<span class="method apipage">
            <a name="size"><a class="lift" href="#size">size</a></a><div class="clear"></div>
            <code class="signature apipage">size() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Return the number of nodes in the tree</span>


</span>
<span class="method apipage">
            <a name="smallest"><a class="lift" href="#smallest">smallest</a></a><div class="clear"></div>
            <code class="signature apipage">smallest() : [luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html)</code><br/><span class="small_desc_flat">return the smallest node (key) in the tree (most left)</span>


</span>
<span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><div class="clear"></div>
            <code class="signature apipage">toArray() : [Array](http://api.haxe.org/Array.html)&lt;[luxe.structural.BalancedBST.T](../../../api/luxe/structural/BalancedBST/T.html)&gt;</code><br/><span class="small_desc_flat">return an array of the values in this tree</span>


</span>
<span class="method apipage">
            <a name="traverse_node"><a class="lift" href="#traverse_node">traverse\_node</a></a><div class="clear"></div>
            <code class="signature apipage">traverse\_node(\_node:[luxe.structural.BalancedBSTNode](../../../api/luxe/structural/BalancedBSTNode.html)&lt;[luxe.structural.BalancedBST.K](../../../api/luxe/structural/BalancedBST/K.html), [luxe.structural.BalancedBST.T](../../../api/luxe/structural/BalancedBST/T.html)&gt;<span></span>, \_method:[luxe.structural.BalancedBSTTraverseMethod](../../../api/luxe/structural/BalancedBSTTraverseMethod.html)<span></span>, \_on\_traverse:[luxe.structural.BalancedBSTNode](../../../api/luxe/structural/BalancedBSTNode.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Traverse a node with the given method, and call the given function for each node traversed</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;