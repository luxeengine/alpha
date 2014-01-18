
import luxe.Rectangle;
import luxe.tilemaps.tiled.TiledObjectGroup;
import luxe.Vector;
import luxe.Input;
import luxe.Color;

import luxe.tilemaps.Ortho;
import luxe.tilemaps.TiledOrtho;
import luxe.tilemaps.Tilemap;
import luxe.tilemaps.tiled.TiledMap;

class Main extends luxe.Game {

    var tiledmap : TiledOrtho;

    public function ready() {
        
        Luxe.renderer.clear_color = new Color().rgb(0xaf663a);

            //we create a custom tilemap 
        create_small_handmade_tilemap();

            //now we load a tiled map from the Tiled editor 
        load_tiledmap();

    } //ready

    function load_tiledmap() {
        
            //create from xml file        
        tiledmap = new TiledOrtho( { file:'assets/tiles.json', format:'json' } );

            //now we can look at the objects layers in the tilemap and draw them
        for(group in tiledmap.tiledmap.object_groups) {
            trace('inspecting group ' + group.name + ' / ' + group.color );
            
            for(object in group.objects) {
                Luxe.draw.text({ text:object.name, size:14, pos:object.pos.clone().multiplyScalar(4).add(tiledmap.pos) });
                switch(object.object_type) {

                    case TiledObjectType.polyline: {

                        var last = new Vector(0,0);
                        for(p in object.polyobject.points) {
                            Luxe.draw.line({
                                p0 : last.clone().add(object.pos).multiplyScalar(4).add(tiledmap.pos),
                                p1 : p.clone().add(object.pos).multiplyScalar(4).add(tiledmap.pos),
                                depth : 2
                            });
                            last = p.clone();
                        } //each point

                    } //polyline 

                    case TiledObjectType.polygon: {

                        var last = new Vector(0,0);
                        for(p in object.polyobject.points) {
                            Luxe.draw.line({
                                p0 : last.clone().add(object.pos).multiplyScalar(4).add(tiledmap.pos),
                                p1 : p.clone().add(object.pos).multiplyScalar(4).add(tiledmap.pos),
                                depth : 2
                            });
                            last = p.clone();
                        } //each point

                        Luxe.draw.line({
                            p0 : last.clone().add(object.pos).multiplyScalar(4).add(tiledmap.pos),
                            p1 : new Vector().clone().add(object.pos).multiplyScalar(4).add(tiledmap.pos),
                            depth : 2
                        });

                    } //polygon

                    case TiledObjectType.ellipse:{

                            //cirle is top left for some reason
                        var _r = (object.width/2)*4;
                        Luxe.draw.ring({
                            x : (object.pos.x*4) + tiledmap.pos.x,
                            y : (object.pos.y*4) + tiledmap.pos.y, 
                            r : _r, 
                            depth : 2  
                        });

                    } //ellipse

                    case TiledObjectType.rectangle: {


                        Luxe.draw.rectangle({
                            x : (object.pos.x*4) + tiledmap.pos.x, y : (object.pos.y*4) + tiledmap.pos.y, 
                            w : object.width*4, h:object.height*4, 
                            depth : 2
                        });

                    } //rectangle

                } //switch type
            } //for each object
        }

    }

    function create_small_handmade_tilemap() {

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
    }
  
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


