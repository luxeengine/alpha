package lab;

import lime.LiME;

import Lab;

import lab.Audio;
import lab.Events;
import lab.Input;
import lab.Scene;
import lab.Files;
import lab.Debug;
import lab.Time;
import lab.Renderer;

import haxe.Timer;

class Core {

		//core versioning
	public var version : String = '0.1';
		//the game object running the core
    public var host : Dynamic;  
        //the config passed to us on creation
	public var config : Dynamic;

        //if the console is displayed atm
    public var console_visible : Bool = false;

        //the reference to the underlying LiME system
    public var lime : LiME;

//Sub Systems, mostly in order of importance
	public var debug    : Debug;
	public var file 	: Files;
	public var time 	: Time;
	public var events 	: Events;
	public var input 	: Input;
    public var audio    : Audio;
    public var scene    : Scene;
	public var renderer : Dynamic;
    public var screen   : lab.Rectangle; //todo

//Delta times
    private var end_dt : Float = 0;
    public var dt : Float = 0;

//flags
	
	   //if we have started a shutdown
    public var shutting_down : Bool = false;
    public var has_shutdown : Bool = false;

    	//constructor
    public function new( _host:Dynamic ) {
            
            //Keep a reference for use
        host = _host;

        Lab.core = this;
        Lab.utils = new lab.utils.Utils(this);

    } //new
    
        //This gets called once the create_main_frame call inside new() 
        //comes back with our window

    private function ready( _lime : LiME ) {
            
            //Keep a reference
        lime = _lime;

        _debug(':: haxelab :: Version ' + version);

          	//Create the subsystems

        startup();

        _debug(':: haxelab :: Ready.');
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

    public function startup() {

            //Cache the settings locally
        config = lime.config;

            //Create the subsystems
		_debug(':: haxelab :: Creating subsystems.');

			//Order is important here
		
		debug = new Debug( this ); Lab.debug = debug;
		file = new Files( this );
		time = new Time( this );
		events = new Events( this );
		audio = new Audio( this );	
		input = new Input( this );        

        if(config.renderer == null) {
            renderer = new Renderer( this );
        } else {
            renderer = Type.createInstance(config.renderer, [this]);
        }

            //assign the globals
        Lab.renderer = renderer;   
            //store the size for access from API
        screen = new lab.Rectangle( 0,0, config.width, config.height );

			//Now make sure they start up

		debug.startup();
		file.startup();
		time.startup();
		events.startup();
		audio.startup();
		input.startup();
        
        if(renderer != null && renderer.startup != null) {
            renderer.startup();
        }

        Lab.audio = audio;        
        Lab.events = events;
        Lab.time = time;
        Lab.camera = new lab.Camera({view:renderer.default_camera});
        Lab.resources = renderer.resource_manager;

        scene = new Scene();
        scene.name = 'default scene';
        Lab.scene = scene;

        scene.add(Lab.camera);

            //finally, create the debug console
        debug.create_debug_console();
    }

    public function shutdown() {        

		_debug('');
		_debug(':: haxelab :: Shutting down...');

            //Make sure all systems know we are going down

        shutting_down = true;

            //shutdown the game class
        if(host.shutdown != null) {
            host.shutdown();
        }

            //shutdown the default scene
        scene.shutdown();        

    		//Order is imporant here too

        if(renderer != null && renderer.shutdown != null) {
            renderer.shutdown();
        }        

    	input.shutdown();
    	audio.shutdown();
    	events.shutdown();
    	time.shutdown();
    	file.shutdown();
    	debug.shutdown();        

    		//Clear up for GC
    	input = null;
    	audio = null;
    	events = null;
    	time = null;
    	file = null;
    	debug = null;
        Lab.utils = null;

            //Flag it
        has_shutdown = true;

        _debug(':: haxelab :: Goodbye.');
    }

    	//Called by LiME
    public function update() { 

        _debug('on_update ' + Timer.stamp(), true, true); 

        if(has_shutdown) return;

            //Update all the subsystems, again, order important

        time.process();     //Timers first
        input.process();    //Input second
        audio.process();    //Audio
        debug.process();    //debug late
        events.process();   //events last

            //Update the default scene first
        scene.update(dt);

            //Update the game class for them
        if(host.update != null) {
            host.update(dt);
        }

            //work out the last frame time
        dt =  haxe.Timer.stamp() - end_dt;
            //store the latest time frame
        end_dt = haxe.Timer.stamp();
            //store the value for the framework
        Lab.dt = dt;

    } //update

        //called by LiME
    public function render() {
        if(renderer != null && renderer.process != null) {
            renderer.process();   
        }
    }

//External overrides
    public function set_renderer( _renderer:Renderer ) {
        if(_renderer != null) {
            renderer = _renderer;
        }
    }

//Lib load wrapper
    public static function load( library:String, method:String, args:Int = 0 ) : Dynamic {
        return lime.utils.Libs.load( library, method, args );
    }

    public function show_console(_show:Bool = true) {
        console_visible = _show;
        debug.show_console(console_visible);
    }

//input events
//keys
    public function onkeydown(e) {
        if(host.onkeydown != null) host.onkeydown(e);
        if(e.value == lab.Input.Keys.tab && console_visible) {
            debug.switch_console();
        }
        if(e.value == lab.Input.Keys.tilde) {
            show_console( !console_visible );
        }
    }
    public function onkeyup(e) {
        if(host.onkeyup != null) host.onkeyup(e);
    }
//mouse
    public function onmousedown(e : MouseEvent) {
        if(host.onmousedown != null) host.onmousedown(e);
    }
    public function onmouseup(e : MouseEvent) {
        if(host.onmouseup != null) host.onmouseup(e);
    }
    public function onmousemove(e : MouseEvent) {
        if(host.onmousemove != null) host.onmousemove(e);
    }
//touch
    public function ontouchbegin(e : TouchEvent) {
        if(host.ontouchbegin != null) host.ontouchbegin(e);
    }
    public function ontouchend(e : TouchEvent) {
        if(host.ontouchend != null) host.ontouchend(e);
    }
    public function ontouchmove(e : TouchEvent) {
        if(host.ontouchmove != null) host.ontouchmove(e);
    }
//joystick
    public function onjoyaxismove(e) {
        if(host.onjoyaxismove != null) host.onjoyaxismove(e);
    }
    public function onjoyballmove(e) {
        if(host.onjoyballmove != null) host.onjoyballmove(e);
    }
    public function onjoyhatmove(e) {
        if(host.onjoyhatmove != null) host.onjoyhatmove(e);
    }    
    public function onjoybuttondown(e) {
        if(host.onjoybuttondown != null) host.onjoybuttondown(e);
    }    
    public function onjoybuttonup(e) {
        if(host.onjoybuttonup != null) host.onjoybuttonup(e);
    }

//Noisy stuff

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
}