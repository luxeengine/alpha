package luxe.debug;

import luxe.Input.KeyEvent;
import luxe.Input;
import phoenix.Resource;

class StatsDebugView extends luxe.debug.DebugView  {

    public var _last_render_stats : Dynamic;
    public var _render_stats : Dynamic;

    public var debug_draw_call_count : Int = 3;
    public var debug_geometry_count : Int = 13;

        //stats console
    public var render_stats_text : luxe.Text;
    public var resource_stats_text : luxe.Text;
    public var resource_list_text : luxe.Text;

    public function new() {

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

    public function get_resource_stats_string() {        
        return Std.string(Luxe.resources.stats);
    }

    public function get_render_stats_string() {
        return 
            'Renderer Statistics\n' + 
            '\tbatcher count : ' + _render_stats.batchers + '\n' +
            '\ttotal geometry : ' + _render_stats.geometry_count + '\n' +
            '\tenabled geometry : ' + _render_stats.enabled_count + '\n' +
            '\tdynamic batch count : ' + _render_stats.dynamic_batched_count + '\n' +
            '\tstatic batch count : ' + _render_stats.static_batched_count + '\n' +
            '\ttotal draw calls : ' + _render_stats.draw_calls;            
    }

    public override function create() { 

        var debug = Luxe.debug;

        render_stats_text = new luxe.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(debug.padding.x*2,debug.padding.y*3),
            font : Luxe.renderer.default_font,
            text : get_render_stats_string(),
            size : 18,
            batcher : debug.batcher,
            enabled : false
        });
        
        resource_stats_text = new luxe.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(debug.padding.x*7,debug.padding.y*3),
            font : Luxe.renderer.default_font,
            text : get_resource_stats_string(),
            size : 18,
            batcher : debug.batcher,
            enabled : false
        });
        
        resource_list_text = new luxe.Text({
            depth : 999.3,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(debug.padding.x*7,debug.padding.y*9),
            font : Luxe.renderer.default_font,
            text : '',
            size : 14,
            batcher : debug.batcher,
            enabled : false
        });


        resource_list_text.locked = true;
        resource_stats_text.locked = true;

    }

    public override function refresh() {
        
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
        resource_list_text.geometry.dirty = true;
    }



    public override function process() {
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
    }

    public override function onkeydown(e:KeyEvent) {
        if(e.key == KeyValue.key_2 && Luxe.debug.visible ) {
            toggle_debug_stats();
        }
    }

    public override function show() {
        refresh();
        render_stats_text.visible = true;
        resource_stats_text.visible = true;
        resource_list_text.visible = true;        
    }

    public override function hide() {
        render_stats_text.visible = false;
        resource_stats_text.visible = false;
        resource_list_text.visible = false;
    }

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

        debug_geometry_count = Luxe.debug.batcher.geometry.size();
        debug_draw_call_count = Luxe.debug.batcher.draw_calls;

        _render_stats.batchers = Luxe.renderer.stats.batchers;
        _render_stats.geometry_count = Luxe.renderer.stats.geometry_count;
        _render_stats.enabled_count = Luxe.renderer.stats.enabled_count;
        _render_stats.dynamic_batched_count = Luxe.renderer.stats.dynamic_batched_count;
        _render_stats.static_batched_count = Luxe.renderer.stats.static_batched_count;
        _render_stats.draw_calls = Luxe.renderer.stats.draw_calls;

        if(hide_debug) {

            _render_stats.batchers = _render_stats.batchers - 1;
            _render_stats.geometry_count = _render_stats.geometry_count - debug_geometry_count;
            _render_stats.enabled_count = _render_stats.enabled_count - _render_stats.enabled_count;
            _render_stats.dynamic_batched_count = _render_stats.dynamic_batched_count - Luxe.debug.batcher.dynamic_batched_count;// - Luxe.debug.batcher.static_batched_count;
            _render_stats.static_batched_count = _render_stats.static_batched_count - Luxe.debug.batcher.static_batched_count;
            _render_stats.draw_calls -= debug_draw_call_count;

        } //hide debug stats?
        
    } //update_render_stats 

} //StatsDebugView

 
