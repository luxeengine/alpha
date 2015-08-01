
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.BitmapFontInfo,luxe.BytesInfo,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.ItemInfo,luxe.JSONInfo,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelChange,luxe.ParcelEvent,luxe.ParcelList,luxe.ParcelProgress,luxe.ParcelState,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.ResourceEvent,luxe.ResourceState,luxe.ResourceStats,luxe.ResourceType,luxe.Resources,luxe.Scan,luxe.Scene,luxe.Screen,luxe.ShaderInfo,luxe.SizeMode,luxe.Sound,luxe.SoundInfo,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.TextInfo,luxe.TextureInfo,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.ParcelEvent_Impl_,luxe._Parcel.ParcelState_Impl_,luxe._Particles.ParticleEmitterInitData,luxe._Resources.ResourceEvent_Impl_,luxe._Resources.ResourceState_Impl_,luxe._Resources.ResourceType_Impl_,luxe.collision.Collision,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.Common,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.SceneDebugView,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerGraph,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.bitmapfont.BitmapFontData,luxe.importers.bitmapfont.BitmapFontParser,luxe.importers.bitmapfont.Character,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.BytesResourceOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.JSONResourceOptions,luxe.options.LineGeometryOptions,luxe.options.LoadFontOptions,luxe.options.LoadShaderOptions,luxe.options.LoadTextureOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.RenderTextureOptions,luxe.options.ResourceOptions,luxe.options.ShaderOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextResourceOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.resource.BytesResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.TextResource,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill.UtfIter,luxe.utils.unifill.UtfTools,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.TextureDataType,phoenix.TextureFormat,phoenix.TextureID,phoenix.TextureSubmitTarget,phoenix.TextureType,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Texture.ClampSlot,phoenix._Texture.ClampSlot_Impl_,phoenix._Texture.ClampType_Impl_,phoenix._Texture.FilterSlot,phoenix._Texture.FilterSlot_Impl_,phoenix._Texture.FilterType_Impl_,phoenix._Texture.TextureSubmitTarget_Impl_,phoenix._Texture.TextureType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Matrix</h1>
<small>`luxe.Matrix`</small>



<hr/>

`typedef`&nbsp;alias of `phoenix.Matrix`   

<hr/>


&nbsp;
&nbsp;





<h3>Members</h3> <hr/><span class="member apipage">
                <a name="elements"><a class="lift" href="#elements">elements</a></a><div class="clear"></div>
                <code class="signature apipage">elements : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="M11"><a class="lift" href="#M11">M11</a></a><div class="clear"></div>
                <code class="signature apipage">M11 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M12"><a class="lift" href="#M12">M12</a></a><div class="clear"></div>
                <code class="signature apipage">M12 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M13"><a class="lift" href="#M13">M13</a></a><div class="clear"></div>
                <code class="signature apipage">M13 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M14"><a class="lift" href="#M14">M14</a></a><div class="clear"></div>
                <code class="signature apipage">M14 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M21"><a class="lift" href="#M21">M21</a></a><div class="clear"></div>
                <code class="signature apipage">M21 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M22"><a class="lift" href="#M22">M22</a></a><div class="clear"></div>
                <code class="signature apipage">M22 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M23"><a class="lift" href="#M23">M23</a></a><div class="clear"></div>
                <code class="signature apipage">M23 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M24"><a class="lift" href="#M24">M24</a></a><div class="clear"></div>
                <code class="signature apipage">M24 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M31"><a class="lift" href="#M31">M31</a></a><div class="clear"></div>
                <code class="signature apipage">M31 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M32"><a class="lift" href="#M32">M32</a></a><div class="clear"></div>
                <code class="signature apipage">M32 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M33"><a class="lift" href="#M33">M33</a></a><div class="clear"></div>
                <code class="signature apipage">M33 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M34"><a class="lift" href="#M34">M34</a></a><div class="clear"></div>
                <code class="signature apipage">M34 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M41"><a class="lift" href="#M41">M41</a></a><div class="clear"></div>
                <code class="signature apipage">M41 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M42"><a class="lift" href="#M42">M42</a></a><div class="clear"></div>
                <code class="signature apipage">M42 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M43"><a class="lift" href="#M43">M43</a></a><div class="clear"></div>
                <code class="signature apipage">M43 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span><span class="member apipage">
                <a name="M44"><a class="lift" href="#M44">M44</a></a><div class="clear"></div>
                <code class="signature apipage">M44 : [Float](http://api.haxe.org/Float.html)</code><br/></span>
            <span class="small_desc_flat"></span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="backward"><a class="lift" href="#backward">backward</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">backward() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="clone"><a class="lift" href="#clone">clone</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">clone() : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compose"><a class="lift" href="#compose">compose</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">compose(\_position:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_quaternion:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_scale:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compose_with_origin"><a class="lift" href="#compose_with_origin">compose\_with\_origin</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">compose\_with\_origin(\_position:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_origin:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_quaternion:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_scale:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="copy"><a class="lift" href="#copy">copy</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">copy(m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="copyPosition"><a class="lift" href="#copyPosition">copyPosition</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">copyPosition(m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="decompose"><a class="lift" href="#decompose">decompose</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">decompose(\_position:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_quaternion:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>, \_scale:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.MatrixTransform](../../api/phoenix/MatrixTransform.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="determinant"><a class="lift" href="#determinant">determinant</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">determinant() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="down"><a class="lift" href="#down">down</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">down() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="extractRotation"><a class="lift" href="#extractRotation">extractRotation</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">extractRotation(m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="flattenToArray"><a class="lift" href="#flattenToArray">flattenToArray</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">flattenToArray(\_flat:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="flattenToArrayOffset"><a class="lift" href="#flattenToArrayOffset">flattenToArrayOffset</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">flattenToArrayOffset(\_flat:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>, \_offset:[Int](http://api.haxe.org/Int.html)<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="float32array"><a class="lift" href="#float32array">float32array</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">float32array() : [snow.api.buffers.Float32Array](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="forward"><a class="lift" href="#forward">forward</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">forward() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="fromArray"><a class="lift" href="#fromArray">fromArray</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">fromArray(\_from:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getInverse"><a class="lift" href="#getInverse">getInverse</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">getInverse(\_m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getMaxScaleOnAxis"><a class="lift" href="#getMaxScaleOnAxis">getMaxScaleOnAxis</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">getMaxScaleOnAxis() : [Float](http://api.haxe.org/Float.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="getPosition"><a class="lift" href="#getPosition">getPosition</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">getPosition() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="identity"><a class="lift" href="#identity">identity</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">identity() : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="inverse"><a class="lift" href="#inverse">inverse</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">inverse() : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="left"><a class="lift" href="#left">left</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">left() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="lookAt"><a class="lift" href="#lookAt">lookAt</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">lookAt(\_eye:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_target:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_up:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="make2D"><a class="lift" href="#make2D">make2D</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">make2D(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_scale:[Float](http://api.haxe.org/Float.html)<span></span>, \_rotation:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeFrustum"><a class="lift" href="#makeFrustum">makeFrustum</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeFrustum(\_left:[Float](http://api.haxe.org/Float.html)<span></span>, \_right:[Float](http://api.haxe.org/Float.html)<span></span>, \_bottom:[Float](http://api.haxe.org/Float.html)<span></span>, \_top:[Float](http://api.haxe.org/Float.html)<span></span>, \_near:[Float](http://api.haxe.org/Float.html)<span></span>, \_far:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeOrthographic"><a class="lift" href="#makeOrthographic">makeOrthographic</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeOrthographic(\_left:[Float](http://api.haxe.org/Float.html)<span></span>, \_right:[Float](http://api.haxe.org/Float.html)<span></span>, \_top:[Float](http://api.haxe.org/Float.html)<span></span>, \_bottom:[Float](http://api.haxe.org/Float.html)<span></span>, \_near:[Float](http://api.haxe.org/Float.html)<span></span>, \_far:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makePerspective"><a class="lift" href="#makePerspective">makePerspective</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makePerspective(\_fov:[Float](http://api.haxe.org/Float.html)<span></span>, \_aspect:[Float](http://api.haxe.org/Float.html)<span></span>, \_near:[Float](http://api.haxe.org/Float.html)<span></span>, \_far:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeRotationAxis"><a class="lift" href="#makeRotationAxis">makeRotationAxis</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeRotationAxis(\_axis:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_angle:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeRotationFromEuler"><a class="lift" href="#makeRotationFromEuler">makeRotationFromEuler</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeRotationFromEuler(\_v:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>, \_order:[phoenix.ComponentOrder](../../api/phoenix/ComponentOrder.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeRotationFromQuaternion"><a class="lift" href="#makeRotationFromQuaternion">makeRotationFromQuaternion</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeRotationFromQuaternion(q:[phoenix.Quaternion](../../api/phoenix/Quaternion.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeRotationX"><a class="lift" href="#makeRotationX">makeRotationX</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeRotationX(\_theta:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeRotationY"><a class="lift" href="#makeRotationY">makeRotationY</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeRotationY(\_theta:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeRotationZ"><a class="lift" href="#makeRotationZ">makeRotationZ</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeRotationZ(\_theta:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeScale"><a class="lift" href="#makeScale">makeScale</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeScale(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="makeTranslation"><a class="lift" href="#makeTranslation">makeTranslation</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">makeTranslation(\_x:[Float](http://api.haxe.org/Float.html)<span></span>, \_y:[Float](http://api.haxe.org/Float.html)<span></span>, \_z:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiply"><a class="lift" href="#multiply">multiply</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiply(\_m:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiplyMatrices"><a class="lift" href="#multiplyMatrices">multiplyMatrices</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiplyMatrices(\_a:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>, \_b:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiplyScalar"><a class="lift" href="#multiplyScalar">multiplyScalar</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiplyScalar(\_s:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiplyToArray"><a class="lift" href="#multiplyToArray">multiplyToArray</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiplyToArray(\_a:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>, \_b:[phoenix.Matrix](../../api/phoenix/Matrix.html)<span></span>, \_r:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="multiplyVector3Array"><a class="lift" href="#multiplyVector3Array">multiplyVector3Array</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">multiplyVector3Array(\_a:[Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;<span></span>) : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">new(n11:[Float](http://api.haxe.org/Float.html)<span></span>, n12:[Float](http://api.haxe.org/Float.html)<span></span>, n13:[Float](http://api.haxe.org/Float.html)<span></span>, n14:[Float](http://api.haxe.org/Float.html)<span></span>, n21:[Float](http://api.haxe.org/Float.html)<span></span>, n22:[Float](http://api.haxe.org/Float.html)<span></span>, n23:[Float](http://api.haxe.org/Float.html)<span></span>, n24:[Float](http://api.haxe.org/Float.html)<span></span>, n31:[Float](http://api.haxe.org/Float.html)<span></span>, n32:[Float](http://api.haxe.org/Float.html)<span></span>, n33:[Float](http://api.haxe.org/Float.html)<span></span>, n34:[Float](http://api.haxe.org/Float.html)<span></span>, n41:[Float](http://api.haxe.org/Float.html)<span></span>, n42:[Float](http://api.haxe.org/Float.html)<span></span>, n43:[Float](http://api.haxe.org/Float.html)<span></span>, n44:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="right"><a class="lift" href="#right">right</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">right() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="scale"><a class="lift" href="#scale">scale</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">scale(\_v:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set"><a class="lift" href="#set">set</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">set(n11:[Float](http://api.haxe.org/Float.html)<span></span>, n12:[Float](http://api.haxe.org/Float.html)<span></span>, n13:[Float](http://api.haxe.org/Float.html)<span></span>, n14:[Float](http://api.haxe.org/Float.html)<span></span>, n21:[Float](http://api.haxe.org/Float.html)<span></span>, n22:[Float](http://api.haxe.org/Float.html)<span></span>, n23:[Float](http://api.haxe.org/Float.html)<span></span>, n24:[Float](http://api.haxe.org/Float.html)<span></span>, n31:[Float](http://api.haxe.org/Float.html)<span></span>, n32:[Float](http://api.haxe.org/Float.html)<span></span>, n33:[Float](http://api.haxe.org/Float.html)<span></span>, n34:[Float](http://api.haxe.org/Float.html)<span></span>, n41:[Float](http://api.haxe.org/Float.html)<span></span>, n42:[Float](http://api.haxe.org/Float.html)<span></span>, n43:[Float](http://api.haxe.org/Float.html)<span></span>, n44:[Float](http://api.haxe.org/Float.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="setPosition"><a class="lift" href="#setPosition">setPosition</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">setPosition(\_v:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="toArray"><a class="lift" href="#toArray">toArray</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">toArray() : [Array](http://api.haxe.org/Array.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="transpose"><a class="lift" href="#transpose">transpose</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">transpose() : [phoenix.Matrix](../../api/phoenix/Matrix.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="up"><a class="lift" href="#up">up</a></a><span class="inline-block static">inline</span><div class="clear"></div>
            <code class="signature apipage">up() : [phoenix.Vector](../../api/phoenix/Vector.html)</code><br/><span class="small_desc_flat"></span>


</span>






<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;