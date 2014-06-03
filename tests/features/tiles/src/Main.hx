
import luxe.Rectangle;
import luxe.tilemaps.tiled.TiledObjectGroup;
import luxe.Vector;
import luxe.Input;
import luxe.Color;

import luxe.tilemaps.TiledMap;
import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Isometric;

class Main extends luxe.Game {


        //A hand made ortho Tilemap
    var small_tiles : Tilemap;
        //A tiled ortho map from a tmx/json
    var tiled_ortho : TiledMap;
        //A tiled iso map from a tmx
    var tiled_iso : TiledMap;
        //text to display a position
    public var tile_text : luxe.Text;


    public function ready() {
        
        Luxe.renderer.clear_color = new Color().rgb(0xaf663a);

            //we create a custom tilemap 
        create_small_handmade_tilemap();        

            //now we load a few tiled maps from the Tiled editor 
        load_ortho_tiledmap();
        load_isometric_tiledmap();

         tile_text = new luxe.Text({
            color : new Color(1,1,1,1),
            pos : new Vector(10,10),
            font : Luxe.renderer.default_font,
            size : 24, 
            text : "move the mouse"
        });

    } //ready

    function load_isometric_tiledmap() {
        
        tiled_iso = new TiledMap( { file:'assets/isotiles.tmx', pos : new Vector(256,128) } );
        tiled_iso.display({ scale:1, grid:true});

            //change a tile id post display, to show "14" with grass
        tiled_iso.tile_at('Tile Layer 2', 0, 0).id = 4;
        tiled_iso.tile_at('Tile Layer 2', 0, 1).id = 0;
            //try remove first
        tiled_iso.tile_at('Tile Layer 2', 0, 2).id = 0;
            //then readd, to test it works
        tiled_iso.tile_at('Tile Layer 2', 0, 2).id = 4;

    } //load_isometric_tiledmap

    function load_ortho_tiledmap() {
        
            //create from xml file, with various encodings, or from JSON
        tiled_ortho = new TiledMap( { file:'assets/tiles.json', format:'json', pos : new Vector(512,0) } );
        // tiled_ortho = new TiledMap( { file:'assets/tiles_base64_zlib.tmx'} );
        // tiled_ortho = new TiledMap( { file:'assets/tiles_base64.tmx'} );
        // tiled_ortho = new TiledMap( { file:'assets/tiles_csv.tmx'} );

        var scale = 2;

            //tell the map to display 
        tiled_ortho.display({ scale:scale, grid:true });

            //draw the additional objects
        draw_tiled_object_groups( scale );

    } //load_ortho_tiledmap

    function create_small_handmade_tilemap() {

            //random tile grid for foreground layer
        var small_tiles_grid = [
            [1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70)],
            [1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70)],
            [1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70)],
            [1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70)],
            [1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70)],
            [1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70), 1+Std.random(70)],
        ];

            //manually create ourselves an ortho tilemap
        small_tiles = new Tilemap({
                //world x/y position
            x           : 512, 
            y           : 0, 
                //tilemap width/height
            w           : 6,  
            h           : 6, 
                //tiles width/height
            tile_width  : 16, 
            tile_height : 16,   
                //orientation of map
            orientation : TilemapOrientation.ortho
        });

            //create a tileset for the map
        small_tiles.add_tileset({ 
            name:'tiles', 
            texture:Luxe.loadTexture('assets/tileset.png'),
            tile_width: 16, tile_height: 16
        });

            //create some layers to add tiles in
            //note we add them out of order with the index, just for testing that
        small_tiles.add_layer({ name:'fg', layer:1, opacity:1, visible:true });
        small_tiles.add_layer({ name:'bg', layer:0, opacity:1, visible:true });        
        small_tiles.add_layer({ name:'removed', layer:2, opacity:1, visible:true });        

            //create them by filling the layer with a fixed id, in this case 21
        small_tiles.add_tiles_fill_by_id( 'bg', 21 );
        small_tiles.add_tiles_fill_by_id( 'removed', 2 );

            //create some tiles from a grid specified above
        small_tiles.add_tiles_from_grid( 'fg', small_tiles_grid );

            //before we display it, remove the "removed" layer so it's not there
        small_tiles.remove_layer('removed');

            //let's change a tile before we display it
        small_tiles.tile_at('fg', 0, 0).id = 1;
        
            //finally, tell it to display
        small_tiles.display({ scale:1 });

            //and change a tile after we display it
        small_tiles.tile_at('fg', 1, 0).id = 1;
        small_tiles.tile_at('fg', 2, 0).id = 1;
        small_tiles.tile_at('fg', 3, 0).id = 1;
        small_tiles.tile_at('fg', 4, 0).id = 1;
        small_tiles.tile_at('fg', 5, 0).id = 1;

    } //create_small_handmade_tilemap
  
    public function onkeyup( e:KeyEvent ) {
        
        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        }

        if(e.key == KeyValue.key_1) { Luxe.camera.zoom = 1.0; }
        if(e.key == KeyValue.key_2) { Luxe.camera.zoom = 2.0; }
        if(e.key == KeyValue.key_3) { Luxe.camera.zoom = 0.5; }

        if(e.key == KeyValue.key_A || e.key == KeyValue.left) {
            left_down = false;
        }

        if(e.key == KeyValue.key_D || e.key == KeyValue.right) {
            right_down = false;
        }

    } //onkeyup

    var left_down = false;
    var right_down = false;

    public function onkeydown( e:KeyEvent ) {

        if(e.key == KeyValue.key_A || e.key == KeyValue.left) {
            left_down = true;
        }

        if(e.key == KeyValue.key_D || e.key == KeyValue.right) {
            right_down = true;
        }

    } //onkeydown

    public function onmousemove( e:MouseEvent ) {

            // Get the tile position that the mouse is hovering.
        var mouse_pos = Luxe.camera.screen_point_to_world( e.pos );
        
        var tile = tiled_iso.tile_at_pos('Tile Layer 2', mouse_pos );
        var world = tiled_iso.worldpos_to_map( mouse_pos );
        
        tile_text.text = world + "\n" + tile;

    } //onmousemove

    public function update( dt:Float ) {

        if(left_down) {
            Luxe.camera.pos.x -= 150 / Luxe.camera.zoom * dt;
        } //left_down

        if(right_down) {
            Luxe.camera.pos.x += 150 / Luxe.camera.zoom * dt;
        } //right_down
		
    } //update

    function draw_tiled_object_groups( _scale:Float = 1) {

            //now we can look at the objects layers in the tilemap and draw them
        for(group in tiled_ortho.tiledmap_data.object_groups) {
            
            for(object in group.objects) {
                Luxe.draw.text({ text:object.name, size:14, pos:object.pos.clone().multiplyScalar(_scale).add(tiled_ortho.pos) });
                switch(object.object_type) {

                    case TiledObjectType.polyline: {

                        var last = new Vector(0,0);
                        for(p in object.polyobject.points) {
                            Luxe.draw.line({
                                p0 : last.clone().add(object.pos).multiplyScalar(_scale).add(tiled_ortho.pos),
                                p1 : p.clone().add(object.pos).multiplyScalar(_scale).add(tiled_ortho.pos),
                                depth : 2
                            });
                            last = p.clone();
                        } //each point

                    } //polyline 

                    case TiledObjectType.polygon: {

                        var last = new Vector(0,0);
                        for(p in object.polyobject.points) {
                            Luxe.draw.line({
                                p0 : last.clone().add(object.pos).multiplyScalar(_scale).add(tiled_ortho.pos),
                                p1 : p.clone().add(object.pos).multiplyScalar(_scale).add(tiled_ortho.pos),
                                depth : 2
                            });
                            last = p.clone();
                        } //each point

                        Luxe.draw.line({
                            p0 : last.clone().add(object.pos).multiplyScalar(_scale).add(tiled_ortho.pos),
                            p1 : new Vector().clone().add(object.pos).multiplyScalar(_scale).add(tiled_ortho.pos),
                            depth : 2
                        });

                    } //polygon

                    case TiledObjectType.ellipse:{

                            //cirle is top left for some reason
                        var _r = (object.width/2)*_scale;
                        Luxe.draw.ring({
                            x : (object.pos.x*_scale) + tiled_ortho.pos.x,
                            y : (object.pos.y*_scale) + tiled_ortho.pos.y, 
                            r : _r, 
                            depth : 2  
                        });

                    } //ellipse

                    case TiledObjectType.rectangle: {


                        Luxe.draw.rectangle({
                            x : (object.pos.x*_scale) + tiled_ortho.pos.x, y : (object.pos.y*_scale) + tiled_ortho.pos.y, 
                            w : object.width*_scale, h:object.height*_scale, 
                            depth : 2
                        });

                    } //rectangle

                } //switch type
            } //for each object
        } //groups

    } //draw_tiled_object_groups


} //Main
