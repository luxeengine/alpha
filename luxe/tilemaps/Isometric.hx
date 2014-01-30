package luxe.tilemaps;

import luxe.Color;
import luxe.Rectangle;
import luxe.Vector;

import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Isometric;

import phoenix.Texture.FilterType;
import phoenix.geometry.Geometry;
import phoenix.Vector;

class Isometric {

    public static function worldpos_to_tile_coord( world_x:Float, world_y:Float, tile_width:Int, tile_height:Int ) : Vector {
        
        var tile_pos = new Vector();

            var tile_width_half = tile_width / 2;
            var tile_height_half = tile_height / 2;

            tile_pos.x = ((world_x / tile_width_half) + (world_y / tile_height_half)) / 2;
            tile_pos.y = ((world_y / tile_height_half) - (world_x / tile_width_half)) / 2;

        return tile_pos;

    } //worldpos_to_tile_coord

    public static function tile_coord_to_worldpos(  tile_x:Int, tile_y:Int, tile_width:Int, tile_height:Int, 
                                                   ?offset_x:TileOffset, ?offset_y:TileOffset ) : Vector {
        var world_pos = new Vector();

            var tile_width_half = tile_width / 2;
            var tile_height_half = tile_height / 2;
        
            world_pos.x = (tile_x - tile_y) * tile_width_half;
            world_pos.y = (tile_x + tile_y) * tile_height_half;

            //top left by default
        if(offset_x == null) {  offset_x = TileOffset.left;  };
        if(offset_y == null) {  offset_y = TileOffset.top;   };

            // switch(offset_x) {
            //     case TileOffset.center:    { _world_x += (tile_width/2) }            
            //     case TileOffset.right:     { _world_x += tile_width; }
            //     case TileOffset.left:      { }
            // }

            // switch(offset_y) {
            //     case TileOffset.center:    { _world_y += (tile_height/2) }            
            //     case TileOffset.bottom:    { _world_y += tile_height; }
            //     case TileOffset.top:       { }
            // }

        return world_pos;
        
    } //tile_coord_to_worldpos


} //Ortho

class IsometricVisuals extends TilemapVisuals {

    public override function create( options:Dynamic ) {

        var _scale = (options.scale != null) ? options.scale : 1;
        var _filter = (options.filter != null) ? options.filter : FilterType.nearest;

            //map tile size scaled up
        var _scaled_tilewidth = map.tile_width*_scale;
        var _scaled_tileheight = map.tile_height*_scale;

        for( layer in map ) {
            
            for( y in 0 ... map.height ) {
                    
                    //the geometry row
                var _geom_row = [];

                for( x in 0 ... map.width ) {
                    
                    var tile = layer.tiles[y][x];

                    if(tile.id == 0) {
                        continue;
                    }

                    var tileset = map.tileset_from_id( tile.id );

                        //specific to each tileset
                    var _scaled_tileset_tilewidth = tileset.tile_width*_scale;
                    var _scaled_tileset_tileheight = tileset.tile_height*_scale;

                        //the half tile size in world space, not tile space
                    var _half_world_tile_width = _scaled_tilewidth / 2;
                    var _half_world_tile_height = _scaled_tileheight / 2;
					
                        //create the tile to the geometry
                    var _tile_geom = Luxe.draw.box({
                            //the positions are based on the map tile width, not the texture tilesize
                        x : (map.pos.x + ((x - y) * _half_world_tile_width)) - _half_world_tile_width,
                        y : (map.pos.y + ((x + y) * _half_world_tile_height)) - _half_world_tile_height,
                            //the geometry size is based on the texture/tileset size, not the map size
                        w : _scaled_tileset_tilewidth, 
                        h : _scaled_tileset_tileheight,
                        texture : (tileset != null) ? tileset.texture : null,
                        enabled : layer.visible,
                        color : new Color(1,1,1,layer.opacity)
                    });

                    if(tileset != null) {
                        if(tileset.texture != null) {
                            tileset.texture.onload = function(t) {

                                var image_coord = tileset.pos_in_texture( tile.id );

                                _tile_geom.uv( 
                                    new Rectangle(
                                        image_coord.x * tileset.tile_width,
                                        image_coord.y * tileset.tile_height,
                                        tileset.tile_width,
                                        tileset.tile_height
                                    ) //rectangle
                                ); //uv

                                tileset.texture.filter = _filter;
                            }
                        }
                    } //tileset != null

                } //for each tile in the x 

                    //add the geometry to the bunches
                geometry.push(_geom_row);

            } //for y

        } //for each layer

        if(options.grid != null && options.grid == true) {

            var color = new Color(1,1,1,0.8).rgb(0xcc0000);


            for(x in 0 ... map.width+1) {
                
                var ip = Isometric.tile_coord_to_worldpos(x, 0, _scaled_tilewidth, _scaled_tileheight);
                var ip_bot = Isometric.tile_coord_to_worldpos(x, map.height, _scaled_tilewidth, _scaled_tileheight);

                Luxe.draw.line({ 
                    p0 : new Vector(map.pos.x + ip.x, map.pos.y + ip.y ),
                    p1 : new Vector(map.pos.x + ip_bot.x, map.pos.y + ip_bot.y),
                    color : color
                });
            }

            for(y in 0 ... map.height+1) {

                var ip = Isometric.tile_coord_to_worldpos(0, y, _scaled_tilewidth, _scaled_tileheight);
                var ip_bot = Isometric.tile_coord_to_worldpos(map.width, y, _scaled_tilewidth, _scaled_tileheight);

                Luxe.draw.line({ 
                    p0 : new Vector(map.pos.x + ip.x, map.pos.y + ip.y),
                    p1 : new Vector(map.pos.x + ip_bot.x, map.pos.y + ip_bot.y),
                    color : color
                });
            }

        }

    } //create

} //IsometricVisuals