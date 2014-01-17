
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import luxe.Color;
import phoenix.Texture;


typedef Tile = {
    id : String,
    row : Int,
    col : Int
}

typedef TileArray = Array<Tile>;

class Tilemap {

        //array of array of tiles = 2d tiles
    public var tiles : Array<TileArray>;

    public function new() {
        tiles = [[]];
    } //new

    public function inside( x:Int, y:Int ) : Bool {
        
        if(tiles.length == 0) {
            return false;
        }

        if( y > (tiles.length-1) ) {
            return false;
        }

        if( x > ( tiles[0].length-1 )) {
            return false;
        }

        return true;

    } //inside

    public function tile_at( x:Int, y:Int ) {

        if( inside(x,y) ) {
            return tiles[y][x];          
        } else { //if inside
            return null;
        }

    } //tile_at

} // Tilemap

class Ortho extends Tilemap {

    public function new( _width:Int, _height:Int ) {

        super();

        for(y in 0 ... _height) {

            var _tilerow = [];

            for(x in 0 ... _width) {
                _tilerow.push({ 
                    id : Luxe.utils.uniqueid(),
                    row : y, col : x
                });
            } //for each column

            tiles.push( _tilerow );

        } //for each row

    } //new

} //Ortho

class Main extends luxe.Game {

    // var map : TiledDisplay;

    public function ready() {
        
        Luxe.renderer.clear_color = new Color().rgb(0xaf663a);


        var ortho = new Ortho(5,5); 

        for(row in ortho.tiles) {
            for(tile in row) {
                trace(tile);
            }
        }


        // map = new TiledDisplay('assets/tiles.tmx');

        // var _map_scale = 4;

        // map.create( 0, _map_scale, FilterType.nearest );

        //     //bounds is set to the tilemap size in pixels * scale
        // Luxe.camera.bounds = new Rectangle( 0, 0, (map.tiledmap.totalWidth*_map_scale)-Luxe.screen.w, (map.tiledmap.totalHeight*_map_scale) );

    } //ready
  
    public function onkeyup(e) {
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }

        if(e.value == Input.Keys.left) {
            left_down = false;
        }
        if(e.value == Input.Keys.right) {
            right_down = false;
        }
    } //onkeyup

    var left_down = false;
    var right_down = false;

    public function onkeydown(e) {

        if(e.value == Input.Keys.left) {
            left_down = true;
        }

        if(e.value == Input.Keys.right) {
            right_down = true;
        }

    } //onkeydown

    public function update(dt:Float) {

        if(left_down) {
            Luxe.camera.pos.x -= 150 * dt;
        } //left_down

        if(right_down) {
            Luxe.camera.pos.x += 150 * dt;
        } //right_down

    } //update

    public function destroy() {

    } //destroy
}


