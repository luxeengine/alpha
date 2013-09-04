
import luxe.Vector;
import luxe.Input;
import luxe.Color;

import phoenix.Batcher;
import phoenix.geometry.CompositeGeometry;


import BinarySearchTree;
import phoenix.geometry.Geometry;
import phoenix.geometry.GeometryState;
import phoenix.Texture;

class Main extends luxe.Game {

    var debug_batcher : Batcher;
    var tree : BinarySearchTree<Geometry,Geometry>;
    var geom : Geometry;
    var geomkey : GeometryState;
    var tex : Texture;

    public function ready() {

        debug_batcher = new Batcher( Luxe.renderer, 'debug_batcher' );
        debug_batcher.layer = 2;
        Luxe.renderer.add_batch(debug_batcher);

        tree = new BinarySearchTree<Geometry, Geometry>( compare_geometry );

        tex = Luxe.loadTexture('assets/luxe.png');  

        create_tree();
       
    } //ready

    public function create_tree() {

        trace("create tree");

        for(i in 0 ... 5) {

            var g = Luxe.draw.box({
                    x:10+(i*5),y:10+(i*5),w:180,h:180, 
                    batcher : debug_batcher,
                    depth: i + Math.round((Math.random() * 20)),
                    texture : tex
                });

            g.id = "g." + i;

            tree.insert(g,g);

            if(i == 0) {
                geom = g;
                var __g = tree.find(geom);
                geomkey = __g.state.clone();
                trace(geomkey);
            }

        } //i in 

        for(_g in tree) {
            trace('depth : ' + _g.depth);
        }        

        draw_batcher_tree();


    } //tree

    public function destroy_tree() {

        for(g in tree) {
            g.drop();
        }

        tree.root = null;
    }

    public function compare_geometry( a:Geometry, b:Geometry ) {
        if(a == b) return 0;
        return a.compare(b);
    } //compare_geometry

    public function compare_int( _key:Int, _other_key:Int ) {
        if(_key < _other_key)  return -1;
        if(_key > _other_key)  return  1;
        if(_key == _other_key) return  0;

        return -1;
    } // compare 

    public function refresh() {
        
        clear_batcher_tree();
                
            var s = geom.state.clone();
                geom.state = geomkey;
                
                tree.remove( geom );

                geom.state = s;
                geomkey = s.clone();


            geom.id = ~/\.deleted/.replace(geom.id, '');
            tree.insert( geom, geom );

            trace( 'tree size ' + tree.size() );

        draw_batcher_tree();

    }
  
    public function onkeyup(e) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }
        
        if(e.value == Input.Keys.key_S) {
            trace(geom.state.depth);
            trace(geomkey.depth);
        }

        if(e.value == Input.Keys.space) {
            clear_batcher_tree();
            destroy_tree();
            create_tree();
        }

        if(e.value == Input.Keys.equals) {
            geom.state.depth+=1;            
            trace(geom.state.depth);
            refresh();
        }
        if(e.value == Input.Keys.minus) {
            geom.state.depth-=1;
            trace(geom.state.depth);
            refresh();
        }
    } //onkeyup

    public function update(dt:Float) {

    } //update

        var _tree_geom : CompositeGeometry;
        public function clear_batcher_tree() {
            if(_tree_geom != null) {
                _tree_geom.drop();
                _tree_geom = null;
            }
        }   

        public function draw_tree_node(l:Bool, _key:Geometry, _value:Geometry, _p:Vector ) {

            var _bw:Float = 20;
            var _bwhalf:Float = 9;
            var _bh:Float = 13;

            _tree_geom.add_geometry( 
                Luxe.draw.rectangle({
                    x:_p.x-_bwhalf, y:_p.y,
                    w:_bw, h:_bh,
                    color: new Color(1,1,1,0.4).rgb(0xf6007b),
                    batcher : debug_batcher,
                    depth : 999.4
                })
            ); //node square
            
            _tree_geom.add_geometry( 
                Luxe.draw.text({
                    pos : _p,
                    size : 13,
                    color : new Color(1,1,1,0.7).rgb(0xf6007b),
                    batcher : debug_batcher,
                    depth : 999.4,
                    text : _key.depth+'',
                    align : luxe.Text.TextAlign.center
                })
            ); //node inside box

            var t = _p.clone().set( _p.x+(_bwhalf*1.5), _p.y );
            var talign = luxe.Text.TextAlign.left;
            if(l) {
                t.x = _p.x - (_bwhalf*1.5);
                talign = luxe.Text.TextAlign.right;
            }

            _tree_geom.add_geometry( 
                Luxe.draw.text({
                    pos : t,
                    size : 13,
                    color : new Color(1,1,1,0.7).rgb(0xf6007b),
                    batcher : debug_batcher,
                    depth : 999.4,
                    text : _value.id+'',
                    align : talign
                })
            ); //node text
        }

        public function draw_tree_leaf( L:Bool, _leaf : BinarySearchTreeNode<Geometry,Geometry>, _p:Vector ) {

            var _bw:Float = 20;
            var _bwb:Float = 24;
            var _bh:Float = 12;
            var _bh2:Float = 24;
            var _bwhalf:Float = 10;

            if(_leaf != null) {
                
                draw_tree_node(L, _leaf.key, _leaf.value, _p);

                if(_leaf.left != null) {
                        
                    var __bwb = _leaf.left.nodecount * _bwb;

                    _tree_geom.add_geometry( 
                        Luxe.draw.line({
                            p0 : new Vector(_p.x-_bwhalf,_p.y+_bh),
                            p1 : new Vector(_p.x-__bwb, _p.y+_bh2 ),
                            color: new Color(1,1,1,0.2).rgb(0xf6007b),
                            batcher : debug_batcher,
                            depth : 999.4
                        })
                    );

                    draw_tree_leaf(true, _leaf.left, new Vector(_p.x-__bwb, _p.y+_bh2 ));
                }
                if(_leaf.right != null) {

                    var __bwb = _leaf.right.nodecount * _bwb;

                    _tree_geom.add_geometry( 
                        Luxe.draw.line({
                            p0 : new Vector(_p.x+_bwhalf,_p.y+_bh),
                            p1 : new Vector(_p.x+__bwb, _p.y+_bh2),
                            color: new Color(1,1,1,0.2).rgb(0xf6007b),
                            batcher : debug_batcher,
                            depth : 999.4
                        })
                    );                    

                    draw_tree_leaf(false,  _leaf.right, new Vector(_p.x+__bwb, _p.y+_bh2));
                }
            }
        }

        public function draw_batcher_tree() {

            _tree_geom = null;
            _tree_geom = new CompositeGeometry({
                batcher : debug_batcher,
                depth : 999.4
            });

            //draw the root
            var _p : Vector = new Vector(Luxe.screen.w/2, 20);

            var _node = tree.root;
                
                draw_tree_leaf(false, _node, _p);

        }

    public function shutdown() {

    } //shutdown
}



            // tree.insert(2,  'two');
            // tree.insert(1,  'one');
            // tree.insert(9,  'nine1');
            // tree.insert(9,  'nine2');
            // tree.insert(9,  'nine3');
            // tree.insert(9,  'nine4');
            // tree.insert(36, 'thirtysix');
            // tree.insert(12, 'twelve');
            // tree.insert(0,  'zero');
            // tree.insert(6,  'six');

            // trace(tree.rank(10));

