
import luxe.Rectangle;
import luxe.Vector;
import luxe.Input;
import luxe.Color;
import phoenix.Texture;

import de.kasoki.luxetiled.TiledMap;
import de.kasoki.luxetiled.Tileset;
import de.kasoki.luxetiled.Layer;

import phoenix.geometry.ComplexGeometry;


class TiledDisplay {

    public var tiledmap : TiledMap;
    public var tileset_geometry : Map<Tileset, ComplexGeometry>;

    public function new( tmx_file:String ) {

        tiledmap = TiledMap.fromAssets( tmx_file );
        tileset_geometry = new Map<Tileset, ComplexGeometry>();

    } //new

    public function create( _depth:Float = 0, _scale:Float = 1, ?_filter:FilterType ) {

        if(_filter == null) _filter = FilterType.nearest;

        var __depth = _depth;
        for(_layer in tiledmap.layers) {            
            Luxe.addGeometry ( createGeometryFromLayer( _layer, _scale, __depth, _filter ) );
            __depth+= 0.001;
        } //_layer

    } //create

    private function createGeometryFromLayer( _layer:Layer, _scale:Float=1, _depth:Float = 0, _filter:FilterType ) : ComplexGeometry {

        if(_filter == null) _filter = FilterType.nearest;
        var tilesetTextureByFirstGID : Map<Int,Texture> = new Map<Int,Texture>();

        for(t in tiledmap.tilesets) {
            var tex = Luxe.loadTexture('assets/'+t.image.source);
            tex.filter = _filter;
            tilesetTextureByFirstGID.set(t.firstGID, tex);
        } //for each tileset, load the texture

        // var bitmapData = new BitmapData(tiledmap.width * tiledmap.tileWidth, tiledmap.height * tiledmap.tileHeight, true, 0x000000);
        var _geometry = new ComplexGeometry({ depth:_depth });
        var gidCounter : Int = 0;

        for(_y in 0...tiledmap.height) {
            for(_x in 0...tiledmap.width) {

                var nextGID = _layer.tiles[gidCounter].gid;                

                if(nextGID != 0) {

                    var firstGID = _layer.parent.getTilesetByGID(nextGID).firstGID;

                    // var texture : Texture = _layer.tiles[gidCounter].texture;
                    var texture = tilesetTextureByFirstGID.get( firstGID );
                    _geometry.texture = texture;

                    var _quadid = _geometry.quad_add({
                        x: (_x*(tiledmap.tileWidth*_scale)), 
                        y: (_y*(tiledmap.tileHeight*_scale)), 
                        w: tiledmap.tileWidth*_scale, 
                        h: tiledmap.tileHeight*_scale
                    });
                        
                    var _pos = tiledmap.getTilesetByGID(gidCounter).getTexturePositionByGID(nextGID);
                    texture.onload = function( t:Texture ){
                        _geometry.quad_uv( _quadid, new Rectangle( _pos.x*tiledmap.tileWidth,_pos.y*tiledmap.tileHeight,tiledmap.tileWidth,tiledmap.tileHeight) );
                    }

                } //nextGID

                gidCounter++;

            } //for x
        } //for y

        return _geometry;

    } //createGeometryFromLayer

    public function destroy() {

    }

} //TiledDisplay



class Main extends luxe.Game {

    var map : TiledDisplay;

    public function ready() {
        
        Luxe.renderer.clear_color = new Color().rgb(0xaf663a); 

        map = new TiledDisplay('assets/tiles.tmx');

        var _map_scale = 4;

        map.create( 0, _map_scale, FilterType.nearest );

            //bounds is set to the tilemap size in pixels * scale
        Luxe.camera.bounds = new Rectangle( 0, 0, (map.tiledmap.totalWidth*_map_scale)-Luxe.screen.w, (map.tiledmap.totalHeight*_map_scale) );

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


