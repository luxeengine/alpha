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

    public var scene_inspector : Inspector;
    public var render_stats_text : lab.Text;
    public var resource_stats_text : lab.Text;
    public var resource_list_text : lab.Text;

    public var debug_batcher : Batcher;
    public var debug_view : Camera;
    public var debug_font : BitmapFont;

    public var debug_overlay : QuadGeometry;

    public var debug_draw_call_count : Int = 3;
    public var debug_geometry_count : Int = 13;

    public function startup() {        

        core._debug(':: haxelab :: \t Debug Initialized.');

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
        var padding : Vector = new Vector(Lab.screen.w*0.05,Lab.screen.h*0.05);
        scene_inspector = new Inspector({ 
            title:'default scene', 
            pos : new Vector(padding.x, padding.y),
            size : new Vector(Lab.screen.w-(padding.x*2), Lab.screen.h-(padding.y*2)),
            batcher:debug_batcher
        });

        scene_inspector.onrefresh = refresh;

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
            pos : new Vector(padding.x*6,padding.y*3),
            font : Lab.renderer.default_font,
            text : get_resource_stats_string(),
            size : 18,
            batcher : debug_batcher,
            enabled : false
        });
        
        resource_list_text = new lab.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(padding.x*6,padding.y*7),
            font : Lab.renderer.default_font,
            text : get_resource_stats_string(),
            size : 14,
            batcher : debug_batcher,
            enabled : false
        });
        
          
    }

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

    public function show_console(_show:Bool = true) {
        if(_show) {
            debug_overlay.enabled = true;
            render_stats_text.visible = true;
            resource_stats_text.visible = true;
            resource_list_text.visible = true;
            scene_inspector.show();
        } else {
            debug_overlay.enabled = false;
            render_stats_text.visible = false;
            resource_stats_text.visible = false;
            resource_list_text.visible = false;
            scene_inspector.hide();
        }
    } //show_console

    public function shutdown() {
        core._debug(':: haxelab :: \t Debug shut down.');
    } //shutdown

	public function process() {

        if(render_stats_text.visible) {

            if(Lab.renderer.stats.geometry_count > debug_geometry_count) {
                Lab.renderer.stats.draw_calls -= debug_draw_call_count;
                Lab.renderer.stats.geometry_count -= debug_geometry_count;
                Lab.renderer.stats.batched_count -= debug_geometry_count;
                Lab.renderer.stats.enabled_count -= debug_geometry_count;
            }            

            render_stats_text.text = get_render_stats_string();
            resource_stats_text.text = get_resource_stats_string();
            scene_inspector._title_text.text = "default scene " + (Std.int(Lab.dt*1000) / 1000);
        }

	} //process
}