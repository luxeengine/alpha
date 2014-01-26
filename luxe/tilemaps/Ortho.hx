package luxe.tilemaps;

import luxe.Color;
import luxe.Rectangle;
import phoenix.Texture.FilterType;
import luxe.tilemaps.Tilemap;

import luxe.Vector;

import phoenix.geometry.Geometry;

class Ortho {

    public static function worldpos_to_tile_coord( world_x:Float, world_y:Float, tile_width:Int, tile_height:Int ) : Vector {
        
        var _tile_x = Math.floor(world_x / tile_width);
        var _tile_y = Math.floor(world_y / tile_height);

        return new Vector( _tile_x, _tile_y );

    } //worldpos_to_tile_coord

    public static function tile_coord_to_worldpos(  tile_x:Int, tile_y:Int, tile_width:Int, tile_height:Int, 
                                                   ?offset_x:TileOffset, ?offset_y:TileOffset ) : Vector {

            //top left by default
        if(offset_x == null) { offset_x = TileOffset.left; };
        if(offset_y == null) { offset_y = TileOffset.top; };

        var _world_x : Float = tile_x * tile_width;
        var _world_y : Float = tile_y * tile_height;

        switch(offset_x) {
            case TileOffset.center:    { _world_x += (tile_width/2); }            
            case TileOffset.right:     { _world_x += tile_width; }
            default:
        }

        switch(offset_y) {
            case TileOffset.center:    { _world_y += (tile_height/2); }            
            case TileOffset.bottom:    { _world_y += tile_height; }
            default:
        }

        return new Vector( _world_x, _world_y );
        
    } //tile_coord_to_worldpos


} //Ortho

class OrthoVisuals extends TilemapVisuals {    

    public override function create( options:Dynamic ) {

        var _scale = (options.scale != null) ? options.scale : 1;
        var _filter = (options.filter != null) ? options.filter : FilterType.nearest;

        var _map_scaled_tw = map.tile_width*_scale;
        var _map_scaled_th = map.tile_height*_scale;

        for( layer in map ) {

            for( row in layer.tiles ) {

                var _geom_row = [];
                for(tile in row) {  

                    if(tile.id == 0) {
                        continue;
                    }

                    var tileset = map.tileset_from_id( tile.id );

                    var _scaled_tilewidth = tileset.tile_width*_scale;
                    var _scaled_tileheight = tileset.tile_height*_scale;

                    var _offset_x = 0;
                    var _offset_y = _scaled_tileheight - _map_scaled_th;

                        //create the tile geometry
                    var _tile_geom = Luxe.draw.box({
                        x: map.pos.x + (tile.x * _map_scaled_tw) - (_offset_x), 
                        y: map.pos.y + (tile.y * _map_scaled_th) - (_offset_y),
                        w: _scaled_tilewidth,
                        h: _scaled_tileheight,
                        enabled : layer.visible,
                        texture : (tileset != null) ? tileset.texture : null,
                        color : new Color(1,1,1, layer.opacity)
                    });

                    if(tileset != null) {
                        if(tileset.texture != null) {
                            tileset.texture.onload = function(t) {
                                var image_coord = tileset.pos_in_texture( tile.id );
                                _tile_geom.uv(
                                    new Rectangle(
                                        tileset.margin + ((image_coord.x * tileset.tile_width) + (image_coord.x * tileset.spacing)),
                                        tileset.margin + ((image_coord.y * tileset.tile_height) + (image_coord.y * tileset.spacing)),
                                        tileset.tile_width,
                                        tileset.tile_height
                                    ) //Rectangle
                                ); //uv
                                tileset.texture.filter = _filter;
                            }
                        }
                    } //tileset != null
                    
                } //for each tile

                    //add the geometry to the bunches
                geometry.push(_geom_row);

            } //for each row
        } //for each map


        if(options.grid != null && options.grid == true) {

            var color = new Color(1,1,1,0.8).rgb(0xcc0000);

            for(x in 0 ... map.width+1) {
                Luxe.draw.line({ 
                    p0 : new Vector(map.pos.x + (x * _map_scaled_tw), map.pos.y + 0 ),
                    p1 : new Vector(map.pos.x + (x * _map_scaled_tw), map.pos.y + (map.height * _map_scaled_th)),
                    color : color
                });
            }

            for(y in 0 ... map.height+1) {
                Luxe.draw.line({ 
                    p0 : new Vector(map.pos.x + (0), map.pos.y + (y * _map_scaled_th)),
                    p1 : new Vector(map.pos.x + (map.width * _map_scaled_tw), map.pos.y + (y * _map_scaled_th)),
                    color : color
                });
            }

        }

    } //create

} //OrhtoVisuals