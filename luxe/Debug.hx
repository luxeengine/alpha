package luxe;

import luxe.Core;

import luxe.debug.Inspector;
import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.Camera;
import phoenix.geometry.QuadGeometry;
import phoenix.Resource;

class Debug {

    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public var visible : Bool = false;

    public var scene_inspector : Inspector;

        //stats consolew
    public var render_stats_text : luxe.Text;
    public var resource_stats_text : luxe.Text;
    public var resource_list_text : luxe.Text;
        //log console
    public var lines : Array<luxe.Text>;
    public var max_lines : Int = 35;

    public var debug_batcher : Batcher;
    public var debug_view : Camera;
    public var debug_font : BitmapFont;

    public var debug_overlay : QuadGeometry;

    public var debug_draw_call_count : Int = 3;
    public var debug_geometry_count : Int = 13;

        //track a 10 frame average
    public var dt_average : Float = 0;
    public var dt_average_accum : Float = 0;
    public var dt_average_span : Int = 60;
    public var dt_average_count : Int = 0;

    public var current_view = 0;
    public var view_count = 2;

    public var padding:Vector;

    public var started = false;
    public var _last_render_stats : Dynamic;
    public var _render_stats : Dynamic;

    public function startup() {        

        haxe.Log.trace = internal_trace;

        core._debug(':: luxe :: \t Debug Initialized.');         
        _last_render_stats = {
            batchers : 0,
            geometry_count : 0,
            dynamic_batched_count : 0,
            static_batched_count : 0,
            enabled_count : 0,
            draw_calls : 0,
            group_count : 0      
        };          

        _render_stats = {
            batchers : 0,
            geometry_count : 0,
            dynamic_batched_count : 0,
            static_batched_count : 0,
            enabled_count : 0,
            draw_calls : 0,
            group_count : 0
        };

    }   

    public static function internal_trace( v : Dynamic, ?inf : haxe.PosInfos) {
        #if lime_native 
            Sys.println( inf.fileName + ':' + inf.lineNumber + ' ' + v );
        #end

        #if lime_html5
            untyped console.log(inf.fileName + ':' + inf.lineNumber, v);
        #end
        
        Luxe.debug.add_line(inf.fileName + ':' + inf.lineNumber + ' ' + v );
    }

    public function create_debug_console() {

            //create the debug renderer and view
        debug_batcher = new Batcher( Luxe.renderer, 'debug_batcher' );
        debug_view = new Camera({ projection:ProjectionType.ortho, x2 : Luxe.screen.w, y2 : Luxe.screen.h });
            //set the camera of the batcher
        debug_batcher.view = debug_view;
            //Also, set the layer so it renders last
        debug_batcher.layer = 999;

        Luxe.renderer.add_batch( debug_batcher );

        debug_overlay = new QuadGeometry({
            x:0, y:0, 
            width: Luxe.screen.w,  height: Luxe.screen.h,        
            color : new Color(0,0,0,0.8),
            depth : 999,    //debug depth
            group : 999,    //debug group
            enabled : false //default invisible
        });

            //add the geometry to the renderer
        debug_batcher.add(debug_overlay);

        //create the scene inspector
        padding = new Vector(Luxe.screen.w*0.05,Luxe.screen.h*0.05);
        scene_inspector = new Inspector({ 
            title:'default scene', 
            pos : new Vector(padding.x, padding.y),
            size : new Vector(Luxe.screen.w-(padding.x*2), Luxe.screen.h-(padding.y*2)),
            batcher : debug_batcher
        });

        scene_inspector.onrefresh = refresh;

        create_stats_console();
        create_log_console();

            //no need to process this while we are here.
        debug_batcher.enabled = false;

    }

    public function create_log_console() {
        lines = new Array<luxe.Text>();
        add_line('luxe version 0.0.1 Debug Log');
    }   

    public function add_line(_t:String) {        
        if(lines == null) {
            return;
        }
            //about to reach the max?
        var line = null;
        if(lines.length > max_lines - 1) {
            line = lines.shift();
        }

        var new_line_y = ( Luxe.screen.h-(padding.y*2) - 8);

        if(line == null) {

            line = new Text({
                depth : 999.3,
                color : new Color(1,1,1,0.6),
                pos : new Vector( padding.x + 24 , new_line_y ),
                font : Luxe.renderer.default_font,
                text : _t,
                size : 15,
                batcher : debug_batcher,
                enabled : true
            });

            
        } // line is a new line 
        else {
            line.pos.y = new_line_y;            
            line.text = _t;       
        }

        //move all previous lines up
        for(_line in lines) {
            _line.pos = new Vector(_line.pos.x,_line.pos.y-14);
            _line.color = new Color(1,1,1,0.6);
                //dirty them to update the positions
            for(_g in _line.geometry.geometry) {
                _g.dirty = true;
            }
        }

            //line is hidden by state
        line.visible = visible && current_view == 0;
            //latest line is darker
        line.color = new Color(1,1,1,0.6);
            //add the line
        lines.push(line);

    }

    public function create_stats_console() {

        render_stats_text = new luxe.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(padding.x*2,padding.y*3),
            font : Luxe.renderer.default_font,
            text : get_render_stats_string(),
            size : 18,
            batcher : debug_batcher,
            enabled : false
        });
        
        resource_stats_text = new luxe.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(padding.x*7,padding.y*3),
            font : Luxe.renderer.default_font,
            text : get_resource_stats_string(),
            size : 18,
            batcher : debug_batcher,
            enabled : false
        });
        
        resource_list_text = new luxe.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(padding.x*7,padding.y*7),
            font : Luxe.renderer.default_font,
            text : get_resource_stats_string(),
            size : 14,
            batcher : debug_batcher,
            enabled : false
        });
    } //create_stats_console

    public function refresh() {
        
        var texture_lists = '';
        var shader_lists = '';
        var font_lists = '';
        
        for(res in Luxe.resources.resourcelist) {
            switch (res.type) {
                case ResourceType.texture:
                    var t : phoenix.Texture = cast res;
                    texture_lists += '\t' + t.id + '    (' +  t.actual_width + 'x' + t.actual_height + '  '+ t.estimated_memory() +' )\n';
                case ResourceType.font:
                    font_lists += '\t' + res.id + '\n';
                case ResourceType.shader:
                    shader_lists += '\t' + res.id + '\n';
                default:
            }
        }

        var lists = 'Textures\n';
        lists += texture_lists;
        lists += 'Fonts\n';
        lists += font_lists;
        lists += 'Shader\n';
        lists += shader_lists;

        resource_list_text.text = lists;
    }

    public function get_render_stats_string() {
        return 
            'Renderer Statistics\n' + 
            '\tbatcher count : ' + _render_stats.batchers + '\n' +
            '\ttotal geometry : ' + _render_stats.geometry_count + '\n' +
            '\tenabled geometry : ' + _render_stats.enabled_count + '\n' +
            '\tdynamic batched geometry : ' + _render_stats.dynamic_batched_count + '\n' +
            '\tstatic batched geometry : ' + _render_stats.static_batched_count + '\n' +
            '\ttotal draw calls : ' + _render_stats.draw_calls;  
    }
    public function get_resource_stats_string() {        
        return Std.string(Luxe.resources.stats);
    }

    public function switch_console(?_change:Bool = true) {
        if(_change) {
            current_view++;
            if(current_view > view_count-1) {
                current_view = 0;
            }
        }

        switch (current_view) {
            case 0:                
                show_log_console(true);
                show_stats_console(false);
            case 1:
                show_log_console(false);
                show_stats_console();
        }
    }

    var last_cursor_shown : Bool = true;
    var last_cursor_locked : Bool = false;
    public function show_console(_show:Bool = true) {

        if(_show) {
            last_cursor_shown = Luxe.cursorShown();
            last_cursor_locked = Luxe.cursorLocked();
            Luxe.showCursor(true);
            Luxe.lockCursor(false);
        } else {
            if(last_cursor_shown!=true) Luxe.showCursor(last_cursor_shown);
            if(last_cursor_locked!=false) Luxe.lockCursor(last_cursor_locked);
        }

        visible = _show;
        debug_batcher.enabled = _show;

        if(_show) {
            switch_console(false);
            debug_overlay.enabled = true;
            scene_inspector.show();
        } else {
            show_log_console(false);
            show_stats_console(false);
            scene_inspector.hide();
            debug_overlay.enabled = false;
        }
    }

    public function show_log_console(_show:Bool = true) {
        if(_show) {
            for(_line in lines) {
                _line.visible = true;
            }
        } else {
            for(_line in lines) {
                _line.visible = false;
            }
        }
    }

    public function show_stats_console(_show:Bool = true) {
        if(_show) {
            render_stats_text.visible = true;
            resource_stats_text.visible = true;
            resource_list_text.visible = true;
        } else {            
            render_stats_text.visible = false;
            resource_stats_text.visible = false;
            resource_list_text.visible = false;
        }
    } //show_console

    public function shutdown() {
        core._debug(':: luxe :: \t Debug shut down.');
    } //shutdown

    public function refresh_render_stats() {

        render_stats_text.text = get_render_stats_string();
        resource_stats_text.text = get_resource_stats_string();

        for(_g in resource_stats_text.geometry.geometry) {
            _g.locked = true;
            _g.dirty = true;
        }
        
        for(_g in render_stats_text.geometry.geometry) {
            _g.locked = true;
            _g.dirty = true;
        }
        
    } //refresh_render_stats

    public var hide_debug : Bool = true;
    public function toggle_debug_stats() {
         hide_debug = !hide_debug;
    }
    public function update_render_stats() {

        debug_geometry_count = debug_batcher.geometry.length;
        debug_draw_call_count = debug_batcher.draw_calls;        

        _render_stats.batchers = Luxe.renderer.stats.batchers;
        _render_stats.geometry_count = Luxe.renderer.stats.geometry_count;
        _render_stats.enabled_count = Luxe.renderer.stats.enabled_count;
        _render_stats.dynamic_batched_count = Luxe.renderer.stats.dynamic_batched_count;
        _render_stats.static_batched_count = Luxe.renderer.stats.static_batched_count;
        _render_stats.draw_calls = Luxe.renderer.stats.draw_calls;

        if(hide_debug) {

            _render_stats.batchers = _render_stats.batchers - 1;
            _render_stats.geometry_count = _render_stats.geometry_count - debug_geometry_count;
            _render_stats.enabled_count = _render_stats.enabled_count - debug_geometry_count + lines.length;
            _render_stats.dynamic_batched_count = _render_stats.dynamic_batched_count - debug_geometry_count + debug_batcher.static_batched_count + lines.length;
            _render_stats.static_batched_count = _render_stats.static_batched_count - debug_batcher.static_batched_count;
            _render_stats.draw_calls -= debug_draw_call_count;

        } //hide debug stats?
        
    }   

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
        scene_inspector._title_text.text = "default scene dt : (average) " + (Std.int(dt_average*1000) / 1000) + ' (exact) ' + (Std.int(Luxe.dt*1000) / 1000);

        if(current_view == 0) {

        } else 
        if(current_view == 1) {

            var dirty = false;
        
                //Update the local statistics
            update_render_stats();

            if(_last_render_stats.batchers != _render_stats.batchers) 
                { dirty = true; _last_render_stats.batchers = _render_stats.batchers; }
            if(_last_render_stats.geometry_count != _render_stats.geometry_count) 
                { dirty = true; _last_render_stats.geometry_count = _render_stats.geometry_count; }
            if(_last_render_stats.dynamic_batched_count != _render_stats.dynamic_batched_count) 
                { dirty = true; _last_render_stats.dynamic_batched_count = _render_stats.dynamic_batched_count; }
            if(_last_render_stats.static_batched_count != _render_stats.static_batched_count) 
                { dirty = true; _last_render_stats.static_batched_count = _render_stats.static_batched_count; }
            if(_last_render_stats.enabled_count != _render_stats.enabled_count) 
                { dirty = true; _last_render_stats.enabled_count = _render_stats.enabled_count; }
            if(_last_render_stats.draw_calls != _render_stats.draw_calls) 
                { dirty = true; _last_render_stats.draw_calls = _render_stats.draw_calls; }
            if(_last_render_stats.group_count != _render_stats.group_count) 
                { dirty = true; _last_render_stats.group_count = _render_stats.group_count; }

            if(dirty) {
                refresh_render_stats();
            } //dirty

        } //current_view


	} //process
}

//cpp.vm.Profiler.start("log.txt");
//cpp.vm.Profiler.stop();
