package luxe.tilemaps;

import luxe.Rectangle;
import luxe.Vector;

import luxe.tilemaps.Tilemap;
import luxe.tilemaps.Isometric;

import phoenix.Texture.FilterType;
import phoenix.geometry.Geometry;

class Isometric {

    public static function worldpos_to_tile_coord( world_x:Float, world_y:Float, tile_width:Int, tile_height:Int ) : Vector {
        
        // var _tile_x = Math.floor(world_x / tile_width);
        // var _tile_y = Math.floor(world_y / tile_height);

        // return new Vector( _tile_x, _tile_y );

        return new Vector();

    } //worldpos_to_tile_coord

    public static function tile_coord_to_worldpos(  tile_x:Int, tile_y:Int, tile_width:Int, tile_height:Int, 
                                                   ?offset_x:TileOffset, ?offset_y:TileOffset ) : Vector {
        
            //top left by default
        if(offset_x == null) {  offset_x = TileOffset.left;  };
        if(offset_y == null) {  offset_y = TileOffset.top;   };

        // var _world_x = tile_x * tile_width;
        // var _world_y = tile_y * tile_height;

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

        return new Vector( 0, 0 );
        
    } //tile_coord_to_worldpos


} //Ortho

class IsometricVisuals extends TilemapVisuals {
    
    public function new( _map:Tilemap, options:Dynamic ) {
        
        super();
        create( options );

    } //new

} //IsometricVisuals