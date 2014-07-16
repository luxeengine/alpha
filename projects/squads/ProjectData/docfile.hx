
//luxe class : luxe.Objects

	 … var name : String;
	 … var id : String;

//luxe class : luxe.Component

	 • function serialize_to_disk(_destination_path:String) : Void;
	 • function get_serialize_data() : null;
	 • function get(_name:String, ?in_children:Bool, ?first_only:Bool) : null;
	 • function add(type:Class, ?_name:String, ?_data:add.T2) : add.T1;
	 … var scaleRelative : luxe.Vector (read/write);
	 … var scale : luxe.Vector (read/write);
	 … var rotationRelative : luxe.Vector (read/write);
	 … var rotation : luxe.Vector (read/write);
	 … var posRelative : luxe.Vector (read/write);
	 … var pos : luxe.Vector (read/write);
	 … var entity : luxe.Entity;
	 • function new(?_init_data:new.T) ;

//luxe class : luxe.State

	 • function do_disable(?_data:do_disable.T) : Void;
	 • function do_enable(?_data:do_enable.T) : Void;
	 … var next_tick : Dynamic (write only);
	 … var active : Bool;
	 … var machine : luxe.States;
	 • function new(?_init_data:new.T) ;

//luxe class : luxe.Audio

	 • function pan(_name:String, _p:Float) : Void;
	 • function volume(_name:String, _v:Float) : Void;
	 • function play(_name:String) : Void;
	 • function create(_name:String, _file:String, ?_forcemusic:Bool) : Void;

//luxe class : luxe.Entity

	 • function serialize_to_disk(_destination_path:String, ?_parent_write:Bool) : Void;
	 • function get_serialize_data() : null;
	 • function remove_child(child:luxe.Entity) : Void;
	 • function add_child(child:luxe.Entity) : Void;
	 • function has(_name:String) : Bool;
	 • function get(_name:String, ?_in_children:Bool, ?_first_only:Bool) : null;
	 • function add(type:Class, ?_name:String, ?_data:add.T2) : add.T1;
	 … var serialize : Bool;
	 … var scene : luxe.Scene (read/write);
	 … var scaleRelative : luxe.Vector (read/write);
	 … var scale : luxe.Vector (read/write);
	 … var rotationRelative : luxe.Vector (read/write);
	 … var rotation : luxe.Vector (read/write);
	 … var posRelative : luxe.Vector (read/write);
	 … var pos : luxe.Vector (read/write);
	 … var parent : luxe.Entity (read/write);
	 … var started : Bool;
	 … var inited : Bool;
	 … var fixed_rate : Float (read/write);
	 … var children : Array;
	 … var events : luxe.Events;
	 … var components : Map (read only);
	 • function new() ;

//luxe class : luxe.Camera

	 • function get_serialize_data() : null;
	 • function shake(amount:Float) : Void;
	 • function center(_p:luxe.Vector, ?_t:Float, ?oncomplete:Void) : Void;
	 … var shaking : Bool;
	 … var shake_amount : Float;
	 … var shake_vector : luxe.Vector;
	 … var bounds : luxe.Rectangle;
	 … var view : phoenix.Camera;
	 • function new(?options:Dynamic) ;

//luxe class : luxe.Draw

	 • function axis3D(?options:Dynamic) : Void;
	 • function plane(options:Dynamic) : phoenix.geometry.PlaneGeometry;
	 • function circle(options:Dynamic) : phoenix.geometry.CircleGeometry;
	 • function arc(options:Dynamic) : phoenix.geometry.ArcGeometry;
	 • function ring(options:Dynamic) : phoenix.geometry.RingGeometry;
	 • function text(options:Dynamic) : null;
	 • function rectangle(options:Dynamic) : phoenix.geometry.RectangleGeometry;
	 • function box(options:Dynamic) : phoenix.geometry.QuadGeometry;
	 • function line(options:Dynamic) : phoenix.geometry.LineGeometry;

//luxe class : luxe.Events

	 • function unschedule(schedule_id:String) : Bool;
	 • function schedule(time:Float, event_name:String, ?properties:schedule.T) : String;
	 • function fire(_event_name:String, ?_properties:fire.T) : Bool;
	 • function process() : Void;
	 • function dequeue(event_id:String) : Bool;
	 • function queue(event_name:String, ?properties:queue.T) : String;
	 • function disconnect(event_id:String) : Bool;
	 • function listen(_event_name:String, _listener:listen.T->Void) : String;
	 • function does_filter_event(_filter:String, _event:String) : Bool;
	 • function clear() : Void;
	 • function destroy() : Void;
	 • function new() ;

//luxe class : luxe.Input

	 … var Keys : lime.helpers.Keys;
	 … var Gamepad : lime.helpers.Gamepad;
	 • function add(_name:String, _event:Dynamic) : Void;

//luxe class : luxe.Sprite

	 • function get_serialize_data() : null;
	 • function point_inside(_p:phoenix.Vector) : Bool;
	 • function destroy(?_ignore_internal_destroy:Bool) : Void;
	 … var flipx : Bool (read/write);
	 … var flipy : Bool (read/write);
	 … var clip_rect : luxe.Rectangle (read/write);
	 … var clip : Bool (read/write);
	 … var uv : luxe.Rectangle (read/write);
	 … var origin : phoenix.Vector (read/write);
	 … var centered : Bool (read/write);
	 … var depth : Float (read/write);
	 … var radians : Float (read/write);
	 … var rotation_z : Float (read/write);
	 … var visible : Bool (read/write);
	 … var color : phoenix.Color (read/write);
	 … var size : phoenix.Vector (read/write);
	 … var shader : phoenix.Shader (read/write);
	 … var texture : phoenix.Texture (read/write);
	 … var locked : Bool (read/write);
	 … var geometry : phoenix.geometry.QuadGeometry;
	 • function new(options:luxe.SpriteOptions) ;

//luxe class : luxe.NineSlice

	 • function create(_pos:luxe.Vector, _w:Float, _h:Float, ?_reset:Bool) : Void;
	 • function destroy(?_ignore_internal_destroy:Bool) : Void;
	 • function dirty() : Void;
	 • function lock() : Void;
	 … var is_set : Bool;
	 … var source_h : Float;
	 … var source_w : Float;
	 … var source_y : Float;
	 … var source_x : Float;
	 … var height : Float;
	 … var bottom : Float;
	 … var width : Float;
	 … var right : Float;
	 … var left : Float;
	 … var top : Float;
	 • function new(_options:Dynamic) ;

//luxe class : luxe.Scene

	 • function serialize_to_disk(_destination_path:String) : Void;
	 • function fixed_update() : Void;
	 • function update(dt:Float) : Void;
	 • function start() : Void;
	 • function init() : Void;
	 • function destroy() : Void;
	 • function onmousemove(e:luxe.MouseEvent) : Void;
	 • function onmouseup(e:luxe.MouseEvent) : Void;
	 • function onmousedown(e:luxe.MouseEvent) : Void;
	 • function oninputup(_name:String, e:Dynamic) : Void;
	 • function oninputdown(_name:String, e:Dynamic) : Void;
	 • function empty() : Void;
	 • function remove(entity:luxe.Entity) : Void;
	 • function add(entity:luxe.Entity) : Void;
	 • function create(type:Class, ?_name:String) : create.T;
	 … var started : Bool;
	 … var inited : Bool;
	 … var entities : Map;
	 … var id : String;
	 … var name : String;
	 • function new() ;

//luxe class : luxe.States

	 • function ontouchdown(e:luxe.TouchEvent) : Void;
	 • function ontouchup(e:luxe.TouchEvent) : Void;
	 • function ontouchmove(e:luxe.TouchEvent) : Void;
	 • function onmousemove(e:luxe.MouseEvent) : Void;
	 • function onmouseup(e:luxe.MouseEvent) : Void;
	 • function onmousedown(e:luxe.MouseEvent) : Void;
	 • function oninputdown(name:String, e:Dynamic) : Void;
	 • function oninputup(name:String, e:Dynamic) : Void;
	 • function onkeyup(e:luxe.KeyEvent) : Void;
	 • function onkeydown(e:luxe.KeyEvent) : Void;
	 • function destroy() : Void;
	 • function update(dt:Float) : Void;
	 • function start() : Void;
	 • function init() : Void;
	 • function set(name:String, ?_enter_data:set.T1, ?_leave_data:set.T2) : Void;
	 • function disable(_name:String, ?_data:disable.T) : Void;
	 • function enable(_name:String, ?_data:enable.T) : Void;
	 • function add_state(type:Class, ?_name:String, ?_data:add_state.T2) : add_state.T1;
	 … var current_state : luxe.State;
	 … var active_states : Array;
	 • function new() ;

//luxe class : luxe.Text

	 • function destroy() : Void;
	 … var text_options : Dynamic;
	 … var ready : Bool;
	 … var locked : Bool (read/write);
	 … var visible : Bool (read/write);
	 … var color : luxe.Color (read/write);
	 … var size : Float (read/write);
	 … var pos : luxe.Vector (read/write);
	 … var text : String (read/write);
	 … var geometry : phoenix.geometry.CompositeGeometry;
	 … var font : phoenix.BitmapFont;
	 • function new(_options:Dynamic) ;

//luxe class : luxe.Timer

	 • function schedule(_time_in_seconds:Float, _on_time:Void, ?repeat:Bool) : haxe.Timer;

//luxe class : luxe.components.sprite.SpriteAnimationData

	 • function from_json(_animdata:Dynamic) : luxe.components.sprite.SpriteAnimationData;
	 • function get_serialize_data() : null;
	 … var frame_count : Int (read only);
	 … var reverse : Bool;
	 … var pingpong : Bool;
	 … var loop : Bool;
	 … var frame_time : Float;
	 … var frame_size : luxe.Vector;
	 … var frameset : Array;
	 … var name : String;
	 • function new(?_name:String) ;

//luxe class : luxe.components.sprite.SpriteAnimation

	 • function get_serialize_data() : null;
	 • function set_frame(_frame:Int) : Void;
	 • function stop() : Void;
	 • function play() : Void;
	 • function restart() : Void;
	 • function add_from_json(_json_string:String) : Void;
	 • function init() : Void;
	 … var playing : Bool;
	 … var reverse : Bool;
	 … var pingpong : Bool;
	 … var loop : Bool;
	 … var frame_time : Float;
	 … var image_frame : Int;
	 … var frame : Int;
	 … var animation : String (read/write);
	 … var current : luxe.components.sprite.SpriteAnimationData;
	 … var animation_list : Map;
	 • function new(?_init_data:new.T) ;

//luxe class : luxe.debug.DebugView

	 • function hide() : Void;
	 • function show() : Void;
	 • function create() : Void;
	 • function onkeyup(e:luxe.KeyEvent) : Void;
	 • function onkeydown(e:luxe.KeyEvent) : Void;
	 • function onmousemove(e:luxe.MouseEvent) : Void;
	 • function onmouseup(e:luxe.MouseEvent) : Void;
	 • function onmousedown(e:luxe.MouseEvent) : Void;
	 • function process() : Void;
	 • function refresh() : Void;

//luxe class : luxe.debug.ProfilerDebugView

	 … var lists : Map;
	 • static function start(_id:String) : Void;
	 • static function end(_id:String) : Void;
	 • function hide() : Void;
	 • function show() : Void;
	 … var core : luxe.debug._ProfilerDebugView.ProfilerValue;
	 • function new() ;

//luxe class : luxe.debug._ProfilerDebugView.ProfilerValue

	 • function set() : Void;
	 … var avg : Int;
	 … var history : Array;
	 … var start : Float;
	 … var name : String;
	 … var bar : luxe.debug._ProfilerDebugView.ProfilerBar;
	 • function new(_name:String, _bar:luxe.debug._ProfilerDebugView.ProfilerBar) ;

//luxe class : luxe.debug._ProfilerDebugView.ProfilerBar

	 • function show() : Void;
	 • function hide() : Void;
	 … var ping : Float (read/write);
	 … var value : Float (read/write);
	 … var pos : luxe.Vector (read/write);
	 … var text : String (read/write);
	 … var history : Int;
	 … var max : Float;
	 … var height2 : Float;
	 … var height : Float;
	 … var width : Float;
	 … var name : String;
	 … var text_item : luxe.Text;
	 … var graph_geometry : phoenix.geometry.Geometry;
	 … var graphbg_geometry : phoenix.geometry.QuadGeometry;
	 … var bg_geometry : phoenix.geometry.QuadGeometry;
	 … var bar_geometry : phoenix.geometry.QuadGeometry;
	 • function new(_name:String, _color:luxe.Color) ;

//luxe class : luxe.debug.StatsDebugView

	 • function update_render_stats() : Void;
	 • function toggle_debug_stats() : Void;
	 … var hide_debug : Bool;
	 • function refresh_render_stats() : Void;
	 • function hide() : Void;
	 • function show() : Void;
	 • function onkeydown(e:luxe.KeyEvent) : Void;
	 • function process() : Void;
	 • function refresh() : Void;
	 • function create() : Void;
	 • function get_render_stats_string() : String;
	 • function get_resource_stats_string() : String;
	 … var resource_list_text : luxe.Text;
	 … var resource_stats_text : luxe.Text;
	 … var render_stats_text : luxe.Text;
	 … var debug_geometry_count : Int;
	 … var debug_draw_call_count : Int;
	 … var _render_stats : Dynamic;
	 … var _last_render_stats : Dynamic;
	 • function new() ;

//luxe class : luxe.debug.TraceDebugView

	 • function hide() : Void;
	 • function show() : Void;
	 • function process() : Void;
	 • function refresh() : Void;
	 • function add_line(_t:String) : Void;
	 • function create() : Void;
	 • function on_trace(v:Dynamic, ?inf:haxe.PosInfos) : Void;
	 … var max_lines : Int;
	 … var lines : luxe.Text;
	 … var logged : Array;
	 • function new() ;

//luxe class : luxe.structural.BalancedBinarySearchTree

	 • function traverse(_node:luxe.structural.BalancedBinarySearchTreeNode, _traverse_method:luxe.structural.BalancedBinarySearchTraverseMethod, _process_node_function:luxe.structural.BalancedBinarySearchTreeNode->Void) : Void;
	 • function iterator() : Iterator;
	 • function keys() : Array;
	 • function toArray() : Array;
	 • function remove(_key:luxe.structural.BalancedBinarySearchTree.K) : Void;
	 • function deleteMax() : Void;
	 • function deleteMin() : Void;
	 • function ceil(_key:luxe.structural.BalancedBinarySearchTree.K) : Null;
	 • function floor(_key:luxe.structural.BalancedBinarySearchTree.K) : Null;
	 • function max() : luxe.structural.BalancedBinarySearchTree.K;
	 • function min() : luxe.structural.BalancedBinarySearchTree.K;
	 • function select(_rank:Int) : luxe.structural.BalancedBinarySearchTree.K;
	 • function rank(_key:luxe.structural.BalancedBinarySearchTree.K) : Int;
	 • function find(_key:luxe.structural.BalancedBinarySearchTree.K) : luxe.structural.BalancedBinarySearchTree.T;
	 • function contains(_key:luxe.structural.BalancedBinarySearchTree.K) : Bool;
	 • function insert(_key:luxe.structural.BalancedBinarySearchTree.K, _value:luxe.structural.BalancedBinarySearchTree.T) : Void;
	 • function height() : Int;
	 • function size() : Int;
	 • function empty() : Bool;
	 • function toString() : String;
	 … var compare : Dynamic;
	 … var root : luxe.structural.BalancedBinarySearchTreeNode;
	 • function new(compare_function:luxe.structural.BalancedBinarySearchTree.K->luxe.structural.BalancedBinarySearchTree.K->Int) ;

//luxe class : luxe.structural.BalancedBinarySearchTreeNode

	 … var value : luxe.structural.BalancedBinarySearchTreeNode.T;
	 … var key : luxe.structural.BalancedBinarySearchTreeNode.K;
	 … var color : Bool;
	 … var nodecount : Int;
	 … var right : luxe.structural.BalancedBinarySearchTreeNode;
	 … var left : luxe.structural.BalancedBinarySearchTreeNode;
	 • function new(_key:luxe.structural.BalancedBinarySearchTreeNode.K, _value:luxe.structural.BalancedBinarySearchTreeNode.T, _nodecount:Int, _color:Bool) ;

//luxe class : luxe.structural.BinarySearchTree

	 • function traverse(_node:luxe.structural.BinarySearchTreeNode, _traverse_method:luxe.structural.BinarySearchTraverseMethod, _process_node_function:luxe.structural.BinarySearchTreeNode->Void) : Void;
	 • function iterator() : Iterator;
	 • function keys() : Array;
	 • function toArray() : Array;
	 • function remove(_key:luxe.structural.BinarySearchTree.K) : Void;
	 • function deleteMax() : Void;
	 • function deleteMin() : Void;
	 • function ceil(_key:luxe.structural.BinarySearchTree.K) : Null;
	 • function floor(_key:luxe.structural.BinarySearchTree.K) : Null;
	 • function max() : luxe.structural.BinarySearchTree.K;
	 • function min() : luxe.structural.BinarySearchTree.K;
	 • function select(_rank:Int) : luxe.structural.BinarySearchTree.K;
	 • function rank(_key:luxe.structural.BinarySearchTree.K) : Int;
	 • function find(_key:luxe.structural.BinarySearchTree.K) : luxe.structural.BinarySearchTree.T;
	 • function contains(_key:luxe.structural.BinarySearchTree.K) : Bool;
	 • function insert(_key:luxe.structural.BinarySearchTree.K, _value:luxe.structural.BinarySearchTree.T) : Void;
	 • function size() : Int;
	 • function toString() : String;
	 … var compare : Dynamic;
	 … var root : luxe.structural.BinarySearchTreeNode;
	 • function new(compare_function:luxe.structural.BinarySearchTree.K->luxe.structural.BinarySearchTree.K->Int) ;

//luxe class : luxe.structural.BinarySearchTreeNode

	 … var value : luxe.structural.BinarySearchTreeNode.T;
	 … var key : luxe.structural.BinarySearchTreeNode.K;
	 … var nodecount : Int;
	 … var right : luxe.structural.BinarySearchTreeNode;
	 … var left : luxe.structural.BinarySearchTreeNode;
	 • function new(_key:luxe.structural.BinarySearchTreeNode.K, _value:luxe.structural.BinarySearchTreeNode.T, _nodecount:Int) ;

//luxe class : luxe.tween.actuators.GenericActuator

	 • function stop(properties:Dynamic, complete:Bool, sendEvent:Bool) : Void;
	 • function snapping(?value:Bool) : luxe.tween.actuators.IGenericActuator;
	 • function smartRotation(?value:Bool) : luxe.tween.actuators.IGenericActuator;
	 • function reverse(?value:Bool) : luxe.tween.actuators.IGenericActuator;
	 • function resume() : Void;
	 • function repeat(?times:Int) : luxe.tween.actuators.IGenericActuator;
	 • function reflect(?value:Bool) : luxe.tween.actuators.IGenericActuator;
	 • function pause() : Void;
	 • function onUpdate(handler:Dynamic, ?parameters:Array) : luxe.tween.actuators.IGenericActuator;
	 • function onRepeat(handler:Dynamic, ?parameters:Array) : luxe.tween.actuators.IGenericActuator;
	 • function onComplete(handler:Dynamic, ?parameters:Array) : luxe.tween.actuators.IGenericActuator;
	 • function move() : Void;
	 • function ease(easing:luxe.tween.easing.IEasing) : luxe.tween.actuators.IGenericActuator;
	 • function delay(duration:Float) : luxe.tween.actuators.IGenericActuator;
	 • function autoVisible(?value:Bool) : luxe.tween.actuators.IGenericActuator;
	 • function apply() : Void;
	 … var target : Dynamic;
	 … var properties : Dynamic;
	 … var id : String;
	 … var duration : Float;
	 • function new(target:Dynamic, duration:Float, properties:Dynamic) ;

//luxe class : luxe.tween.actuators.SimpleActuator

	 • function stop(properties:Dynamic, complete:Bool, sendEvent:Bool) : Void;
	 • function resume() : Void;
	 • function pause() : Void;
	 • function onUpdate(handler:Dynamic, ?parameters:Array) : luxe.tween.actuators.IGenericActuator;
	 • function move() : Void;
	 • function delay(duration:Float) : luxe.tween.actuators.IGenericActuator;
	 • function autoVisible(?value:Bool) : luxe.tween.actuators.IGenericActuator;
	 • function new(target:Dynamic, duration:Float, properties:Dynamic) ;

//luxe class : luxe.tween.easing.Expo

	 … var easeIn : luxe.tween.easing.IEasing (read only);
	 … var easeInOut : luxe.tween.easing.IEasing (read only);
	 … var easeOut : luxe.tween.easing.IEasing (read only);

//luxe class : luxe.tween.easing.ExpoEaseOut

	 • function ease(t:Float, b:Float, c:Float, d:Float) : Float;
	 • function calculate(k:Float) : Float;
	 • function new() ;

//luxe class : luxe.tween.Actuate

	 … var defaultActuator : Class;
	 … var defaultEase : luxe.tween.easing.IEasing;
	 • static function apply(target:Dynamic, properties:Dynamic, ?customActuator:Class) : luxe.tween.actuators.IGenericActuator;
	 • static function motionPath(target:Dynamic, duration:Float, properties:Dynamic, ?overwrite:Bool) : luxe.tween.actuators.IGenericActuator;
	 • static function pause(target:Dynamic) : Void;
	 • static function pauseAll() : Void;
	 • static function reset() : Void;
	 • static function resume(target:Dynamic) : Void;
	 • static function resumeAll() : Void;
	 • static function stop(target:Dynamic, ?properties:Dynamic, ?complete:Bool, ?sendEvent:Bool) : Void;
	 • static function timer(duration:Float, ?customActuator:Class) : luxe.tween.actuators.IGenericActuator;
	 • static function tween(target:Dynamic, duration:Float, properties:Dynamic, ?overwrite:Bool, ?customActuator:Class) : luxe.tween.actuators.IGenericActuator;
	 • static function unload(actuator:luxe.tween.actuators.GenericActuator) : Void;
	 • static function update(target:Dynamic, duration:Float, ?start:Array, ?end:Array, ?overwrite:Bool) : luxe.tween.actuators.IGenericActuator;

//luxe class : luxe.tween.MotionPath

	 • function line(x:Float, y:Float, ?strength:Float) : luxe.tween.MotionPath;
	 • function bezier(x:Float, y:Float, controlX:Float, controlY:Float, ?strength:Float) : luxe.tween.MotionPath;
	 … var y : luxe.tween.IComponentPath (read only);
	 … var x : luxe.tween.IComponentPath (read only);
	 • function new() ;

//luxe class : luxe.tween.ComponentPath

	 • function calculate(k:Float) : Float;
	 • function addPath(path:luxe.tween.BezierPath) : Void;
	 … var end : Float (read only);
	 … var start : Float;
	 • function new() ;

//luxe class : luxe.tween.BezierPath

	 • function calculate(start:Float, k:Float) : Float;
	 … var strength : Float;
	 … var end : Float;
	 … var control : Float;
	 • function new(end:Float, control:Float, strength:Float) ;

//luxe class : luxe.tween.LinearPath

	 • function calculate(start:Float, k:Float) : Float;
	 • function new(end:Float, strength:Float) ;

//luxe class : luxe.tween.actuators.MethodActuator

	 • function apply() : Void;
	 • function new(target:Dynamic, duration:Float, properties:Dynamic) ;

//luxe class : luxe.tween.actuators.MotionPathActuator

	 • function apply() : Void;
	 • function new(target:Dynamic, duration:Float, properties:Dynamic) ;

//luxe class : luxe.tween.actuators.PropertyDetails

	 … var target : Dynamic;
	 … var start : Float;
	 … var propertyName : String;
	 … var isField : Bool;
	 … var change : Float;
	 • function new(target:Dynamic, propertyName:String, start:Float, change:Float, ?isField:Bool) ;

//luxe class : luxe.tween.actuators.PropertyPathDetails

	 … var path : luxe.tween.IComponentPath;
	 • function new(target:Dynamic, propertyName:String, path:luxe.tween.IComponentPath, ?isField:Bool) ;

//luxe class : luxe.tween.easing.ExpoEaseIn

	 • function ease(t:Float, b:Float, c:Float, d:Float) : Float;
	 • function calculate(k:Float) : Float;
	 • function new() ;

//luxe class : luxe.tween.easing.ExpoEaseInOut

	 • function ease(t:Float, b:Float, c:Float, d:Float) : Float;
	 • function calculate(k:Float) : Float;
	 • function new() ;

//luxe class : luxe.tween.easing.Quad

	 … var easeIn : luxe.tween.easing.IEasing (read only);
	 … var easeInOut : luxe.tween.easing.IEasing (read only);
	 … var easeOut : luxe.tween.easing.IEasing (read only);

//luxe class : luxe.tween.easing.QuadEaseIn

	 • function ease(t:Float, b:Float, c:Float, d:Float) : Float;
	 • function calculate(k:Float) : Float;
	 • function new() ;

//luxe class : luxe.tween.easing.QuadEaseInOut

	 • function ease(t:Float, b:Float, c:Float, d:Float) : Float;
	 • function calculate(k:Float) : Float;
	 • function new() ;

//luxe class : luxe.tween.easing.QuadEaseOut

	 • function ease(t:Float, b:Float, c:Float, d:Float) : Float;
	 • function calculate(k:Float) : Float;
	 • function new() ;

//luxe class : luxe.utils.GeometryUtils

	 • function intersect_ray_plane(_ray_start:luxe.Vector, _ray_dir:luxe.Vector, _plane_normal:luxe.Vector, _plane_point:luxe.Vector) : luxe.Vector;
	 • function point_in_polygon(_point:luxe.Vector, _offset:luxe.Vector, _verts:Array) : Bool;
	 • function random_point_in_unit_circle() : luxe.Vector;
	 • function segments_for_smooth_circle(_radius:Float, ?_smooth:Float) : Float;

//luxe class : luxe.utils.JSON

	 • static function encode(o:Dynamic) : String;
	 • static function decode(s:String, ?strict:Bool) : null;
	 • static function stringify(o:Dynamic) : String;
	 • static function parse(s:String, ?strict:Bool) : null;

//luxe class : luxe.utils.Maths

	 … var DEG2RAD : Float;
	 … var RAD2DEG : Float;
	 • static function fixed(value:Float, precision:Int) : Float;
	 • static function clamp(value:Float, a:Float, b:Float) : Float;
	 • static function clampBottom(value:Float, a:Float) : Float;
	 • static function nearest_power_of_two(_value:Int) : Int;
	 • static function mapLinear(value:Float, a1:Float, a2:Float, b1:Float, b2:Float) : Float;
	 • static function smoothstep(x:Float, min:Float, max:Float) : Float;
	 • static function smootherstep(x:Float, min:Float, max:Float) : Float;
	 • static function random16() : Float;
	 • static function randInt(low:Int, high:Int) : Int;
	 • static function randFloat(low:Float, high:Float) : Float;
	 • static function randFloatSpread(range:Float) : Float;
	 • static function sign(x:Float) : Int;
	 • static function degToRad(deg:Float) : Float;
	 • static function radToDeg(rad:Float) : Float;

//luxe class : luxe.utils.UUID

	 • static function generate_undashed() : String;
	 • static function get() : String;

//luxe class : luxe.utils.Utils

	 • function file_bytes_to_class(_file:String, _outfile:String, ?_string_length:Int) : Void;
	 • function arrayToBytes(array:Array) : haxe.io.Bytes;
	 • function bytes_to_string(bytes:Int) : String;
	 • function uuid() : String;
	 • function uniqueid() : String;
	 … var geometry : luxe.utils.GeometryUtils;
