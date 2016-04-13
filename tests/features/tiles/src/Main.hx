
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import luxe.Color;
import phoenix.Texture;
import phoenix.geometry.CircleGeometry;

import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Isometric;
import luxe.tilemaps.Ortho;

import luxe.importers.tiled.TiledMap;
import luxe.importers.tiled.TiledObjectGroup;
import luxe.Log.*;

class Main extends luxe.Game {


        //A hand made ortho Tilemap
    var small_tiles : Tilemap;
        //A tiled ortho map from a tmx/json
    var tiled_ortho : TiledMap;
        //A tiled iso map from a tmx
    var tiled_iso : TiledMap;
        //text to display a position
    public var tile_text : luxe.Text;

    var batcher : phoenix.Batcher;

    var tile_offset_circle : CircleGeometry;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/isotiles.png' });
        config.preload.textures.push({ id:'assets/clouds.png' });
        config.preload.textures.push({ id:'assets/tileset.png' });
        config.preload.textures.push({ id:'assets/tiles_padded.png' });

        config.preload.texts.push({ id:'assets/isotiles.tmx' });
        config.preload.texts.push({ id:'assets/tiles.json' });
        config.preload.texts.push({ id:'assets/tiles.tmx' });

        return config;

    } //config

    override function ready() {

        Luxe.renderer.clear_color = new Color().rgb(0xaf663a);

        batcher = Luxe.renderer.create_batcher({ name:'separate tile view' });

            //we create a custom tilemap
        generate_tilemap();

            //now we load a few tiled maps from the Tiled editor
        load_ortho_tiledmap();
        load_isometric_tiledmap();

        tile_text = new luxe.Text({
            color : new Color(1,1,1,1),
            pos : new Vector(10,10),
            font : Luxe.renderer.font,
            batcher : batcher,
            point_size : 24,
            text : "move the mouse"
        });


        tile_offset_circle =  Luxe.draw.circle({
            x : 0,
            y : 0,
            r : 3,
            color : new Color(0,1.0,0,1.0),
            depth : 700
        });

    } //ready

    function load_isometric_tiledmap() {

        var res = Luxe.resources.text('assets/isotiles.tmx');

        assertnull(res, 'Resource not found!');

        tiled_iso = new TiledMap({ tiled_file_data:res.asset.text, pos : new Vector(256,128) });
        tiled_iso.display({ scale:1, grid:true });

            //change a tile id post display, to show "14" with grass
        tiled_iso.tile_at('Tile Layer 2', 0, 0).id = 4;
        tiled_iso.tile_at('Tile Layer 2', 0, 1).id = 0;
            //try remove first
        tiled_iso.tile_at('Tile Layer 2', 0, 2).id = 0;
            //then readd, to test it works
        tiled_iso.tile_at('Tile Layer 2', 0, 2).id = 4;

    } //load_isometric_tiledmap

    function load_ortho_tiledmap() {

        //try these,
        //make sure to adjust the config preload part as well, or it won't find them
        //'assets/tiles_base64_zlib.tmx'
        //'assets/tiles_base64.tmx'
        //'assets/tiles_csv.tmx'

        //change this to try the other type
        var format = 'json';//
        // var format = 'tmx';

        var res = Luxe.resources.text('assets/tiles.$format');

        assertnull(res, 'Resource not found!');

        var scale = 2;

            //create from xml file, with various encodings, or from JSON
        tiled_ortho = new TiledMap( { tiled_file_data:res.asset.text, format:format, pos : new Vector(512,0) } );

            //tell the map to display
        tiled_ortho.display({ scale:scale, grid:true, filter:FilterType.nearest });

            //draw the additional objects
        draw_tiled_object_groups( scale );
        draw_tiled_image_layers( scale );

        for(layer in tiled_ortho.layers) {
            trace('layer / ${layer.id} / ${layer.name} / ${layer.properties}');
        }

    } //load_ortho_tiledmap

    function generate_tilemap() {

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
            texture:Luxe.resources.texture('assets/tileset.png'),
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
        small_tiles.display({ scale:1, batcher:batcher, depth:2 });

            //and change a tile after we display it
        small_tiles.tile_at('fg', 1, 0).id = 1;
        small_tiles.tile_at('fg', 2, 0).id = 1;
        small_tiles.tile_at('fg', 3, 0).id = 1;
        small_tiles.tile_at('fg', 4, 0).id = 1;
        small_tiles.tile_at('fg', 5, 0).id = 1;

    } //generate_tilemap

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        if(e.keycode == Key.key_1) { Luxe.camera.zoom = 1.0; Luxe.camera.pos = new Vector(); }
        if(e.keycode == Key.key_2) { Luxe.camera.zoom = 2.0; }
        if(e.keycode == Key.key_3) { Luxe.camera.zoom = 0.5; }

        if(e.keycode == Key.key_r) {
            if(small_tiles != null) {
                small_tiles.destroy();
                small_tiles = null;
            }
        }

        if(e.keycode == Key.key_c) {
            if(small_tiles == null) generate_tilemap();
        }

        if(e.keycode == Key.key_a || e.keycode == Key.left) {
            left_down = false;
        }

        if(e.keycode == Key.key_d || e.keycode == Key.right) {
            right_down = false;
        }

        if(e.keycode == Key.key_w || e.keycode == Key.up) {
            up_down = false;
        }

        if(e.keycode == Key.key_s || e.keycode == Key.down) {
            down_down = false;
        }

    } //onkeyup

    var up_down = false;
    var down_down = false;
    var left_down = false;
    var right_down = false;

    override function onkeydown( e:KeyEvent ) {

        if(e.keycode == Key.key_a || e.keycode == Key.left) {
            left_down = true;
        }

        if(e.keycode == Key.key_d || e.keycode == Key.right) {
            right_down = true;
        }

        if(e.keycode == Key.key_w || e.keycode == Key.up) {
            up_down = true;
        }

        if(e.keycode == Key.key_s || e.keycode == Key.down) {
            down_down = true;
        }

    } //onkeydown


    override function onmousewheel( e:MouseEvent ) {

        Luxe.camera.zoom += e.y * 0.1;

    } //onmousewheel

    override function onmouseup( e:MouseEvent ) {

            // Get the tile position that the mouse is hovering.
        var mouse_pos = Luxe.camera.screen_point_to_world( e.pos );

            //for the ortho map
        var _scale = tiled_ortho.visual.options.scale;
        var tile = tiled_ortho.tile_at_pos('walls', mouse_pos.x, mouse_pos.y, _scale );

        if( tile != null ) {
            var oldid = tile.id;
            tile.id = 1+Std.random(70);
            trace('ORTHO set a new id from $oldid to ${tile.id}!');
        }

            //for the iso map
        _scale = tiled_iso.visual.options.scale;
        tile = tiled_iso.tile_at_pos('Tile Layer 2', mouse_pos.x, mouse_pos.y, _scale );

        if( tile != null ) {
            var oldid = tile.id;
            tile.id = 1+Std.random(16);
            trace('ISO set a new id from $oldid to ${tile.id}!');
        }

    } //onmouseup

    override function onmousemove( e:MouseEvent ) {

        if(tiled_iso == null || tiled_ortho == null) return;

            // Get the tile position that the mouse is hovering.
        var mouse_pos = Luxe.camera.screen_point_to_world( e.pos );

        var _scale = tiled_ortho.visual.options.scale;
        var tile = tiled_ortho.tile_at_pos('walls', mouse_pos.x, mouse_pos.y, _scale );
        var world = tiled_ortho.tile_coord( mouse_pos.x, mouse_pos.y, _scale );

        if ( tile != null ) {

                //when converting a world pos to tile pos, it returns it in fractions if we ask for no rounding
            var coord_pos = tiled_ortho.tile_coord(mouse_pos.x, mouse_pos.y, _scale, false);

                //so we have the % in tile coords, we round it 0..1 range, we only care about the offset within the tile
            var relative_x = (coord_pos.x % 1.0);
            var relative_y = (coord_pos.y % 1.0);

                 // Create the offset depending on which corner is closest to the mouse position.
            var offset_x = TileOffset.right;
            var offset_y = TileOffset.bottom;

            if (relative_x <= 0.33) {
                offset_x = TileOffset.left;
            } else if (relative_x <= 0.66) {
                offset_x = TileOffset.center;
            }

            if (relative_y <= 0.33) {
                offset_y = TileOffset.top;
            } else if (relative_y <= 0.66) {
                offset_y = TileOffset.center;
            }

                //now use the offsets to position the circle
            tile_offset_circle.transform.pos = tiled_ortho.tile_pos(tile.x, tile.y, _scale, offset_x, offset_y);

        }

        tile_text.text = world + "\n" + tile;

        _scale = tiled_iso.visual.options.scale;
        tile = tiled_iso.tile_at_pos('Tile Layer 2', mouse_pos.x, mouse_pos.y, _scale );
        if( tile != null ) {

                //when converting a world pos to tile pos, it returns it in fractions if asked for no rounding
            var coord_pos = tiled_iso.tile_coord(mouse_pos.x, mouse_pos.y, _scale, false);

                //so we have the % in tile coords, we round it 0..1 range, we only care about the offset within the tile
            var relative_x = (coord_pos.x % 1.0);
            var relative_y = (coord_pos.y % 1.0);

                 // Create the offset depending on which corner is closest to the mouse position.
            var offset_x = TileOffset.right;
            var offset_y = TileOffset.bottom;

            if (relative_x <= 0.33) {
                offset_x = TileOffset.left;
            } else if (relative_x <= 0.66) {
                offset_x = TileOffset.center;
            }

            if (relative_y <= 0.33) {
                offset_y = TileOffset.top;
            } else if (relative_y <= 0.66) {
                offset_y = TileOffset.center;
            }

                //now use the offsets to position the circle
            tile_offset_circle.transform.pos = tiled_iso.tile_pos(tile.x, tile.y, _scale, offset_x, offset_y);

        } //tile != null

    } //onmousemove

    override function update( dt:Float ) {

        if(left_down) {
            Luxe.camera.pos.x -= (150/Luxe.camera.zoom) * dt;
        } //left_down

        if(right_down) {
            Luxe.camera.pos.x += (150/Luxe.camera.zoom) * dt;
        } //right_down

        if(up_down) {
            Luxe.camera.pos.y -= (150/Luxe.camera.zoom) * dt;
        } //up_down

        if(down_down) {
            Luxe.camera.pos.y += (150/Luxe.camera.zoom) * dt;
        } //down_down

    } //update

    function draw_tiled_image_layers( _scale:Float = 1) {

        for(layer in tiled_ortho.tiledmap_data.image_layers) {
            trace('loading image layer ${layer.name} pos:${layer.x},${layer.x} properties:${layer.properties}');
            new luxe.Sprite({
                centered: false,
                pos:new Vector(tiled_ortho.pos.x+(layer.x*_scale), tiled_ortho.pos.y+(layer.y * _scale)),
                scale:new Vector(_scale, _scale),
                texture: Luxe.resources.texture('assets/'+layer.image.source),
                color: new Color(1,1,1,layer.opacity),
                visible: layer.visible
            });
        }

    } //

    function draw_tiled_object_groups( _scale:Float = 1) {

            //now we can look at the objects layers in the tilemap and draw them
        for(group in tiled_ortho.tiledmap_data.object_groups) {

            for(object in group.objects) {
                Luxe.draw.text({ text:'${object.name} (${object.id})', point_size:14, pos:object.pos.clone().multiplyScalar(_scale).add(tiled_ortho.pos) });
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
