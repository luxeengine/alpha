package luxe.debug;

import luxe.Input.MouseEvent;
import luxe.Rectangle;
import luxe.Text;
import luxe.Vector;
import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Vertex;

class ProfilerDebugView extends luxe.debug.DebugView {

    public static var lists:Map<String,ProfilerValue>;

    public function new() {

        super();

        name = 'Profiler';
        lists = new Map();
    }

    var _setup : Bool = false;

    public static function add_offset(_id:String, _offset:String) {
        var _item = lists.get(_id);
        var _offsetitem = lists.get(_offset);
        if(_item != null && _offsetitem != null) {
            _item.offsets.push(_offsetitem);
        } else {
            trace("not found for " + _id + " or " + _offset);
            trace(_item + " / " + _offsetitem);
        }
    }

    public static function hide_item(_id:String) {
        var _item = lists.get(_id);
        if(_item != null) {
            _item.hidden = true;
            _item.bar.hide();
        }
    }
    public static function show_item(_id:String) {
        var _item = lists.get(_id);
        if(_item != null) {
            _item.hidden = false;
            _item.bar.show();
        }
    }

    public static function start(_id:String) {
        var _item = lists.get(_id);
        if(_item == null) {
            //create it
            _item = new ProfilerValue(_id, new ProfilerBar(_id, new Color().rgb(0xf6007b) ));
            _item.bar.pos = new Vector(Luxe.debug.padding.x*2,(Luxe.debug.padding.y*3) + (Lambda.count(lists) * 20) );
            lists.set(_id, _item);
        }

        _item.start = Luxe.time;
    }

    public static function end(_id:String) {
        var _item = lists.get(_id);
        if(_item!=null) {
            _item.set();
        } else {
            throw "Profile end called for " + _id + " but no start called";
        }
    }

    public override function show() {
        for(_item in lists) {
            if(!_item.hidden) {
                _item.bar.show();
            }
        }

        if(!_setup) {
            ProfilerDebugView.add_offset('core.render' , 'batch.debug_batcher');
            // ProfilerDebugView.add_offset('core.render' , 'batch.debug_batcher_view');
            // ProfilerDebugView.hide_item('batch.debug_batcher');
            // ProfilerDebugView.hide_item('batch.debug_batcher_view');
            _setup = true;
        }
    }
    public override function hide() {
        for(_item in lists) {
            _item.bar.hide();
        }
    }

}

private class ProfilerValue {

    public var offsets : Array<ProfilerValue>;
    public var bar : ProfilerBar;
    public var name : String;
    public var start : Float = 0.0;
    public var history : Array<Float>;
    public var avg : Int = 10;
    public var hidden : Bool = false;
    var count : Int = 0;
    var accum : Float = 0;

    public function new(_name:String, _bar:ProfilerBar) {
        name = _name; bar = _bar;
        history = [];
        offsets = [];
    }

    public function set() {

        var _t = Luxe.time - start;

            //adjust by any offsets
        for(_offset in offsets) {
            _t -= _offset.history[_offset.history.length-1];
        }

            //push the value into history
        history.push(_t);
            //drop old values
        if(history.length > avg) {
            history.shift();
        }

        count++;
            //reset if maxed average
        if(count == avg) {
            var __t = accum / avg;
            bar.value = __t;
            bar.ping = __t;
            accum = 0;
            count = 0;
        }

        accum += _t;

        if(bar.visible) {
            bar.text = Std.string(luxe.utils.Maths.fixed(_t*1000,4));
        }

    }

}

private class ProfilerBar {

    public var bar_geometry : QuadGeometry;
    public var bg_geometry : QuadGeometry;
    public var graphbg_geometry : QuadGeometry;
    public var graph_geometry : Geometry;

    public var text_item : Text;
    public var name : String;

    public var width : Float = 128;
    public var height : Float = 8;
    public var height2 : Float = 8;
    public var max : Float = 16.6;
    public var history:Int = 33;
    public var visible:Bool = false;
    var segment : Float;

    var color_red : Color;
    var color_green : Color;
    var color_normal : Color;

    @:isVar public var text (default,set) : String;
    @:isVar public var pos (default,set) : Vector;
    @:isVar public var value (default,set) : Float;
    @:isVar public var ping (default,set) : Float;

    public function new(_name:String, _color:Color){

        color_red = new Color().rgb(0xcc0000);
        color_green = new Color().rgb(0x228844);
        color_normal = new Color().rgb(0xf0f0f0);

            //:todo:snow:
        max = (1/60) * 1000;
        name = _name;
        segment = (width/history);
        height2 = height*2;

        text_item = new Text({
            no_scene : true,
            name : 'profiler.text.' + _name,
            pos : new Vector(0,0),
            color : _color,
            point_size : height*1.8,
            depth : 999.3,
            text : '32ms',
            batcher : Luxe.debug.batcher
        });

        bg_geometry = Luxe.draw.box({
            color : new Color().rgb(0x090909),
            depth : 999.3,
            batcher : Luxe.debug.batcher,
            x:0, y:0, w:width, h:height
        });

        graphbg_geometry = Luxe.draw.box({
            color : new Color().rgb(0x222222),
            depth : 999.3,
            batcher : Luxe.debug.batcher,
            x:0, y:0, w:width-segment, h:height*2
        });

        bar_geometry = Luxe.draw.box({
            color : _color,
            depth : 999.33,
            batcher : Luxe.debug.batcher,
            x:1, y:1, w:width-2, h:height-2
        });

        graph_geometry = new Geometry({
            color : _color,
            depth : 999.33,
            batcher : Luxe.debug.batcher
        });

        for(i in 0 ... history) {
            var _b = new Vertex(new Vector(segment*i, 0), _color);
            graph_geometry.add( _b );
        }

        graph_geometry.primitive_type = PrimitiveType.line_strip;

        hide();

    }

    public function hide() {
        visible = false;
        bar_geometry.visible = false;
        bg_geometry.visible = false;
        graph_geometry.visible = false;
        graphbg_geometry.visible = false;
        text_item.visible = false;
    }
    public function show() {
        visible = true;
        bar_geometry.visible = true;
        bg_geometry.visible = true;
        graph_geometry.visible = true;
        graphbg_geometry.visible = true;
        text_item.visible = true;
    }

    function set_ping(_v:Float) {

        var _vv = luxe.utils.Maths.fixed(_v*1000,4);
        var _p = _vv/max;

            //shift every vertex left
        for(i in 0 ... history) {
            //copy x from the next one
            var v = graph_geometry.vertices[i];
            if(i < (history-1)) {
                var v1 = graph_geometry.vertices[i+1];
                if(v1 != null) {
                    v.pos.y = Math.floor(v1.pos.y);
                    v.color = v1.color;
                }
            }
        }

        if(_p > 1) {
            _p = 1;
            graph_geometry.vertices[history-1].color = color_red;
        } else if(_p < 0.2) {
            graph_geometry.vertices[history-1].color = color_green;
        } else {
            graph_geometry.vertices[history-1].color = color_normal;
        }

        if(_p < 0.001) {
            _p = 0.001;
        }

        graph_geometry.vertices[history-1].pos.y = Math.floor(((height2)*(1.0-_p)));

        return ping = _v;
    }

    function set_value(_v:Float) {
        var _vv = luxe.utils.Maths.fixed(_v*1000,4);
        var _p = _vv/max;
        if(_p > 1) {
            _p = 1;
            bar_geometry.color = color_red;
        } else if(_p < 0.15) {
            bar_geometry.color = color_green;
        } else {
            bar_geometry.color = color_normal;
        }

        if(_p < 0.005) {
            _p = 0.005;
        }

        var nx = (width-2)*_p;
        // bar_geometry.transform.pos = new Vector();
        bar_geometry.resize(new Vector(nx, height-2));
        // bar_geometry.transform.pos = new Vector(bg_geometry.transform.pos.x+1, bg_geometry.transform.pos.y+1);

        return value = _v;
    }

    function set_pos(_p:Vector) {
        bg_geometry.transform.pos = _p;
        bar_geometry.transform.pos = new Vector(_p.x+1, _p.y+1);
        text_item.pos = new Vector(_p.x+(width*2)+10, _p.y-6);
        graphbg_geometry.transform.pos = new Vector(_p.x+width+2, _p.y-4);
        graph_geometry.transform.pos = graphbg_geometry.transform.pos;
        return pos = _p;
    }

    function set_text(_t:String) {
        text_item.text = name + ' | ' + _t + 'ms';
        return text = _t;
    }

}
