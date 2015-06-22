package luxe.debug;

import luxe.Text;
import luxe.utils.Maths;
import luxe.Vector;
import luxe.Input;
import luxe.Screen.WindowEvent;
import luxe.Log.*;

class SceneDebugView extends luxe.debug.DebugView  {

    var items_list : luxe.Text;

    public function new() {

        super();

        name = 'Scenes';
        scenes = [];

    }

    var margin = 32;
    var font_size = 15.0;
    public override function create() {

        var debug = Luxe.debug;

        items_list = new luxe.Text({
            name: 'debug.scene.list',
            depth : 999.3,
            no_scene : true,
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(0,0),
            font : Luxe.renderer.font,
            text : get_list(),
            point_size : font_size,
            batcher : debug.batcher,
            visible : false,
        });

        items_list.geometry.id = 'debug.scene.list.geometry';

        resize();

    }

    var scenes : Array<luxe.Scene>;

    public function add_scene(_scene:luxe.Scene) : Void {

        assert(scenes.indexOf(_scene) == -1);

        scenes.push(_scene);

    } //add_scene

    public function remove_scene(_scene:luxe.Scene) : Bool {

            //maybe this isn't as handy
        assert(scenes.indexOf(_scene) != -1);

        var _result = scenes.remove(_scene);

        refresh();

        return _result;

    } //remove_scene

    public override function onkeydown(e:KeyEvent) {

        if(e.keycode == Key.key_2 && visible) {
            toggle_ids();
        }

    } //onkeydown

    var hide_ids : Bool = true;
    function toggle_ids() {
        hide_ids = !hide_ids;
        refresh();
    }


    inline function tabs(_d:Int) {
        var res = '';
        for(i in 0 ... _d) res += '    ';
        return res;
    }

    inline function list_entity(_list:String, e:luxe.Entity, _depth:Int = 1) : String {

        var _active = (e.active) ? '' : '/ inactive';
        var _pre = (_depth == 1) ? tabs(_depth) : tabs(_depth)+'> ';
        var _id = hide_ids ? '' : e.id;
        var _comp_count = Lambda.count(e.components);
        var _comp = '• ' + _comp_count;
        var _childs = '> ${e.children.length}';

        _list += '${_pre}$_id ${e.name} $_childs $_comp $_active\n';

        for(_name in e.components.keys()) {
            var comp = e.components.get(_name);
            var _comp_id = hide_ids ? '' : ' '+comp.id;
            _list += tabs(_depth+1) + '•$_comp_id ${comp.name}\n';
        }

        for(_child in e.children) {
            _list = list_entity(_list, _child, _depth+2);
        }

        return _list;
    }

    inline function get_list() : String {

        var _result = '';

            for(_scene in scenes) {
                var _id = hide_ids ? '' : '${_scene.id} ';

                _result += _id;
                _result += '${_scene.name} ';
                _result += '( ${_scene.length} )\n';
                for(_entity in _scene.entities) {
                    _result = list_entity(_result, _entity);
                }
            }

        return _result;

    } //get_list

    public override function refresh() {

        items_list.text = get_list();

    } //refresh

    public override function process() {

        if(!visible) return;

        var _has_changed = false;

        for(_scene in scenes) {
            if(_scene._has_changed) {
                _has_changed = true;
                _scene._has_changed = false;
            }
        } //each scene

        if(_has_changed) {

            refresh();

        } //_has_changed

    } //process

#if (desktop || web)
    //:wip:
    override function onmousewheel(e:MouseEvent) {
        var h = items_list.text_bounds.h;
        var vh = Luxe.debug.debug_inspector.size.y - margin;
        var diff = h - vh;

        var new_y = items_list.pos.y;
        var max_y = Luxe.debug.padding.y +(margin*1.5);
        var min_y = max_y;

        if(diff > 0) {
            min_y = (max_y - (diff+(margin*2)));
        }

        new_y -= (margin/2) * e.y;
        new_y = Maths.clamp(new_y, min_y, max_y);
        items_list.pos.y = new_y;
    }
#end

//state
    public override function show() {

        super.show();
        refresh();
        items_list.visible = true;

    } //show

    public override function hide() {

        super.hide();
        items_list.visible = false;

    } //hide

//sizing

    function resize() {

        var debug = Luxe.debug;

        var viewrect = new Rectangle(
            debug.debug_inspector.pos.x + (margin/2),
            debug.debug_inspector.pos.y + (margin*1.5),
            debug.debug_inspector.size.x - margin,
            debug.debug_inspector.size.y - margin - (margin*1.5)
        );

        var left = debug.padding.x + margin;
        var top = debug.padding.y +(margin*1.5);

        if(items_list != null) {
            items_list.pos = new Vector(left, top);
            items_list.clip_rect = viewrect;
        }

    }
    override function onwindowsized(e:WindowEvent) resize();

}
