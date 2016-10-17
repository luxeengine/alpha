
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.Audio,luxe.AudioEvent,luxe.AudioHandle,luxe.AudioInstance,luxe.AudioSource,luxe.AudioState,luxe.BitmapFontInfo,luxe.BytesInfo,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Cursor,luxe.Debug,luxe.DebugError,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Engine,luxe.Entity,luxe.Ev,luxe.Events,luxe.Game,luxe.GameConfig,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputEventType,luxe.InteractState,luxe.ItemInfo,luxe.JSONInfo,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelChange,luxe.ParcelEvent,luxe.ParcelList,luxe.ParcelProgress,luxe.ParcelState,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.PhysicsEvent,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.ResourceEvent,luxe.ResourceState,luxe.ResourceStats,luxe.ResourceType,luxe.Resources,luxe.Scan,luxe.Scene,luxe.Screen,luxe.ShaderInfo,luxe.SizeMode,luxe.SoundInfo,luxe.Sprite,luxe.State,luxe.States,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.TextInfo,luxe.TextureInfo,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.UserConfig,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Ev.Ev_Impl_,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._Log.LogError,luxe._NineSlice.Slice,luxe._Parcel.ParcelEvent_Impl_,luxe._Parcel.ParcelState_Impl_,luxe._Particles.ParticleEmitterInitData,luxe._Physics.PhysicsEvent_Impl_,luxe._Resources.ResourceEvent_Impl_,luxe._Resources.ResourceState_Impl_,luxe._Resources.ResourceType_Impl_,luxe.collision.Collision,luxe.collision.Results,luxe.collision.ResultsIterator,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision._Collision.Constructible,luxe.collision.data.RayCollision,luxe.collision.data.RayCollisionHelper,luxe.collision.data.RayIntersection,luxe.collision.data.ShapeCollision,luxe.collision.sat.SAT2D,luxe.collision.shapes.Circle,luxe.collision.shapes.InfiniteState,luxe.collision.shapes.Polygon,luxe.collision.shapes.Ray,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.physics.nape.BoxCollider,luxe.components.physics.nape.BoxColliderOptions,luxe.components.physics.nape.CircleCollider,luxe.components.physics.nape.CircleColliderOptions,luxe.components.physics.nape.NapeBody,luxe.components.physics.nape.NapeBodyOptions,luxe.components.physics.nape.PolygonCollider,luxe.components.physics.nape.PolygonColliderOptions,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.SceneDebugView,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerGraph,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.bitmapfont.BitmapFontData,luxe.importers.bitmapfont.BitmapFontParser,luxe.importers.bitmapfont.Character,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledImage,luxe.importers.tiled.TiledImageLayer,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.importers.tiled.TiledUtil,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.AudioResourceOptions,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.BytesResourceOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawPolygonOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.JSONResourceOptions,luxe.options.LineGeometryOptions,luxe.options.LoadAudioOptions,luxe.options.LoadFontOptions,luxe.options.LoadShaderOptions,luxe.options.LoadTextureOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.RenderTextureOptions,luxe.options.ResourceOptions,luxe.options.ShaderOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextOptions,luxe.options.TextResourceOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.physics.nape.DebugDraw,luxe.physics.nape.PhysicsNape,luxe.physics.nape._DebugDraw.CachedGeometry,luxe.resource.AudioResource,luxe.resource.BytesResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.TextResource,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTIterator,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Cache,luxe.structural.Heap,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.structural._BalancedBST.NodeColor,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisual,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisual,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisual,luxe.tilemaps.TilemapVisualLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.types.user.Game,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingBackwardIter,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf16,luxe.utils.unifill.Utf32,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf16.StringU16,luxe.utils.unifill._Utf16.StringU16Buffer,luxe.utils.unifill._Utf16.StringU16Buffer_Impl_,luxe.utils.unifill._Utf16.StringU16_Impl_,luxe.utils.unifill._Utf16.Utf16Impl,luxe.utils.unifill._Utf16.Utf16_Impl_,luxe.utils.unifill._Utf32.Utf32_Impl_,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,luxe.utils.unifill._Utf8.Utf8_Impl_,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherEventType,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.DualQuaternion,phoenix.FOVType,phoenix.FilterType,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.TextureDataType,phoenix.TextureFormat,phoenix.TextureID,phoenix.TextureSubmitTarget,phoenix.TextureType,phoenix.Transform,phoenix.Uniforms,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BatcherEventType_Impl_,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.Uniform,phoenix._Texture.ClampSlot,phoenix._Texture.ClampSlot_Impl_,phoenix._Texture.ClampType_Impl_,phoenix._Texture.FilterSlot,phoenix._Texture.FilterSlot_Impl_,phoenix._Texture.FilterType_Impl_,phoenix._Texture.TextureSubmitTarget_Impl_,phoenix._Texture.TextureType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Texture</h1>
<small>
<code><a target="_blank" href="https:/github.com/underscorediscovery/luxe/blob/master/phoenix/Texture.hx">phoenix.Texture</a></code>
</small>



<hr/>

`class`extends <code><span><a href="../../api/luxe/resource/Resource.html">luxe.resource.Resource</a></span></code>

<hr/>

&nbsp;



<h3>Members</h3> <hr/><span class="member apipage">
                <a name="border"><a class="lift" href="#border">border</a></a><div class="clear"></div>
                <code class="signature apipage">border : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Only used when submitting to the GPU, where supported.</span><br/><span class="member apipage">
                <a name="compressed"><a class="lift" href="#compressed">compressed</a></a><div class="clear"></div>
                <code class="signature apipage">compressed : [Bool](http://api.haxe.org/Bool.html)</code><br/></span>
            <span class="small_desc_flat">If true, the pixels buffer should store compressed image format data that the GPU understands.</span><br/><span class="member apipage">
                <a name="data_type"><a class="lift" href="#data_type">data\_type</a></a><div class="clear"></div>
                <code class="signature apipage">data\_type : [phoenix.TextureDataType](../../api/phoenix/TextureDataType.html)</code><br/></span>
            <span class="small_desc_flat">The GPU data type, i.e `GL.UNSIGNED_BYTE` or similar.</span><br/><span class="member apipage">
                <a name="default_clamp"><a class="lift" href="#default_clamp">default\_clamp</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">default\_clamp : [phoenix.ClampType](../../api/phoenix/ClampType.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="default_filter"><a class="lift" href="#default_filter">default\_filter</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">default\_filter : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="format"><a class="lift" href="#format">format</a></a><div class="clear"></div>
                <code class="signature apipage">format : [phoenix.TextureFormat](../../api/phoenix/TextureFormat.html)</code><br/></span>
            <span class="small_desc_flat">The GPU texture format, i.e `GL.RGBA` or similar.</span><br/><span class="member apipage">
                <a name="height"><a class="lift" href="#height">height</a></a><div class="clear"></div>
                <code class="signature apipage">height : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The height of the texture</span><br/><span class="member apipage">
                <a name="height_actual"><a class="lift" href="#height_actual">height\_actual</a></a><div class="clear"></div>
                <code class="signature apipage">height\_actual : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The height of the actual texture, used for example when the texture may be padded to POT sizes.</span><br/><span class="member apipage">
                <a name="slot"><a class="lift" href="#slot">slot</a></a><div class="clear"></div>
                <code class="signature apipage">slot : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">Which texture slot this texture would be assigned to when bound.</span><br/><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [phoenix.TextureID](../../api/phoenix/TextureID.html)</code><br/></span>
            <span class="small_desc_flat">The GPU texture ID</span><br/><span class="member apipage">
                <a name="type"><a class="lift" href="#type">type</a></a><div class="clear"></div>
                <code class="signature apipage">type : [phoenix.TextureType](../../api/phoenix/TextureType.html)</code><br/></span>
            <span class="small_desc_flat">The GPU texture type, i.e `GL.TEXTURE_2D` or similar.</span><br/><span class="member apipage">
                <a name="width"><a class="lift" href="#width">width</a></a><div class="clear"></div>
                <code class="signature apipage">width : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The width of the texture</span><br/><span class="member apipage">
                <a name="width_actual"><a class="lift" href="#width_actual">width\_actual</a></a><div class="clear"></div>
                <code class="signature apipage">width\_actual : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat">The width of the actual texture, used for example when the texture may be padded to POT sizes.</span><br/>

<h3>Properties</h3> <hr/><span class="member apipage">
                <a name="clamp_s"><a class="lift" href="#clamp_s">clamp\_s</a></a><div class="clear"></div>
                <code class="signature apipage">clamp\_s : [phoenix.ClampType](../../api/phoenix/ClampType.html)</code><br/></span>
            <span class="small_desc_flat">Sets the S (horizontal) clamp type</span><span class="member apipage">
                <a name="clamp_t"><a class="lift" href="#clamp_t">clamp\_t</a></a><div class="clear"></div>
                <code class="signature apipage">clamp\_t : [phoenix.ClampType](../../api/phoenix/ClampType.html)</code><br/></span>
            <span class="small_desc_flat">Sets the T (vertical) clamp type</span><span class="member apipage">
                <a name="filter_mag"><a class="lift" href="#filter_mag">filter\_mag</a></a><div class="clear"></div>
                <code class="signature apipage">filter\_mag : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat">Set the magnification filter type</span><span class="member apipage">
                <a name="filter_min"><a class="lift" href="#filter_min">filter\_min</a></a><div class="clear"></div>
                <code class="signature apipage">filter\_min : [phoenix.FilterType](../../api/phoenix/FilterType.html)</code><br/></span>
            <span class="small_desc_flat">Set the minification filter type</span>

<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="bind"><a class="lift" href="#bind">bind</a></a><div class="clear"></div>
            <code class="signature apipage">bind() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Bind this texture to the it's active texture slot,
            and it's texture id to the texture type. Calling this
            repeatedly is fine, as the state is tracked by
            the RenderState.</span>


</span>
<span class="method apipage">
            <a name="fetch"><a class="lift" href="#fetch">fetch</a></a><div class="clear"></div>
            <code class="signature apipage">fetch(\_into:[snow.api.buffers.Uint8Array](https://snowkit.github.io/snow/api/snow/api/buffers/Uint8Array.html)<span></span>, \_x:[Int](http://api.haxe.org/Int.html)<span></span>, \_y:[Int](http://api.haxe.org/Int.html)<span></span>, \_w:[Int](http://api.haxe.org/Int.html)<span></span>, \_h:[Int](http://api.haxe.org/Int.html)<span></span>) : [snow.api.buffers.Uint8Array](https://snowkit.github.io/snow/api/snow/api/buffers/Uint8Array.html)</code><br/><span class="small_desc_flat">Fetch the pixels from the texture id, storing them in the provided array buffer view.
            Returns image pixels in RGBA format, as unsigned byte (0-255) values only.
            This means that the view must be `w * h * 4` in length, minimum.
            By default, x and y are 0, 0, and the texture `width` and `height`
            are used (not width_actual/height_actual)</span>


</span>
<span class="method apipage">
            <a name="generate_mipmaps"><a class="lift" href="#generate_mipmaps">generate\_mipmaps</a></a><div class="clear"></div>
            <code class="signature apipage">generate\_mipmaps() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Generates mipmaps for this texture.</span>


</span>
<span class="method apipage">
            <a name="max_size"><a class="lift" href="#max_size">max\_size</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">max\_size() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Return the maximum size of a texture from the hardware</span>


</span>
<span class="method apipage">
            <a name="memory_use"><a class="lift" href="#memory_use">memory\_use</a></a><div class="clear"></div>
            <code class="signature apipage">memory\_use() : [Int](http://api.haxe.org/Int.html)</code><br/><span class="small_desc_flat">Returns the estimated memory usage of this Texture, in bytes.</span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_options:[luxe.options.TextureOptions](../../api/luxe/options/TextureOptions.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="reload"><a class="lift" href="#reload">reload</a></a><div class="clear"></div>
            <code class="signature apipage">reload() : [snow.api.Promise](https://snowkit.github.io/snow/api/snow/api/Promise.html)</code><br/><span class="small_desc_flat">Reloads this texture from it's id - only a valid call if the id is a image asset resource.</span>


</span>
<span class="method apipage">
            <a name="submit"><a class="lift" href="#submit">submit</a></a><div class="clear"></div>
            <code class="signature apipage">submit(\_pixels:[snow.api.buffers.ArrayBufferView](https://snowkit.github.io/snow/api/snow/api/buffers/ArrayBufferView.html)<span></span>, \_target:[phoenix.TextureSubmitTarget](../../api/phoenix/TextureSubmitTarget.html)<span></span>, \_level:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Submit a pixels array to the texture id. Must match the type and format accordingly.</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;