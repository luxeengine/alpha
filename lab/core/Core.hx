package lab.core;

import lab.core.utils.Loader;
import lab.core.Constants;

import lab.core.Audio;
import lab.core.Events;
import lab.core.Input;
import lab.core.Files;
import lab.core.Debug;
import lab.core.Time;


class Core {

		//core versioning
	public var version : String = '0.1';
		//the game object running the core
	public var game : Dynamic;

//Sub Systems, mostly in order of importance
	public var debug    : Debug;
	public var file 	: Files;
	public var time 	: Time;
	public var events 	: Events;
	public var input 	: Input;
	public var audio 	: Audio;

//nme specifics
		//the handle to the window from nme
    public var mainframe_handle : Dynamic;
    	//the handle to the nme stage
    public var stage_handle : Dynamic;
        //direct_renderer_handle
    public var direct_renderer_handle : Dynamic;

//flags
	
		//if the core is active
    public var active : Bool = false;
    	//if the window is invalidated
    public var invalidated : Bool = false;

    	//constructor
    public function new() {} //new

    	//Initialize
    public function init( _main_ ) {

    	game = _main_;

    	_debug(':: haxelab :: initializing - running version ' + version);
        _debug(':: haxelab :: Creating window.');

        nme_create_main_frame( 
            on_main_frame_created, 
            960,                            //width
            640,                            //height
                Window.RESIZABLE | 
                Window.HARDWARE | 
                Window.VSYNC | 
                Window.HW_AA | 
                Window.HW_AA_HIRES | 
                Window.ALLOW_SHADERS | 
                Window.REQUIRE_SHADERS | 
                Window.DEPTH_BUFFER | 
                Window.STENCIL_BUFFER ,     //flags
            "haxelab",                      //title
            null                            //icon

        ); //nme_create_main_frame
       	
    } //init
    
        //This gets called once the create_main_frame call inside new() 
        //comes back with our window

    private function on_main_frame_created( handle:Dynamic ) {
            
        mainframe_handle = handle;
        stage_handle = nme_get_frame_stage( mainframe_handle );

        nme_set_stage_handler(stage_handle, on_stage_event, 960, 640);

            //Create the OpenGL View
        direct_renderer_handle = nme_direct_renderer_create();
            //Set this handle to the real view with a render function
        nme_direct_renderer_set( direct_renderer_handle, on_glview_render );

        	//Create the subsystems

        startup();

			//OK, we are done.

        _debug(':: haxelab :: Ready.');
        _debug('');

        	//Call the main ready function 
        	//and send the ready event to the game

        Reflect.callMethod( game , "ready", null);

    } //on_main_frame_created

    public function startup() {
		//Create the subsystems

		_debug(':: haxelab :: Creating subsystems.');

			//Order is important here
		
		debug = new Debug( this );
		file = new Files( this );
		time = new Time( this );
		events = new Events( this );
		audio = new Audio( this );	
		input = new Input( this );

			//Now make sure they start up

		debug.startup();
		file.startup();
		time.startup();
		events.startup();
		audio.startup();
		input.startup();

    }

    public function shutdown() {
		
		_debug('');
		_debug(':: haxelab :: Shutting down...');

    		//Order is imporant here too

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

    		//Ok kill it! 
        nme_close();

        _debug(':: haxelab :: Goodbye.');
    }

    private function on_stage_event( _event:Dynamic ):Dynamic {

        var event_type:Int = Std.int(Reflect.field(_event, "type"));
        
        switch(event_type) {

    //keyboard
            case SystemEvents.char:
                input.core_onchar(_event);

            case SystemEvents.keydown:
                input.core_onkeydown(_event);

            case SystemEvents.keyup:
                input.core_onkeyup(_event);
                
            case SystemEvents.gotinputfocus:
            	input.core_gotinputfocus(_event);

            case SystemEvents.lostinputfocus:
            	input.core_lostinputfocus(_event);

    //mouse             
            case SystemEvents.mousemove:
                input.core_mousemove(_event);

            case SystemEvents.mousedown:
            	input.core_mousedown(_event);
                

            case SystemEvents.mouseclick:
            	input.core_mouseclick(_event);

            case SystemEvents.mouseup:
            	input.core_mouseup(_event);
                

    //touch
            case SystemEvents.touchbegin:
               	input.core_touchbegin(_event);

            case SystemEvents.touchmove:
                input.core_touchmove(_event);

            case SystemEvents.touchend:
                input.core_touchend(_event);

            case SystemEvents.touchtap:
                input.core_touchtap(_event);

    //joystick

            case SystemEvents.joyaxismove:
                input.core_joyaxismove(_event);

            case SystemEvents.joyballmove:
                input.core_joyballmove(_event);

            case SystemEvents.joyhatmove:
                input.core_joyhatmove(_event);

            case SystemEvents.joybuttondown:
                input.core_joybuttondown(_event);

            case SystemEvents.joybuttonup:
                input.core_joybuttonup(_event);

    //window
            case SystemEvents.activate:
                //nmeSetActive(true);

            case SystemEvents.deactivate:
                //nmeSetActive(false);

            case SystemEvents.resize:
                on_resize(_event);

            case SystemEvents.poll:
                on_poll();

            case SystemEvents.quit: 
                shutdown();

            case SystemEvents.focus:
                //nmeOnFocus(_event);

            case SystemEvents.syswm:
                on_syswm(_event);

            case SystemEvents.redraw:
                on_render(true);

    //orientation
            case SystemEvents.shouldrotate:
                //if (shouldRotateInterface(_event.value))
                //  _event.result = 2;

    //misc
            case SystemEvents.change:
                // nmeOnChange(_event);

        }
        
        return null;
    } //on_stage_event

    	//Invalidate the window (forcing a redraw on next update)
    public function invalidate() : Void {
        invalidated = true;
    } //invalidate

    	//Handle system/window messages
    public function on_syswm(ev:Dynamic) {
        _debug('syswm');
    } //on_syswm

    public function on_resize(_event:Dynamic) {
    	//nmeOnResize(_event.x, _event.y);
            //if (renderRequest == null)
            //  nmeRender(false);
    }

    	//Render the window

    public function on_glview_render( _rect:Dynamic ) {
        _debug('WT');
    }

    public function on_render( _do_broadcast_event : Bool) {
      
        if( !active ) {
            return;
        }

        _debug("render!", true, true);
      
        if( _do_broadcast_event ) {
            // nmeBroadcast(new Event(Event.ENTER_FRAME));
        } 

        if( invalidated ) {
            invalidated = false;
            // nmeBroadcast(new Event(Event.RENDER));
        }

        nme_render_stage( stage_handle );
    } //on_render

    	//todo
    public function on_exit() { 
        _debug('exit'); 
    } //exit

    	//Called when polled by the nme runtime
    public function on_poll() { 
        _debug('poll', true, true); 
        on_render(true);
    } //on_poll

    	//Called when the application wants to go to the background and stop
    public function on_pause() { 
        _debug('pause'); 
        nme_pause_animation(); 
    } //on_pause

        //Called when the application resumes operation from the background
    public function on_resume() { 
        _debug('resume'); 
        nme_resume_animation();  
    } //on_resume

        // Terminates the process straight away, bypassing graceful shutdown
    public function on_force_close() {  
        _debug('force close');
        nme_terminate();
    } //on_force_close


//Noisy stuff

    	//import nme_library functions
    private static var nme_render_stage             = Loader.load("nme_render_stage", 1);
    private static var nme_set_stage_handler        = Loader.load("nme_set_stage_handler",  4);
    private static var nme_get_frame_stage          = Loader.load("nme_get_frame_stage",    1);
    private static var nme_pause_animation          = Loader.load("nme_pause_animation",    0);
    private static var nme_resume_animation         = Loader.load("nme_resume_animation",   0);

    private static var nme_terminate                = Loader.load("nme_terminate", 0);
    private static var nme_close                    = Loader.load("nme_close", 0);

    private static var nme_create_main_frame        = Loader.load("nme_create_main_frame", -1);        
    private static var nme_direct_renderer_create   = Loader.load("nme_direct_renderer_create", 0);
    private static var nme_direct_renderer_set      = Loader.load("nme_direct_renderer_set", 2);

   		//temporary debugging with verbosity options

	public var log : Bool = true;
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