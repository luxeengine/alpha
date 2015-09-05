package luxe.debug;

import luxe.Input.MouseEvent;
import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.CompositeGeometry;
import luxe.structural.BalancedBST.BalancedBSTNode;
import phoenix.geometry.Geometry;


class BatcherDebugView extends luxe.debug.DebugView {

    public function new(  ) {
        super();
        name = 'Batcher Debug';
    }

    var batcher : Batcher;

    public override function create() {

        batcher = Luxe.renderer.create_batcher({
            name:'debug_batcher_view',
            camera : new phoenix.Camera({ camera_name : 'batcher_debug_view' }),
            layer : 1000
        });

    } //create

    public override function refresh() {
        clear_batcher_tree();
        draw_batcher_tree();
    }

    var dragging = false;
    var dragstart : Vector;
    var dragmstart : Vector;

    public override function onmousedown(e:MouseEvent) {
        dragmstart = e.pos.clone();
        dragstart = batcher.view.pos.clone();
        dragging = true;
    }
    public override function onmouseup(e:MouseEvent) {
        dragging = false;
    }
    public override function onmousemove(e:MouseEvent) {
        if(dragging) {
            var diff = Vector.Subtract(e.pos, dragmstart);
            batcher.view.pos = Vector.Subtract(dragstart, diff);
        }
    }

    public override function onmousewheel(e:MouseEvent) {
        if(e.y < 0) {
            batcher.view.zoom -= 0.1;
        } else {
            batcher.view.zoom += 0.1;
        }
    }

    var _tree_geom : CompositeGeometry;
    var as_immediate : Bool = false;

    public function clear_batcher_tree() {
        if(_tree_geom != null) {
            _tree_geom.drop();
            _tree_geom = null;
        }
    }

    function keystr( key:GeometryKey, key2:GeometryKey) {
         return
            'ts: '+ key.timestamp + '\n' +
            'seq: '+ key.sequence + '\n' +
            'primitive_type: '+ key.primitive_type + " " + (key.primitive_type) + '\n' +
            'texture: '+ (key.texture == null ? 'null' : Std.string(key.texture.texture)) + '\n' +
            'texture id: '+ (key.texture == null ? 'null' : key.texture.id) + '\n' +
            'shader: '+ (key.shader == null ? 'null' : key.shader.id) + '\n' +
            'group: '+ key.group + '\n' +
            'depth: '+ key.depth + '\n' +
            'clip: '+ key.clip;
    }

    public function draw_geom_node(l:Bool, _leaf : BalancedBSTNode<GeometryKey,Geometry>, _p:Vector, _bbw:Float=20 ) {

        var _bw:Float = 128;
        var _bwhalf:Float = _bw /2;
        var _bh:Float = 128;

        var _g : Geometry = _leaf.value;

        var c = new Color(1,1,1,0.4).rgb(0xffffff);

        if(_g.dropped) {
            c = new Color(1,1,1,1).rgb(0xcc0000);
        }

        _tree_geom.add_geometry(
            Luxe.draw.rectangle({
                immediate:as_immediate,
                x:_p.x-_bwhalf, y:_p.y,
                w:_bw, h:_bh,
                color: c,
                batcher : batcher,
                depth : 999.4
            })
        ); //node square

        _tree_geom.add_geometry(
            Luxe.draw.text({
                immediate:as_immediate,
                bounds : new Rectangle(_p.x-_bwhalf, _p.y, _bw, _bh),
                point_size : 13,
                color : c,
                batcher : batcher,
                depth : 999.4,
                text : keystr(_leaf.key, _g.key),
                align : luxe.Text.TextAlign.center,
                align_vertical : luxe.Text.TextAlign.center
            })
        ); //node text

        var t = _p.clone().set_xy( _p.x, _p.y-16 );
        var t2 = _p.clone().set_xy( _p.x, _p.y+_bw+2 );
        var talign = luxe.Text.TextAlign.center;
        // if(l) {
            // t.x = _p.x - (_bwhalf*1.5);
            // talign = luxe.Text.TextAlign.right;
        // }

        _tree_geom.add_geometry(
            Luxe.draw.text({
                immediate:as_immediate,
                pos : t,
                point_size : 13,
                color : c,
                batcher : batcher,
                depth : 999.4,
                text : _g.id,
                align : talign
            })
        ); //node text

        var c2 = new Color(1,1,1,0.4).rgb(0xff9944);
        var notes_l = "none";
        var notes_r = "none";

        if(_leaf.left != null) {
            notes_l = 'node';
            var compare = @:privateAccess Luxe.renderer.batcher.compare_rule(_leaf.key, _leaf.left.key);
            notes_l = @:privateAccess Luxe.renderer.batcher.compare_rule_to_string(compare);
        }

        if(_leaf.right != null) {
            notes_r = 'node';
            var compare = @:privateAccess Luxe.renderer.batcher.compare_rule(_leaf.key, _leaf.right.key);
            notes_r = @:privateAccess Luxe.renderer.batcher.compare_rule_to_string(compare);
        }

        _tree_geom.add_geometry(
            Luxe.draw.text({
                immediate:as_immediate,
                pos : t2,
                point_size : 13,
                color : c2,
                batcher : batcher,
                depth : 999.4,
                text : notes_l + " / " + notes_r,
                align : talign
            })
        ); //node text
    }

    public function draw_geom_leaf( L:Bool, _leaf : BalancedBSTNode<GeometryKey,Geometry>, _p:Vector ) {

        if(_leaf == null) {
            return;
        }

        var _bw:Float = _leaf.nodecount / 20;
        var _bwb:Float = _leaf.nodecount * 25;
        var _bh:Float = 128;
        var _bh2:Float = 148;
        var _bwhalf:Float = _bw/2;

        var c = new Color(1,1,1,0.4).rgb(0xffffff);

        if(_leaf != null) {

            draw_geom_node(L, _leaf, _p, _bw);

            if(_leaf.left != null) {

                if( @:privateAccess Luxe.renderer.batcher.geometry_compare( _leaf.left.key, _leaf.key ) < 0 ) {
                    c = new Color(1,1,1,1).rgb(0x00cc00);
                } else {
                    c = new Color(1,1,1,1).rgb(0xcc0000);
                }

                _tree_geom.add_geometry(
                    Luxe.draw.line({
                        immediate:as_immediate,
                        p0 : new Vector(_p.x-_bwhalf,_p.y+_bh),
                        p1 : new Vector(_p.x-_bwb, _p.y+_bh2 ),
                        color: c,
                        batcher : batcher,
                        depth : 999.4
                    })
                );

                draw_geom_leaf(true, _leaf.left, new Vector(_p.x-_bwb, _p.y+_bh2 ));
            }
            if(_leaf.right != null) {

                if( @:privateAccess Luxe.renderer.batcher.geometry_compare( _leaf.right.key, _leaf.key ) > 0 ) {
                    c = new Color(1,1,1,1).rgb(0x00cc00);
                } else {
                    c = new Color(1,1,1,1).rgb(0xcc0000);
                }

                _tree_geom.add_geometry(
                    Luxe.draw.line({
                        immediate:as_immediate,
                        p0 : new Vector(_p.x+_bwhalf,_p.y+_bh),
                        p1 : new Vector(_p.x+_bwb, _p.y+_bh2),
                        color: c,
                        batcher : batcher,
                        depth : 999.4
                    })
                );

                draw_geom_leaf(false, _leaf.right, new Vector(_p.x+_bwb, _p.y+_bh2));
            }
        } //leaf != null
    }

    public function draw_batcher_tree() {

        _tree_geom = null;
        _tree_geom = new CompositeGeometry({
            batcher : batcher,
            immediate:as_immediate,
            depth : 999.4
        });

        //draw the root
        var _p : Vector = new Vector(Luxe.screen.w/2, (Luxe.debug.padding.y*2)+10);

        var _node = Luxe.renderer.batcher.geometry.root;

            draw_geom_leaf(true, _node, _p);

    }

    public override function process() {
        if(visible) {
            if(Luxe.renderer.batcher.tree_changed) {
                refresh();
            }
        }
    }

    public override function show() {
        super.show();
        refresh();
    }

    public override function hide() {
        super.hide();
        clear_batcher_tree();
    }

} //BatcherDebugView
