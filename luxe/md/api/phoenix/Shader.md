
[![Logo](../../images/logo.png)](../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Circle,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.ID,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.Mesh,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Parcel,luxe.ParcelProgress,luxe.Particle,luxe.ParticleEmitter,luxe.ParticleEmitterInitData,luxe.ParticleSystem,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.State,luxe.States,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe._Core.CoreThreadRequest,luxe._Core.LoadShaderInfo,luxe._Core.LoadTextureInfo,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._NineSlice.Slice,luxe._Parcel.FontInfo,luxe._Parcel.ShaderInfo,luxe._Parcel.SoundInfo,luxe.collision.Collision,luxe.collision.CollisionData,luxe.collision.ShapeDrawer,luxe.collision.ShapeDrawerLuxe,luxe.collision.shapes.Circle,luxe.collision.shapes.Polygon,luxe.collision.shapes.Shape,luxe.components.Components,luxe.components.cameras.FlyCamera,luxe.components.render.MeshComponent,luxe.components.sprite.SpriteAnimation,luxe.components.sprite.SpriteAnimationData,luxe.components.sprite.SpriteAnimationEventData,luxe.components.sprite.SpriteAnimationFrame,luxe.components.sprite.SpriteAnimationFrameEvent,luxe.components.sprite.SpriteAnimationFrameSource,luxe.components.sprite.SpriteAnimationType,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.importers.obj.Data,luxe.importers.obj.Normal,luxe.importers.obj.Reader,luxe.importers.obj.UV,luxe.importers.obj.Vector,luxe.importers.obj.Vertex,luxe.importers.texturepacker.TexturePackerData,luxe.importers.texturepacker.TexturePackerFrame,luxe.importers.texturepacker.TexturePackerJSON,luxe.importers.texturepacker.TexturePackerJSONType,luxe.importers.texturepacker.TexturePackerMeta,luxe.importers.texturepacker.TexturePackerRect,luxe.importers.texturepacker.TexturePackerSize,luxe.importers.texturepacker.TexturePackerSpriteAnimation,luxe.importers.tiled.TiledLayer,luxe.importers.tiled.TiledMap,luxe.importers.tiled.TiledMapData,luxe.importers.tiled.TiledMapOptions,luxe.importers.tiled.TiledObject,luxe.importers.tiled.TiledObjectGroup,luxe.importers.tiled.TiledObjectType,luxe.importers.tiled.TiledPolyObject,luxe.importers.tiled.TiledPropertyTile,luxe.importers.tiled.TiledTile,luxe.importers.tiled.TiledTileset,luxe.macros.BuildVersion,luxe.macros.ComponentRules,luxe.macros.EntityRules,luxe.options.BatcherOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.FontOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.MeshOptions,luxe.options.NineSliceOptions,luxe.options.ParcelOptions,luxe.options.ParcelProgressOptions,luxe.options.ParticleEmitterOptions,luxe.options.ParticleOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.ResourceOptions,luxe.options.SpriteOptions,luxe.options.StateOptions,luxe.options.StatesOptions,luxe.options.TextureOptions,luxe.options.TileLayerOptions,luxe.options.TileOptions,luxe.options.TilemapOptions,luxe.options.TilemapVisualOptions,luxe.options.TilesetOptions,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceManager,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.structural.BST,luxe.structural.BSTNode,luxe.structural.BSTTraverseMethod,luxe.structural.Bag,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.Heap,luxe.structural.Pool,luxe.structural.Stack,luxe.structural.StackNode,luxe.structural._Bag.BagNode,luxe.tilemaps.Isometric,luxe.tilemaps.IsometricVisuals,luxe.tilemaps.Ortho,luxe.tilemaps.OrthoVisuals,luxe.tilemaps.Tile,luxe.tilemaps.TileArray,luxe.tilemaps.TileLayer,luxe.tilemaps.TileOffset,luxe.tilemaps.Tilemap,luxe.tilemaps.TilemapOrientation,luxe.tilemaps.TilemapVisuals,luxe.tilemaps.TilemapVisualsLayerGeometry,luxe.tilemaps.Tileset,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.Back,luxe.tween.easing.BackEaseIn,luxe.tween.easing.BackEaseInOut,luxe.tween.easing.BackEaseOut,luxe.tween.easing.Bounce,luxe.tween.easing.BounceEaseIn,luxe.tween.easing.BounceEaseInOut,luxe.tween.easing.BounceEaseOut,luxe.tween.easing.Cubic,luxe.tween.easing.CubicEaseIn,luxe.tween.easing.CubicEaseInOut,luxe.tween.easing.CubicEaseOut,luxe.tween.easing.Elastic,luxe.tween.easing.ElasticEaseIn,luxe.tween.easing.ElasticEaseInOut,luxe.tween.easing.ElasticEaseOut,luxe.tween.easing.Expo,luxe.tween.easing.ExpoEaseIn,luxe.tween.easing.ExpoEaseInOut,luxe.tween.easing.ExpoEaseOut,luxe.tween.easing.IEasing,luxe.tween.easing.Linear,luxe.tween.easing.LinearEaseNone,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.tween.easing.Quart,luxe.tween.easing.QuartEaseIn,luxe.tween.easing.QuartEaseInOut,luxe.tween.easing.QuartEaseOut,luxe.tween.easing.Quint,luxe.tween.easing.QuintEaseIn,luxe.tween.easing.QuintEaseInOut,luxe.tween.easing.QuintEaseOut,luxe.tween.easing.Sine,luxe.tween.easing.SineEaseIn,luxe.tween.easing.SineEaseInOut,luxe.tween.easing.SineEaseOut,luxe.utils.GeometryUtils,luxe.utils.JSON,luxe.utils.Maths,luxe.utils.UUID,luxe.utils.Utils,luxe.utils._UUID.Rule30,luxe.utils.json.JSONDecoder,luxe.utils.json.JSONEncoder,luxe.utils.json.JSONParseError,luxe.utils.json.JSONToken,luxe.utils.json.JSONTokenType,luxe.utils.json.JSONTokenizer,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.DualQuaternion,phoenix.FilterType,phoenix.KerningKey,phoenix.KeyValuePair,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PageInfo,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPass,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.UniformValue,phoenix.UniformValueType,phoenix.Vec,phoenix.Vector,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.ComplexGeometry,phoenix.geometry.ComplexQuad,phoenix.geometry.CompositeGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.utils.Rendering"></script>


<h1>Shader</h1>
<small>`phoenix.Shader`</small>



<hr/>

`class`extends <code><span>luxe.resource.Resource</span></code><br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="color_attribute"><a class="lift" href="#color_attribute">color\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">color\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="errors"><a class="lift" href="#errors">errors</a></a><div class="clear"></div>
                <code class="signature apipage">errors : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="frag_shader"><a class="lift" href="#frag_shader">frag\_shader</a></a><div class="clear"></div>
                <code class="signature apipage">frag\_shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="fragment_source_name"><a class="lift" href="#fragment_source_name">fragment\_source\_name</a></a><div class="clear"></div>
                <code class="signature apipage">fragment\_source\_name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="log"><a class="lift" href="#log">log</a></a><div class="clear"></div>
                <code class="signature apipage">log : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="modelviewmatrix_attribute"><a class="lift" href="#modelviewmatrix_attribute">modelviewmatrix\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">modelviewmatrix\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="normal_attribute"><a class="lift" href="#normal_attribute">normal\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">normal\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="program"><a class="lift" href="#program">program</a></a><div class="clear"></div>
                <code class="signature apipage">program : [snow.render.opengl.GLProgram](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="projectionmatrix_attribute"><a class="lift" href="#projectionmatrix_attribute">projectionmatrix\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">projectionmatrix\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tcoord_attribute"><a class="lift" href="#tcoord_attribute">tcoord\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tcoord\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex0_attribute"><a class="lift" href="#tex0_attribute">tex0\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex0\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex1_attribute"><a class="lift" href="#tex1_attribute">tex1\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex1\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex2_attribute"><a class="lift" href="#tex2_attribute">tex2\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex2\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex3_attribute"><a class="lift" href="#tex3_attribute">tex3\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex3\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex4_attribute"><a class="lift" href="#tex4_attribute">tex4\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex4\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex5_attribute"><a class="lift" href="#tex5_attribute">tex5\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex5\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex6_attribute"><a class="lift" href="#tex6_attribute">tex6\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex6\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="tex7_attribute"><a class="lift" href="#tex7_attribute">tex7\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">tex7\_attribute : [snow.render.opengl.GLUniformLocation](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="uniforms"><a class="lift" href="#uniforms">uniforms</a></a><div class="clear"></div>
                <code class="signature apipage">uniforms : [Map](http://api.haxe.org/Map.html)&lt;[String](http://api.haxe.org/String.html), [phoenix.UniformValue](../../api/phoenix/UniformValue.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vert_attribute"><a class="lift" href="#vert_attribute">vert\_attribute</a></a><div class="clear"></div>
                <code class="signature apipage">vert\_attribute : [Int](http://api.haxe.org/Int.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vert_shader"><a class="lift" href="#vert_shader">vert\_shader</a></a><div class="clear"></div>
                <code class="signature apipage">vert\_shader : [snow.render.opengl.GLShader](#)</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="vertex_source_name"><a class="lift" href="#vertex_source_name">vertex\_source\_name</a></a><div class="clear"></div>
                <code class="signature apipage">vertex\_source\_name : [String](http://api.haxe.org/String.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="activate"><a class="lift" href="#activate">activate</a></a><div class="clear"></div>
            <code class="signature apipage">activate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="addError"><a class="lift" href="#addError">addError</a></a><div class="clear"></div>
            <code class="signature apipage">addError(\_error:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="addLog"><a class="lift" href="#addLog">addLog</a></a><div class="clear"></div>
            <code class="signature apipage">addLog(\_log:[String](http://api.haxe.org/String.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="compile"><a class="lift" href="#compile">compile</a></a><div class="clear"></div>
            <code class="signature apipage">compile(\_type:[Int](http://api.haxe.org/Int.html)<span></span>, \_source:[String](http://api.haxe.org/String.html)<span></span>, \_verbose:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [snow.render.opengl.GLShader](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="deactivate"><a class="lift" href="#deactivate">deactivate</a></a><div class="clear"></div>
            <code class="signature apipage">deactivate() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="destroy"><a class="lift" href="#destroy">destroy</a></a><div class="clear"></div>
            <code class="signature apipage">destroy() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="drop"><a class="lift" href="#drop">drop</a></a><div class="clear"></div>
            <code class="signature apipage">drop() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="from_string"><a class="lift" href="#from_string">from\_string</a></a><div class="clear"></div>
            <code class="signature apipage">from\_string(\_vertex\_source:[String](http://api.haxe.org/String.html)<span></span>, \_fragment\_source:[String](http://api.haxe.org/String.html)<span></span>, \_frag\_name:[String](http://api.haxe.org/String.html)<span>=&#x27;&#x27;</span>, \_vertex\_name:[String](http://api.haxe.org/String.html)<span>=&#x27;&#x27;</span>, \_verbose:[Bool](http://api.haxe.org/Bool.html)<span>=false</span>) : [Bool](http://api.haxe.org/Bool.html)</code><br/><span class="small_desc_flat">Loads shaders from a string, compiles, and links them</span>


</span>
<span class="method apipage">
            <a name="link"><a class="lift" href="#link">link</a></a><div class="clear"></div>
            <code class="signature apipage">link() : [snow.platform.native.render.opengl.GLProgram](#)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="load"><a class="lift" href="#load">load</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">load(\_psid:[String](http://api.haxe.org/String.html)<span></span>, \_vsid:[String](http://api.haxe.org/String.html)<span>=null</span>, \_onloaded:[phoenix.Shader](../../api/phoenix/Shader.html)&nbsp;-&gt; [Void](http://api.haxe.org/Void.html)<span>=null</span>) : [phoenix.Shader](../../api/phoenix/Shader.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="new"><a class="lift" href="#new">new</a></a><div class="clear"></div>
            <code class="signature apipage">new(\_manager:[luxe.resource.ResourceManager](../../api/luxe/resource/ResourceManager.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_uniform_color"><a class="lift" href="#set_uniform_color">set\_uniform\_color</a></a><div class="clear"></div>
            <code class="signature apipage">set\_uniform\_color(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Color](../../api/phoenix/Color.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_uniform_float"><a class="lift" href="#set_uniform_float">set\_uniform\_float</a></a><div class="clear"></div>
            <code class="signature apipage">set\_uniform\_float(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[Float](http://api.haxe.org/Float.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_uniform_int"><a class="lift" href="#set_uniform_int">set\_uniform\_int</a></a><div class="clear"></div>
            <code class="signature apipage">set\_uniform\_int(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[Int](http://api.haxe.org/Int.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_uniform_texture"><a class="lift" href="#set_uniform_texture">set\_uniform\_texture</a></a><div class="clear"></div>
            <code class="signature apipage">set\_uniform\_texture(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Texture](../../api/phoenix/Texture.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_uniform_vector2"><a class="lift" href="#set_uniform_vector2">set\_uniform\_vector2</a></a><div class="clear"></div>
            <code class="signature apipage">set\_uniform\_vector2(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_uniform_vector3"><a class="lift" href="#set_uniform_vector3">set\_uniform\_vector3</a></a><div class="clear"></div>
            <code class="signature apipage">set\_uniform\_vector3(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="set_uniform_vector4"><a class="lift" href="#set_uniform_vector4">set\_uniform\_vector4</a></a><div class="clear"></div>
            <code class="signature apipage">set\_uniform\_vector4(\_name:[String](http://api.haxe.org/String.html)<span></span>, \_value:[phoenix.Vector](../../api/phoenix/Vector.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;