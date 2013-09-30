
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

## Luxe Class Index


	//luxe class : luxe.Objects

		 … var name : String;
		 … var id : String;

	//luxe class : luxe.components.Component

		 • function serialize_to_disk(_destination_path:String) : Void;
		 • function get_serialize_data() : null;
		 • function get(_name:String, ?in_children:Bool, ?first_only:Bool) : null;
		 • function add(type:Class, ?_name:String) : add.T;
		 … var scaleRelative : luxe.Vector ;
		 … var scale : luxe.Vector ;
		 … var rotationRelative : luxe.Vector ;
		 … var rotation : luxe.Vector ;
		 … var posRelative : luxe.Vector ;
		 … var pos : luxe.Vector ;
		 … var entity : luxe.Entity;
		 • function new() ;

	//luxe class : luxe.Mode

		 … var next_tick : Dynamic (write only);
		 … var name : String;
		 … var active : Bool;
		 … var modes : luxe.Modes;
		 • function new() ;

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
		 • function add(type:Class, ?_name:String) : add.T;
		 … var serialize : Bool;
		 … var scene : luxe.Scene ;
		 … var scaleRelative : luxe.Vector ;
		 … var scale : luxe.Vector ;
		 … var rotationRelative : luxe.Vector ;
		 … var rotation : luxe.Vector ;
		 … var posRelative : luxe.Vector ;
		 … var pos : luxe.Vector ;
		 … var parent : luxe.Entity ;
		 … var started : Bool;
		 … var inited : Bool;
		 … var fixed_rate : Float ;
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
		 • function ring(options:Dynamic) : phoenix.geometry.RingGeometry;
		 • function text(options:Dynamic) : phoenix.geometry.Geometry;
		 • function rectangle(options:Dynamic) : phoenix.geometry.RectangleGeometry;
		 • function box(options:Dynamic) : phoenix.geometry.QuadGeometry;
		 • function line(options:Dynamic) : phoenix.geometry.LineGeometry;

	//luxe class : luxe.Events

		 • function unschedule(schedule_id:String) : Bool;
		 • function schedule(time:Float, event_name:String, ?properties:Dynamic) : String;
		 • function fire(_event_name:String, ?_properties:Dynamic) : Bool;
		 • function process() : Void;
		 • function dequeue(event_id:String) : Bool;
		 • function queue(event_name:String, ?properties:Dynamic) : String;
		 • function disconnect(event_id:String) : Bool;
		 • function listen(_event_name:String, _listener:null->Void) : String;
		 • function does_filter_event(_filter:String, _event:String) : Bool;
		 • function new() ;

	//luxe class : luxe.Input

		 … var Keys : lime.utils.Keys;
		 … var Gamepad : lime.utils.Gamepad;
		 • function add(_name:String, _event:Dynamic) : Void;

	//luxe class : luxe.Modes

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
		 • function set(name:String) : Void;
		 • function disable(_name:String) : Void;
		 • function enable(_name:String) : Void;
		 • function add_mode(type:Class, ?_name:String) : add_mode.T;
		 … var currentmode : luxe.Mode;
		 … var activemodes : Array;
		 • function new() ;

	//luxe class : luxe.Sprite

		 • function get_serialize_data() : null;
		 • function point_inside(_p:phoenix.Vector) : Bool;
		 • function destroy() : Void;
		 … var flipx : Bool ;
		 … var flipy : Bool ;
		 … var clip_rect : luxe.Rectangle ;
		 … var clip : Bool ;
		 … var uv : luxe.Rectangle ;
		 … var origin : phoenix.Vector ;
		 … var centered : Bool ;
		 … var depth : Float ;
		 … var radians : Float ;
		 … var rotation_z : Float ;
		 … var visible : Bool ;
		 … var color : phoenix.Color ;
		 … var size : phoenix.Vector ;
		 … var shader : phoenix.Shader ;
		 … var texture : phoenix.Texture ;
		 … var locked : Bool ;
		 … var geometry : phoenix.geometry.QuadGeometry;
		 • function new(options:Dynamic) ;

	//luxe class : luxe.NineSlice

		 • function create(_pos:luxe.Vector, _w:Float, _h:Float, ?_reset:Bool) : Void;
		 • function destroy() : Void;
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
		 • function shutdown() : Void;
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

	//luxe class : luxe.Text

		 • function destroy() : Void;
		 … var text_options : Dynamic;
		 … var ready : Bool;
		 … var visible : Bool ;
		 … var color : luxe.Color ;
		 … var size : Float ;
		 … var pos : luxe.Vector ;
		 … var text : String ;
		 … var geometry : phoenix.geometry.CompositeGeometry;
		 … var font : phoenix.BitmapFont;
		 • function new(_options:Dynamic) ;

	//luxe class : luxe.Time

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
		 … var animation : String ;
		 … var current : luxe.components.sprite.SpriteAnimationData;
		 … var animation_list : Map;
		 • function new() ;

	//luxe class : luxe.structures.BalancedBinarySearchTree

		 • function traverse(_node:luxe.structures.BalancedBinarySearchTreeNode, _traverse_method:luxe.structures.BalancedBinarySearchTraverseMethod, _process_node_function:luxe.structures.BalancedBinarySearchTreeNode->Void) : Void;
		 • function iterator() : Iterator;
		 • function keys() : Array;
		 • function toArray() : Array;
		 • function remove(_key:luxe.structures.BalancedBinarySearchTree.K) : Void;
		 • function deleteMax() : Void;
		 • function deleteMin() : Void;
		 • function ceil(_key:luxe.structures.BalancedBinarySearchTree.K) : Null;
		 • function floor(_key:luxe.structures.BalancedBinarySearchTree.K) : Null;
		 • function max() : luxe.structures.BalancedBinarySearchTree.K;
		 • function min() : luxe.structures.BalancedBinarySearchTree.K;
		 • function select(_rank:Int) : luxe.structures.BalancedBinarySearchTree.K;
		 • function rank(_key:luxe.structures.BalancedBinarySearchTree.K) : Int;
		 • function find(_key:luxe.structures.BalancedBinarySearchTree.K) : luxe.structures.BalancedBinarySearchTree.T;
		 • function contains(_key:luxe.structures.BalancedBinarySearchTree.K) : Bool;
		 • function insert(_key:luxe.structures.BalancedBinarySearchTree.K, _value:luxe.structures.BalancedBinarySearchTree.T) : Void;
		 • function height() : Int;
		 • function size() : Int;
		 • function empty() : Bool;
		 • function toString() : String;
		 … var compare : Dynamic;
		 … var root : luxe.structures.BalancedBinarySearchTreeNode;
		 • function new(compare_function:luxe.structures.BalancedBinarySearchTree.K->luxe.structures.BalancedBinarySearchTree.K->Int) ;

	//luxe class : luxe.structures.BalancedBinarySearchTreeNode

		 … var value : luxe.structures.BalancedBinarySearchTreeNode.T;
		 … var key : luxe.structures.BalancedBinarySearchTreeNode.K;
		 … var color : Bool;
		 … var nodecount : Int;
		 … var right : luxe.structures.BalancedBinarySearchTreeNode;
		 … var left : luxe.structures.BalancedBinarySearchTreeNode;
		 • function new(_key:luxe.structures.BalancedBinarySearchTreeNode.K, _value:luxe.structures.BalancedBinarySearchTreeNode.T, _nodecount:Int, _color:Bool) ;

	//luxe class : luxe.structures.BinarySearchTree

		 • function traverse(_node:luxe.structures.BinarySearchTreeNode, _traverse_method:luxe.structures.BinarySearchTraverseMethod, _process_node_function:luxe.structures.BinarySearchTreeNode->Void) : Void;
		 • function iterator() : Iterator;
		 • function keys() : Array;
		 • function toArray() : Array;
		 • function remove(_key:luxe.structures.BinarySearchTree.K) : Void;
		 • function deleteMax() : Void;
		 • function deleteMin() : Void;
		 • function ceil(_key:luxe.structures.BinarySearchTree.K) : Null;
		 • function floor(_key:luxe.structures.BinarySearchTree.K) : Null;
		 • function max() : luxe.structures.BinarySearchTree.K;
		 • function min() : luxe.structures.BinarySearchTree.K;
		 • function select(_rank:Int) : luxe.structures.BinarySearchTree.K;
		 • function rank(_key:luxe.structures.BinarySearchTree.K) : Int;
		 • function find(_key:luxe.structures.BinarySearchTree.K) : luxe.structures.BinarySearchTree.T;
		 • function contains(_key:luxe.structures.BinarySearchTree.K) : Bool;
		 • function insert(_key:luxe.structures.BinarySearchTree.K, _value:luxe.structures.BinarySearchTree.T) : Void;
		 • function size() : Int;
		 • function toString() : String;
		 … var compare : Dynamic;
		 … var root : luxe.structures.BinarySearchTreeNode;
		 • function new(compare_function:luxe.structures.BinarySearchTree.K->luxe.structures.BinarySearchTree.K->Int) ;

	//luxe class : luxe.structures.BinarySearchTreeNode

		 … var value : luxe.structures.BinarySearchTreeNode.T;
		 … var key : luxe.structures.BinarySearchTreeNode.K;
		 … var nodecount : Int;
		 … var right : luxe.structures.BinarySearchTreeNode;
		 … var left : luxe.structures.BinarySearchTreeNode;
		 • function new(_key:luxe.structures.BinarySearchTreeNode.K, _value:luxe.structures.BinarySearchTreeNode.T, _nodecount:Int) ;

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
		 • function apply(target:Dynamic, properties:Dynamic, ?customActuator:Class) : luxe.tween.actuators.IGenericActuator;
		 • function motionPath(target:Dynamic, duration:Float, properties:Dynamic, ?overwrite:Bool) : luxe.tween.actuators.IGenericActuator;
		 • function pause(target:Dynamic) : Void;
		 • function pauseAll() : Void;
		 • function reset() : Void;
		 • function resume(target:Dynamic) : Void;
		 • function resumeAll() : Void;
		 • function stop(target:Dynamic, ?properties:Dynamic, ?complete:Bool, ?sendEvent:Bool) : Void;
		 • function timer(duration:Float, ?customActuator:Class) : luxe.tween.actuators.IGenericActuator;
		 • function tween(target:Dynamic, duration:Float, properties:Dynamic, ?overwrite:Bool, ?customActuator:Class) : luxe.tween.actuators.IGenericActuator;
		 • function unload(actuator:luxe.tween.actuators.GenericActuator) : Void;
		 • function update(target:Dynamic, duration:Float, ?start:Array, ?end:Array, ?overwrite:Bool) : luxe.tween.actuators.IGenericActuator;

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

		 … var encode : Dynamic (read only);
		 … var decode : Dynamic (read only);
		 … var stringify : Dynamic (read only);
		 … var parse : Dynamic (read only);

	//luxe class : luxe.utils.UUID

		 • function generate_undashed() : String;
		 • function get() : String;

	//luxe class : luxe.utils.Utils

		 • function file_bytes_to_class(_file:String, _outfile:String, ?_string_length:Int) : Void;
		 • function arrayToBytes(array:Array) : haxe.io.Bytes;
		 • function bytes_to_string(bytes:Int) : String;
		 • function nearest_power_of_two(_value:Int) : Int;
		 • function clamp(value:Float, min:Float, max:Float) : Float;
		 • function uuid() : String;
		 … var geometry : luxe.utils.GeometryUtils;
