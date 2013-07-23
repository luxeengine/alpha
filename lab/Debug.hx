package lab;

import lab.Core;

import lab.debug.Inspector;
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

        //stats console
    public var render_stats_text : lab.Text;
    public var resource_stats_text : lab.Text;
    public var resource_list_text : lab.Text;
        //log console
    public var lines : Array<lab.Text>;
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
    public var dt_average_span : Int = 10;
    public var dt_average_count : Int = 0;

    public var current_view = 0;
    public var view_count = 2;

    public var padding:Vector;

    public var _last_render_stats : Dynamic;

    public function startup() {        

        haxe.Log.trace = internal_trace;

        core._debug(':: haxelab :: \t Debug Initialized.');         
        _last_render_stats = {
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
       Lab.debug.add_line(inf.fileName + ':' + inf.lineNumber + ' ' + v );
    }

    public function create_debug_console() {

            //create the debug renderer and view
        debug_batcher = new Batcher( Lab.renderer );
        debug_view = new Camera(ProjectionType.ortho, { x2 : Lab.screen.w, y2 : Lab.screen.h });

        debug_batcher.view = debug_view;

        Lab.renderer.add_batch( debug_batcher );

        debug_overlay = new QuadGeometry({
            x:0, y:0, 
            width: Lab.screen.w,  height: Lab.screen.h,        
            color : new Color(1,1,1,0.9),
            depth : 999,    //debug depth
            group : 999,    //debug group
            enabled : false //default invisible
        });

            //add the geometry to the renderer
        debug_batcher.add(debug_overlay);

        //create the scene inspector
        padding = new Vector(Lab.screen.w*0.05,Lab.screen.h*0.05);
        scene_inspector = new Inspector({ 
            title:'default scene', 
            pos : new Vector(padding.x, padding.y),
            size : new Vector(Lab.screen.w-(padding.x*2), Lab.screen.h-(padding.y*2)),
            batcher:debug_batcher
        });

        scene_inspector.onrefresh = refresh;

        create_stats_console();
        create_log_console();
    }

    public function create_log_console() {
        lines = new Array<lab.Text>();
        add_line('lab version 0.0.1 Debug Log');
    }   

    public function add_line(_t:String) {        

            //about to reach the max?
        var line = null;
        if(lines.length > max_lines - 1) {
            line = lines.shift();
        }

        var new_line_y = ( Lab.screen.h-(padding.y*2) - 8);

        if(line == null) {
            var new_line_y = 
            line = new Text({
                depth : 999.3,
                color : new Color(0,0,0,0.6),
                pos : new Vector( padding.x + 24 , new_line_y ),
                font : Lab.renderer.default_font,
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
            _line.color = new Color(0,0,0,0.4);
        }

            //line is hidden by state
        line.visible = visible && current_view == 0;
            //latest line is darker
        line.color = new Color(0,0,0,0.6);
            //add the line
        lines.push(line);

    }

    public function create_stats_console() {
        render_stats_text = new lab.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(padding.x*2,padding.y*3),
            font : Lab.renderer.default_font,
            text : get_render_stats_string(),
            size : 18,
            batcher : debug_batcher,
            enabled : false
        });
        
        resource_stats_text = new lab.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(padding.x*7,padding.y*3),
            font : Lab.renderer.default_font,
            text : get_resource_stats_string(),
            size : 18,
            batcher : debug_batcher,
            enabled : false
        });
        
        resource_list_text = new lab.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(padding.x*7,padding.y*7),
            font : Lab.renderer.default_font,
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
        
        for(res in Lab.resources.resourcelist) {
            switch (res.type) {
                case ResourceType.texture:
                    var t : phoenix.Texture = cast res;
                    texture_lists += '\t' + t.id + '    (' +  t.actual_width + 'x' + t.actual_height + ')\n';
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
        return Std.string(Lab.renderer.stats);        
    }
    public function get_resource_stats_string() {        
        return Std.string(Lab.resources.stats);
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

    public function show_console(_show:Bool = true) {
        visible = _show;
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
        core._debug(':: haxelab :: \t Debug shut down.');
    } //shutdown

    public function refresh_render_stats() {

        if(Lab.renderer.stats.geometry_count > debug_geometry_count) {
            Lab.renderer.stats.draw_calls -= debug_draw_call_count;
            Lab.renderer.stats.geometry_count -= debug_geometry_count;
            Lab.renderer.stats.dynamic_batched_count -= debug_geometry_count;
            Lab.renderer.stats.enabled_count -= debug_geometry_count;
        }

        render_stats_text.text = get_render_stats_string();
        resource_stats_text.text = get_resource_stats_string();

    } //refresh_render_stats

	public function process() {

        dt_average_accum += Lab.dt;
        dt_average_count++;

        if(dt_average_count == dt_average_span - 1) {
            dt_average = dt_average_accum/dt_average_span;
            dt_average_accum = dt_average;
            dt_average_count = 0;
        }

        if(!visible) return;

            //update the title
        scene_inspector._title_text.text = "default scene dt : (average) " + (Std.int(dt_average*1000) / 1000) + ' (exact) ' + (Std.int(Lab.dt*1000) / 1000);

        if(current_view == 0) {

        } else 
        if(current_view == 1) {

            var dirty = false;
    
            if(_last_render_stats.batchers != Lab.renderer.stats.batchers) 
                { dirty = true; _last_render_stats.batchers = Lab.renderer.stats.batchers; }
            if(_last_render_stats.geometry_count != Lab.renderer.stats.geometry_count) 
                { dirty = true; _last_render_stats.geometry_count = Lab.renderer.stats.geometry_count; }
            if(_last_render_stats.dynamic_batched_count != Lab.renderer.stats.dynamic_batched_count) 
                { dirty = true; _last_render_stats.dynamic_batched_count = Lab.renderer.stats.dynamic_batched_count; }
            if(_last_render_stats.static_batched_count != Lab.renderer.stats.static_batched_count) 
                { dirty = true; _last_render_stats.static_batched_count = Lab.renderer.stats.static_batched_count; }
            if(_last_render_stats.enabled_count != Lab.renderer.stats.enabled_count) 
                { dirty = true; _last_render_stats.enabled_count = Lab.renderer.stats.enabled_count; }
            if(_last_render_stats.draw_calls != Lab.renderer.stats.draw_calls) 
                { dirty = true; _last_render_stats.draw_calls = Lab.renderer.stats.draw_calls; }
            if(_last_render_stats.group_count != Lab.renderer.stats.group_count) 
                { dirty = true; _last_render_stats.group_count = Lab.renderer.stats.group_count; }

            if(dirty) {
                refresh_render_stats();
            } //dirty

        } //current_view


	} //process
}

//cpp.vm.Profiler.start("log.txt");
//cpp.vm.Profiler.stop();
