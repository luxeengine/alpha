
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelProgress,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleEmitterInitData,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.DataInfo,luxe._Parcel.FontInfo,luxe._Parcel.JSONInfo,luxe._Parcel.ShaderInfo,luxe._Parcel.SoundInfo,luxe._Parcel.TextInfo,luxe.collision.Collision,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.Common,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.FontOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.ResourceOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill.UtfIter,luxe.utils.unifill.UtfTools,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Parcel</h1>
<small>`luxe.Parcel`</small>



<hr/>

`class`extends <code><span>luxe.resource.Resources</span></code>
<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="current_count"><a class="lift" href="#current_count">current\_count</a></a><div class="clear"></div>
                <code class="signature apipage">current\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="options"><a class="lift" href="#options">options</a></a><div class="clear"></div>
                <code class="signature apipage">options : [luxe.options.ParcelOptions](../../api/luxe/options/ParcelOptions.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="time_to_load"><a class="lift" href="#time_to_load">time\_to\_load</a></a><div class="clear"></div>
                <code class="signature apipage">time\_to\_load : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="total_items"><a class="lift" href="#total_items">total\_items</a></a><div class="clear"></div>
                <code class="signature apipage">total\_items : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add_data"><a class="lift" href="#add_data">add\_data</a></a><div class="clear"></div>
            <code class="signature apipage">add\_data(\_id:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_datas"><a class="lift" href="#add_datas">add\_datas</a></a><div class="clear"></div>
            <code class="signature apipage">add\_datas(list:[Array](http://api.haxe.org/Array.html)&lt;[luxe._Parcel.DataInfo](../../api/luxe/_Parcel/DataInfo.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_font"><a class="lift" href="#add_font">add\_font</a></a><div class="clear"></div>
            <code class="signature apipage">add\_font(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_texture\_path:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_fonts"><a class="lift" href="#add_fonts">add\_fonts</a></a><div class="clear"></div>
            <code class="signature apipage">add\_fonts(list:[Array](http://api.haxe.org/Array.html)&lt;[luxe._Parcel.FontInfo](../../api/luxe/_Parcel/FontInfo.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_json"><a class="lift" href="#add_json">add\_json</a></a><div class="clear"></div>
            <code class="signature apipage">add\_json(\_id:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_jsons"><a class="lift" href="#add_jsons">add\_jsons</a></a><div class="clear"></div>
            <code class="signature apipage">add\_jsons(list:[Array](http://api.haxe.org/Array.html)&lt;[luxe._Parcel.JSONInfo](../../api/luxe/_Parcel/JSONInfo.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_shader"><a class="lift" href="#add_shader">add\_shader</a></a><div class="clear"></div>
            <code class="signature apipage">add\_shader(ps\_id:[String](http://api.haxe.org/String.html)<span></span>, vs\_id:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_shaders"><a class="lift" href="#add_shaders">add\_shaders</a></a><div class="clear"></div>
            <code class="signature apipage">add\_shaders(list:[Array](http://api.haxe.org/Array.html)&lt;[luxe._Parcel.ShaderInfo](../../api/luxe/_Parcel/ShaderInfo.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_sound"><a class="lift" href="#add_sound">add\_sound</a></a><div class="clear"></div>
            <code class="signature apipage">add\_sound(\_id:[String](http://api.haxe.org/String.html)<span></span>, \_name:[String](http://api.haxe.org/String.html)<span></span>, \_is\_stream:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_sounds"><a class="lift" href="#add_sounds">add\_sounds</a></a><div class="clear"></div>
            <code class="signature apipage">add\_sounds(list:[Array](http://api.haxe.org/Array.html)&lt;[luxe._Parcel.SoundInfo](../../api/luxe/_Parcel/SoundInfo.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_text"><a class="lift" href="#add_text">add\_text</a></a><div class="clear"></div>
            <code class="signature apipage">add\_text(\_id:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_texts"><a class="lift" href="#add_texts">add\_texts</a></a><div class="clear"></div>
            <code class="signature apipage">add\_texts(list:[Array](http://api.haxe.org/Array.html)&lt;[luxe._Parcel.TextInfo](../../api/luxe/_Parcel/TextInfo.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_texture"><a class="lift" href="#add_texture">add\_texture</a></a><div class="clear"></div>
            <code class="signature apipage">add\_texture(\_id:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_textures"><a class="lift" href="#add_textures">add\_textures</a></a><div class="clear"></div>
            <code class="signature apipage">add\_textures(list:[Array](http://api.haxe.org/Array.html)&lt;[String](http://api.haxe.org/String.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="from_json"><a class="lift" href="#from_json">from\_json</a></a><div class="clear"></div>
            <code class="signature apipage">from\_json(\_json\_object:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><div class="clear"></div>
            <code class="signature apipage">load() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.ParcelOptions](../../api/luxe/options/ParcelOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;