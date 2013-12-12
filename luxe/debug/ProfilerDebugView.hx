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

    public var core:ProfilerValue;
    public static var lists:Map<String,ProfilerValue>;

    public function new() {
        lists = new Map();
    }

    public static function start(_id:String) {
        var _item = lists.get(_id);
        if(_item == null) {
            //create it 
            _item = new ProfilerValue(_id, new ProfilerBar(_id, new Color().rgb(0xf6007b) ));
            _item.bar.pos = new Vector(Luxe.debug.padding.x*2,(Luxe.debug.padding.y*3) + (Lambda.count(lists) * 20) );
            lists.set(_id, _item);
        }
    
        _item.start = haxe.Timer.stamp();
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
            _item.bar.show();
        }
    }
    public override function hide() {
        for(_item in lists) {
            _item.bar.hide();
        }
    }

}

private class ProfilerValue {

    public var bar : ProfilerBar;
    public var name : String;
    public var start : Float = 0.0;
    public var history : Array<Float>;
    public var avg : Int = 10;
    var count : Int = 0;
    var accum : Float = 0;

    public function new(_name:String, _bar:ProfilerBar) {
        name = _name; bar = _bar;
        history = [];
    }

    public function set() {

        var _t = haxe.Timer.stamp() - start;
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

        bar.text = Std.string(luxe.utils.Maths.fixed(_t*1000,4));
        accum += _t;

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

        name = _name;
        segment = (width/history);
        height2 = height*2;

        text_item = new Text({
            pos : new Vector(0,0),
            color : _color,
            size : height*2.2,
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
            var _b = new Vertex(new Vector(segment*i, 0)) ;
                _b.color = _color;
            graph_geometry.add( _b );
        }

        graph_geometry.primitive_type = PrimitiveType.line_strip;
        Luxe.debug.batcher.add( graph_geometry);

        hide();

    }

    public function hide() {
        bar_geometry.enabled = false;
        bg_geometry.enabled = false;
        graph_geometry.enabled = false;
        graphbg_geometry.enabled = false;
        text_item.visible = false;
    }
    public function show() {
        bar_geometry.enabled = true;
        bg_geometry.enabled = true;
        graph_geometry.enabled = true;
        graphbg_geometry.enabled = true;
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
                    v.pos.y = v1.pos.y;
                    v.color = v1.color;
                }
            }
        }        

        if(_p > 1) {
            _p = 1;
            graph_geometry.vertices[history-1].color = color_red;
        } else if(_p < 0.15) { 
            graph_geometry.vertices[history-1].color = color_green;
        } else { 
            graph_geometry.vertices[history-1].color = color_normal; 
        }

        if(_p < 0.005) {
            _p = 0.005;
        }

        graph_geometry.vertices[history-1].pos.y = ((height2)*(1.0-_p));

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
        bar_geometry.pos = new Vector();
        bar_geometry.resize(new Vector(nx, height-2));
        bar_geometry.pos = new Vector(bg_geometry.pos.x+1, bg_geometry.pos.y+1);
        
        return value = _v;
    }

    function set_pos(_p:Vector) {
        bg_geometry.pos = _p;
        bar_geometry.pos = new Vector(_p.x+1, _p.y+1);
        text_item.pos = new Vector(_p.x+(width*2)+10, _p.y-6);
        graphbg_geometry.pos = new Vector(_p.x+width+2, _p.y-4);
        graph_geometry.pos = graphbg_geometry.pos;
        return pos = _p;
    }

    function set_text(_t:String) {
        text_item.text = name + '|' + _t + 'ms';
        return text = _t;
    } 

}