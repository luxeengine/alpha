package luxe;

import luxe.Core;
import Luxe.Ev;

import luxe.debug.Inspector;
import luxe.Input.KeyEvent;
import luxe.Input;
import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.Camera;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;
import luxe.utils.Maths;

import luxe.debug.DebugView;
import luxe.debug.TraceDebugView;
import luxe.debug.ProfilerDebugView;
import luxe.debug.SceneDebugView;
import luxe.debug.StatsDebugView;
import luxe.debug.BatcherDebugView;

import luxe.Log._debug;

class Debug {

    public var core : Core;
    public var visible : Bool = false;
    public static var shut_down : Bool = false;

    public var inspector : Inspector;
    public var overlay : QuadGeometry;

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

    static var trace_callbacks : Map<String, Dynamic->?haxe.PosInfos->Void>;

    @:noCompletion public function new( _core:Core ) {
        core = _core;
    } //new

    @:noCompletion public function init() {

        trace_callbacks = new Map();
        views = [];

        #if !no_debug_console

            views.push(new TraceDebugView());
            views.push(new StatsDebugView());
            //views.push(new BatcherDebugView());
            views.push(new ProfilerDebugView());
            views.push(new SceneDebugView());

            current_view = views[0];

        #end

        haxe.Log.trace = internal_trace;

        _debug('\t debug initialized.');

    } //init

        /** Fetch the instance of the debug view for manipulation by name */
    public function get_view<T>(_name:String) : T {

        for(view in views) {

            if(view.name == _name) {
                return cast view;
            }

        } //view

        return null;

    } //get_view

    #if !luxe_noprofile
            /** start a profiling section for the profiler debug view */
        public function start(_name:String, ?_max:Float) {
            #if !no_debug_console
                if(!core.appconfig.headless) {
                    ProfilerDebugView.start(_name, _max);
                }
            #end
        }

            /** end a profiling section for the profiler debug view */
        public function end(_name:String) {
            #if !no_debug_console
                if(!core.appconfig.headless) {
                    ProfilerDebugView.end(_name);
                }
            #end
        }
    #end

        /** remove a trace listener added via add_trace_listener */
    public function remove_trace_listener( _name:String ) {
        trace_callbacks.remove(_name);
    }

        /** since luxe captures the haxe `trace` log, you can add listeners to catch trace values for yourself. */
    public function add_trace_listener( _name:String, _callback: Dynamic->?haxe.PosInfos->Void ) {
        trace_callbacks.set(_name, _callback);
    }


    //Taken from haxe std lib
#if cpp
    static function default_cpp_trace( v : Dynamic, ?infos : haxe.PosInfos ) {
        if (infos!=null && infos.customParams!=null) {
            var extra:String = "";
            for( v in infos.customParams ) { extra += "," + v; }
            untyped __trace(v + extra,infos);
        } else {
            untyped __trace(v,infos);
        }
    } //default_native_trace
#end //cpp
#if neko
    static function default_neko_trace(v:Dynamic, ?infos:haxe.PosInfos) {
        untyped {
            $print(infos.fileName + ":" + infos.lineNumber + ": ", v);
            if( infos.customParams != null ) for( v in infos.customParams ) $print(",", v);
            $print("\n");
        }
    }
#end //neko

    @:noCompletion public static function internal_trace( v : Dynamic, ?inf : haxe.PosInfos ) {

        var _line = StringTools.rpad(Std.string(inf.lineNumber), ' ', 4);

        #if neko default_neko_trace(v, inf);
        #elseif cpp default_cpp_trace(v, inf);
        #end

        #if luxe_web untyped console.log('${inf.fileName}::$_line $v');
        #end

        if(shut_down) {
            return;
        }

            //call listeners
        for(_callback in trace_callbacks) {
            _callback(v, inf);
        }

    } //internal_trace

    @:noCompletion public function create_debug_console() {

        #if !no_debug_console

            core.on(Ev.keyup, keyup);
            core.on(Ev.keydown, keydown);
            core.on(Ev.mouseup, mouseup);
            core.on(Ev.mousedown, mousedown);
            core.on(Ev.mousemove, mousemove);
            core.on(Ev.mousewheel, mousewheel);

                //create the debug renderer and view
            batcher = new Batcher( Luxe.renderer, 'debug_batcher', Math.floor(Math.pow(2, 20)));
                //create a camera
            view = new Camera({ camera_name:'debug_batcher_camera' });
                //set the camera of the batcher
            batcher.view = view;
                //Also, set the layer so it renders last
            batcher.layer = 999;

            overlay = new QuadGeometry({
                id: 'debug.overlay',
                x:0, y:0,
                w: Luxe.screen.w,  h: Luxe.screen.h,
                color : new Color(0,0,0,0.8),
                depth : 999,    //debug depth
                visible : false, //default invisible
                batcher : batcher
            });

            overlay.locked = true;

                //create the scene inspector
            padding = new Vector(Luxe.screen.w*0.05,Luxe.screen.h*0.05);
            inspector = new Inspector({
                pos : new Vector(padding.x, padding.y),
                size : new Vector(Luxe.screen.w-(padding.x*2), Luxe.screen.h-(padding.y*2)),
                batcher : batcher
            });


            inspector.onrefresh = refresh;

            core.on(Ev.windowsized, function( _event:luxe.Screen.WindowEvent ){

                var _w = _event.x;
                var _h = _event.y;

                padding.set_xy(_w*0.05,_h*0.05);

                overlay.resize_xy(_w, _h);
                view.viewport = new Rectangle(0, 0, _w, _h);
                inspector.size = new Vector(_w-(padding.x*2), _h-(padding.y*2));
                inspector.pos = new Vector(padding.x, padding.y);

                for(view in views) {
                    view.onwindowsized(_event);
                }
            });

                //no need to process this while we are here.
            batcher.enabled = false;

            for(view in views) {
                view.create();
            }

        #end //no_debug_console

    } //create_debug_console

    function mouseup(e:MouseEvent) {
        if(visible) {
            for(view in views) {
                view.onmouseup(e);
            }
        }
    } //mouseup

    function mousedown(e:MouseEvent) {
        if(visible) {
            for(view in views) {
                view.onmousedown(e);
            }
        }
    } //mousedown

    function mousewheel(e:MouseEvent) {
        if(visible) {
            for(view in views) {
                view.onmousewheel(e);
            }
        }
    } //mousewheel

    function mousemove(e:MouseEvent) {
        if(visible) {
            for(view in views) {
                view.onmousemove(e);
            }
        }
    } //mousemove

    function keyup(e:KeyEvent) {

        if(visible) {
            for(view in views) {
                view.onkeyup(e);
            }
        } //visible

        #if profiler
            #if luxe_native
                if(e.keycode == Key.key_p && profiling) {
                    cpp.vm.Profiler.stop();
                    profiling = false;
                    trace("profiling complete. Look for the results in " + profile_path );
                }
            #end //luxe_native
        #end //profiler

    } //keyup

    function keydown(e:KeyEvent) {

        if(visible) {

            if(e.keycode == Key.key_1 && core.console_visible) {
                switch_view();
            }

            for(view in views) {
                view.onkeydown(e);
            }

        }

        #if profiler
            #if luxe_native
                if(e.keycode == Key.key_p && e.mod.ctrl && !e.repeat) {
                    trace("starting profiler ... let go of key to stop profiling.");
                    cpp.vm.Profiler.start( profile_path );
                    profiling = true;
                }
            #end //luxe_native
        #end //profiler

    } //keydown

    function refresh() {

        if(current_view != null) {
            current_view.refresh();
        }

    } //refresh

        /** programmatically switch the debug console view. currently cycles the view. */
    @:noCompletion public function switch_view() {

            //keep knowledge of this
        last_view_index = current_view_index;
            //then go up one, :todo : make easier to jump to specific view?
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

    } //switch_view

    var last_cursor_grab : Bool = false;

    @:noCompletion public function show_console(_show:Bool = true) {

        #if no_debug_console
            return;
        #end

        if(_show) {

            last_cursor_grab = Luxe.screen.cursor.grab;

            Luxe.screen.cursor.grab = false;

        } else {

            if(last_cursor_grab!=false) {
                Luxe.screen.cursor.grab = last_cursor_grab;
            }
        }

        visible = _show;
        batcher.enabled = _show;

        if(_show) {
            current_view.show();
            overlay.visible = true;
            inspector.show();
        } else {
            current_view.hide();
            inspector.hide();
            overlay.visible = false;
        }

    } //show_console

    @:noCompletion public function destroy() {

        core.off(Ev.keyup, keyup);
        core.off(Ev.keydown, keydown);
        core.off(Ev.mouseup, mouseup);
        core.off(Ev.mousedown, mousedown);
        core.off(Ev.mousemove, mousemove);
        core.off(Ev.mousewheel, mousewheel);

        _debug('\t debug shut down.');
        shut_down = true;

    } //destroy

    @:noCompletion public function process() {

        dt_average_accum += Luxe.dt;
        dt_average_count++;

        if(dt_average_count == dt_average_span - 1) {
            dt_average = dt_average_accum/dt_average_span;
            dt_average_accum = dt_average;
            dt_average_count = 0;
        }

        if(!visible) {
            return;
        }

            //update the title
        inspector.title.text = '[${current_view.name}] / ${Math.round(1/dt_average)} / ${Maths.fixed(Luxe.dt,5)} / ${Maths.fixed(dt_average,5)}';

        for(view in views) {
            view.process();
        }

    } //process

} //Debug

