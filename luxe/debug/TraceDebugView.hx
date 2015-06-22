package luxe.debug;

import luxe.Screen.WindowEvent;

class TraceDebugView extends luxe.debug.DebugView {

        //log console
    public var logged : Array<String>;
    public var lines : luxe.Text;
    public var max_lines : Int = 35;

    public function new() {

        super();

        name = 'Log';

        Luxe.debug.add_trace_listener('TraceDebugView', on_trace);

        logged = new Array<String>();

        add_line('luxe version ${Luxe.build} Debug Log');

    } //new

    public function on_trace( v : Dynamic, ?inf : haxe.PosInfos ) {
        add_line( inf.fileName + ':' + inf.lineNumber + ' ' + v );
    }

    public override function create() {

        var debug = Luxe.debug;
        var text_bounds = new luxe.Rectangle( debug.padding.x+20, debug.padding.y+40, Luxe.screen.w-(debug.padding.x*2)-20, Luxe.screen.h-(debug.padding.y*2)-40 );

        lines = new luxe.Text({
            name : 'debug.log.text',
            no_scene : true,
            depth : 999.3,
            color : new Color().rgb(0x888888),
            bounds : text_bounds,
            bounds_wrap : true,
            font : Luxe.renderer.font,
            text : '',
            align_vertical : luxe.Text.TextAlign.bottom,
            point_size : 12,
            batcher : debug.batcher,
            visible : false
        });

        if(lines.geometry != null) {
            lines.geometry.clip_rect = text_bounds;
            lines.geometry.locked = true;
            lines.geometry.id = 'debug.log.text.geometry';
        }
    }

    override function onwindowsized(e:WindowEvent) {
        var debug = Luxe.debug;
        var text_bounds = new luxe.Rectangle( debug.padding.x+20, debug.padding.y+40, Luxe.screen.w-(debug.padding.x*2)-20, Luxe.screen.h-(debug.padding.y*2)-40 );
        lines.bounds = text_bounds;
        lines.clip_rect = text_bounds;
            //flush the sizes
        if(lines.geometry != null) {
            lines.geometry.locked = true;
            lines.geometry.dirty = true;
        }
    }

    public function add_line(_t:String) {

        if(logged == null) {
            return;
        }

            //store in the list of pushed lines
        logged.push(_t);

            //update the line geometry
        if(!visible) {
            return;
        }

        refresh_lines();

    } //add_line

    var _last_logged_length : Int = 0;
    function refresh_lines() {

        if(_last_logged_length == logged.length) {
            return;
        }

            //we go though each line in the logged list,
            //and create a string from them.
            //then we set the lines text to that
        var _final = '';

        if(logged.length <= max_lines) {
            for(_line in logged) {
                _final += _line + '\n';
            }
        } else {
            var _start = logged.length - max_lines;
            var _total = logged.length;
            for(i in _start ... logged.length) {
                var _line = logged[i];
                _final += _line + '\n';
            }
        }//

        lines.text = _final;

        if(lines.geometry != null) {
            lines.geometry.locked = true;
            lines.geometry.dirty = true;
        }

        _last_logged_length = logged.length;

    } //refresh_lines


    public override function refresh() {

    }

    public override function process() {

    }

    public override function show() {
        super.show();
        refresh_lines();
        lines.visible = true;
    }

    public override function hide() {
        super.hide();
        lines.visible = false;
    }

}
