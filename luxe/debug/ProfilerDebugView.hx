package luxe.debug;

import luxe.Input.MouseEvent;
import luxe.Rectangle;
import luxe.Text;
import luxe.utils.Maths;
import luxe.Vector;
import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;
import phoenix.geometry.Vertex;

class ProfilerDebugView extends luxe.debug.DebugView {

    public static var lists:Map<String,ProfilerValue>;

    public static var color_red : Color = new Color().rgb(0xcc0000);
    public static var color_green : Color = new Color().rgb(0x228844);
    public static var color_normal : Color = new Color().rgb(0xf0f0f0);

    #if cpp
        public var memgraph:ProfilerGraph;
        public var memgraph2:ProfilerGraph;
        public var memgraph3:ProfilerGraph;
        public var memgraph4:ProfilerGraph;
        public var memtext:Text;
    #end //cpp

    public function new() {

        super();

        name = 'Profiler';
        lists = new Map();

    } //new

    var margin = 32;
    override function create() {

        #if cpp

            var debug = Luxe.debug;

            var viewrect = new Rectangle(
                debug.debug_inspector.pos.x + (margin/2),
                debug.debug_inspector.pos.y + (margin*1.5),
                debug.debug_inspector.size.x - margin,
                debug.debug_inspector.size.y - margin - (margin*1.5)
            );

            memgraph = new ProfilerGraph('usage');
            memgraph2 = new ProfilerGraph('current',false);
            memgraph3 = new ProfilerGraph('large',false);
            memgraph4 = new ProfilerGraph('reserved',false);

            var gh = 48;
            var gp = new Vector(viewrect.x, viewrect.h );
            var gw = viewrect.w;//Luxe.screen.w-(Luxe.debug.padding.x*4);

                memgraph.color = new Color().rgb(0xf6007b);
                memgraph2.color = new Color().rgb(0x007bf6);
                memgraph3.color = new Color(0,0,0,0.5).rgb(0xf6001a);
                memgraph4.color = new Color(0,0,0,0.5).rgb(0x00f67b);

                memgraph.history = memgraph2.history = memgraph3.history = memgraph4.history = 256;
                memgraph.height = memgraph2.height = memgraph3.height = memgraph4.height = gh;
                memgraph.width = memgraph2.width = memgraph3.width = memgraph4.width = gw;

            memgraph.create();
            memgraph2.create();
            memgraph3.create();
            memgraph4.create();

            memgraph.pos = memgraph2.pos = memgraph3.pos = memgraph4.pos = gp;

            memtext = new Text({
                no_scene : true,
                name : 'profiler.memgraph',
                pos : gp.clone().add_xyz(0, -gh),
                color : ProfilerDebugView.color_normal.clone(),
                point_size : 12,
                depth : 999.3,
                text : '1 mb',
                batcher : Luxe.debug.batcher,
                visible: false,
            });

            memtext.color.a = 0.4;

        #end //cpp

    } //create

    var tickamount = 0.017;
    var nexttick = 0.0;
    var peak = 1.0;
    var minpeak = 1.0;
    var _byte_levels = ['bytes', 'Kb', 'MB', 'GB', 'TB'];

    function update_graph(graph:ProfilerGraph, val:Float) {

        var _byte_index = Math.floor( Math.log(val) / Math.log(1024) );
        var _byte_value = ( val / Math.pow(1024, _byte_index) );

        if(_byte_value > peak) {
            peak = Math.ceil(_byte_value + (_byte_value*0.1));
        }

        if(_byte_value < minpeak) {
            minpeak = Math.floor(_byte_value - (_byte_value*0.1));
        }

        if(graph.max != peak) {
            graph.max = peak;
        }

        graph.ping = Maths.fixed(_byte_value,4);

    } //update_graph

    override function process() {

        #if cpp

            var u = cpp.vm.Gc.memInfo(cpp.vm.Gc.MEM_INFO_USAGE);
            var c = cpp.vm.Gc.memInfo(cpp.vm.Gc.MEM_INFO_CURRENT);
            var l = cpp.vm.Gc.memInfo(cpp.vm.Gc.MEM_INFO_LARGE);
            var r = cpp.vm.Gc.memInfo(cpp.vm.Gc.MEM_INFO_RESERVED);

            update_graph(memgraph,  u);
            update_graph(memgraph2, c);
            update_graph(memgraph3, l);
            update_graph(memgraph4, r);

            var _index = Math.floor( Math.log(u) / Math.log(1024) );
            var s = _byte_levels[_index];

            memtext.text =
                '(y axis) ${memgraph.max} $s\n'+
                'usage/pink: ${memgraph.ping} $s  |  '+
                'current/blue: ${memgraph2.ping} $s\n'+
                'large/red: ${memgraph3.ping} $s  |  '+
                'reserved/green: ${memgraph4.ping} $s\n';

        #end //cpp

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
    } //hide_item

    public static function show_item(_id:String) {
        var _item = lists.get(_id);
        if(_item != null) {
            _item.hidden = false;
            _item.bar.show();
        }
    } //show_item

    public static function start(_id:String, ?_max:Float) {

        var _item = lists.get(_id);

        if(_item == null) {
            //create it
            _item = new ProfilerValue(_id, new ProfilerBar(_id, _max, new Color().rgb(0xf6007b) ));
            _item.bar.pos = new Vector(Luxe.debug.padding.x*2,(Luxe.debug.padding.y*3) + (Lambda.count(lists) * 20) );
            lists.set(_id, _item);
        }

        _item.start = Luxe.time;

    } //start

    public static function end(_id:String) {

        var _item = lists.get(_id);

        if(_item!=null) {
            _item.set();
        } else {
            throw "Debug / profile end called for " + _id + " but no start called";
        }

    } //end

    public override function show() {

        for(_item in lists) {
            if(!_item.hidden) {
                _item.bar.show();
            }
        }

        #if cpp
            memgraph.show();
            memgraph2.show();
            memgraph3.show();
            memgraph4.show();
            memtext.visible = true;
        #end //cpp

        if(!_setup) {
            // ProfilerDebugView.add_offset('core.render' , 'batch.debug_batcher');
            // ProfilerDebugView.add_offset('core.render' , 'batch.debug_batcher_view');
            // ProfilerDebugView.hide_item('batch.debug_batcher');
            // ProfilerDebugView.hide_item('batch.debug_batcher_view');
            _setup = true;
        }

    } //show

    public override function hide() {

        for(_item in lists) {
            _item.bar.hide();
        }

        #if cpp
            memgraph.hide();
            memgraph2.hide();
            memgraph3.hide();
            memgraph4.hide();
            memtext.visible = false;
        #end

    } //hide

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
            accum = 0;
            count = 0;
        }

        accum += _t;

        if(bar.visible) {
            bar.text = Std.string(Maths.fixed(_t*1000,4));
        }

    }

}

private class ProfilerGraph {

    public var graphbg_geometry : QuadGeometry;
    public var graph_geometry : Geometry;
    public var name : String;

    var bg : Bool = true;

    public var width : Float = 128;
    public var height : Float = 8;
    public var height2 : Float = 8;
    public var history:Int = 33;
    public var visible:Bool = false;
    public var color:Color;

    @:isVar public var max (default,set) : Float;
    @:isVar public var ping (default,set) : Float;
    @:isVar public var pos (default,set) : Vector;

    var segment : Float;

    public function new(_name:String, _bg:Bool=true){

        bg = _bg;
        name = _name;
        color = new Color();
        max = Maths.fixed((1/60) * 1000, 2);

    } //new

    public function create() {

        segment = (width/history);
        height2 = height*2;

        if(bg) {
            graphbg_geometry = Luxe.draw.box({
                color : new Color().rgb(0x101010),
                depth : 999.3,
                batcher : Luxe.debug.batcher,
                x:0, y:0, w:width-segment, h:height2
            });
        }

        graph_geometry = new Geometry({
            color : color,
            depth : 999.33,
            batcher : Luxe.debug.batcher
        });

        for(i in 0 ... history) {
            var _b = new Vertex(new Vector(segment*i, height2), color);
            graph_geometry.add( _b );
        }

        graph_geometry.primitive_type = PrimitiveType.line_strip;

        hide();

    }

        //when changing the max we adjust
        //all the values in the history to reflect
    function set_max(_v:Float) {

        var oldmax = max;
        max = _v;

        if(graph_geometry != null) {
            var ratio = 1.0;
            if(oldmax != 0) {
                ratio = oldmax/_v;
            }
            for(v in graph_geometry.vertices) {
                if(v != null) {
                    //get the value out as 0 - 1
                    var vp = 1.0 - (v.pos.y / height2);
                    //multiply it by the old max to get the value
                    var vv = vp * oldmax;
                    //get the new % over new max
                    vp = vv / max;
                    //and then set the new y pos
                    v.pos.y = height2*(1.0-vp);
                }
            }
        }

        return max;
    }

    function set_ping(_v:Float) {

        var _vv = Maths.fixed(_v,4);
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

        _p = Maths.clamp(_p, 0.001, 1);

        if(_p > 1) {
            graph_geometry.vertices[history-1].color = ProfilerDebugView.color_red;
        } else if(_p < 0.2) {
            graph_geometry.vertices[history-1].color = ProfilerDebugView.color_green;
        } else {
            graph_geometry.vertices[history-1].color = color;
        }

        graph_geometry.vertices[history-1].pos.y = Math.floor(((height2)*(1.0-_p)));

        return ping = _v;

    } //set_ping

    public function hide() {
        visible = false;
        graph_geometry.visible = false;
        if(graphbg_geometry != null) graphbg_geometry.visible = false;
    }

    public function show() {
        visible = true;
        graph_geometry.visible = true;
        if(graphbg_geometry != null) graphbg_geometry.visible = true;
    }

    function set_pos(_p:Vector) {

        if(graphbg_geometry != null) graphbg_geometry.transform.pos.copy_from(_p);
        graph_geometry.transform.pos.copy_from(_p);

        return pos = _p;

    } //set_pos

} //ProfilerGraph

private class ProfilerBar {

    public var bar_geometry : QuadGeometry;
    public var bg_geometry : QuadGeometry;
    public var graph : ProfilerGraph;

    public var text_item : Text;
    public var name : String;

    public var visible:Bool = false;
    public var height : Float = 8;
    public var max : Float = 16.7;

    @:isVar public var text (default,set) : String;
    @:isVar public var pos (default,set) : Vector;
    @:isVar public var value (default,set) : Float;

    public function new(_name:String, ?_max:Float, _color:Color) {

        name = _name;

        graph = new ProfilerGraph(_name);
        graph.create();
        if(_max != null) graph.max = _max;

        text_item = new Text({
            no_scene : true,
            name : 'profiler.text.' + _name,
            pos : new Vector(0,0),
            color : _color,
            point_size : height*1.8,
            depth : 999.3,
            text : '',
            batcher : Luxe.debug.batcher
        });

        bg_geometry = Luxe.draw.box({
            color : new Color().rgb(0x090909),
            depth : 999.3,
            batcher : Luxe.debug.batcher,
            x:0, y:0, w:graph.width, h:graph.height
        });

        bar_geometry = Luxe.draw.box({
            color : _color,
            depth : 999.33,
            batcher : Luxe.debug.batcher,
            x:1, y:1, w:graph.width-2, h:graph.height-2
        });

        hide();

    } //new

    public function hide() {
        visible = false;
        bar_geometry.visible = false;
        bg_geometry.visible = false;
        text_item.visible = false;
        graph.hide();
    }

    public function show() {
        visible = true;
        bar_geometry.visible = true;
        bg_geometry.visible = true;
        text_item.visible = true;
        graph.show();
    }

    function set_value(_v:Float) {

        graph.ping = _v * 1000;

        if(!this.visible) return value = _v;

        var _vv = Maths.fixed(_v*1000,4);
        var _p = _vv/max;

        _p = Maths.clamp(_p, 0.005, 1);

        if(_p > 1) {
            bar_geometry.color = ProfilerDebugView.color_red;
        } else if(_p < 0.15) {
            bar_geometry.color = ProfilerDebugView.color_green;
        } else {
            bar_geometry.color = ProfilerDebugView.color_normal;
        }

        var nx = (graph.width-2) * _p;
        bar_geometry.resize_xy(nx, graph.height-2);

        return value = _v;

    } //set_value

    function set_pos(_p:Vector) {
        bg_geometry.transform.pos = _p;
        bar_geometry.transform.pos.set_xy(_p.x+1, _p.y+1);
        text_item.pos.set_xy(_p.x+(graph.width*2)+10, _p.y-6);
        graph.pos = _p.clone().add_xyz(graph.width+2, -graph.height+4);
        return pos = _p;
    }

    function set_text(_t:String) {
        text_item.text = '$name (${graph.max}ms) | ${_t}ms';
        return text = _t;
    }

} //ProfilerBar
