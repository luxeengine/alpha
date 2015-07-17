package luxe;

import snow.Snow;
import snow.types.Types;
import snow.system.window.Window;
import snow.system.assets.Asset;
import snow.api.buffers.Uint8Array;

import Luxe;
import luxe.IO;
import luxe.Audio;
import luxe.Events;
import luxe.Emitter;
import luxe.Input;
import luxe.Scene;
import luxe.Debug;
import luxe.Timer;
import luxe.Physics;
import luxe.AppConfig;
import luxe.Resources;

import luxe.debug.ProfilerDebugView;

import phoenix.Renderer;
import phoenix.Texture;
import phoenix.Shader;

import luxe.Game;
import luxe.Log.*;


@:keep
@:noCompletion
@:log_as('luxe')

class Core
extends
    #if luxe_appfixedtimestep
        snow.App.AppFixedTimestep
    #else
        snow.App
    #end
{

        //the game object running the core
    public var game : Game;
    public var appconfig : AppConfig;

        //if the console is displayed atm
    public var console_visible : Bool = false;
        /** Set to true if the app is running without a window */
    public var headless : Bool = false;


//Sub Systems, mostly in order of importance
    public var emitter   : Emitter<Ev>;
    public var debug     : Debug;
    public var io        : IO;
    public var draw      : Draw;
    public var timer     : Timer;
    public var events    : Events;
    public var input     : Input;
    public var audio     : Audio;
    public var scene     : Scene;
    public var resources : Resources;
    public var renderer  : Renderer;
    public var screen    : luxe.Screen;
    public var physics   : Physics;

//flags

       //if we have started a shutdown
    public var shutting_down : Bool = false;
    public var has_shutdown : Bool = false;
    public var inited : Bool = false;

    var init_config: luxe.AppConfig;

    @:noCompletion public function new( _game:Game, _config:luxe.AppConfig ) {

        super();

        init_config = _config;
        game = _game;

            //Store the core for reference in the game
        game.app = this;

            //Create internal stuff
        emitter = new Emitter<Ev>();

            //Set external references
        Luxe.core = this;
        Luxe.utils = new luxe.utils.Utils(this);

    } //new


        //This gets called once snow has booted us
    override function ready() {

        if(luxe.Log.get_level() > 1) {
            log('log / level to ${luxe.Log.get_level()}' );
            log('log / filter : ${luxe.Log.get_filter()}');
            log('log / exclude : ${luxe.Log.get_exclude()}');
        }

        Luxe.version = haxe.Resource.getString('version');
            //Don't change this, it matches semantic versioning http://semver.org/
        Luxe.build = Luxe.version + haxe.Resource.getString('build');

        log('${Luxe.snow.platform} / version ${Luxe.build}');

            //flag for later
        headless = (app.window == null);

            //:todo: I'm not happy about this but for now it will do
        #if no_default_font

            init(null);

        #else

            if(!headless) {

                var _font_name = 'default.png';
                var _font_image = Uint8Array.fromBytes(haxe.Resource.getBytes(_font_name));
                var _font_load = app.assets.image_from_bytes(_font_name, _font_image);

                _font_load.then(function(asset:AssetImage) {
                    init(asset);
                }).error(function(error) {
                    log("failed to load default font, things will probably not look right... $error");
                    init(null);
                });

            } else {

                init(null);

            }

        #end //no_default_font

    } //ready

    override function ondestroy() {

        shutting_down = true;

        log('shutting down...');

            //shutdown the game class
        game.ondestroy();

            //shutdown the default scene
        emitter.emit(Ev.destroy);

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
        emitter = null;
        input = null;
        audio = null;
        events = null;
        timer = null;
        debug = null;
        Luxe.utils = null;

            //Flag it
        has_shutdown = true;

        log('goodbye.');

    }

    public function init( asset:AssetImage ) {

        _debug('creating subsystems...');

            //Order is important here

        Luxe.debug = debug = new Debug( this );
        Luxe.io = io = new IO( this );

        draw = new Draw( this );
        timer = new Timer( this );
        events = new Events();
        audio = new Audio( this );
        input = new Input( this );
        physics = new Physics( this );

            //should be up earlier
        resources = new Resources();
        Luxe.resources = resources;

        if(!headless) {
                //listen for window events
            app.window.onevent = window_event;
                //create the renderer
            renderer = new Renderer( this, asset );
                //assign the globals
            Luxe.renderer = renderer;
        }

            //if there is a window,
            //store the size
        var _window_w = 0;
        var _window_h = 0;

        if(app.window != null) {
            _window_w = app.window.width;
            _window_h = app.window.height;
        }

            //store the size for access from API
        screen = new luxe.Screen( this, _window_w, _window_h );

            //Now make sure
            //they start up

        debug.init();
        io.init();
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
        }

        Luxe.physics = physics;

        scene = new Scene('default scene');
        Luxe.scene = scene;

        if(!headless) {
            scene.add(Luxe.camera);
            debug.create_debug_console();
        }

            //
        internal_pre_ready();

    } //init

    function internal_pre_ready() {

        if(!headless) {
                //Don't remove this, :todo:
                //it's a catch for crashing because
                //we don't have a valid GL context, until the query
                //is finalized on snow side
            log('opengl /');
            log(snow.modules.opengl.GL.versionString());

            _debug('ready. loading default parcel ' + appconfig.preload);

                //pre load config parcel
            var default_parcel = new Parcel({
                id:         'default_parcel',
                system:     resources,
                bytes:      appconfig.preload.bytes,
                texts:      appconfig.preload.texts,
                jsons:      appconfig.preload.jsons,
                textures:   appconfig.preload.textures,
                fonts:      appconfig.preload.fonts,
                shaders:    appconfig.preload.shaders,
                sounds:     appconfig.preload.sounds,
                oncomplete: internal_ready,
                onfailed: function(_error:Dynamic) {
                    log('config / preload / failed to load');
                    throw Error.error(_error);
                }
            });

            default_parcel.load();

        } else {

            internal_ready(null);

        }

    } //internal_pre_ready

    function internal_ready(_) {

            //and even more finally, tell snow we want to
            //know when it's rendering the window so we can draw
        if(app.window != null && !headless) {

            app.window.onrender = render;

                //start here because end is called first below
            debug.start(Tag.update, 50);
            debug.start(Tag.renderdt, 50);

        } //app.window != null && !headless

            //Call the main ready function
            //and send the ready event to the game
        game.ready();

            //shutdown can come from the ready function
        if(!shutting_down) {

                //emit the init event
                //so that scene and others can start up
            emitter.emit(Ev.init);
            inited = true;

                //Reset the physics (starts the timer etc)
            physics.reset();

                //Now, if no main loop is requested we should immediately shutdown
            if(!app.snow_config.has_loop) {
                shutdown();
            }

        } //!shutting down

    } //internal_ready

    public function shutdown() {

            //Make sure all systems know we are going down
        shutting_down = true;

            //shutdown snow, which calls ondestroy for us
        Luxe.next(app.shutdown);

    } //shutdown

    public function on<T>(event:Ev, handler:T->Void ) {
        emitter.on(event, handler);
    }

    public function off<T>(event:Ev, handler:T->Void ) {
        return emitter.off(event, handler);
    }

    public function emit<T>(event:Ev, ?data:T) {
        return emitter.emit(event, data);
    }

        //called by snow
    override function onevent( event:snow.types.Types.SystemEvent ) {

        if(!inited) return;

            //forward to game class
        game.onevent( event );

    } //onevent

        //called by snow
    override function update( dt:Float ) {

        #if luxe_fullprofile
            _verbose('on_update ' + Luxe.time);
        #end //luxe_fullprofile

        if(has_shutdown) return;
        if(!inited) return;

        debug.end(Tag.update);
        debug.start(Tag.update);

            //Update all the subsystems, again, order important
//Timers first
            #if luxe_fullprofile debug.start(Tag.timer); #end
        timer.process();
            #if luxe_fullprofile debug.end(Tag.timer); #end
//Input second
            #if luxe_fullprofile debug.start(Tag.input); #end
        input.process();
            #if luxe_fullprofile debug.end(Tag.input); #end
//Audio
            #if luxe_fullprofile debug.start(Tag.audio); #end
        audio.process();
            #if luxe_fullprofile debug.end(Tag.audio); #end
//Events
            #if luxe_fullprofile debug.start(Tag.events); #end
        events.process();
            #if luxe_fullprofile debug.end(Tag.events); #end
//Physics
            //note that this does not update the physics, simply processes the active engines
        physics.process();

//Run update callbacks
            debug.start(Tag.updates);
        emitter.emit(Ev.update, dt);
            debug.end(Tag.updates);

//Update the game class for the game
            debug.start( Tag.game_update );
        game.update(dt);
            debug.end( Tag.game_update );

//And finally the debug stuff
            #if luxe_fullprofile debug.start(Tag.debug); #end
        debug.process();
            #if luxe_fullprofile debug.end(Tag.debug); #end

    } //update

    function window_event( _event:snow.types.Types.WindowEvent ) {

        if(shutting_down) return;
        if(!inited) return;

        emitter.emit(Ev.window, _event );

        switch(_event.type) {

            case WindowEventType.moved : {
                emitter.emit(Ev.windowmoved, _event );
                game.onwindowmoved( _event );
            } //moved

            case WindowEventType.resized : {
                screen.internal_resized(_event.event.x, _event.event.y);
                renderer.internal_resized(_event.event.x, _event.event.y);
                emitter.emit(Ev.windowresized, _event );
                game.onwindowresized( _event );
            } //resized

            case WindowEventType.size_changed : {
                screen.internal_resized(_event.event.x, _event.event.y);
                renderer.internal_resized(_event.event.x, _event.event.y);
                emitter.emit(Ev.windowsized, _event );
                game.onwindowsized( _event );
            } //size_changed

            case WindowEventType.minimized : {
                emitter.emit(Ev.windowminimized, _event );
                game.onwindowminimized( _event );
            } //minimized

            case WindowEventType.restored : {
                emitter.emit(Ev.windowrestored, _event );
                game.onwindowrestored( _event );
            } //restored

            default: {}

        } //switch

    } //window_event

    function render( window:Window ) {

        if(shutting_down) return;
        if(!inited) return;

        debug.end(Tag.renderdt);
        debug.start(Tag.renderdt);

        if(!headless) {

            debug.start(Tag.render);

            emitter.emit(Ev.prerender);
            game.onprerender();

                emitter.emit(Ev.render);
                game.onrender();
                renderer.process();

            emitter.emit(Ev.postrender);
            game.onpostrender();

            debug.end(Tag.render);

        } //!headless

    } //render

    public function show_console(_show:Bool = true) {

        console_visible = _show;
        debug.show_console(console_visible);

    } //show_console

//input events
//keys
    override function onkeydown( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {

        if(!inited) return;

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
            emitter.emit(Ev.keydown, event);

            game.onkeydown(event);

            if(scancode == Scan.grave) {
                show_console( !console_visible );
            }

        } //!shutting down

    } //onkeydown

    override function onkeyup( keycode:Int, scancode:Int, repeat:Bool, mod:ModState, timestamp:Float, window_id:Int ) {

        if(!inited) return;

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
            emitter.emit(Ev.keyup, event);

            game.onkeyup(event);

        } //!shutting down

    } //onkeyup

    override function ontextinput( text:String, start:Int, length:Int, type:snow.types.TextEventType, timestamp:Float, window_id:Int ) {

        if(!inited) return;

        var _type : TextEventType = TextEventType.unknown;

        switch(type) {
            case edit: _type = TextEventType.edit;
            case input: _type = TextEventType.input;
            default: {
                return;
            }
        }

        var event : TextEvent = {
            text : text,
            start : start,
            length : length,
            type : _type,
            timestamp : timestamp,
            window_id : window_id
        }

        if(!shutting_down) {

            emitter.emit(Ev.textinput, event);

            game.ontextinput(event);

        } //!shutting_down

    } //ontextinput

//input

    public function oninputdown( name:String, event:InputEvent ) {

        if(!inited) return;

        if(!shutting_down) {

            emitter.emit(Ev.inputdown, { name:name, event:event });

            game.oninputdown( name, event );

        } //!shutting_down

    } //oninputdown

    public function oninputup( name:String, event:InputEvent ) {

        if(!inited) return;

        if(!shutting_down) {

            emitter.emit(Ev.inputup, { name:name, event:event });

            game.oninputup( name, event );

        } //!shutting_down

    } //oninputup

//mouse

    override function onmousedown( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        if(!inited) return;

            //this has to be a new value because if it's cached it sends in references that get kept by user code
            //until :todo:immutable: Vector types
        screen.cursor.set_internal(new luxe.Vector( x, y ));

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.down,
            button : button,
            x : x,
            y : y,
            xrel : x,
            yrel : y,
            pos : screen.cursor.pos,
        }

        if(!shutting_down) {

            input.check_named_mouse(event, true);
            emitter.emit(Ev.mousedown, event);
            game.onmousedown(event);

        } //!shutting_down

    } //onmousedown

    override function onmouseup( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        if(!inited) return;

            //see notes on new in mousedown
        screen.cursor.set_internal(new luxe.Vector( x, y ));

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.up,
            button : button,
            x : x,
            y : y,
            xrel : x,
            yrel : y,
            pos : screen.cursor.pos
        }

        if(!shutting_down) {

            input.check_named_mouse(event);
            emitter.emit(Ev.mouseup, event);
            game.onmouseup(event);

        } //!shutting_down

    } //onmouseup

    override function onmousemove( x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int ) {

        if(!inited) return;

            //see notes on new in mousedown
        screen.cursor.set_internal(new luxe.Vector( x, y ));

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.move,
            button : MouseButton.none,
            x : x,
            y : y,
            xrel : xrel,
            yrel : yrel,
            pos : screen.cursor.pos
        }

        if(!shutting_down) {

            emitter.emit(Ev.mousemove, event);
            game.onmousemove(event);

        } //!shutting_down

    } //onmousemove

    override function onmousewheel( x:Int, y:Int, timestamp:Float, window_id:Int ) {

        if(!inited) return;

        var event : MouseEvent = {
            timestamp : timestamp,
            window_id : window_id,
            state : InteractState.wheel,
            button : MouseButton.none,
            x : x,
            y : y,
            xrel : x,
            yrel : y,
            pos : screen.cursor.pos
        }

        if(!shutting_down) {

            input.check_named_mouse(event, false);
            emitter.emit(Ev.mousewheel, event);
            game.onmousewheel(event);

        } //!shutting_down

    } //onmousewheel

//touch
        //cached touch pos
    var _touch_pos : Vector;

    override function ontouchdown( x:Float, y:Float, touch_id:Int, timestamp:Float ) {

        if(!inited) return;

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

            emitter.emit(Ev.touchdown, event);

            game.ontouchdown(event);

            #if (!no_debug_console && mobile)

                    //3 finger tap when console opens will switch tabs
                if(app.input.touch_count == 3) {
                    if(console_visible) {
                        debug.switch_view();
                    }
                }

                    //4 finger tap toggles console
                if(app.input.touch_count == 4) {
                    show_console( !console_visible );
                }

            #end //no_debug_console

        } //!shutting_down

    } //ontouchdown

    override function ontouchup( x:Float, y:Float, touch_id:Int, timestamp:Float ) {

        if(!inited) return;

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

            emitter.emit(Ev.touchup, event);
            game.ontouchup(event);

        } //!shutting_down

    } //ontouchup

    override function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {

        if(!inited) return;

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

            emitter.emit(Ev.touchmove, event);
            game.ontouchmove(event);

        } //!shutting_down

    } //ontouchmove

//gamepad

    override function ongamepadaxis( gamepad:Int, axis:Int, value:Float, timestamp:Float ) {

        if(!inited) return;

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

            emitter.emit(Ev.gamepadaxis,event);
            game.ongamepadaxis(event);

        } //!shutting_down

    } //ongamepadaxis

    override function ongamepaddown( gamepad:Int, button:Int, value:Float, timestamp:Float ) {

        if(!inited) return;

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

            input.check_named_gamepad_buttons(event, true);
            emitter.emit(Ev.gamepaddown,event);
            game.ongamepaddown(event);

        } //!shutting_down

    } //ongamepadbuttondown

    override function ongamepadup( gamepad:Int, button:Int, value:Float, timestamp:Float ) {

        if(!inited) return;

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

            input.check_named_gamepad_buttons(event, false);
            emitter.emit(Ev.gamepadup, event);
            game.ongamepadup(event);

        } //!shutting_down

    } //ongamepadup

    override function ongamepaddevice( gamepad:Int, type:GamepadDeviceEventType, timestamp:Float ) {

        if(!inited) return;

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

        if(!shutting_down) {

            game.ongamepaddevice(event);

        } //!shutting_down

    } //ongamepaddevice

        /** return what the game decides for runtime config */
    override function config( config: snow.types.Types.AppConfig ) : snow.types.Types.AppConfig {

            //start with the snow default config
        appconfig = cast config;

            //assign the override values from the boot/flow config
        appconfig.window.width =      init_config.window.width;
        appconfig.window.height =     init_config.window.height;
        appconfig.window.fullscreen = init_config.window.fullscreen;
        appconfig.window.borderless = init_config.window.borderless;
        appconfig.window.resizable =  init_config.window.resizable;
        appconfig.window.title =      init_config.window.title;

        appconfig.preload = {
            bytes:      [],
            texts:      [],
            jsons:      [],
            textures:   [],
            fonts:      [],
            shaders:    [],
            sounds:     []
        };

            //fetch the user updates to the config
        appconfig = game.config( appconfig );

            //return the snow config
        return cast appconfig;

    } //config


} //Core


/**
A tag class for the string based values in the core.
Note that these values are not inline intentionally, they avoid
allocating strings each frame.
*/
@:noCompletion
@:allow(luxe.Core)
class Tag {
    static var update       = 'real dt';
    static var renderdt     = 'render dt';
    static var game_update  = 'game.update';
    static var render       = 'core.render';
    static var debug        = 'core.debug';
    static var updates      = 'core.updates';
    static var events       = 'core.events';
    static var audio        = 'core.audio';
    static var input        = 'core.input';
    static var timer        = 'core.timer';
    static var scene        = 'core.scene';
}
