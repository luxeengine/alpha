
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.BitmapFontInfo,luxe.BytesInfo,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.ItemInfo,luxe.JSONInfo,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelChange,luxe.ParcelEvent,luxe.ParcelList,luxe.ParcelProgress,luxe.ParcelState,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.ResourceEvent,luxe.ResourceState,luxe.ResourceStats,luxe.ResourceType,luxe.Resources,luxe.Scan,luxe.Scene,luxe.Screen,luxe.ShaderInfo,luxe.SizeMode,luxe.Sound,luxe.SoundInfo,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.TextInfo,luxe.TextureInfo,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.ParcelEvent_Impl_,luxe._Parcel.ParcelState_Impl_,luxe._Particles.ParticleEmitterInitData,luxe._Resources.ResourceEvent_Impl_,luxe._Resources.ResourceState_Impl_,luxe._Resources.ResourceType_Impl_,luxe.collision.Collision,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.Common,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.SceneDebugView,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerGraph,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.bitmapfont.BitmapFontData,luxe.importers.bitmapfont.BitmapFontParser,luxe.importers.bitmapfont.Character,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.BytesResourceOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.JSONResourceOptions,luxe.options.LineGeometryOptions,luxe.options.LoadFontOptions,luxe.options.LoadShaderOptions,luxe.options.LoadTextureOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.RenderTextureOptions,luxe.options.ResourceOptions,luxe.options.ShaderOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextResourceOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.resource.BytesResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.TextResource,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill.UtfIter,luxe.utils.unifill.UtfTools,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.TextureDataType,phoenix.TextureFormat,phoenix.TextureID,phoenix.TextureSubmitTarget,phoenix.TextureType,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Texture.ClampSlot,phoenix._Texture.ClampSlot_Impl_,phoenix._Texture.ClampType_Impl_,phoenix._Texture.FilterSlot,phoenix._Texture.FilterSlot_Impl_,phoenix._Texture.FilterType_Impl_,phoenix._Texture.TextureSubmitTarget_Impl_,phoenix._Texture.TextureType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Batcher</h1>
<small>`phoenix.Batcher`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="buffer_count"><a class="lift" href="#buffer_count">buffer\_count</a></a><div class="clear"></div>
                <code class="signature apipage">buffer\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="buffer_index"><a class="lift" href="#buffer_index">buffer\_index</a></a><div class="clear"></div>
                <code class="signature apipage">buffer\_index : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="color_attribute"><a class="lift" href="#color_attribute">color\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">color\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="color_floats"><a class="lift" href="#color_floats">color\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">color\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="colorlist"><a class="lift" href="#colorlist">colorlist</a></a><div class="clear"></div>
                <code class="signature apipage">colorlist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="draw_calls"><a class="lift" href="#draw_calls">draw\_calls</a></a><div class="clear"></div>
                <code class="signature apipage">draw\_calls : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="dynamic_batched_count"><a class="lift" href="#dynamic_batched_count">dynamic\_batched\_count</a></a><div class="clear"></div>
                <code class="signature apipage">dynamic\_batched\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="enabled"><a class="lift" href="#enabled">enabled</a></a><div class="clear"></div>
                <code class="signature apipage">enabled : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><div class="clear"></div>
                <code class="signature apipage">geometry : [luxe.structural.BalancedBST_phoenix_geometry_GeometryKey_phoenix_geometry_Geometry](../../api/luxe/structural/BalancedBST_phoenix_geometry_GeometryKey_phoenix_geometry_Geometry.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="groups"><a class="lift" href="#groups">groups</a></a><div class="clear"></div>
                <code class="signature apipage">groups : [Map](http://api.haxe.org/Map.html)&lt;[Int](http://api.haxe.org/Int.html), [Array](http://api.haxe.org/Array.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="id"><a class="lift" href="#id">id</a></a><div class="clear"></div>
                <code class="signature apipage">id : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="log"><a class="lift" href="#log">log</a></a><div class="clear"></div>
                <code class="signature apipage">log : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="max_floats"><a class="lift" href="#max_floats">max\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">max\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="max_verts"><a class="lift" href="#max_verts">max\_verts</a></a><div class="clear"></div>
                <code class="signature apipage">max\_verts : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="modelviewmatrix_attribute"><a class="lift" href="#modelviewmatrix_attribute">modelviewmatrix\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">modelviewmatrix\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="normal_floats"><a class="lift" href="#normal_floats">normal\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">normal\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="normallist"><a class="lift" href="#normallist">normallist</a></a><div class="clear"></div>
                <code class="signature apipage">normallist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="projectionmatrix_attribute"><a class="lift" href="#projectionmatrix_attribute">projectionmatrix\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">projectionmatrix\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="renderer"><a class="lift" href="#renderer">renderer</a></a><div class="clear"></div>
                <code class="signature apipage">renderer : [phoenix.Renderer](../../api/phoenix/Renderer.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="state"><a class="lift" href="#state">state</a></a><div class="clear"></div>
                <code class="signature apipage">state : [phoenix.BatchState](../../api/phoenix/BatchState.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_batched_count"><a class="lift" href="#static_batched_count">static\_batched\_count</a></a><div class="clear"></div>
                <code class="signature apipage">static\_batched\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_color_floats"><a class="lift" href="#static_color_floats">static\_color\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">static\_color\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_colorlist"><a class="lift" href="#static_colorlist">static\_colorlist</a></a><div class="clear"></div>
                <code class="signature apipage">static\_colorlist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_normal_floats"><a class="lift" href="#static_normal_floats">static\_normal\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">static\_normal\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_normallist"><a class="lift" href="#static_normallist">static\_normallist</a></a><div class="clear"></div>
                <code class="signature apipage">static\_normallist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_tcoord_floats"><a class="lift" href="#static_tcoord_floats">static\_tcoord\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">static\_tcoord\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_tcoordlist"><a class="lift" href="#static_tcoordlist">static\_tcoordlist</a></a><div class="clear"></div>
                <code class="signature apipage">static\_tcoordlist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_vert_floats"><a class="lift" href="#static_vert_floats">static\_vert\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">static\_vert\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="static_vertlist"><a class="lift" href="#static_vertlist">static\_vertlist</a></a><div class="clear"></div>
                <code class="signature apipage">static\_vertlist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tcoordBuffers"><a class="lift" href="#tcoordBuffers">tcoordBuffers</a></a><div class="clear"></div>
                <code class="signature apipage">tcoordBuffers : [Array](http://api.haxe.org/Array.html)&lt;[snow.modules.opengl.GLBuffer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tcoord_attribute"><a class="lift" href="#tcoord_attribute">tcoord\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tcoord\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tcoord_floats"><a class="lift" href="#tcoord_floats">tcoord\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">tcoord\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tcoordlist"><a class="lift" href="#tcoordlist">tcoordlist</a></a><div class="clear"></div>
                <code class="signature apipage">tcoordlist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex0_attribute"><a class="lift" href="#tex0_attribute">tex0\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex0\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex1_attribute"><a class="lift" href="#tex1_attribute">tex1\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex1\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex2_attribute"><a class="lift" href="#tex2_attribute">tex2\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex2\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex3_attribute"><a class="lift" href="#tex3_attribute">tex3\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex3\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex4_attribute"><a class="lift" href="#tex4_attribute">tex4\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex4\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex5_attribute"><a class="lift" href="#tex5_attribute">tex5\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex5\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex6_attribute"><a class="lift" href="#tex6_attribute">tex6\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex6\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex7_attribute"><a class="lift" href="#tex7_attribute">tex7\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex7\_attribute : [snow.modules.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tree_changed"><a class="lift" href="#tree_changed">tree\_changed</a></a><div class="clear"></div>
                <code class="signature apipage">tree\_changed : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vcolorBuffers"><a class="lift" href="#vcolorBuffers">vcolorBuffers</a></a><div class="clear"></div>
                <code class="signature apipage">vcolorBuffers : [Array](http://api.haxe.org/Array.html)&lt;[snow.modules.opengl.GLBuffer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vert_attribute"><a class="lift" href="#vert_attribute">vert\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">vert\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vert_count"><a class="lift" href="#vert_count">vert\_count</a></a><div class="clear"></div>
                <code class="signature apipage">vert\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vert_floats"><a class="lift" href="#vert_floats">vert\_floats</a></a><div class="clear"></div>
                <code class="signature apipage">vert\_floats : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vertexBuffers"><a class="lift" href="#vertexBuffers">vertexBuffers</a></a><div class="clear"></div>
                <code class="signature apipage">vertexBuffers : [Array](http://api.haxe.org/Array.html)&lt;[snow.modules.opengl.GLBuffer](#)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vertlist"><a class="lift" href="#vertlist">vertlist</a></a><div class="clear"></div>
                <code class="signature apipage">vertlist : [snow.api.buffers.Float32Array](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="view"><a class="lift" href="#view">view</a></a><div class="clear"></div>
                <code class="signature apipage">view : [phoenix.Camera](../../api/phoenix/Camera.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="visible_count"><a class="lift" href="#visible_count">visible\_count</a></a><div class="clear"></div>
                <code class="signature apipage">visible\_count : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="layer"><a class="lift" href="#layer">layer</a></a><div class="clear"></div>
                <code class="signature apipage">layer : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="add"><a class="lift" href="#add">add</a></a><div class="clear"></div>
            <code class="signature apipage">add(\_geom:[phoenix.geometry.Geometry](../../api/phoenix/geometry/Geometry.html)<span></span>, \_force\_add:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="add_group"><a class="lift" href="#add_group">add\_group</a></a><div class="clear"></div>
            <code class="signature apipage">add\_group(\_group:[Int](http://api.haxe.org/Int.html)<span></span>, \_pre\_render:[phoenix.Batcher](../../api/phoenix/Batcher.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>, \_post\_render:[phoenix.Batcher](../../api/phoenix/Batcher.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="batch"><a class="lift" href="#batch">batch</a></a><div class="clear"></div>
            <code class="signature apipage">batch(persist\_immediate:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compare"><a class="lift" href="#compare">compare</a></a><div class="clear"></div>
            <code class="signature apipage">compare(other:[phoenix.Batcher](../../api/phoenix/Batcher.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compare_rule"><a class="lift" href="#compare_rule">compare\_rule</a></a><div class="clear"></div>
            <code class="signature apipage">compare\_rule(a:[phoenix.geometry.GeometryKey](../../api/phoenix/geometry/GeometryKey.html)<span></span>, b:[phoenix.geometry.GeometryKey](../../api/phoenix/geometry/GeometryKey.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compare_rule_to_string"><a class="lift" href="#compare_rule_to_string">compare\_rule\_to\_string</a></a><div class="clear"></div>
            <code class="signature apipage">compare\_rule\_to\_string(r:[Int](http://api.haxe.org/Int.html)<span></span>) : [String](http://api.haxe.org/String.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="draw"><a class="lift" href="#draw">draw</a></a><div class="clear"></div>
            <code class="signature apipage">draw(persist\_immediate:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="empty"><a class="lift" href="#empty">empty</a></a><div class="clear"></div>
            <code class="signature apipage">empty(\_drop:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">:todo: this is a temporary construct as part of #119</span>


</span>
<span class="method apipage">
            <a name="geometry_compare"><a class="lift" href="#geometry_compare">geometry\_compare</a></a><div class="clear"></div>
            <code class="signature apipage">geometry\_compare(a:[phoenix.geometry.GeometryKey](../../api/phoenix/geometry/GeometryKey.html)<span></span>, b:[phoenix.geometry.GeometryKey](../../api/phoenix/geometry/GeometryKey.html)<span></span>) : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_r:[phoenix.Renderer](../../api/phoenix/Renderer.html)<span></span>, \_name:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="remove"><a class="lift" href="#remove">remove</a></a><div class="clear"></div>
            <code class="signature apipage">remove(\_geom:[phoenix.geometry.Geometry](../../api/phoenix/geometry/Geometry.html)<span></span>, \_remove\_batcher\_from\_geometry:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="shader_activate"><a class="lift" href="#shader_activate">shader\_activate</a></a><div class="clear"></div>
            <code class="signature apipage">shader\_activate(\_shader:[phoenix.Shader](../../api/phoenix/Shader.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="submit_current_vertex_list"><a class="lift" href="#submit_current_vertex_list">submit\_current\_vertex\_list</a></a><div class="clear"></div>
            <code class="signature apipage">submit\_current\_vertex\_list(type:[phoenix.PrimitiveType](../../api/phoenix/PrimitiveType.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="submit_static_geometry"><a class="lift" href="#submit_static_geometry">submit\_static\_geometry</a></a><div class="clear"></div>
            <code class="signature apipage">submit\_static\_geometry(geom:[phoenix.geometry.Geometry](../../api/phoenix/geometry/Geometry.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;