
import luxe.Color;
import luxe.Input;
import luxe.structural.Heap;
import pathing.core.Grid;
import pathing.finders.AStarFinder;
import pathing.Pathing;
import phoenix.geometry.ComplexGeometry;

class Main extends luxe.Game {


    var grid : Grid;
    var geom : ComplexGeometry;
    var geom_quads : Map<String, String>;

    var gridx : Int = 200;
    var gridy : Int = 200;
    var gridw : Int = 32;
    var gridh : Int = 32;
    var grid_space : Int = 2;

    public function draw_grid( _geom:ComplexGeometry, _grid:Grid ) {
        if(geom_quads == null) { geom_quads = new Map(); }
        _geom.clear();
        for( y in 0 ... _grid.height ) {
            for(x in 0 ... _grid.width ) {
                var loc_id = x + "_" + y; 
                var geom_id = _geom.quad_add({ 
                    x:gridx+(x*(gridw+grid_space)), 
                    y:gridy+(y*(gridh+grid_space)), 
                    w:gridw, h:gridh
                });
                geom_quads.set(loc_id, geom_id);
                if(_grid.isWalkableAt(x,y)) {
                    _geom.quad_color( geom_id, new Color().rgb(0xff403b) );
                } else {
                    _geom.quad_color( geom_id, new Color().rgb(0x111111) );
                }
            }
        }
    }

    public function ready() {

        geom = new ComplexGeometry({});
        Luxe.addGeometry(geom);

    	grid = new Grid( 10,10 );

        grid.setWalkableAt(5,3, false);
        grid.setWalkableAt(5,4, false);
        grid.setWalkableAt(5,5, false);
        grid.setWalkableAt(5,6, false);

        draw_grid( geom, grid );

        var finder = new AStarFinder();
        var path : Path = finder.findPath(0,0,9,9,grid);

        for(n in path) {
            var loc_id = n[0]+"_"+n[1];
            var quad_id = geom_quads.get(loc_id);
            if(quad_id!=null) {
                geom.quad_color(quad_id, new Color());
            }
        }

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    public function update(dt:Float) {

    } //update


} //Main
