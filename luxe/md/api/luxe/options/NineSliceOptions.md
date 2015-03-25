
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>NineSliceOptions</h1>
<small>`luxe.options.NineSliceOptions`</small>

Options for a Nineslice scaled entity, extending from `Sprite` allowing scaleable graphics to be drawn from a small image. See the guide for examples.

<hr/>

`typedef`<br/><span class="meta">
meta: @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="visible"><a class="lift" href="#visible">visible</a></a><div class="clear"></div>
                <code class="signature apipage">visible : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the visibility</span><br/><span class="member apipage">
                <a name="uv"><a class="lift" href="#uv">uv</a></a><div class="clear"></div>
                <code class="signature apipage">uv : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Rectangle](../../../api/luxe/Rectangle.html)&gt;</code><br/></span>
            <span class="small_desc_flat">specify the uv rectangle inside the texture, in texture space (pixels)</span><br/><span class="member apipage">
                <a name="transform"><a class="lift" href="#transform">transform</a></a><div class="clear"></div>
                <code class="signature apipage">transform : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Transform](../../../api/luxe/Transform.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, this transform will be used as the transform reference on this entity</span><br/><span class="member apipage">
                <a name="top"><a class="lift" href="#top">top</a></a><div class="clear"></div>
                <code class="signature apipage">top : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the top size of the nineslice, in the texture (pixels)</span><br/><span class="member apipage">
                <a name="texture"><a class="lift" href="#texture">texture</a></a><div class="clear"></div>
                <code class="signature apipage">texture : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Texture](../../../api/phoenix/Texture.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the texture for the geometry</span><br/><span class="member apipage">
                <a name="source_y"><a class="lift" href="#source_y">source\_y</a></a><div class="clear"></div>
                <code class="signature apipage">source\_y : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The source y position within the texture. used for atlas based nineslice images</span><br/><span class="member apipage">
                <a name="source_x"><a class="lift" href="#source_x">source\_x</a></a><div class="clear"></div>
                <code class="signature apipage">source\_x : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The source x position within the texture. used for atlas based nineslice images</span><br/><span class="member apipage">
                <a name="source_w"><a class="lift" href="#source_w">source\_w</a></a><div class="clear"></div>
                <code class="signature apipage">source\_w : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The source width, within the texture. used for atlas based nineslice images</span><br/><span class="member apipage">
                <a name="source_h"><a class="lift" href="#source_h">source\_h</a></a><div class="clear"></div>
                <code class="signature apipage">source\_h : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">The source height, within the texture. used for atlas based nineslice images</span><br/><span class="member apipage">
                <a name="size"><a class="lift" href="#size">size</a></a><div class="clear"></div>
                <code class="signature apipage">size : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Vector](../../../api/luxe/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the size of the geometry to create</span><br/><span class="member apipage">
                <a name="shader"><a class="lift" href="#shader">shader</a></a><div class="clear"></div>
                <code class="signature apipage">shader : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Shader](../../../api/phoenix/Shader.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the shader for the geometry</span><br/><span class="member apipage">
                <a name="scene"><a class="lift" href="#scene">scene</a></a><div class="clear"></div>
                <code class="signature apipage">scene : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Scene](../../../api/luxe/Scene.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, add to given scene. If not set, will add to default scene (unless no_scene)</span><br/><span class="member apipage">
                <a name="scale"><a class="lift" href="#scale">scale</a></a><div class="clear"></div>
                <code class="signature apipage">scale : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Vector](../../../api/phoenix/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform scale</span><br/><span class="member apipage">
                <a name="rotation_z"><a class="lift" href="#rotation_z">rotation\_z</a></a><div class="clear"></div>
                <code class="signature apipage">rotation\_z : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the rotation around the z access, in degrees. convenience.</span><br/><span class="member apipage">
                <a name="rotation"><a class="lift" href="#rotation">rotation</a></a><div class="clear"></div>
                <code class="signature apipage">rotation : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Quaternion](../../../api/phoenix/Quaternion.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform rotation</span><br/><span class="member apipage">
                <a name="right"><a class="lift" href="#right">right</a></a><div class="clear"></div>
                <code class="signature apipage">right : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the right size of the nineslice, in the texture (pixels)</span><br/><span class="member apipage">
                <a name="pos"><a class="lift" href="#pos">pos</a></a><div class="clear"></div>
                <code class="signature apipage">pos : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Vector](../../../api/phoenix/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform position</span><br/><span class="member apipage">
                <a name="parent"><a class="lift" href="#parent">parent</a></a><div class="clear"></div>
                <code class="signature apipage">parent : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Entity](../../../api/luxe/Entity.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, set parent to given entity</span><br/><span class="member apipage">
                <a name="origin"><a class="lift" href="#origin">origin</a></a><div class="clear"></div>
                <code class="signature apipage">origin : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Vector](../../../api/phoenix/Vector.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the transform origin</span><br/><span class="member apipage">
                <a name="no_scene"><a class="lift" href="#no_scene">no\_scene</a></a><div class="clear"></div>
                <code class="signature apipage">no\_scene : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if true, do not add to any scene</span><br/><span class="member apipage">
                <a name="no_geometry"><a class="lift" href="#no_geometry">no\_geometry</a></a><div class="clear"></div>
                <code class="signature apipage">no\_geometry : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, no geometry will be created.</span><br/><span class="member apipage">
                <a name="no_batcher_add"><a class="lift" href="#no_batcher_add">no\_batcher\_add</a></a><div class="clear"></div>
                <code class="signature apipage">no\_batcher\_add : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, the geometry will not be added to any batcher.</span><br/><span class="member apipage">
                <a name="name_unique"><a class="lift" href="#name_unique">name\_unique</a></a><div class="clear"></div>
                <code class="signature apipage">name\_unique : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">If shared names prefer a unique name, set this to true.   
            For example, `{ name:'enemy', name_unique:true }` would   
            generate a unique enemy.tp28h type of name for later filtering,   
            where the unique part would be the entity id</span><br/><span class="member apipage">
                <a name="name"><a class="lift" href="#name">name</a></a><div class="clear"></div>
                <code class="signature apipage">name : [Null](http://api.haxe.org/Null.html)&lt;[String](http://api.haxe.org/String.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the entity name. highly recommended you set this.</span><br/><span class="member apipage">
                <a name="left"><a class="lift" href="#left">left</a></a><div class="clear"></div>
                <code class="signature apipage">left : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the left size of the nineslice, in the texture (pixels)</span><br/><span class="member apipage">
                <a name="immediate"><a class="lift" href="#immediate">immediate</a></a><div class="clear"></div>
                <code class="signature apipage">immediate : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if immediate, this geometry is dropped from the batcher at the end of the frame.</span><br/><span class="member apipage">
                <a name="group"><a class="lift" href="#group">group</a></a><div class="clear"></div>
                <code class="signature apipage">group : [Null](http://api.haxe.org/Null.html)&lt;[Int](http://api.haxe.org/Int.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry group id (see guides)</span><br/><span class="member apipage">
                <a name="geometry"><a class="lift" href="#geometry">geometry</a></a><div class="clear"></div>
                <code class="signature apipage">geometry : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.geometry.Geometry](../../../api/phoenix/geometry/Geometry.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if specified, this geometry will be used instead.</span><br/><span class="member apipage">
                <a name="flipy"><a class="lift" href="#flipy">flipy</a></a><div class="clear"></div>
                <code class="signature apipage">flipy : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, the sprite will be flipped vertically</span><br/><span class="member apipage">
                <a name="flipx"><a class="lift" href="#flipx">flipx</a></a><div class="clear"></div>
                <code class="signature apipage">flipx : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, the sprite will be flipped horizontally</span><br/><span class="member apipage">
                <a name="depth"><a class="lift" href="#depth">depth</a></a><div class="clear"></div>
                <code class="signature apipage">depth : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the geometry depth value (see guides)</span><br/><span class="member apipage">
                <a name="color"><a class="lift" href="#color">color</a></a><div class="clear"></div>
                <code class="signature apipage">color : [Null](http://api.haxe.org/Null.html)&lt;[luxe.Color](../../../api/luxe/Color.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the base color for the geometry</span><br/><span class="member apipage">
                <a name="centered"><a class="lift" href="#centered">centered</a></a><div class="clear"></div>
                <code class="signature apipage">centered : [Null](http://api.haxe.org/Null.html)&lt;[Bool](http://api.haxe.org/Bool.html)&gt;</code><br/></span>
            <span class="small_desc_flat">if set, the sprite will be centered</span><br/><span class="member apipage">
                <a name="bottom"><a class="lift" href="#bottom">bottom</a></a><div class="clear"></div>
                <code class="signature apipage">bottom : [Null](http://api.haxe.org/Null.html)&lt;[Float](http://api.haxe.org/Float.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the bottom size of the nineslice, in the texture (pixels)</span><br/><span class="member apipage">
                <a name="batcher"><a class="lift" href="#batcher">batcher</a></a><div class="clear"></div>
                <code class="signature apipage">batcher : [Null](http://api.haxe.org/Null.html)&lt;[phoenix.Batcher](../../../api/phoenix/Batcher.html)&gt;</code><br/></span>
            <span class="small_desc_flat">the batcher to add the geometry to. If not specified, the default batcher is used.</span><br/>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;