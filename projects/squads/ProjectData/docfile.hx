luxe class : luxe.Game
	luxecore:luxe.Core
	new(  ) : Void
luxe class : luxe.Objects
	_show_debug:Bool
	name:String
	id:String
	new(  ) : Void
luxe class : luxe.components.Component
	serialize_to_disk( _destination_path:String ) : Void
	get_serialize_data(  ) : null
	get( _name:String, ?in_children:Bool, ?first_only:Bool ) : null
	add( type:Class, ?_name:String ) : add.T
	scaleRelative property( accessor,accessor ) 
	scale property( accessor,accessor ) 
	rotationRelative property( accessor,accessor ) 
	rotation property( accessor,accessor ) 
	posRelative property( accessor,accessor ) 
	pos property( accessor,accessor ) 
	entity:luxe.Entity
	new(  ) : Void
luxe class : luxe.Mode
	_update( dt:Float ) : Void
	set_next_tick( _f:Void ) : Void
	next_tick property( null,accessor ) 
	name:String
	active:Bool
	modes:luxe.Modes
	new(  ) : Void
luxe class : luxe.Audio
	process(  ) : Void
	pan( _name:String, _p:Float ) : Void
	volume( _name:String, _v:Float ) : Void
	play( _name:String ) : Void
	create( _name:String, _file:String, ?_forcemusic:Bool ) : Void
	shutdown(  ) : Void
	startup(  ) : Void
	core:luxe.Core
	new( _core:luxe.Core ) : Void
luxe class : luxe.Entity
	serialize_to_disk( _destination_path:String, ?_parent_write:Bool ) : Void
	get_serialize_data(  ) : null
	internal_parent_scale_changed( _parent_scale:luxe.Vector ) : Void
	internal_parent_rotation_changed( _parent_rotation:luxe.Vector ) : Void
	internal_parent_pos_changed( _parent_pos:luxe.Vector ) : Void
	remove_child( child:luxe.Entity ) : Void
	add_child( child:luxe.Entity ) : Void
	has( _name:String ) : Bool
	get( _name:String, ?_in_children:Bool, ?_first_only:Bool ) : null
	add( type:Class, ?_name:String ) : add.T
	_fixed_update(  ) : Void
	_update( dt:Float ) : Void
	_destroy(  ) : Void
	_start(  ) : Void
	_oninputup( _name:String, e:null ) : Void
	_oninputdown( _name:String, e:null ) : Void
	_onmousemove( e:luxe.MouseEvent ) : Void
	_onmouseup( e:luxe.MouseEvent ) : Void
	_onmousedown( e:luxe.MouseEvent ) : Void
	_init(  ) : Void
	serialize:Bool
	scene property( accessor,accessor ) 
	scaleRelative property( accessor,accessor ) 
	scale property( accessor,accessor ) 
	rotationRelative property( accessor,accessor ) 
	rotation property( accessor,accessor ) 
	posRelative property( accessor,accessor ) 
	pos property( accessor,accessor ) 
	parent property( accessor,accessor ) 
	started:Bool
	inited:Bool
	fixed_rate property( accessor,accessor ) 
	children:Array
	events:luxe.Events
	components property( accessor,null ) 
	new(  ) : Void
luxe class : luxe.Camera
	get_serialize_data(  ) : null
	update( dt:Float ) : Void
	shake( amount:Float ) : Void
	set_pos( v:luxe.Vector ) : luxe.Vector
	center( _p:luxe.Vector, ?_t:Float, ?oncomplete:Void ) : Void
	shaking:Bool
	shake_amount:Float
	shake_vector:luxe.Vector
	bounds:luxe.Rectangle
	view:phoenix.Camera
	new( ?options:null ) : Void
luxe class : luxe.Core
	load( library:String, method:String, ?args:Int ) : null
	_debug( value:null, ?_verbose:Bool, ?_more_verbose:Bool ) : Void
	more_verbose:Bool
	verbose:Bool
	log:Bool
	onjoybuttonup( e:null ) : Void
	onjoybuttondown( e:null ) : Void
	onjoyhatmove( e:null ) : Void
	onjoyballmove( e:null ) : Void
	onjoyaxismove( e:null ) : Void
	ontouchmove( e:luxe.TouchEvent ) : Void
	ontouchend( e:luxe.TouchEvent ) : Void
	ontouchbegin( e:luxe.TouchEvent ) : Void
	onmousemove( e:luxe.MouseEvent ) : Void
	onmouseup( e:luxe.MouseEvent ) : Void
	onmousedown( e:luxe.MouseEvent ) : Void
	oninputup( _name:String, e:null ) : Void
	oninputdown( _name:String, e:null ) : Void
	onkeyup( e:luxe.KeyEvent ) : Void
	onkeydown( e:luxe.KeyEvent ) : Void
	onresize( e:null ) : Void
	show_console( ?_show:Bool ) : Void
	set_renderer( _renderer:luxe.Renderer ) : Void
	render(  ) : Void
	update(  ) : Void
	shutdown(  ) : Void
	startup(  ) : Void
	has_shutdown:Bool
	shutting_down:Bool
	add_internal_update( _update:Float->Void ) : String
	profiling:Bool
	profile_path:String
	dt:Float
	screen:luxe.Rectangle
	renderer:null
	scene:luxe.Scene
	audio:luxe.Audio
	input:luxe.Input
	events:luxe.Events
	time:luxe.Time
	draw:luxe.Draw
	file:luxe.Files
	debug:luxe.Debug
	lime:lime.LiME
	console_visible:Bool
	config:null
	host:null
	version:String
	new( _host:null ) : Void
luxe class : luxe.Debug
	internal_trace( v:null, ?inf:haxe.PosInfos ) : Void
	process(  ) : Void
	update_render_stats(  ) : Void
	toggle_debug_stats(  ) : Void
	hide_debug:Bool
	refresh_render_stats(  ) : Void
	shutdown(  ) : Void
	show_stats_console( ?_show:Bool ) : Void
	show_log_console( ?_show:Bool ) : Void
	show_batcher_list( ?_show:Bool ) : Void
	draw_batcher_tree(  ) : Void
	draw_geom_leaf( L:Bool, _leaf:luxe.structures.BalancedBinarySearchTreeNode, _p:luxe.Vector ) : Void
	draw_geom_node( l:Bool, _g:phoenix.geometry.Geometry, _p:luxe.Vector ) : Void
	clear_batcher_tree(  ) : Void
	show_console( ?_show:Bool ) : Void
	switch_console( ?_change:Bool ) : Void
	get_resource_stats_string(  ) : String
	get_render_stats_string(  ) : String
	get_batcher_list_string(  ) : String
	refresh(  ) : Void
	create_stats_console(  ) : Void
	create_batch_console(  ) : Void
	add_line( _t:String ) : Void
	create_log_console(  ) : Void
	onresize( e:null ) : Void
	create_debug_console(  ) : Void
	startup(  ) : Void
	_render_stats:null
	_last_render_stats:null
	started:Bool
	padding:luxe.Vector
	view_count:Int
	current_view:Int
	dt_average_count:Int
	dt_average_span:Int
	dt_average_accum:Float
	dt_average:Float
	debug_geometry_count:Int
	debug_draw_call_count:Int
	debug_overlay:phoenix.geometry.QuadGeometry
	debug_font:phoenix.BitmapFont
	debug_view:phoenix.Camera
	debug_batcher:phoenix.Batcher
	max_lines:Int
	lines:luxe.Text
	logged:Array
	resource_list_text:luxe.Text
	resource_stats_text:luxe.Text
	render_stats_text:luxe.Text
	batcher_list_text:luxe.Text
	scene_inspector:luxe.debug.Inspector
	visible:Bool
	core:luxe.Core
	new( _core:luxe.Core ) : Void
luxe class : luxe.Draw
	axis3D( ?options:null ) : Void
	plane( options:null ) : phoenix.geometry.PlaneGeometry
	circle( options:null ) : phoenix.geometry.CircleGeometry
	ring( options:null ) : phoenix.geometry.RingGeometry
	text( options:null ) : phoenix.geometry.Geometry
	rectangle( options:null ) : phoenix.geometry.RectangleGeometry
	box( options:null ) : phoenix.geometry.QuadGeometry
	line( options:null ) : phoenix.geometry.LineGeometry
	core:luxe.Core
	new( _core:luxe.Core ) : Void
luxe class : luxe.Events
	unschedule( schedule_id:String ) : Bool
	schedule( time:Float, event_name:String, ?properties:null ) : String
	fire( _event_name:String, ?_properties:null ) : Bool
	process(  ) : Void
	dequeue( event_id:String ) : Bool
	queue( event_name:String, ?properties:null ) : String
	disconnect( event_id:String ) : Bool
	listen( _event_name:String, _listener:null->Void ) : String
	does_filter_event( _filter:String, _event:String ) : Bool
	shutdown(  ) : Void
	startup(  ) : Void
	event_schedules:Map
	event_filters:Map
	event_slots:Map
	event_connections:Map
	event_queue:Map
	new(  ) : Void
luxe class : luxe.EventConnection
	event_name:String
	id:String
	listener:null
	new( _id:String, _event_name:String, _listener:null->Void ) : Void
luxe class : luxe.EventObject
	properties:null
	name:String
	id:String
	new( _id:String, _event_name:String, _event_properties:null ) : Void
luxe class : luxe.Files
	process(  ) : Void
	shutdown(  ) : Void
	startup(  ) : Void
	core:luxe.Core
	new( _core:luxe.Core ) : Void
luxe class : luxe.Input
	Keys:lime.utils.Keys
	Gamepad:lime.utils.Gamepad
	add( _name:String, _event:null ) : Void
	core:luxe.Core
	new( _core:luxe.Core ) : Void
luxe class : luxe.Modes
	onmousemove( e:luxe.MouseEvent ) : Void
	onmouseup( e:luxe.MouseEvent ) : Void
	onmousedown( e:luxe.MouseEvent ) : Void
	oninputdown( name:String, e:null ) : Void
	oninputup( name:String, e:null ) : Void
	onkeyup( e:luxe.KeyEvent ) : Void
	onkeydown( e:luxe.KeyEvent ) : Void
	destroy(  ) : Void
	update( dt:Float ) : Void
	start(  ) : Void
	init(  ) : Void
	set( name:String ) : Void
	disable( _name:String ) : Void
	enable( _name:String ) : Void
	add_mode( type:Class, ?_name:String ) : add_mode.T
	currentmode:luxe.Mode
	activemodes:Array
	_modes:Map
	new(  ) : Void
luxe class : luxe.Sprite
	get_serialize_data(  ) : null
	set_clip_rect( val:luxe.Rectangle ) : luxe.Rectangle
	set_clip( val:Bool ) : Bool
	set_uv( _uv:luxe.Rectangle ) : luxe.Rectangle
	set_locked( _l:Bool ) : Bool
	set_size( _v:phoenix.Vector ) : phoenix.Vector
	set_scale( _v:phoenix.Vector ) : phoenix.Vector
	set_radians( _r:Float ) : Float
	set_rotation_z( _r:Float ) : Float
	get_rotation_z(  ) : Float
	set_pos( _p:phoenix.Vector ) : phoenix.Vector
	set_centered( _c:Bool ) : Bool
	set_origin( _o:phoenix.Vector ) : phoenix.Vector
	set_color( _c:phoenix.Color ) : phoenix.Color
	set_depth( _v:Float ) : Float
	set_visible( _v:Bool ) : Bool
	set_flipx( _v:Bool ) : Bool
	set_flipy( _v:Bool ) : Bool
	point_inside( _p:phoenix.Vector ) : Bool
	destroy(  ) : Void
	_create_geometry( options:null ) : Void
	flipx property( null,accessor ) 
	flipy property( null,accessor ) 
	clip_rect property( null,accessor ) 
	clip property( null,accessor ) 
	uv property( null,accessor ) 
	origin property( null,accessor ) 
	centered property( null,accessor ) 
	depth property( null,accessor ) 
	radians property( null,accessor ) 
	rotation_z property( null,accessor ) 
	visible property( null,accessor ) 
	color property( null,accessor ) 
	size property( null,accessor ) 
	shader property( null,accessor ) 
	texture property( null,accessor ) 
	locked property( null,accessor ) 
	geometry:phoenix.geometry.QuadGeometry
	new( options:null ) : Void
luxe class : luxe.NineSlice
	create( _pos:luxe.Vector, _w:Float, _h:Float, ?_reset:Bool ) : Void
	set_color( _color:luxe.Color ) : luxe.Color
	set_clip_rect( val:luxe.Rectangle ) : luxe.Rectangle
	set_clip( val:Bool ) : Bool
	set_visible( _v:Bool ) : Bool
	destroy(  ) : Void
	set_pos( _v:luxe.Vector ) : luxe.Vector
	set_size( _v:luxe.Vector ) : luxe.Vector
	set( _width:Float, _height:Float ) : Void
	update_size( _width:Float, _height:Float ) : Void
	dirty(  ) : Void
	lock(  ) : Void
	_geometry:phoenix.geometry.ComplexGeometry
	midheight:Float
	midwidth:Float
	is_set:Bool
	source_h:Float
	source_w:Float
	source_y:Float
	source_x:Float
	height:Float
	bottom:Float
	width:Float
	right:Float
	left:Float
	top:Float
	options:null
	added:Bool
	slices:Array
	new( _options:null ) : Void
luxe class : luxe.Renderer
	process(  ) : Void
	shutdown(  ) : Void
	startup(  ) : Void
	core:luxe.Core
	new( _core:luxe.Core ) : Void
luxe class : luxe.Scene
	serialize_to_disk( _destination_path:String ) : Void
	fixed_update(  ) : Void
	update( dt:Float ) : Void
	start(  ) : Void
	init(  ) : Void
	destroy(  ) : Void
	onmousemove( e:luxe.MouseEvent ) : Void
	onmouseup( e:luxe.MouseEvent ) : Void
	onmousedown( e:luxe.MouseEvent ) : Void
	oninputup( _name:String, e:null ) : Void
	oninputdown( _name:String, e:null ) : Void
	shutdown(  ) : Void
	empty(  ) : Void
	remove( entity:luxe.Entity ) : Void
	add( entity:luxe.Entity ) : Void
	create( type:Class, ?_name:String ) : create.T
	started:Bool
	inited:Bool
	entities:Map
	id:String
	name:String
	new(  ) : Void
luxe class : luxe.Text
	set_text( v:String ) : String
	set_visible( b:Bool ) : Bool
	set_color( c:luxe.Color ) : luxe.Color
	set_size( v:Float ) : Float
	set_pos( v:luxe.Vector ) : luxe.Vector
	destroy(  ) : Void
	onloaded(  ) : Void
	text_options:null
	ready:Bool
	visible property( null,accessor ) 
	color property( null,accessor ) 
	size property( null,accessor ) 
	pos property( null,accessor ) 
	text property( null,accessor ) 
	geometry:phoenix.geometry.CompositeGeometry
	font:phoenix.BitmapFont
	new( _options:null ) : Void
luxe class : luxe.Time
	process(  ) : Void
	schedule( _time_in_seconds:Float, _on_time:Void, ?repeat:Bool ) : haxe.Timer
	shutdown(  ) : Void
	startup(  ) : Void
	core:luxe.Core
	new( _core:luxe.Core ) : Void
luxe class : luxe.components.Components
	_show_debug:Bool
	has( _name:String ) : Bool
	get( _name:String, ?in_children:Bool, ?first_only:Bool ) : null
	add( type:Class, ?_name:String ) : add.T
	entity:luxe.Entity
	components:Map
	new( _entity:luxe.Entity ) : Void
luxe class : luxe.components.sprite.SpriteAnimationData
	from_json( _animdata:null ) : luxe.components.sprite.SpriteAnimationData
	get_serialize_data(  ) : null
	frame_count property( accessor,null ) 
	reverse:Bool
	pingpong:Bool
	loop:Bool
	frame_time:Float
	frame_size:luxe.Vector
	frameset:Array
	name:String
	new( ?_name:String ) : Void
luxe class : luxe.components.sprite.SpriteAnimation
	get_serialize_data(  ) : null
	update( dt:Float ) : Void
	set_frame( _frame:Int ) : Void
	stop(  ) : Void
	play(  ) : Void
	restart(  ) : Void
	add_from_json( _json_string:String ) : Void
	init(  ) : Void
	playing:Bool
	reverse:Bool
	pingpong:Bool
	loop:Bool
	next_frame_time:Float
	frame_time:Float
	image_frame:Int
	frame:Int
	animation property( accessor,accessor ) 
	current:luxe.components.sprite.SpriteAnimationData
	animation_list:Map
	new(  ) : Void
luxe class : luxe.debug.Inspector
	hide(  ) : Void
	show(  ) : Void
	refresh(  ) : Void
	onrefresh:null
	_window:luxe.NineSlice
	default_button_texture:phoenix.Texture
	default_box_texture:phoenix.Texture
	_title_text:luxe.Text
	size:luxe.Vector
	pos:luxe.Vector
	font:phoenix.BitmapFont
	title:String
	new( _options:null ) : Void
luxe class : luxe.defaults.TinyBox
	data(  ) : String
luxe class : luxe.defaults.TinyButton
	data(  ) : String
luxe class : luxe.structures.BalancedBinarySearchTree
	RED property( inline,null ) 
	BLACK property( inline,null ) 
	traverse( _node:luxe.structures.BalancedBinarySearchTreeNode, _traverse_method:luxe.structures.BalancedBinarySearchTraverseMethod, _process_node_function:luxe.structures.BalancedBinarySearchTreeNode->Void ) : Void
	iterator(  ) : Iterator
	keys(  ) : Array
	toArray(  ) : Array
	flip_colors( _node:luxe.structures.BalancedBinarySearchTreeNode ) : Void
	rotate_right( _node:luxe.structures.BalancedBinarySearchTreeNode ) : luxe.structures.BalancedBinarySearchTreeNode
	rotate_left( _node:luxe.structures.BalancedBinarySearchTreeNode ) : luxe.structures.BalancedBinarySearchTreeNode
	remove( _key:luxe.structures.BalancedBinarySearchTree.K ) : Void
	deleteMax(  ) : Void
	deleteMin(  ) : Void
	ceil( _key:luxe.structures.BalancedBinarySearchTree.K ) : Null
	floor( _key:luxe.structures.BalancedBinarySearchTree.K ) : Null
	max(  ) : luxe.structures.BalancedBinarySearchTree.K
	_min( _node:luxe.structures.BalancedBinarySearchTreeNode ) : luxe.structures.BalancedBinarySearchTreeNode
	min(  ) : luxe.structures.BalancedBinarySearchTree.K
	select( _rank:Int ) : luxe.structures.BalancedBinarySearchTree.K
	rank( _key:luxe.structures.BalancedBinarySearchTree.K ) : Int
	find( _key:luxe.structures.BalancedBinarySearchTree.K ) : luxe.structures.BalancedBinarySearchTree.T
	contains( _key:luxe.structures.BalancedBinarySearchTree.K ) : Bool
	insert( _key:luxe.structures.BalancedBinarySearchTree.K, _value:luxe.structures.BalancedBinarySearchTree.T ) : Void
	height(  ) : Int
	size(  ) : Int
	empty(  ) : Bool
	toString(  ) : String
	compare:null
	root:luxe.structures.BalancedBinarySearchTreeNode
	new( compare_function:luxe.structures.BalancedBinarySearchTree.K->luxe.structures.BalancedBinarySearchTree.K->Int ) : Void
luxe class : luxe.structures.BalancedBinarySearchTreeNode
	value:luxe.structures.BalancedBinarySearchTreeNode.T
	key:luxe.structures.BalancedBinarySearchTreeNode.K
	color:Bool
	nodecount:Int
	right:luxe.structures.BalancedBinarySearchTreeNode
	left:luxe.structures.BalancedBinarySearchTreeNode
	new( _key:luxe.structures.BalancedBinarySearchTreeNode.K, _value:luxe.structures.BalancedBinarySearchTreeNode.T, _nodecount:Int, _color:Bool ) : Void
luxe class : luxe.structures.BinarySearchTree
	traverse( _node:luxe.structures.BinarySearchTreeNode, _traverse_method:luxe.structures.BinarySearchTraverseMethod, _process_node_function:luxe.structures.BinarySearchTreeNode->Void ) : Void
	iterator(  ) : Iterator
	keys(  ) : Array
	toArray(  ) : Array
	remove( _key:luxe.structures.BinarySearchTree.K ) : Void
	deleteMax(  ) : Void
	deleteMin(  ) : Void
	ceil( _key:luxe.structures.BinarySearchTree.K ) : Null
	floor( _key:luxe.structures.BinarySearchTree.K ) : Null
	max(  ) : luxe.structures.BinarySearchTree.K
	_min( _node:luxe.structures.BinarySearchTreeNode ) : luxe.structures.BinarySearchTreeNode
	min(  ) : luxe.structures.BinarySearchTree.K
	select( _rank:Int ) : luxe.structures.BinarySearchTree.K
	rank( _key:luxe.structures.BinarySearchTree.K ) : Int
	find( _key:luxe.structures.BinarySearchTree.K ) : luxe.structures.BinarySearchTree.T
	contains( _key:luxe.structures.BinarySearchTree.K ) : Bool
	insert( _key:luxe.structures.BinarySearchTree.K, _value:luxe.structures.BinarySearchTree.T ) : Void
	size(  ) : Int
	toString(  ) : String
	compare:null
	root:luxe.structures.BinarySearchTreeNode
	new( compare_function:luxe.structures.BinarySearchTree.K->luxe.structures.BinarySearchTree.K->Int ) : Void
luxe class : luxe.structures.BinarySearchTreeNode
	value:luxe.structures.BinarySearchTreeNode.T
	key:luxe.structures.BinarySearchTreeNode.K
	nodecount:Int
	right:luxe.structures.BinarySearchTreeNode
	left:luxe.structures.BinarySearchTreeNode
	new( _key:luxe.structures.BinarySearchTreeNode.K, _value:luxe.structures.BinarySearchTreeNode.T, _nodecount:Int ) : Void
luxe class : luxe.tween.actuators.IGenericActuator
	snapping( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	smartRotation( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	reverse( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	repeat( ?times:Int ) : luxe.tween.actuators.IGenericActuator
	reflect( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	onUpdate( handler:null, ?parameters:Array ) : luxe.tween.actuators.IGenericActuator
	onRepeat( handler:null, ?parameters:Array ) : luxe.tween.actuators.IGenericActuator
	onComplete( handler:null, ?parameters:Array ) : luxe.tween.actuators.IGenericActuator
	ease( easing:luxe.tween.easing.IEasing ) : luxe.tween.actuators.IGenericActuator
	delay( duration:Float ) : luxe.tween.actuators.IGenericActuator
	autoVisible( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
luxe class : luxe.tween.actuators.GenericActuator
	stop( properties:null, complete:Bool, sendEvent:Bool ) : Void
	snapping( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	smartRotation( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	reverse( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	resume(  ) : Void
	repeat( ?times:Int ) : luxe.tween.actuators.IGenericActuator
	reflect( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	pause(  ) : Void
	onUpdate( handler:null, ?parameters:Array ) : luxe.tween.actuators.IGenericActuator
	onRepeat( handler:null, ?parameters:Array ) : luxe.tween.actuators.IGenericActuator
	onComplete( handler:null, ?parameters:Array ) : luxe.tween.actuators.IGenericActuator
	move(  ) : Void
	ease( easing:luxe.tween.easing.IEasing ) : luxe.tween.actuators.IGenericActuator
	delay( duration:Float ) : luxe.tween.actuators.IGenericActuator
	autoVisible( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	apply(  ) : Void
	target:null
	properties:null
	id:String
	duration:Float
	new( target:null, duration:Float, properties:null ) : Void
luxe class : luxe.tween.actuators.SimpleActuator
	stop( properties:null, complete:Bool, sendEvent:Bool ) : Void
	resume(  ) : Void
	pause(  ) : Void
	onUpdate( handler:null, ?parameters:Array ) : luxe.tween.actuators.IGenericActuator
	move(  ) : Void
	delay( duration:Float ) : luxe.tween.actuators.IGenericActuator
	autoVisible( ?value:Bool ) : luxe.tween.actuators.IGenericActuator
	new( target:null, duration:Float, properties:null ) : Void
luxe class : luxe.tween.easing.Expo
	easeIn property( accessor,null ) 
	easeInOut property( accessor,null ) 
	easeOut property( accessor,null ) 
luxe class : luxe.tween.easing.IEasing
	ease( t:Float, b:Float, c:Float, d:Float ) : Float
	calculate( k:Float ) : Float
luxe class : luxe.tween.easing.ExpoEaseOut
	ease( t:Float, b:Float, c:Float, d:Float ) : Float
	calculate( k:Float ) : Float
	new(  ) : Void
luxe class : luxe.tween.Actuate
	defaultActuator:Class
	defaultEase:luxe.tween.easing.IEasing
	apply( target:null, properties:null, ?customActuator:Class ) : luxe.tween.actuators.IGenericActuator
	motionPath( target:null, duration:Float, properties:null, ?overwrite:Bool ) : luxe.tween.actuators.IGenericActuator
	pause( target:null ) : Void
	pauseAll(  ) : Void
	reset(  ) : Void
	resume( target:null ) : Void
	resumeAll(  ) : Void
	stop( target:null, ?properties:null, ?complete:Bool, ?sendEvent:Bool ) : Void
	timer( duration:Float, ?customActuator:Class ) : luxe.tween.actuators.IGenericActuator
	tween( target:null, duration:Float, properties:null, ?overwrite:Bool, ?customActuator:Class ) : luxe.tween.actuators.IGenericActuator
	unload( actuator:luxe.tween.actuators.GenericActuator ) : Void
	update( target:null, duration:Float, ?start:Array, ?end:Array, ?overwrite:Bool ) : luxe.tween.actuators.IGenericActuator
luxe class : luxe.tween._Actuate.TweenTimer
	progress:Float
	new( progress:Float ) : Void
luxe class : luxe.tween.MotionPath
	line( x:Float, y:Float, ?strength:Float ) : luxe.tween.MotionPath
	bezier( x:Float, y:Float, controlX:Float, controlY:Float, ?strength:Float ) : luxe.tween.MotionPath
	y property( accessor,null ) 
	x property( accessor,null ) 
	new(  ) : Void
luxe class : luxe.tween.IComponentPath
	calculate( k:Float ) : Float
	start:Float
	 ••• Unknown type, get:null set:nullend
luxe class : luxe.tween.ComponentPath
	calculate( k:Float ) : Float
	addPath( path:luxe.tween.BezierPath ) : Void
	end property( accessor,null ) 
	start:Float
	new(  ) : Void
luxe class : luxe.tween.BezierPath
	calculate( start:Float, k:Float ) : Float
	strength:Float
	end:Float
	control:Float
	new( end:Float, control:Float, strength:Float ) : Void
luxe class : luxe.tween.LinearPath
	calculate( start:Float, k:Float ) : Float
	new( end:Float, strength:Float ) : Void
luxe class : luxe.tween.actuators.MethodActuator
	apply(  ) : Void
	new( target:null, duration:Float, properties:null ) : Void
luxe class : luxe.tween.actuators.MotionPathActuator
	apply(  ) : Void
	new( target:null, duration:Float, properties:null ) : Void
luxe class : luxe.tween.actuators.PropertyDetails
	target:null
	start:Float
	propertyName:String
	isField:Bool
	change:Float
	new( target:null, propertyName:String, start:Float, change:Float, ?isField:Bool ) : Void
luxe class : luxe.tween.actuators.PropertyPathDetails
	path:luxe.tween.IComponentPath
	new( target:null, propertyName:String, path:luxe.tween.IComponentPath, ?isField:Bool ) : Void
luxe class : luxe.tween.easing.ExpoEaseIn
	ease( t:Float, b:Float, c:Float, d:Float ) : Float
	calculate( k:Float ) : Float
	new(  ) : Void
luxe class : luxe.tween.easing.ExpoEaseInOut
	ease( t:Float, b:Float, c:Float, d:Float ) : Float
	calculate( k:Float ) : Float
	new(  ) : Void
luxe class : luxe.tween.easing.Quad
	easeIn property( accessor,null ) 
	easeInOut property( accessor,null ) 
	easeOut property( accessor,null ) 
luxe class : luxe.tween.easing.QuadEaseIn
	ease( t:Float, b:Float, c:Float, d:Float ) : Float
	calculate( k:Float ) : Float
	new(  ) : Void
luxe class : luxe.tween.easing.QuadEaseInOut
	ease( t:Float, b:Float, c:Float, d:Float ) : Float
	calculate( k:Float ) : Float
	new(  ) : Void
luxe class : luxe.tween.easing.QuadEaseOut
	ease( t:Float, b:Float, c:Float, d:Float ) : Float
	calculate( k:Float ) : Float
	new(  ) : Void
luxe class : luxe.utils.GeometryUtils
	intersect_ray_plane( _ray_start:luxe.Vector, _ray_dir:luxe.Vector, _plane_normal:luxe.Vector, _plane_point:luxe.Vector ) : luxe.Vector
	point_in_polygon( _point:luxe.Vector, _offset:luxe.Vector, _verts:Array ) : Bool
	random_point_in_unit_circle(  ) : luxe.Vector
	segments_for_smooth_circle( _radius:Float, ?_smooth:Float ) : Float
	luxe:luxe.Core
	new( _luxe:luxe.Core ) : Void
luxe class : luxe.utils.JSON
	encode property( inline,null ) 
	decode property( inline,null ) 
	stringify property( inline,null ) 
	parse property( inline,null ) 
luxe class : luxe.utils.JSONDecoder
	getValue(  ) : null
	new( s:String, strict:Bool ) : Void
luxe class : luxe.utils.JSONEncoder
	_trace( e:String ) : Void
	debug:Bool
	getString(  ) : String
	new( value:null ) : Void
luxe class : luxe.utils.JSONParseError
	toString(  ) : String
	get_text(  ) : String
	get_location(  ) : Int
	location property( accessor,null ) 
	text property( accessor,null ) 
	new( ?message:String, ?location:Int, ?text:String ) : Void
luxe class : luxe.utils.JSONToken
	value:null
	type:luxe.utils.JSONTokenType
	new( ?type:luxe.utils.JSONTokenType, ?value:null ) : Void
luxe class : luxe.utils.JSONTokenizer
	parseError( message:String ) : Void
	getNextToken(  ) : luxe.utils.JSONToken
	new( s:String, strict:Bool ) : Void
luxe class : luxe.utils._UUID.Rule30
	createWithLength( length:Int ) : luxe.utils._UUID.Rule30
	getBits( length:Int ) : Int
luxe class : luxe.utils.UUID
	generate_undashed(  ) : String
	get(  ) : String
luxe class : luxe.utils.Utils
	file_bytes_to_class( _file:String, _outfile:String, ?_string_length:Int ) : Void
	arrayToBytes( array:Array ) : haxe.io.Bytes
	bytes_to_string( bytes:Int ) : String
	nearest_power_of_two( _value:Int ) : Int
	clamp( value:Float, min:Float, max:Float ) : Float
	uuid(  ) : String
	luxe:luxe.Core
	geometry:luxe.utils.GeometryUtils
	new( _luxe:luxe.Core ) : Void
