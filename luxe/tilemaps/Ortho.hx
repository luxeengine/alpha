package luxe.tilemaps;

import luxe.Rectangle;
import phoenix.Texture.FilterType;
import luxe.tilemaps.Tilemap;

import luxe.Vector;

import phoenix.geometry.Geometry;

class Ortho extends Tilemap {

    public function new( options:TilemapOptions ) {

        super( options );

            //update the type
        orientation = TilemapOrientation.ortho;

    } //new

        //return a tile from a layer, in world coordinates
    public override function tile_at_pos( layer_name:String, worldpos:Vector ) {
        
        var _world_x = worldpos.x - pos.x;
        var _world_y = worldpos.y - pos.y;
        var _tile_x = Math.floor(_world_x / tile_width);
        var _tile_y = Math.floor(_world_y / tile_height);

        return tile_at( layer_name, _tile_x, _tile_y );

    } //tile_at_pos

} //Ortho


class OrthoDisplay {

    public var geometry : Array<Array<Geometry> >;

    public function new( _map:Ortho, options:Dynamic ) {

        geometry = [];
        var _scale = (options.scale != null) ? options.scale : 1;
        var _filter = (options.filter != null) ? options.filter : FilterType.nearest;

        var _scaled_tilewidth = _map.tile_width*_scale;
        var _scaled_tileheight = _map.tile_height*_scale;

        for( layer in _map ) {
            for( row in layer.tiles ) {

                var _geom_row = [];
                for(tile in row) {  

                    if(tile.id == 0) {
                        continue;
                    }

                    var tileset = _map.tileset_from_id( tile.id );        

                        //create the tile to the geometry
                    var _tile_geom = Luxe.draw.box({
                        x: _map.pos.x + (tile.x * _scaled_tilewidth), 
                        y: _map.pos.y + (tile.y * _scaled_tileheight),
                        w: _scaled_tilewidth, 
                        h: _scaled_tileheight,
                        texture : (tileset != null) ? tileset.texture : null
                    });

                    if(tileset != null) {
                        if(tileset.texture != null) {
                            tileset.texture.onload = function(t) {
                                var image_coord = tileset.pos_in_texture( tile.id );
                                _tile_geom.uv(new Rectangle(image_coord.x*_map.tile_width,image_coord.y*_map.tile_height,_map.tile_width,_map.tile_height));
                                tileset.texture.filter = _filter;
                            }
                        }
                    } //tileset != null
                    
                } //for each tile

                    //add the geometry to the bunches
                geometry.push(_geom_row);

            } //for each row
        } //for each _map

    } //new

} //OrthoDisplay