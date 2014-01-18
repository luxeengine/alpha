
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import luxe.Color;

import luxe.tilemaps.Ortho;
import luxe.tilemaps.TiledOrtho;
import luxe.tilemaps.Tilemap;
import luxe.tilemaps.tiled.TiledMap;

class Main extends luxe.Game {

    public function ready() {
        
        Luxe.renderer.clear_color = new Color().rgb(0xaf663a);

        var small_tiles_grid = [
            [29,29,29,29,29,29,29,29],
            [29,29,29,29,29,29,29,29],
            [29,29,29,29,29,29,29,29],
            [29,29,29,29,29,29,29,29],
            [29,29,29,29,29,29,29,29],
            [29,29,29,29,29,29,29,29],
            [29,29,29,29,29,29,29,29],
            [29,29,29,29,29,29,29,29],
        ];

            //manually create ourselves an ortho tilemap
        var ortho = new Ortho({
            x:0, y:20, 
            w:8,  h:8, 
            tile_width:16, 
            tile_height:16
        });

            //create a tileset for the map
        ortho.add_tileset('tiles', Luxe.loadTexture('assets/tileset.png'));

            //create a layer for some tiles
        var layer1 = ortho.add_layer('fg', 1);
        var layer0 = ortho.add_layer('bg', 0);

            //create some tiles from a grid
        ortho.add_tiles_from_grid( 'bg', small_tiles_grid );
        ortho.add_tiles_fill_by_id( 'fg', 38 );

        new OrthoDisplay(ortho, { scale:1 });

        new TiledOrtho( 'assets/tiles.tmx' );

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


