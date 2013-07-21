package lab;

import lab.Core;

import lab.debug.Inspector;
import phoenix.Batcher;
import phoenix.BitmapFont;
import phoenix.Camera;
import phoenix.geometry.QuadGeometry;

class Debug {
        
    public var core : Core;
    public function new( _core:Core ) { core = _core; }

    public var scene_inspector : Inspector;
    public var stats_text : lab.Text;

    public var debug_batcher : Batcher;
    public var debug_view : Camera;
    public var debug_font : BitmapFont;

    public var debug_overlay : QuadGeometry;

    public function startup() {


        core._debug(':: haxelab :: \t Debug Initialized.');
    }
    public function create_debug_console() {

            //create the debug renderer and view
        debug_batcher = new Batcher( Lab.renderer );
        debug_view = new Camera(ProjectionType.ortho, { x2 : Lab.screen.w, y2 : Lab.screen.h });
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

        stats_text = new lab.Text({
            font : Lab.renderer.default_font,
            text : get_stats_string(),
            depth : 999.3,
            size : 18,
            pos : new Vector(padding.x*2,padding.y*3),
            color : new Color(0,0,0,1).rgb(0xf6007b),
            batcher : debug_batcher,
            enabled : false          
        });
        
    }

    public function get_stats_string() {
        var s = '';
        s += Lab.renderer.stats;
        return s;
    }

    public function show_console(_show:Bool = true) {
        if(_show) {
            debug_overlay.enabled = true;
            stats_text.visible = true;
            scene_inspector.show();
        } else {
            debug_overlay.enabled = false;
            stats_text.visible = false;
            scene_inspector.hide();
        }
    } //show_console

    public function shutdown() {
        core._debug(':: haxelab :: \t Debug shut down.');
    } //shutdown

	public function process() {

        if(stats_text.visible) {
            trace('ok');
            stats_text.text = get_stats_string();
        }
	} //process
}