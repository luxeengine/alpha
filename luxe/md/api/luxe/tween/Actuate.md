
[![Logo](../../../images/logo.png)](../../../api/index.html)

<hr/>
<a href="#" id="search_bar" onclick="return;"><div> search API <em>(or start typing anywhere)</em> </div></a>
<hr/>

<script src="../../../js/omnibar.js"> </script>
<link rel="stylesheet" type="text/css" href="../../../css/omnibar.css" media="all">

<div id="omnibar"> <a href="#" onclick="return" id="omnibar_close"></a> <input id="omnibar_text" type="text" placeholder="search types..."></input></div>
<script  id="typelist" data-relpath="../../../" data-types="Luxe,luxe.AppConfig,luxe.Audio,luxe.Camera,luxe.Color,luxe.ColorHSL,luxe.ColorHSV,luxe.Component,luxe.Core,luxe.Cursor,luxe.Debug,luxe.Draw,luxe.EmitHandler,luxe.Emitter,luxe.Entity,luxe.Events,luxe.Game,luxe.GamepadEvent,luxe.GamepadEventType,luxe.HandlerList,luxe.ID,luxe.IO,luxe.Input,luxe.InputEvent,luxe.InputType,luxe.InteractState,luxe.Key,luxe.KeyEvent,luxe.Log,luxe.Matrix,luxe.ModState,luxe.MouseButton,luxe.MouseEvent,luxe.NineSlice,luxe.Objects,luxe.Physics,luxe.PhysicsEngine,luxe.ProjectionType,luxe.Quaternion,luxe.Rectangle,luxe.Scan,luxe.Scene,luxe.Screen,luxe.SizeMode,luxe.Sound,luxe.Sprite,luxe.Tag,luxe.Text,luxe.TextAlign,luxe.TextEvent,luxe.TextEventType,luxe.Timer,luxe.TouchEvent,luxe.Transform,luxe.Vec,luxe.Vector,luxe.Visual,luxe.WindowEvent,luxe.WindowEventData,luxe.WindowEventType,luxe._Emitter.EmitNode,luxe._Events.EventConnection,luxe._Events.EventObject,luxe._Input.MouseButton_Impl_,luxe._NineSlice.Slice,luxe.components.Components,luxe.debug.BatcherDebugView,luxe.debug.DebugInspectorOptions,luxe.debug.DebugView,luxe.debug.Inspector,luxe.debug.ProfilerDebugView,luxe.debug.RenderStats,luxe.debug.StatsDebugView,luxe.debug.TraceDebugView,luxe.debug._ProfilerDebugView.ProfilerBar,luxe.debug._ProfilerDebugView.ProfilerValue,luxe.macros.BuildVersion,luxe.options.BatcherOptions,luxe.options.BitmapFontOptions,luxe.options.CameraOptions,luxe.options.CircleGeometryOptions,luxe.options.ColorOptions,luxe.options.ComponentOptions,luxe.options.DrawArcOptions,luxe.options.DrawBoxOptions,luxe.options.DrawCircleOptions,luxe.options.DrawLineOptions,luxe.options.DrawNgonOptions,luxe.options.DrawPlaneOptions,luxe.options.DrawRectangleOptions,luxe.options.DrawRingOptions,luxe.options.DrawTextureOptions,luxe.options.EntityOptions,luxe.options.GeometryOptions,luxe.options.LineGeometryOptions,luxe.options.LuxeCameraOptions,luxe.options.NineSliceOptions,luxe.options.PlaneGeometryOptions,luxe.options.QuadGeometryOptions,luxe.options.RectangleGeometryOptions,luxe.options.RenderProperties,luxe.options.SpriteOptions,luxe.options.TextOptions,luxe.options.TransformProperties,luxe.options.VisualOptions,luxe.options._DrawOptions.DrawOptions,luxe.options._FontOptions.FontOptions,luxe.resource.DataResource,luxe.resource.JSONResource,luxe.resource.Resource,luxe.resource.ResourceStats,luxe.resource.ResourceType,luxe.resource.Resources,luxe.resource.SoundResource,luxe.resource.TextResource,luxe.resource._Resource.ResourceType_Impl_,luxe.structural.BalancedBST,luxe.structural.BalancedBSTNode,luxe.structural.BalancedBSTTraverseMethod,luxe.structural.OrderedMap,luxe.structural.OrderedMapIterator,luxe.structural._BalancedBST.NodeColor,luxe.tween.Actuate,luxe.tween.BezierPath,luxe.tween.ComponentPath,luxe.tween.IComponentPath,luxe.tween.LinearPath,luxe.tween.MotionPath,luxe.tween.ObjectHash,luxe.tween.RotationPath,luxe.tween._Actuate.TweenTimer,luxe.tween.actuators.GenericActuator,luxe.tween.actuators.IGenericActuator,luxe.tween.actuators.MethodActuator,luxe.tween.actuators.MotionPathActuator,luxe.tween.actuators.PropertyDetails,luxe.tween.actuators.PropertyPathDetails,luxe.tween.actuators.SimpleActuator,luxe.tween.easing.IEasing,luxe.tween.easing.Quad,luxe.tween.easing.QuadEaseIn,luxe.tween.easing.QuadEaseInOut,luxe.tween.easing.QuadEaseOut,luxe.utils.GeometryUtils,luxe.utils.Maths,luxe.utils.Random,luxe.utils.Utils,luxe.utils.unifill.CodePoint,luxe.utils.unifill.CodePointIter,luxe.utils.unifill.Exception,luxe.utils.unifill.InternalEncoding,luxe.utils.unifill.InternalEncodingIter,luxe.utils.unifill.Unicode,luxe.utils.unifill.Unifill,luxe.utils.unifill.Utf,luxe.utils.unifill.Utf8,luxe.utils.unifill._CodePoint.CodePoint_Impl_,luxe.utils.unifill._InternalEncoding.UtfX,luxe.utils.unifill._Utf8.StringU8,luxe.utils.unifill._Utf8.StringU8_Impl_,luxe.utils.unifill._Utf8.Utf8Impl,phoenix.BatchGroup,phoenix.BatchState,phoenix.Batcher,phoenix.BatcherKey,phoenix.BitmapFont,phoenix.BlendEquation,phoenix.BlendMode,phoenix.Camera,phoenix.Character,phoenix.Circle,phoenix.ClampType,phoenix.Color,phoenix.ColorHSL,phoenix.ColorHSV,phoenix.ComponentOrder,phoenix.FOVType,phoenix.FilterType,phoenix.FontInfo,phoenix.Matrix,phoenix.MatrixTransform,phoenix.PrimitiveType,phoenix.ProjectionType,phoenix.Quaternion,phoenix.Ray,phoenix.Rectangle,phoenix.RenderPath,phoenix.RenderState,phoenix.RenderTexture,phoenix.Renderer,phoenix.RendererStats,phoenix.Shader,phoenix.Spatial,phoenix.TextAlign,phoenix.Texture,phoenix.Transform,phoenix.Uniform,phoenix.UniformType,phoenix.Vec,phoenix.Vector,phoenix._Batcher.BlendEquation_Impl_,phoenix._Batcher.BlendMode_Impl_,phoenix._Batcher.PrimitiveType_Impl_,phoenix._BitmapFont.Parser,phoenix._BitmapFont.TextAlign_Impl_,phoenix._Renderer.DefaultShader,phoenix._Renderer.DefaultShaders,phoenix._Shader.Location,phoenix._Shader.UniformType_Impl_,phoenix._Vector.ComponentOrder_Impl_,phoenix._Vector.Vec_Impl_,phoenix.geometry.ArcGeometry,phoenix.geometry.CircleGeometry,phoenix.geometry.CompositeGeometry,phoenix.geometry.EvTextGeometry,phoenix.geometry.Geometry,phoenix.geometry.GeometryKey,phoenix.geometry.GeometryState,phoenix.geometry.LineGeometry,phoenix.geometry.PackedQuad,phoenix.geometry.PackedQuadOptions,phoenix.geometry.PlaneGeometry,phoenix.geometry.QuadGeometry,phoenix.geometry.QuadPackGeometry,phoenix.geometry.RectangleGeometry,phoenix.geometry.RingGeometry,phoenix.geometry.TextGeometry,phoenix.geometry.TextGeometryOptions,phoenix.geometry.TextureCoord,phoenix.geometry.TextureCoordSet,phoenix.geometry.Vertex,phoenix.geometry._TextGeometry.EvTextGeometry_Impl_,phoenix.utils.Rendering"></script>


<h1>Actuate</h1>
<small>`luxe.tween.Actuate`</small>



<hr/>

`class`<br/><span class="meta">
meta: @:directlyUsed, @:keep</span>

<hr/>


&nbsp;
&nbsp;




<h3>Members</h3> <hr/><span class="member apipage">
                <a name="defaultActuator"><a class="lift" href="#defaultActuator">defaultActuator</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">defaultActuator : [Class](#)&lt;[luxe.tween.actuators.GenericActuator](../../../api/luxe/tween/actuators/GenericActuator.html)&gt;</code><br/></span>
            <span class="small_desc_flat"></span><br/><span class="member apipage">
                <a name="defaultEase"><a class="lift" href="#defaultEase">defaultEase</a></a><span class="inline-block static">static</span><div class="clear"></div>
                <code class="signature apipage">defaultEase : [luxe.tween.easing.IEasing](../../../api/luxe/tween/easing/IEasing.html)</code><br/></span>
            <span class="small_desc_flat"></span><br/>


<h3>Methods</h3> <hr/><span class="method apipage">
            <a name="apply"><a class="lift" href="#apply">apply</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">apply(target:[Dynamic](#)<span></span>, properties:[Dynamic](#)<span></span>, customActuator:[Class](#)&lt;[luxe.tween.actuators.GenericActuator](../../../api/luxe/tween/actuators/GenericActuator.html)&gt;<span></span>) : [luxe.tween.actuators.IGenericActuator](../../../api/luxe/tween/actuators/IGenericActuator.html)</code><br/><span class="small_desc_flat">Copies properties from one object to another. Conflicting tweens are stopped automatically   
      @example     <code>Actuate.apply (MyClip, { alpha: 1 } );</code>   
      @param   target      The object to copy to   
      @param   properties      The object to copy from   
      @param   customActuator      A custom actuator to use instead of the default (Optional)   
      @return      The current actuator instance, which can be used to apply properties like onComplete or onUpdate handlers</span>


</span>
<span class="method apipage">
            <a name="motionPath"><a class="lift" href="#motionPath">motionPath</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">motionPath(target:[Dynamic](#)<span></span>, duration:[Float](http://api.haxe.org/Float.html)<span></span>, properties:[Dynamic](#)<span></span>, overwrite:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [luxe.tween.actuators.IGenericActuator](../../../api/luxe/tween/actuators/IGenericActuator.html)</code><br/><span class="small_desc_flat">Creates a new MotionPath tween   
      @param   target      The object to tween   
      @param   duration        The length of the tween in seconds   
      @param   properties      An object containing a motion path for each property you wish to tween   
      @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)   
      @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate</span>


</span>
<span class="method apipage">
            <a name="pause"><a class="lift" href="#pause">pause</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">pause(target:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Pauses tweens for the specified target objects   
      @param   ... targets     The target objects which will have their tweens paused. Passing no value pauses tweens for all objects</span>


</span>
<span class="method apipage">
            <a name="pauseAll"><a class="lift" href="#pauseAll">pauseAll</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">pauseAll() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="reset"><a class="lift" href="#reset">reset</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">reset() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Resets Actuate by stopping and removing tweens for all objects</span>


</span>
<span class="method apipage">
            <a name="resume"><a class="lift" href="#resume">resume</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">resume(target:[Dynamic](#)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Resumes paused tweens for the specified target objects   
      @param   ... targets     The target objects which will have their tweens resumed. Passing no value resumes tweens for all objects</span>


</span>
<span class="method apipage">
            <a name="resumeAll"><a class="lift" href="#resumeAll">resumeAll</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">resumeAll() : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="stop"><a class="lift" href="#stop">stop</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">stop(target:[Dynamic](#)<span></span>, properties:[Dynamic](#)<span></span>, complete:[Bool](http://api.haxe.org/Bool.html)<span></span>, sendEvent:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat">Stops all tweens for an individual object   
      @param   target      The target object which will have its tweens stopped, or a generic actuator instance   
      @param   properties      A string, array or object which contains the properties you wish to stop, like "alpha", [ "x", "y" ] or { alpha: null }. Passing no value removes all tweens for the object (Optional)   
      @param   complete        If tweens should apply their final target values before stopping. Default is false (Optional)   
      @param   sendEvent   If a complete() event should be dispatched for the specified target. Default is true (Optional)</span>


</span>
<span class="method apipage">
            <a name="timer"><a class="lift" href="#timer">timer</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">timer(duration:[Float](http://api.haxe.org/Float.html)<span></span>, customActuator:[Class](#)&lt;[luxe.tween.actuators.GenericActuator](../../../api/luxe/tween/actuators/GenericActuator.html)&gt;<span></span>) : [luxe.tween.actuators.IGenericActuator](../../../api/luxe/tween/actuators/IGenericActuator.html)</code><br/><span class="small_desc_flat">Creates a tween-based timer, which is useful for synchronizing function calls with other animations   
      @example     <code>Actuate.timer (1).onComplete (trace, [ "Timer is now complete" ]);</code>   
      @param   duration        The length of the timer in seconds   
      @param   customActuator      A custom actuator to use instead of the default (Optional)   
      @return      The current actuator instance, which can be used to apply properties like onComplete or to gain a reference to the target timer object</span>


</span>
<span class="method apipage">
            <a name="tween"><a class="lift" href="#tween">tween</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">tween(target:[Dynamic](#)<span></span>, duration:[Float](http://api.haxe.org/Float.html)<span></span>, properties:[Dynamic](#)<span></span>, overwrite:[Bool](http://api.haxe.org/Bool.html)<span></span>, customActuator:[Class](#)&lt;[luxe.tween.actuators.GenericActuator](../../../api/luxe/tween/actuators/GenericActuator.html)&gt;<span></span>) : [luxe.tween.actuators.IGenericActuator](../../../api/luxe/tween/actuators/IGenericActuator.html)</code><br/><span class="small_desc_flat">Creates a new tween   
      @example     <code>Actuate.tween (MyClip, 1, { alpha: 1 } ).onComplete (trace, [ "MyClip is now visible" ]);</code>   
      @param   target      The object to tween   
      @param   duration        The length of the tween in seconds   
      @param   properties      The end values to tween the target to   
      @param   overwrite           Sets whether previous tweens for the same target and properties will be overwritten (Default is true)   
      @param   customActuator      A custom actuator to use instead of the default (Optional)   
      @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate</span>


</span>
<span class="method apipage">
            <a name="unload"><a class="lift" href="#unload">unload</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">unload(actuator:[luxe.tween.actuators.GenericActuator](../../../api/luxe/tween/actuators/GenericActuator.html)<span></span>) : [Void](http://api.haxe.org/Void.html)</code><br/><span class="small_desc_flat"></span>


</span>
<span class="method apipage">
            <a name="update"><a class="lift" href="#update">update</a></a><span class="inline-block static">static</span><div class="clear"></div>
            <code class="signature apipage">update(target:[Dynamic](#)<span></span>, duration:[Float](http://api.haxe.org/Float.html)<span></span>, start:[Array](http://api.haxe.org/Array.html)&lt;[](#)&gt;<span></span>, end:[Array](http://api.haxe.org/Array.html)&lt;[](#)&gt;<span></span>, overwrite:[Bool](http://api.haxe.org/Bool.html)<span></span>) : [luxe.tween.actuators.IGenericActuator](../../../api/luxe/tween/actuators/IGenericActuator.html)</code><br/><span class="small_desc_flat">Creates a new tween that updates a method rather than setting the properties of an object   
      @example     <code>Actuate.update (trace, 1, ["Value: ", 0], ["", 1]).onComplete (trace, [ "Finished tracing values between 0 and 1" ]);</code>   
      @param   target      The method to update   
      @param   duration        The length of the tween in seconds   
      @param   start       The starting parameters of the method call. You may use both numeric and non-numeric values   
      @param   end     The ending parameters of the method call. You may use both numeric and non-numeric values, but the signature should match the start parameters   
      @param   overwrite       Sets whether previous tweens for the same target and properties will be overwritten (Default is true)   
      @return      The current actuator instance, which can be used to apply properties like ease, delay, onComplete or onUpdate</span>


</span>



<hr/>

&nbsp;
&nbsp;
&nbsp;
&nbsp;