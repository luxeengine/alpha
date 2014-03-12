package luxe.tilemaps;

import luxe.Color;
import luxe.Rectangle;
import phoenix.geometry.QuadGeometry;
import phoenix.Texture.FilterType;
import luxe.tilemaps.Tilemap;

import luxe.Vector;

import phoenix.geometry.Geometry;

class Ortho {

    public static function worldpos_to_tile_coord( world_x:Float, world_y:Float, tile_width:Int, tile_height:Int ) : Vector {
        
        var tile_coord = new Vector();

            tile_coord.x = Math.floor(world_x / tile_width);
            tile_coord.y = Math.floor(world_y / tile_height);

        return tile_coord;

    } //worldpos_to_tile_coord

    public static function tile_coord_to_worldpos(  tile_x:Int, tile_y:Int, tile_width:Int, tile_height:Int, 
                                                   ?offset_x:TileOffset, ?offset_y:TileOffset ) : Vector {
            
        var world_pos = new Vector();

            world_pos.x = tile_x * tile_width;
            world_pos.y = tile_y * tile_height;

            //top left by default
        if(offset_x == null) { offset_x = TileOffset.left; };
        if(offset_y == null) { offset_y = TileOffset.top; };

            switch(offset_x) {
                case TileOffset.center:    { world_pos.x += (tile_width/2); }            
                case TileOffset.right:     { world_pos.x += tile_width; }
                default:
            }

            switch(offset_y) {
                case TileOffset.center:    { world_pos.y += (tile_height/2); }            
                case TileOffset.bottom:    { world_pos.y += tile_height; }
                default:
            }

        return world_pos;
        
    } //tile_coord_to_worldpos


} //Ortho

class OrthoVisuals extends TilemapVisuals {    

    public override function create( options:Dynamic ) {

        var _scale = (options.scale != null) ? options.scale : 1;        

        var _map_scaled_tw = map.tile_width*_scale;
        var _map_scaled_th = map.tile_height*_scale;

        for( layer in map ) {

            var _layer_geom : TilemapVisualsLayerGeometry = [];

            for( y in 0 ... map.height ) {

                var _geom_row : Array<Geometry> = [];

                for( x in 0 ... map.width ) {

                        //we want to push nulls into here,
                        //because otherwise the sizes won't match
                        //and because we use it to create tiles when
                        //changing the tile gid later
                    var _tile_geom = create_tile_for_layer( layer, x, y, _scale, options.filter );

                    _geom_row.push( _tile_geom );
                    
                } //for each tile

                _layer_geom.push(_geom_row);

            } //for each row

                //add the geometry to the list
            geometry.set( layer.name, _layer_geom );

        } //for each map


        if(options.grid != null && options.grid == true) {

            var color = new Color(1,1,1,0.8).rgb(0xcc0000);

            for(x in 0 ... map.width+1) {
                Luxe.draw.line({ 
                    p0 : new Vector(map.pos.x + (x * _map_scaled_tw), map.pos.y + 0 ),
                    p1 : new Vector(map.pos.x + (x * _map_scaled_tw), map.pos.y + (map.height * _map_scaled_th)),
                    color : color,
                    depth : 2
                });
            }

            for(y in 0 ... map.height+1) {
                Luxe.draw.line({ 
                    p0 : new Vector(map.pos.x + (0), map.pos.y + (y * _map_scaled_th)),
                    p1 : new Vector(map.pos.x + (map.width * _map_scaled_tw), map.pos.y + (y * _map_scaled_th)),
                    color : color,
                    depth : 2
                });
            }

        }

    } //create

    override function create_tile_for_layer( layer:TileLayer, x:Int, y:Int, ?_scale:Float=1, ?_filter:FilterType  ) {

        _filter = (_filter != null) ? _filter: FilterType.nearest;

        var _map_scaled_tw = map.tile_width*_scale;
        var _map_scaled_th = map.tile_height*_scale;

        var tile = layer.tiles[y][x];

            //don't create blank tiles
        if(tile.id == 0) {
            return null;
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
            visible : layer.visible,
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

                    if(_filter != null) {
                        tileset.texture.filter = _filter;
                    }
                }
            }
        } //tileset != null

        return _tile_geom;

    } //create_tile_for_layer


} //OrhtoVisuals