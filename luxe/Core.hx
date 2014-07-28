package luxe;

import snow.Snow;
import snow.types.Types;
import snow.utils.ByteArray;
import snow.window.Window;

import Luxe;
import luxe.Audio;
import luxe.Events;
import luxe.Input;
import luxe.Scene;
import luxe.Debug;
import luxe.Timer;
import luxe.Physics;

import luxe.debug.ProfilerDebugView;

import phoenix.Renderer;
import phoenix.Texture;
import phoenix.Shader;

import luxe.Game;
import luxe.Log._verbose;
import luxe.Log._debug;
import luxe.Log.log;


#if (!luxe_threading_disabled && luxe_native)

    #if neko
        import neko.vm.Thread;
        import neko.vm.Mutex;
    #else
        import cpp.vm.Thread;
        import cpp.vm.Mutex;
    #end

    typedef LoadTextureInfo = {
        onloaded : Texture->Void,
        bytes : ByteArray,
        id : String
    }

    typedef LoadShaderInfo = {
        onloaded:Shader->Void,
        ps_id : String,
        vs_id : String
    }

    enum CoreThreadRequest {
        load_texture;
        load_shader;
    }

#end //!luxe_threading_disabled && luxe_native

@:noCompletion
@:keep
@:log_as('luxe')
class Core extends snow.App {

        //the game object running the core
    public var game : Game;

#if (luxe_native && !luxe_threading_disabled)

    public var core_thread : Thread;
    public var thread_message : Dynamic;

#end //luxe_native

        //if the console is displayed atm
    public var console_visible : Bool = false;
        /** Set to true if the app is running without a window */
    public var headless : Bool = false;


//Sub Systems, mostly in order of importance
    public var debug    : Debug;
    public var draw     : Draw;
    public var timer    : Timer;
    public var events   : Events;
    public var input    : Input;
    public var audio    : Audio;
    public var scene    : Scene;
    public var renderer : Renderer;
    public var screen   : luxe.Screen;
    public var physics  : Physics;

//Mouse and fake mouse touch
    var _mouse_pos : Vector;
    var _touch_pos : Vector;

//Additional external internal updates
        //the list of internal update handlers, for calling
    var _update_handlers : Map<String,Float->Void>;
        //add an internal update
    public function add_internal_update( _update:Float->Void ) {
        var _uuid = Luxe.utils.uniqueid();
        _update_handlers.set(_uuid,_update);
        return _uuid;
    }

//flags

       //if we have started a shutdown
    public var shutting_down : Bool = false;
    public var has_shutdown : Bool = false;


    public function new( _game:Game ) {

        super();

        game = _game;

            //Store the core for reference in the game
        game._luxe = this;

            //make sure we know what thread we start in
        #if (luxe_native && !luxe_threading_disabled)
            core_thread = Thread.current();
        #end //luxe_native

            //Create internal stuff
        _update_handlers = new Map();
        _mouse_pos = new Vector();
        _touch_pos = new Vector();
        Luxe.mouse = _mouse_pos;

            //Set external references
        Luxe.core = this;
        Luxe.utils = new luxe.utils.Utils(this);

    } //new

        //This gets called once snow has booted us - this is
    override function ready() {

        Luxe.version = haxe.Resource.getString('version');
            //Don't change this, it matches semantic versioning http://semver.org/
        Luxe.build = Luxe.version + haxe.Resource.getString('build');

        log('version ${Luxe.build}');

            //Create the subsystems
        init();

            //
        _debug('ready.');

            //Call the main ready function
            //and send the ready event to the game
        game.ready();

            //After we are ready we can init the scene
        scene.init();
            //We can also call start, for now, as this will be deferred later
            //when there is a restart etc
        scene.reset();

            //Reset the physics (starts the timer etc)
        physics.reset();

            //Now, if no main loop is requested we should immediately shutdown
        if(!app.snow_config.has_loop) {
            shutdown();
        }

    } //ready


    public function init() {

            //Create the subsystems
        _debug('creating subsystems...');

            //Order is important here

        debug = new Debug( this ); Luxe.debug = debug;
        draw = new Draw( this );
        timer = new Timer( this );
        events = new Events();
        audio = new Audio( this );
        input = new Input( this );
        physics = new Physics( this );

            //flag for later
        if(app.window == null) {
            headless = true;
        }

        if(!headless) {
                //create the renderer
            renderer = new Renderer( this );
                //assign the globals
            Luxe.renderer = renderer;
        }

            //if there is a window, store the sizes
        var _window_x = 0;
        var _window_y = 0;
        var _window_w = 0;
        var _window_h = 0;

        if(app.window != null) {
            _window_x = app.window.x;
            _window_y = app.window.y;
            _window_w = app.window.width;
            _window_h = app.window.height;
        }

            //store the size for access from API
        screen = new luxe.Screen( this, _window_x, _window_y, _window_w, _window_h );

            //Now make sure
            //they start up

        debug.init();
        timer.init();
        audio.init();
        input.init();

        if(!headless) {
            renderer.init();
        }

        physics.init();

        Luxe.audio = audio;
        Luxe.draw = draw;
        Luxe.events = events;
        Luxe.timer = timer;
        Luxe.input = input;

        if(!headless) {
            Luxe.camera = new luxe.Camera({ name:'default camera', view:renderer.camera });
            Luxe.resources = renderer.resource_manager;
        }

        Luxe.physics = physics;

        scene = new Scene();
        scene.name = 'default scene';
        Luxe.scene = scene;

        if(!headless) scene.add(Luxe.camera);

            //finally, create the debug console
        if(!headless) {
            debug.create_debug_console();
        }

            //and even more finally, tell snow we want to
            //know when it's rendering the window so we can draw
        if(app.window != null && !headless) {

            app.window.onrender = render;

                //start here because end is called first below
            debug.start(core_tag_update);
            debug.start(core_tag_renderdt);

        } //app.window != null && !headless

    } //init

    public function shutdown() {

        _debug('shutting down...');

            //Make sure all systems know we are going down
        shutting_down = true;

            //shutdown the game class
        game.destroyed();

            //shutdown the default scene
        scene.destroy();

            //Order is imporant here too
        if(renderer != null) {
            renderer.destroy();
        }

        physics.destroy();
        input.destroy();
        audio.destroy();
        timer.destroy();
        events.destroy();
        debug.destroy();


            //Clear up for GC
        input = null;
        audio = null;
        events = null;
        timer = null;
        debug = null;
        Luxe.utils = null;

            //Flag it
        has_shutdown = true;

        _debug('goodbye.');

            //shutdown snow
        app.shutdown();

    } //shutdown

        //called by snow
    override function update( dt:Float ) {


        #if luxe_fullprofile
            _verbose('on_update ' + Luxe.time);
        #end //luxe_fullprofile

        if(has_shutdown) return;

        debug.end(core_tag_update);
        debug.start(core_tag_update);

            //Update all the subsystems, again, order important
//Timers first
            #if luxe_fullprofile debug.start(core_tag_timer); #end
        timer.process();
            #if luxe_fullprofile debug.end(core_tag_timer); #end
//Input second
            #if luxe_fullprofile debug.start(core_tag_input); #end
        input.process();
            #if luxe_fullprofile debug.end(core_tag_input); #end
//Audio
            #if luxe_fullprofile debug.start(core_tag_audio); #end
        audio.process();
            #if luxe_fullprofile debug.end(core_tag_audio); #end
//Events
            #if luxe_fullprofile debug.start(core_tag_events); #end
        events.process();
            #if luxe_fullprofile debug.end(core_tag_events); #end
//Physics
            //note that this does not update the physics, simply processes the active engines
        physics.process();

//Loading thread

        process_loading_thread();

//Run update callbacks
            #if luxe_fullprofile debug.start(core_tag_updates); #end

        for(_update in _update_handlers) {
            _update(dt);
        }
            #if luxe_fullprofile debug.end(core_tag_updates); #end

//Update the default scene
            debug.start(core_tag_scene);
        scene.update(dt);
            debug.end(core_tag_scene);

//Update the game class for the game
            debug.start( game_tag_update );
        game.update(dt);
            debug.end( game_tag_update );

//And finally the debug stuff
            #if luxe_fullprofile debug.start(core_tag_debug); #end
        debug.process();
            #if luxe_fullprofile debug.end(core_tag_debug); #end

    } //update

    function render( window:Window ) {

        debug.end(core_tag_renderdt);
        debug.start(core_tag_renderdt);

        debug.start(core_tag_render);

        game.pre_render();

            //note that this does not update the physics, simply processes the active engines
        physics.render();

        if(!headless) {
            renderer.process();
        }

        game.post_render();

        debug.end(core_tag_render);

    } //render

    public function show_console(_show:Bool = true) {

        console_visible = _show;
        debug.show_console(console_visible);

    } //show_console

//window events
//     public function onresize(e) {
//             //update the screen sizes
//         Luxe.screen.w = e.x;
//         Luxe.screen.h = e.y;

//             //update internal render views
//         debug.onresize(e);
//             //and the defaults
//         renderer.onresize(e);
//             //and then the game
//         if(game.onresize != null) game.onresize(e);

//     } // onresize

//input events
//keys
    override function onkeydown( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {

        var event : KeyEvent = {
            scancode : scancode,
            keycode : keycode,
            state : InteractState.down,
            mod : mod,
            repeat : repeat,
            timestamp : timestamp,
            window_id : window_id
        }

        if(!shutting_down) {
                //check for named input
            input.check_named_keys(event, true);
                //pass to scene
            scene.onkeydown(event);
                //forward to debug module
            if(debug != null) {
                debug.onkeydown(event);
            }
        }

        game.onkeydown(event);

        if(keycode == Key.BACKQUOTE) {
            show_console( !console_visible );
        }

    } //onkeydown

    override function onkeyup( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {

        var event : KeyEvent = {
            scancode : scancode,
            keycode : keycode,
            state : InteractState.up,
            mod : mod,
            repeat : repeat,
            timestamp : timestamp,
            window_id : window_id
        }

        if(!shutting_down) {
                //check for named input
            input.check_named_keys(event);
                //pass to scene
            scene.onkeyup(event);
                //forward to debug module
            if(debug != null) {
                debug.onkeyup(event);
            }
        }

        game.onkeyup(event);

    } //onkeyup

//input

    public function oninputdown( _name:String, e:InputEvent ) {

        if(!shutting_down) {
            scene.oninputdown(_name,e);
        }

        game.oninputdown(_name,e);

    } //oninputdown

    public function oninputup( _name:String, e:InputEvent ) {

        if(!shutting_down) {
            scene.oninputup(_name,e);
        }

        game.oninputup(_name,e);

    } //oninputup

//mouse
    function mouse_button_from_number( button : Int ) : MouseButton {

        switch(button) {

            case    1 : return MouseButton.left;
            case    2 : return MouseButton.middle;
            case    3 : return MouseButton.right;
            case    4 : return MouseButton.extra1;
            case    5 : return MouseButton.extra2;
            default   : return MouseButton.none;

        }

        return MouseButton.none;

    } //mouse_button_from_number

    override function onmousedown( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

            //this has to be a new value because if it's cached it sends in references that get kept by user code
        _mouse_pos = new luxe.Vector( x, y );
        Luxe.mouse = _mouse_pos;

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.down,
            button : mouse_button_from_number(button),
            x : x,
            y : y,
            xrel : x,
            yrel : y,
            pos : _mouse_pos,
        }

        if(!shutting_down) {
            input.check_named_mouse(event, true);
            scene.onmousedown(event);
            debug.onmousedown(event);
        }

        game.onmousedown(event);

    } //onmousedown

    override function onmouseup( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        _mouse_pos = new luxe.Vector( x, y );
        Luxe.mouse = _mouse_pos;

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.up,
            button : mouse_button_from_number(button),
            x : x,
            y : y,
            xrel : x,
            yrel : y,
            pos : _mouse_pos
        }

        if(!shutting_down) {
            debug.onmouseup(event);
            input.check_named_mouse(event);
            scene.onmouseup(event);
        }

        game.onmouseup(event);

    } //onmouseup

    override function onmousemove( x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int ) {

        _mouse_pos = new luxe.Vector( x, y );
        Luxe.mouse = _mouse_pos;

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.move,
            button : MouseButton.none,
            x : x,
            y : y,
            xrel : x,
            yrel : y,
            pos : _mouse_pos,
        }

        if(!shutting_down) {
            scene.onmousemove(event);
            debug.onmousemove(event);
        }

        game.onmousemove(event);

    } //onmousemove

    override function onmousewheel( x:Int, y:Int, timestamp:Float, window_id:Int ) {

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.wheel,
            button : MouseButton.none,
            x : x,
            y : y,
            xrel : x,
            yrel : y,
            pos : _mouse_pos,
        }

        if(!shutting_down) {
            input.check_named_mouse(event, false);
            scene.onmousewheel(event);
            debug.onmousewheel(event);
        }

        game.onmousewheel(event);

    } //onmousewheel

//touch

    override function ontouchdown( x:Float, y:Float, touch_id:Int, timestamp:Float ) {

         _touch_pos = new luxe.Vector( x, y );

        var event : TouchEvent = {
            state : InteractState.down,
            timestamp : timestamp,
            touch_id : touch_id,
            x : x,
            y : y,
            dx : x,
            dy : y,
            pos : _touch_pos
        }

        if(!shutting_down) {
            scene.ontouchdown(event);
        }

        game.ontouchdown(event);

            //3 finger tap when console opens will switch tabs
        if(touch_id == 3) {
            if(console_visible) {
                debug.switch_view();
            }
        }

            //4 finger tap toggles console
        if(touch_id == 4) {
            show_console( !console_visible );
        }

    } //ontouchdown

    override function ontouchup( x:Float, y:Float, touch_id:Int, timestamp:Float ) {

         _touch_pos = new luxe.Vector( x, y );

        var event : TouchEvent = {
            state : InteractState.up,
            timestamp : timestamp,
            touch_id : touch_id,
            x : x,
            y : y,
            dx : x,
            dy : y,
            pos : _touch_pos
        }

        if(!shutting_down) {
                //pass to scene
            scene.ontouchup( event );
        }

        game.ontouchup( event );

    } //ontouchup

    override function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {

        _touch_pos = new luxe.Vector( x, y );

        var event : TouchEvent = {
            state : InteractState.move,
            timestamp : timestamp,
            touch_id : touch_id,
            x : x,
            y : y,
            dx : dx,
            dy : dy,
            pos : _touch_pos
        }

        if(!shutting_down) {
                //pass to scene
            scene.ontouchmove(event);
        }

        game.ontouchmove(event);

    } //ontouchmove

//gamepad

    override function ongamepadaxis( gamepad:Int, axis:Int, value:Float, timestamp:Float ) {

        var event : GamepadEvent = {
            timestamp : timestamp,
            type : GamepadEventType.axis,
            state : InteractState.axis,
            gamepad : gamepad,
            button : -1,
            axis : axis,
            value : value
        }

        if(!shutting_down) {
            scene.ongamepadaxis(event);
        }

        game.ongamepadaxis(event);

    } //ongamepadaxis

    override function ongamepadbuttondown( gamepad:Int, button:Int, value:Float, timestamp:Float ) {

        var event : GamepadEvent = {
            timestamp : timestamp,
            type : GamepadEventType.button,
            state : InteractState.down,
            gamepad : gamepad,
            button : button,
            axis : -1,
            value : value
        }

        if(!shutting_down) {
            scene.ongamepadbuttondown(event);
        }

        game.ongamepadbuttondown(event);

    } //ongamepadbuttondown

    override function ongamepadbuttonup( gamepad:Int, button:Int, value:Float, timestamp:Float ) {

        var event : GamepadEvent = {
            timestamp : timestamp,
            type : GamepadEventType.button,
            state : InteractState.up,
            gamepad : gamepad,
            button : button,
            axis : -1,
            value : value
        }

        if(!shutting_down) {
            scene.ongamepadbuttonup(event);
        }

        game.ongamepadbuttonup(event);

    } //ongamepadbuttonup

    override function ongamepaddevice( gamepad:Int, type:GamepadDeviceEventType, timestamp:Float ) {

        var _event_type : GamepadEventType = GamepadEventType.unknown;

        switch(type) {
            case GamepadDeviceEventType.device_added:
                _event_type = GamepadEventType.device_added;
            case GamepadDeviceEventType.device_removed:
                _event_type = GamepadEventType.device_removed;
            case GamepadDeviceEventType.device_remapped:
                _event_type = GamepadEventType.device_remapped;
            default:
        }


        var event : GamepadEvent = {
            timestamp : timestamp,
            type : _event_type,
            state : InteractState.none,
            gamepad : gamepad,
            button : -1,
            axis : -1,
            value : 0
        }

        game.ongamepaddevice(event);

    }

        /** return what the game decides for runtime config */
    override function config( config:AppConfig ) : AppConfig {

       return game.config( config );

    } //config

    function process_loading_thread() {
        #if (luxe_native && !luxe_threading_disabled)
//Background threads sending requests our way

            thread_message = Thread.readMessage(false);

            if(thread_message != null) {

                var type : CoreThreadRequest = thread_message.type;
                switch( type ) {
                    case CoreThreadRequest.load_texture: {
                        var info : LoadTextureInfo = cast thread_message.info;
                        Luxe.loadTexture( info.id, info.onloaded, false ); //, info.bytes :todo:snow:
                    } //load_texture

                    case CoreThreadRequest.load_shader: {
                        var info : LoadShaderInfo = cast thread_message.info;
                        Luxe.loadShader( info.ps_id, info.vs_id, info.onloaded );
                    } //load_shader

                } //switch type

            } //thread_message

        #end //(luxe_native && !luxe_threading_disabled)
    } //process_loading_thread

//Noisy stuff

    static var core_tag_update : String = 'real dt';
    static var core_tag_renderdt : String = 'render dt';
    static var game_tag_update : String = 'game.update';
    static var core_tag_render : String = 'core.render';
    static var core_tag_debug : String = 'core.debug';
    static var core_tag_updates : String = 'core.update_callbacks';
    static var core_tag_events : String = 'core.events';
    static var core_tag_audio : String = 'core.audio';
    static var core_tag_input : String = 'core.input';
    static var core_tag_timer : String = 'core.timer';
    static var core_tag_scene : String = 'core.scene';


} //Core
