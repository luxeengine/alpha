package luxe;

import luxe.Core;

import luxe.debug.Inspector;
import luxe.Input.KeyEvent;
import luxe.Input;
import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.Camera;
import phoenix.geometry.CompositeGeometry;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;
import luxe.utils.Maths;

import luxe.debug.DebugView;
import luxe.debug.TraceDebugView;
import luxe.debug.ProfilerDebugView;
import luxe.debug.StatsDebugView;

@:hide class Debug {

    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public var visible : Bool = false;
    public static var shut_down : Bool = false;

    public var debug_inspector : Inspector;
    public var overlay : QuadGeometry;

    static var trace_callbacks : Map<String, Dynamic->?haxe.PosInfos->Void>;

    public var batcher : Batcher;
    public var view : Camera;
    public var debug_font : BitmapFont;

        //track a 10 frame average
    public var dt_average : Float = 0;
    public var dt_average_accum : Float = 0;
    public var dt_average_span : Int = 60;
    public var dt_average_count : Int = 0;

    public var current_view_index = 0;
    public var last_view_index = 0;
    public var current_view : DebugView;
    public static var views : Array<DebugView>;

    public var padding : Vector;

    public var started = false;

//Profile path
    public var profile_path : String = "profile.txt";
    public var profiling : Bool = false;

#if luxe_native
    #if neko
        static var thread : neko.vm.Thread;
        static var mutex : neko.vm.Mutex;
    #else    
        static var thread : cpp.vm.Thread;
        static var mutex : cpp.vm.Mutex;
    #end 
#end 

    public function init() {        

        trace_callbacks = new Map();

        views = [
            new TraceDebugView(),
            new StatsDebugView(),
            new ProfilerDebugView()
        ];

        current_view = views[0];        

        haxe.Log.trace = internal_trace;

        core._debug(':: luxe :: \t Debug Initialized.');

    } //init

    public function start(_name:String) {
        ProfilerDebugView.start(_name);
    }
    public function end(_name:String) {
        ProfilerDebugView.end(_name);
    }

    public function remove_trace_listener( _name:String ) {
        trace_callbacks.remove(_name);
    }
    public function add_trace_listener( _name:String, _callback: Dynamic->?haxe.PosInfos->Void ) {
        trace_callbacks.set(_name, _callback);
    }

    public static function internal_trace( v : Dynamic, ?inf : haxe.PosInfos ) {

        #if luxe_native 
            Sys.println( inf.fileName + ':' + inf.lineNumber + ' ' + v );
        #end

        #if luxe_html5
            untyped console.log(inf.fileName + ':' + inf.lineNumber, v);
        #end
            
            //call listeners
        for(_callback in trace_callbacks) {
            _callback(v, inf);
        }        

    } //internal_trace

    public function create_debug_console() {

            //create the debug renderer and view
        batcher = new Batcher( Luxe.renderer, 'debug_batcher' );
        view = new Camera({ projection:ProjectionType.ortho, x2 : Luxe.screen.w, y2 : Luxe.screen.h });
            //set the camera of the batcher
        batcher.view = view;
            //Also, set the layer so it renders last
        batcher.layer = 999;

        Luxe.renderer.add_batch( batcher );

        overlay = new QuadGeometry({
            x:0, y:0, 
            w: Luxe.screen.w,  h: Luxe.screen.h,        
            color : new Color(0,0,0,0.8),
            depth : 999,    //debug depth
            group : 999,    //debug group
            enabled : false //default invisible
        });

            //add the geometry to the renderer
        batcher.add(overlay);

            //create the scene inspector
        padding = new Vector(Luxe.screen.w*0.05,Luxe.screen.h*0.05);
        debug_inspector = new Inspector({ 
            title:'default scene', 
            pos : new Vector(padding.x, padding.y),
            size : new Vector(Luxe.screen.w-(padding.x*2), Luxe.screen.h-(padding.y*2)),
            batcher : batcher
        });

        debug_inspector.onrefresh = refresh;

            //no need to process this while we are here.
        batcher.enabled = false;

        for(view in views) {
            view.create();
        }

        //start a background thread with the debug process function
        // #if luxe_native
        //     mutex = new cpp.vm.Mutex();
        //     thread = cpp.vm.Thread.create(do_views);            
        // #end

    } //create_debug_console

    public function onmouseup(e:MouseEvent) {
        if(visible) {
            for(view in views) {
                view.onmouseup(e);
            }
        }
    }

    public function onmousedown(e:MouseEvent) {
        if(visible) {
            for(view in views) {
                view.onmousedown(e);
            }
        }
    }
    public function onmousemove(e:MouseEvent) {
        if(visible) {
            for(view in views) {
                view.onmousemove(e);
            }
        }
    }

    public function onkeyup(e:KeyEvent) {

        if(visible) {
            for(view in views) {
                view.onkeyup(e);
            }
        }

        #if profiler
            #if luxe_native
                if(e.key == KeyValue.key_P && profiling) {
                    cpp.vm.Profiler.stop();
                    profiling = false;
                    trace("luxe :: profiling complete. Look for the results in " + profile_path );
                }
            #end //luxe_native
        #end //profiler        
    }
    public function onkeydown(e:KeyEvent) {
    
        if(visible) {

            if(e.key == KeyValue.key_1 && core.console_visible) {
                switch_view();
            }

            for(view in views) {
                view.onkeydown(e);
            }

        }

        #if profiler
            #if luxe_native
                if(e.key == KeyValue.key_P && e.ctrl_down) {
                    trace("luxe :: starting profiler ... let go of key to stop profiling.");
                    cpp.vm.Profiler.start( profile_path );                    
                    profiling = true;
                }
            #end //luxe_native
        #end //profiler        
    }

    public function onresize(e) {
        view.set_ortho({ x2 : Luxe.screen.w, y2 : Luxe.screen.h });
        //current_view.onresize(e);
    } //onresize

    function refresh() {
        current_view.refresh();
    }

    public function switch_view() {

            //keep knowledge of this
        last_view_index = current_view_index;
            //then go up one, todo:make easier to jump to specific
            //or cycle down etc
        current_view_index++;
            
            //handle looping
        if(current_view_index > views.length-1) {
            current_view_index = 0;
        }

            //now hide the last view
        views[last_view_index].hide();
            //store the new one
        current_view = views[current_view_index];

            //show the new one
        current_view.show();

    } //switch_console

    var last_cursor_shown : Bool = true;
    var last_cursor_locked : Bool = false;
    public function show_console(_show:Bool = true) {

        if(_show) {
            // still in flux for sdl2 support.
            // last_cursor_shown = Luxe.cursorShown();
            // last_cursor_locked = Luxe.cursorLocked();
            // Luxe.showCursor(true);
            // Luxe.lockCursor(false);
        } else {
            // if(last_cursor_shown!=true) Luxe.showCursor(last_cursor_shown);
            // if(last_cursor_locked!=false) Luxe.lockCursor(last_cursor_locked);
        }

        visible = _show;
        batcher.enabled = _show;

        if(_show) {
            current_view.show();
            overlay.enabled = true;
            debug_inspector.show();
        } else {
            current_view.hide();
            debug_inspector.hide();
            overlay.enabled = false;
        }
    }

    public function destroy() {
        shut_down = true;
        core._debug(':: luxe :: \t Debug shut down.');
    } //destroy

    
    // public static function do_views() {

    //     while(!shut_down) {
            
    //         for(view in views) {
    //             view.process();
    //         }

    //         Sys.sleep(0.05);
    //     }

    // }

	public function process() {

        dt_average_accum += Luxe.dt;
        dt_average_count++;

        if(dt_average_count == dt_average_span - 1) {
            dt_average = dt_average_accum/dt_average_span;
            dt_average_accum = dt_average;
            dt_average_count = 0;
        }

        if(!visible) return;        

            //update the title
        debug_inspector._title_text.text = Maths.fixed(Luxe.dt,3) + ' / ' + Maths.fixed(dt_average,3);
        
        // return;

        // #if !luxe_native
            for(view in views) {
                view.process();
            }
        // #end
        
	} //process

} //Debug 
