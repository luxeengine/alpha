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
import luxe.debug.BatcherDebugView;

import luxe.Log._debug;

class Debug {

    public var core : Core;
    public var visible : Bool = false;
    public static var shut_down : Bool = false;

    public var debug_inspector : Inspector;
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

        #if !no_debug_console
            views = [
                new TraceDebugView(),
                new StatsDebugView(),
                // new BatcherDebugView(),
                new ProfilerDebugView()
            ];
        #else
            views = [];
        #end

        current_view = views[0];

        haxe.Log.trace = internal_trace;

        _debug('\t debug initialized.');

    } //init

        /** start a profiling section for the profiler debug view */
    public function start(_name:String) {
        #if !no_debug_console
        if(!core.headless) {
            ProfilerDebugView.start(_name);
        }
        #end
    }

        /** end a profiling section for the profiler debug view */
    public function end(_name:String) {
        #if !no_debug_console
        if(!core.headless) {
            ProfilerDebugView.end(_name);
        }
        #end
    }
        /** remove a trace listener added via add_trace_listener */
    public function remove_trace_listener( _name:String ) {
        trace_callbacks.remove(_name);
    }

        /** since luxe captures the haxe `trace` log, you can add listeners to catch trace values for yourself. */
    public function add_trace_listener( _name:String, _callback: Dynamic->?haxe.PosInfos->Void ) {
        trace_callbacks.set(_name, _callback);
    }


#if cpp
    static function default_native_trace( v : Dynamic, ?infos : haxe.PosInfos ) {

        if (infos!=null && infos.customParams!=null) {

            var extra:String = "";

            for( v in infos.customParams ) { extra += "," + v; }

            untyped __trace(v + extra,infos);

        } else {
            untyped __trace(v,infos);
        }

    } //default_native_trace
#end //cpp

    @:noCompletion public static function internal_trace( v : Dynamic, ?inf : haxe.PosInfos ) {

        var _line = StringTools.rpad(Std.string(inf.lineNumber), ' ', 4);
        #if luxe_native
            default_native_trace(v, inf);
        #end

        #if luxe_web
            untyped console.log('${inf.fileName}::$_line $v');
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

            core.on('keyup', keyup);
            core.on('keydown', keydown);
            core.on('mouseup', mouseup);
            core.on('mousedown', mousedown);
            core.on('mousemove', mousemove);

                //create the debug renderer and view
            batcher = new Batcher( Luxe.renderer, 'debug_batcher' );
                //create a camera
            view = new Camera();
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
                visible : false, //default invisible
                batcher : batcher
            });

                //create the scene inspector
            padding = new Vector(Luxe.screen.w*0.05,Luxe.screen.h*0.05);
            debug_inspector = new Inspector({
                title:'luxe debug',
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

    @:noCompletion public function onresize(e) {
        view.viewport = new Rectangle(0,0,Luxe.screen.w, Luxe.screen.h);
    } //onresize

    function refresh() {
        current_view.refresh();
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

    var last_cursor_shown : Bool = true;
    var last_cursor_grab : Bool = false;

    @:noCompletion public function show_console(_show:Bool = true) {

        #if no_debug_console
            return;
        #end

        if(_show) {

            last_cursor_shown = Luxe.screen.cursor.visible;
            last_cursor_grab = Luxe.screen.cursor.grab;

            Luxe.screen.cursor.visible = true;
            Luxe.screen.cursor.grab = false;

        } else {

            if(last_cursor_shown!=true) {
                Luxe.screen.cursor.visible = last_cursor_shown;
            }

            if(last_cursor_grab!=false) {
                Luxe.screen.cursor.grab = last_cursor_grab;
            }
        }

        visible = _show;
        batcher.enabled = _show;

        if(_show) {
            current_view.show();
            overlay.visible = true;
            debug_inspector.show();
        } else {
            current_view.hide();
            debug_inspector.hide();
            overlay.visible = false;
        }

    } //show_console

    @:noCompletion public function destroy() {

        core.off('keyup', keyup);
        core.off('keydown', keydown);
        core.off('mouseup', mouseup);
        core.off('mousedown', mousedown);
        core.off('mousemove', mousemove);

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
        debug_inspector._title_text.text = "[ " + current_view.name + " ] " + Maths.fixed(Luxe.dt,5) + ' / ' + Maths.fixed(dt_average,5);

        // #if !luxe_native
            for(view in views) {
                view.process();
            }
        // #end

    } //process

} //Debug

