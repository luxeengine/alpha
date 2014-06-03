package luxe;

import lime.Lime;
import lime.utils.ByteArray;

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

@:noCompletion class Core {

        //core versioning
    public var version : String = '0.1';
        //the game object running the core
    public var host : Dynamic;  
        //the config passed to us on creation
    public var config : LimeConfig;

#if (luxe_native && !luxe_threading_disabled) 
    
    public var core_thread : Thread;
    public var thread_message : Dynamic;

#end //luxe_native

        //if the console is displayed atm
    public var console_visible : Bool = false;

        //the reference to the underlying Lime system
    public var lime : Lime;

//Sub Systems, mostly in order of importance
    public var debug    : Debug;
    public var draw     : Draw;
    public var time     : Timer;
    public var events   : Events;
    public var input    : Input;
    public var audio    : Audio;
    public var scene    : Scene;
    public var renderer : Renderer;
    public var screen   : luxe.Screen;
    public var physics  : Physics;

//Delta times    
    public var dt : Float = 0;
    var end_dt : Float = 0;

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


        //constructor
    public function new( _host:Dynamic ) {
            
            //Keep a reference for use
        host = _host;

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
    
        //This gets called once the create_main_frame call inside new() 
        //comes back with our window

    private function ready( _lime : Lime ) {
            
            //Keep a reference
        lime = _lime;

        _debug(':: luxe :: Version ' + version);

            //Create the subsystems

        init();

        _debug(':: luxe :: Ready.');
        _debug('');

            //Call the main ready function 
            //and send the ready event to the host
        if(host.ready != null) {
            host.ready();
        }

            //After we are ready we can init the scene
        scene.init();
            //We can also call start, for now, as this will be deferred later
            //when there is a restart etc
        scene.start();

            //otherwise we get a wild value for first hit
        end_dt = haxe.Timer.stamp();

    } //on_main_frame_created

    public function init() {

            //Cache the settings locally
        config = lime.config;

            //Create the subsystems
        _debug(':: luxe :: Creating subsystems.');

            //Order is important here
        
        debug = new Debug( this ); Luxe.debug = debug;
        draw = new Draw( this );
        time = new Timer( this );
        events = new Events();
        audio = new Audio( this );  
        input = new Input( this );
        physics = new Physics( this );

            //create the renderer
        renderer = new Renderer( this );
            //assign the globals
        Luxe.renderer = renderer;   
            //store the size for access from API, :todo : Window position can go here.
        screen = new luxe.Screen( this, 0, 0, config.width, config.height );

            //Now make sure 
            //they start up
            
        debug.init();
        time.init();
        audio.init();
        input.init();
        renderer.init();  
        physics.init();      

        Luxe.audio = audio;
        Luxe.draw = draw;     
        Luxe.events = events;
        Luxe.timer = time;
        Luxe.input = input;
        Luxe.camera = new luxe.Camera({ name:'default_camera', view:renderer.default_camera });
        Luxe.resources = renderer.resource_manager;
        Luxe.physics = physics;

        scene = new Scene();
        scene.name = 'default scene';
        Luxe.scene = scene;

        scene.add(Luxe.camera);

            //finally, create the debug console
        debug.create_debug_console(); 

    } //init

    public function shutdown() {        

        _debug('');
        _debug(':: luxe :: Shutting down...');

            //Make sure all systems know we are going down

        shutting_down = true;

            //shutdown the game class
        if(host.destroyed != null) {
            host.destroyed();
        }

            //shutdown the default scene
        scene.destroy();        

            //Order is imporant here too

        if(renderer != null && renderer.destroy != null) {
            renderer.destroy();
        }

        physics.destroy();
        input.destroy();
        audio.destroy();
        time.destroy();
        events.destroy();
        debug.destroy();        

            //Clear up for GC
        input = null;
        audio = null;
        events = null;
        time = null;
        debug = null;
        Luxe.utils = null;

            //Flag it
        has_shutdown = true;

        _debug(':: luxe :: Goodbye.');

    } //shutdown

        //Called by Lime
    public function update() { 

        #if luxe_fullprofile 
            _debug('on_update ' + haxe.Timer.stamp(), true, true);
        #end //luxe_fullprofile

        if(has_shutdown) return;

            //Update all the subsystems, again, order important
//Timers first
            #if luxe_fullprofile debug.start(core_tag_time); #end
        time.process();     
            #if luxe_fullprofile debug.end(core_tag_time); #end
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
        debug.start(core_tag_physics);
        physics.process();
        debug.end(core_tag_physics);

        #if (luxe_native && !luxe_threading_disabled) 
//Background threads sending requests our way
            
            thread_message = Thread.readMessage(false);

            if(thread_message != null) {

                var type : CoreThreadRequest = thread_message.type;
                switch( type ) {
                    case CoreThreadRequest.load_texture: {
                        var info : LoadTextureInfo = cast thread_message.info;
                        Luxe.loadTexture( info.id, info.onloaded, false, info.bytes );
                    } //load_texture

                    case CoreThreadRequest.load_shader: {
                        var info : LoadShaderInfo = cast thread_message.info;
                        Luxe.loadShader( info.ps_id, info.vs_id, info.onloaded );
                    } //load_shader

                } //switch type

            } //thread_message

        #end //(luxe_native && !luxe_threading_disabled) 

//Run update callbacks
            #if luxe_fullprofile debug.start(core_tag_updates); #end
        
        for(_update in _update_handlers) {
            _update(Luxe.dt);
        }
            #if luxe_fullprofile debug.end(core_tag_updates); #end

//Update the default scene            
            debug.start(core_tag_scene);
        scene.update(Luxe.dt);
            debug.end(core_tag_scene);

//Update the game class for the host
        if(host.update != null) {

            debug.start( host_tag_update );

            host.update(Luxe.dt);
            
            debug.end( host_tag_update );

        } //host.update

//And finally the debug stuff
            #if luxe_fullprofile debug.start(core_tag_debug); #end
        debug.process(); 
            #if luxe_fullprofile debug.end(core_tag_debug); #end

//Update delta time

            //work out the last frame time
        dt = (Luxe.fixed_timestep != 0) ? Luxe.fixed_timestep : (haxe.Timer.stamp() - end_dt);
            //store the timescaled version for external
        Luxe.dt = dt * Luxe.timescale;
            //store the latest time frame
        end_dt = haxe.Timer.stamp();

    } //update

        //called by Lime
    public function render() {        

        debug.start(core_tag_render);

            //Call back to the game class for them
        if(host.prerender != null) {
            host.prerender();
        }
        
        if(renderer != null && renderer.process != null) {
            renderer.process();   
        }

        if(host.postrender != null) {
            host.postrender();
        }

        debug.end(core_tag_render);

    } //render

//External overrides
    public function set_renderer( _renderer:Renderer ) {
        if(_renderer != null) {
            renderer = _renderer;
        }
    } //set_renderer

//Lib load wrapper
    public static function load( library:String, method:String, args:Int = 0 ) : Dynamic {
        return lime.utils.Libs.load( library, method, args );
    } //load

    public function show_console(_show:Bool = true) {

        console_visible = _show;
        debug.show_console(console_visible);

    } //show_console

//window events
    public function onresize(e) {
            //update the screen sizes
        Luxe.screen.w = e.x;
        Luxe.screen.h = e.y;

            //update internal render views
        debug.onresize(e);
            //and the defaults
        renderer.onresize(e);
            //and then the host
        if(host.onresize != null) host.onresize(e);

    } // onresize

//input events
//keys
    public function onkeydown( e:KeyEvent ) {
            
        if(!shutting_down) {
                //check for named input 
            input.check_named_keys(e, true);
                //pass to scene
            scene.onkeydown(e);
                //forward to debug module
            debug.onkeydown(e);
        }

        if(host.onkeydown != null) {
            host.onkeydown(e);
        }

        if(e.key == KeyValue.tilde) {
            show_console( !console_visible );
        }

    } //onkeydown

    public function onkeyup( e:KeyEvent ) {
            
        if(!shutting_down) {
                //check for named input 
            input.check_named_keys(e);
                //pass to scene
            scene.onkeyup(e);            
                //forward to debug module
            if(debug!=null)debug.onkeyup(e);
        }
        
        if(host.onkeyup != null) {
            host.onkeyup(e);
        }

    } //onkeyup

//input

    public function oninputdown( _name:String, e:InputEvent ) {

        if(!shutting_down) {
            scene.oninputdown(_name,e);
        }

        if(host.oninputdown != null) {
            host.oninputdown(_name,e); 
        }

    } //oninputdown

    public function oninputup( _name:String, e:InputEvent ) {
        
        if(!shutting_down) {
            scene.oninputup(_name,e);
        }

        if(host.oninputup != null) {
            host.oninputup(_name,e); 
        }

    } //oninputup

//mouse

    public function onmousedown(e : MouseEvent) {

            //this has to be a new value because if it's cached it sends in references that get kept by user code
        _mouse_pos = new luxe.Vector( e.x, e.y );
        e.pos = _mouse_pos;
        Luxe.mouse = _mouse_pos;

        if(!shutting_down) {
            input.check_named_mouse(e, true);
            scene.onmousedown(e);
            debug.onmousedown(e);
        }

        if(host.onmousedown != null) {
            host.onmousedown(e);
        }

    } //onmousedown
    
    public function onmousewheel(e : MouseEvent) {

        if(!shutting_down) {
            input.check_named_mouse(e, false);
            scene.onmousewheel(e);
            debug.onmousewheel(e);
        }
        
        if(host.onmousewheel != null) {
            host.onmousewheel(e);
        }

    } //onmousewheel

    public function onmouseup(e : MouseEvent) {

        _mouse_pos = new luxe.Vector( e.x, e.y );
        e.pos = _mouse_pos;
        Luxe.mouse = _mouse_pos;

        if(!shutting_down) {
            input.check_named_mouse(e);
            scene.onmouseup(e);
            debug.onmouseup(e);
        }

        if(host.onmouseup != null) {
            host.onmouseup(e);
        }

    } //onmouseup

    public function onmousemove(e : MouseEvent) {

        _mouse_pos = new luxe.Vector( e.x, e.y );
        e.pos = _mouse_pos;
        Luxe.mouse = _mouse_pos;

        if(!shutting_down) {
            scene.onmousemove(e);
            debug.onmousemove(e);
        }

        if(host.onmousemove != null) {
            host.onmousemove(e);
        }

    } //onmousemove
    
//touch
    var touches_down : Map<Int, TouchEvent>;

    public function ontouchbegin(e : TouchEvent) {

         _touch_pos = new luxe.Vector( e.x, e.y );
        e.pos = _touch_pos;

        if(!shutting_down) {
            scene.ontouchbegin(e);
        }

        if(host.ontouchbegin != null) {
            host.ontouchbegin(e);
        }

        if(touches_down == null) {
            touches_down = new Map();
        }
        
        touches_down.set(e.ID, e);

            //3 finger tap when console opens will switch tabs
        if(Lambda.count(touches_down) >= 3) {
            if(console_visible) {
                debug.switch_view();
            }
        }

            //4 finger tap toggles console
        if(Lambda.count(touches_down) >= 4) {            
            show_console( !console_visible );
        }

    } //ontouchbegin

    public function ontouchend(e : TouchEvent) {

         _touch_pos = new luxe.Vector( e.x, e.y );
        e.pos = _touch_pos;

        if(!shutting_down) {
                //pass to scene
            scene.ontouchend(e);
        }        

        if(host.ontouchend != null) {
            host.ontouchend(e);
        }

        touches_down.remove(e.ID);

    } //ontouchend

    public function ontouchmove(e : TouchEvent) {
        
        _touch_pos = new luxe.Vector( e.x, e.y );
        e.pos = _touch_pos;

        if(!shutting_down) {
                //pass to scene
            scene.ontouchmove(e);
        }

        if(host.ontouchmove != null) {
            host.ontouchmove(e);
        }
        
    } //ontouchmove

//joystick

    public function ongamepadaxis(e) {

        if(!shutting_down) {
            scene.ongamepadaxis(e);
        }

        if(host.ongamepadaxis != null) {
            host.ongamepadaxis(e);
        }

    } //ongamepadaxis

    public function ongamepadball(e) {

        if(!shutting_down) {
            scene.ongamepadball(e);
        }

        if(host.ongamepadball != null) {
            host.ongamepadball(e);
        }

    } //ongamepadball

    public function ongamepadhat(e) {

        if(!shutting_down) {
            scene.ongamepadhat(e);
        }

        if(host.ongamepadhat != null) {
            host.ongamepadhat(e);
        }

    } //ongamepadhat

    public function ongamepadbuttondown(e) {

        if(!shutting_down) {
            scene.ongamepadbuttondown(e);
        }

        if(host.ongamepadbuttondown != null) {
            host.ongamepadbuttondown(e);
        }

    } //ongamepadbuttondown

    public function ongamepadbuttonup(e) {

        if(!shutting_down) {
            scene.ongamepadbuttonup(e);
        }
        
        if(host.ongamepadbuttonup != null) {
            host.ongamepadbuttonup(e);
        }

    } //ongamepadbuttonup

//Noisy stuff

    private static inline var host_tag_update : String = 'host.update';
    private static inline var core_tag_render : String = 'core.render';
    private static inline var core_tag_debug : String = 'core.debug';
    private static inline var core_tag_physics : String = 'core.physics';
    private static inline var core_tag_updates : String = 'core.update_callbacks';
    private static inline var core_tag_events : String = 'core.events';
    private static inline var core_tag_audio : String = 'core.audio';
    private static inline var core_tag_input : String = 'core.input';
    private static inline var core_tag_time : String = 'core.time';
    private static inline var core_tag_scene : String = 'core.scene';

//temporary debugging with verbosity options

    public var log : Bool = false;
    public var verbose : Bool = true;
    public var more_verbose : Bool = false;
    public function _debug(value:Dynamic, _verbose:Bool = false, _more_verbose:Bool = false) { 
        if(log) {            
            if(verbose && _verbose && !_more_verbose) {
                trace(value);
            } else 
            if(more_verbose && _more_verbose) {
                trace(value);
            } else {
                if(!_verbose && !_more_verbose) {
                    trace(value);
                }
            } //elses
        } //log
    } //_debug


} //Core
