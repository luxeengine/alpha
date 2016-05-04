package luxe;

import snow.Snow;
import snow.types.Types;
import snow.systems.assets.Asset;
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
import luxe.GameConfig;
import luxe.Resources;

import luxe.debug.ProfilerDebugView;

import phoenix.Renderer;
import phoenix.Texture;
import phoenix.Shader;

import luxe.Game;
import luxe.Log.*;

typedef UserConfig = Dynamic

@:keep
@:noCompletion
@:log_as('luxe')
class Engine extends snow.App {

        //the game object running the core
    public var game : Game;
    public var game_config : GameConfig;

    public var version   : String = 'dev';
    public var build     : String = luxe.macros.BuildVersion.latest();

//Sub Systems, mostly in order of importance
    public var emitter   : Emitter<luxe.Ev>;
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

    public var shutting_down : Bool = false;
    public var has_shutdown : Bool = false;
    public var inited : Bool = false;
    public var headless = false;

    var running = false;

        /** Create a new luxe engine instance.
            Call run when you are ready for it to start up,
            which allows you to attach to events in between. */
    public function new(_game:Game) {

        game = _game;

            //Create internal stuff
        emitter = new Emitter<luxe.Ev>();

            //Set external references
        Luxe.core = this;
        Luxe.utils = new luxe.utils.Utils(this);

    } //new

//Public API

        /** Runs the engine. Can only be called once.
            Does not return until engine is shut down. */
    public function run() {

        assert(running == false);

        running = true;

        new snow.Snow(this);

    } //run

        /** Shut down the engine */
    public function shutdown() {

            //Make sure all systems know we are going down
        shutting_down = true;

            //shutdown snow, which calls ondestroy for us
        Luxe.next(app.shutdown);

    } //shutdown

        /** Returns information about the runtime, like the build number, debug state, os, platform */
    public inline function runtime_info() {

        return '${Luxe.build} / debug:${app.debug} / os:${app.os} / platform:${app.platform}';

    } //runtime_info

    // @:generic
    inline
    public function on<T>(event:luxe.Ev, handler:T->Void ) {
        emitter.on(event, handler);
    }

    // @:generic
    inline
    public function off<T>(event:luxe.Ev, handler:T->Void ) {
        return emitter.off(event, handler);
    }

    // @:generic
    inline
    public function emit<T>(event:luxe.Ev, ?data:T) {
        return emitter.emit(event, data);
    }

//Internal

    override function ready() {

        if(luxe.Log.get_level() > 1) {
            log('log / level to ${luxe.Log.get_level()}' );
            log('log / filter : ${luxe.Log.get_filter()}');
            log('log / exclude : ${luxe.Log.get_exclude()}');
        }

        version = haxe.Resource.getString('version');
            //Don't change this, it matches semantic versioning http://semver.org/
        build = version + haxe.Resource.getString('build');

        log(runtime_info());

            //:todo: I'm not happy about this but for now it will do
        #if no_default_font

            init(null);

        #else

            headless = game_config.headless;
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

            //shutdown the default scene
        emitter.emit(luxe.Ev.destroy);
        game.ondestroy();

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

    } //ondestroy

    function init(asset:AssetImage) {

        _debug('creating subsystems...');

            //Order is important here

        Luxe.debug = debug = new Debug(this);
        Luxe.io = io = new IO(this);

        draw    = new Draw(this);
        timer   = new Timer(this);
        events  = new Events();
        audio   = new Audio(this);
        input   = new Input(this);
        physics = new Physics(this);

        resources = new Resources();
        Luxe.resources = resources;

        if(!headless) {
            renderer = new Renderer(this, asset);
            Luxe.renderer = renderer;
        }

        var _window_w = app.runtime.window_width();
        var _window_h = app.runtime.window_height();

        screen = new luxe.Screen(this, _window_w, _window_h);

        debug.init();
           io.init();
        timer.init();
        audio.init();
        input.init();

        if(!headless) {
            renderer.init();
        }

        physics.init();

        Luxe.audio  = audio;
        Luxe.draw   = draw;
        Luxe.events = events;
        Luxe.timer  = timer;
        Luxe.input  = input;

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

        internal_pre_ready();

    } //init

    function internal_pre_ready() {

        if(!headless) {
                //:todo:GL context query
                //Don't remove this,
                //it's a catch for crashing because
                //we don't have a valid GL context, until the query
                //is finalized on snow side
            log('opengl ${snow.modules.opengl.GL.versionString()}');

            _debug('ready. loading default parcel ' + game_config.preload);

                //pre load config parcel
            var _default_parcel = new Parcel({
                id:         'default_parcel',
                system:     resources,
                bytes:      game_config.preload.bytes,
                texts:      game_config.preload.texts,
                jsons:      game_config.preload.jsons,
                textures:   game_config.preload.textures,
                fonts:      game_config.preload.fonts,
                shaders:    game_config.preload.shaders,
                sounds:     game_config.preload.sounds,
                oncomplete: internal_ready,
                onfailed: function(_error:Dynamic) {
                    log('config / preload / failed to load');
                    throw Error.error(_error);
                }
            });

            _default_parcel.load();

        } else {

            internal_ready(null);

        }

    } //internal_pre_ready

    function internal_ready(_) {

        if(!headless) {

            #if !luxe_noprofile
                    //start called here, so that end is called first, in update/tick
                debug.start(Tag.update, 50);
                debug.start(Tag.tick, 50);
            #end

        } //!headless

            //Call the main ready function
            //and send the ready event to the game
        game.ready();

            //shutdown can come from the ready function
        if(!shutting_down) {

                //emit the init event
                //so that scene and others can start up
            emitter.emit(luxe.Ev.init);
            inited = true;

                //Reset the physics (starts the timer etc)
            physics.reset();

        } //!shutting down

    } //internal_ready

//System events

    override function onevent(_event:snow.types.Types.SystemEvent) {

        if(_event.window != null) {
            window_event(_event.window);
        }

        game.onevent(_event);

    } //onevent

//Update events

    override function update(_delta:Float) {

        if(has_shutdown) return;
        if(!inited) return;

        //The order of end/start matters

            #if !luxe_noprofile
                debug.end(Tag.update);
                debug.start(Tag.update);
            #end

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
            #if !luxe_noprofile debug.start(Tag.updates); #end
        emitter.emit(luxe.Ev.update, _delta);
            #if !luxe_noprofile debug.end(Tag.updates); #end

            //Update the game
            #if !luxe_noprofile debug.start(Tag.game_update); #end
        game.update(_delta);
            #if !luxe_noprofile debug.end(Tag.game_update); #end

            //And finally the debug stuff
            #if luxe_fullprofile debug.start(Tag.debug); #end
        debug.process();
            #if luxe_fullprofile debug.end(Tag.debug); #end

    } //update

    override function tick(_delta:Float) {

        if(shutting_down) return;
        if(!inited) return;

        #if !luxe_noprofile
            debug.end(Tag.tick);
            debug.start(Tag.tick);
        #end

        if(!headless) {

            #if !luxe_noprofile debug.start(Tag.render); #end

            emitter.emit(luxe.Ev.prerender);
            game.onprerender();

                emitter.emit(luxe.Ev.render);
                game.onrender();
                renderer.process();

            emitter.emit(luxe.Ev.postrender);
            game.onpostrender();

            #if !luxe_noprofile debug.end(Tag.render); #end

            debug.render();

        } //!headless

    } //tick

    override function ontickstart() {

        if(!has_shutdown) {
            emitter.emit(luxe.Ev.tickstart);
        }

    } //ontickstart

    override function ontickend() {

        if(!has_shutdown) {
            emitter.emit(luxe.Ev.tickend);
        }

    } //ontickend

//Window events

    function window_event(_event:snow.types.Types.WindowEvent) {

        if(shutting_down) return;
        if(!inited) return;

        emitter.emit(luxe.Ev.window, _event);

        switch(_event.type) {

            case we_moved : {
                emitter.emit(luxe.Ev.windowmoved, _event);
                game.onwindowmoved(_event);
            } //moved

            case we_resized : {
                screen.internal_resized(_event.x, _event.y);
                renderer.internal_resized(_event.x, _event.y);
                emitter.emit(luxe.Ev.windowresized, _event);
                game.onwindowresized(_event);
            } //resized

            case we_size_changed : {
                screen.internal_resized(_event.x, _event.y);
                renderer.internal_resized(_event.x, _event.y);
                emitter.emit(luxe.Ev.windowsized, _event);
                game.onwindowsized(_event);
            } //size_changed

            case we_minimized : {
                emitter.emit(luxe.Ev.windowminimized, _event);
                game.onwindowminimized(_event);
            } //minimized

            case we_restored : {
                emitter.emit(luxe.Ev.windowrestored, _event);
                game.onwindowrestored(_event);
            } //restored

            case _:

        } //switch

        _event = null;

    } //window_event

//Input events

    //mouse

        override function onmousedown(_x:Int, _y:Int, _button:Int, _timestamp:Float, _window_id:Int) {

            if(!inited) return;

            screen.cursor.set_internal(_x, _y);

            input.onmousedown(_x, _y, _button, _timestamp, _window_id);

        } //onmousedown

        override function onmouseup(_x:Int, _y:Int, _button:Int, _timestamp:Float, _window_id:Int) {

            if(!inited) return;

            screen.cursor.set_internal(_x, _y);

            input.onmouseup(_x, _y, _button, _timestamp, _window_id);

        } //onmouseup

        override function onmousemove(_x:Int, _y:Int, _x_rel:Int, _y_rel:Int, _timestamp:Float, _window_id:Int) {

            if(!inited) return;

            screen.cursor.set_internal(_x, _y);

            input.onmousemove(_x, _y, _x_rel, _y_rel, _timestamp, _window_id);

        } //onmousemove

        override function onmousewheel(_x:Float, _y:Float, _timestamp:Float, _window_id:Int) {

            if(!inited) return;

            input.onmousewheel(_x, _y, _timestamp, _window_id);

        } //onmousewheel

    //keys

        override function onkeydown(_keycode:Int, _scancode:Int, _repeat:Bool, _mod:ModState, _timestamp:Float, _window_id:Int) : Void {

            if(!inited) return;

            input.onkeydown(_keycode, _scancode, _repeat, _mod, _timestamp, _window_id);

        } //onkeydown

        override function onkeyup(_keycode:Int, _scancode:Int, _repeat:Bool, _mod:ModState, _timestamp:Float, _window_id:Int) : Void {

            if(!inited) return;

            input.onkeyup(_keycode, _scancode, _repeat, _mod, _timestamp, _window_id);

        } //onkeyup

        override function ontextinput(_text:String, _start:Int, _length:Int, _etype:snow.types.TextEventType, _timestamp:Float, _window_id:Int) : Void {

            if(!inited) return;

            input.ontextinput(_text, _start, _length, _etype, _timestamp, _window_id);

        } //ontextinput

    //touch

        override function ontouchdown(_x:Float, _y:Float, _dx:Float, _dy:Float, _touch_id:Int, _timestamp:Float) {

            if(!inited) return;

            input.ontouchdown(_x, _y, _dx, _dy, _touch_id, _timestamp);

        } //ontouchdown

        override function ontouchup(_x:Float, _y:Float, _dx:Float, _dy:Float, _touch_id:Int, _timestamp:Float) {

            if(!inited) return;

             input.ontouchup(_x, _y, _dx, _dy, _touch_id, _timestamp);

        } //ontouchup

        override function ontouchmove(_x:Float, _y:Float, _dx:Float, _dy:Float, _touch_id:Int, _timestamp:Float) {

            if(!inited) return;

            input.ontouchmove(_x, _y, _dx, _dy, _touch_id, _timestamp);

        } //ontouchmove

    //input

        public function oninputdown(_name:String, ?_key_event:KeyEvent, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {

            if(!inited) return;

            input.oninputdown(_name, _key_event, _mouse_event, _touch_event, _gamepad_event);

        } //oninputdown

        public function oninputup(_name:String, ?_key_event:KeyEvent, ?_mouse_event:MouseEvent, ?_touch_event:TouchEvent, ?_gamepad_event:GamepadEvent) {

            if(!inited) return;

            input.oninputup(_name, _key_event, _mouse_event, _touch_event, _gamepad_event);

        } //oninputup

    //gamepad

        override function ongamepadaxis(_gamepad:Int, _axis:Int, _value:Float, _timestamp:Float) : Void {

            if(!inited) return;

            input.ongamepadaxis(_gamepad, _axis, _value, _timestamp);

        } //ongamepadaxis

        override function ongamepaddown(_gamepad:Int, _button:Int, _value:Float, _timestamp:Float) : Void {

            if(!inited) return;

            input.ongamepaddown(_gamepad, _button, _value, _timestamp);

        } //ongamepadbuttondown

        override function ongamepadup(_gamepad:Int, _button:Int, _value:Float, _timestamp:Float) : Void {

            if(!inited) return;

            input.ongamepadup(_gamepad, _button, _value, _timestamp);

        } //ongamepadup

        override function ongamepaddevice(_gamepad:Int, _id:String, _etype:GamepadDeviceEventType, _timestamp:Float) : Void {

            if(!inited) return;

            input.ongamepaddevice(_gamepad, _id, _etype, _timestamp);

        } //ongamepaddevice


//config handling

        /** return what the game decides for runtime config */
    override function config(_config:snow.types.Types.AppConfig) : snow.types.Types.AppConfig {

        if(_config.user == null) _config.user = {};

            //start with the snow default config
        game_config = cast _config;

            //assign the default luxe values
        game_config.window.title = 'luxe game';
        game_config.window.width = 960;
        game_config.window.height = 640;
        game_config.window.resizable = true;
        game_config.window.fullscreen = #if mobile true #else false #end;
        game_config.window.borderless = #if mobile true #else false #end;

        game_config.preload = {
            bytes:      [],
            texts:      [],
            jsons:      [],
            textures:   [],
            fonts:      [],
            shaders:    [],
            sounds:     []
        };

            //fetch the user updates to the config
        game_config = game.config( game_config );

            //return the snow config
        return cast game_config;

    } //config

} //Engine


/**
A tag class for the string based values in the core.
Note that these values are not inline intentionally, they avoid
allocating strings each frame.
*/
@:noCompletion
@:allow(luxe.Engine)
class Tag {
    static var update       = 'update dt';
    static var tick         = 'tick dt';
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
