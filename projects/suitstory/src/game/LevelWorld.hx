
package game;

import luxe.Vector;
import luxe.Color;

import phoenix.Batcher.PrimitiveType;
import phoenix.geometry.Geometry;

import luxe.utils.JSON;
import phoenix.geometry.Vertex;


class LevelWorld {

        //The world bounds are a polygonal shape that will disallow placement near it
        //we use a geometry because it keeps a list for us and can already be drawn
    public var world_bounds:Array<Vector>;
        //an offset to use for the level bounds
    public var world_offset:Vector;
        //the source name of the data file of this level
    public var level_file:String;
        //the actual data
    public var level_data:Dynamic;
        //a debug list of things to draw when in debug view
    public var level_debug_geometry : Array<Geometry>;
        //the source data of this level
    public var level_data_string:String = '{
        "world_bounds" : [
            { "x":11, "y":46 },
            { "x":32, "y":41 }, 
            { "x":41, "y":47 },
            { "x":73, "y":39 },
            { "x":115, "y":73 },
            { "x":91, "y":113 },
            { "x":68, "y":111 },
            { "x":35, "y":106 },
            { "x":14, "y":110 },
            { "x":4, "y":75 }
        ]
    }';
    public var world_bound_scale : Float = 4.0;

        //A grid level 
    public function new(_level_file:String) {

        world_bounds = new Array<Vector>();
        world_offset = new Vector(256,0);

        if(!loadLevelData(level_data_string)) {
            throw "Level data is invalid! :)";
        }

        for(v in world_bounds) {
            v.x = world_offset.x + (world_bound_scale * v.x); 
            v.y = world_offset.y + (world_bound_scale * v.y); 
        }

        create_level_debug();

        create_level_path_mesh();

    }

    public function create_level_path_mesh() {

    }

    public function destroy() {
        show_debug(false);
        level_debug_geometry.splice(0,level_debug_geometry.length);
    }

    public function loadLevelData(_d:String) : Bool {

       try {
            level_data = JSON.parse(_d);                
            var bounds : Array<Dynamic> = cast level_data.world_bounds;
            for(point in bounds) {
                world_bounds.push( new Vector(point.x, point.y) );
            }
        } catch(e:Dynamic) {
            trace("level data file error!");
            trace(e);
            return false;
        }

        return true;
    }

    public function create_level_debug(){

        level_debug_geometry = new Array<Geometry>();
            //create the world bounds debug geometry
        var wb = new Geometry({
            type : PrimitiveType.triangle_fan,
            color: new Color().rgb(0x4f8548),
            immediate : false,
            depth:2
        });

        wb.color.a = 0.5;

        var _wb_verts = new Array<Vertex>();
        var avgx = 0.0; var avgy = 0.0;
        for(v in world_bounds) {    
            avgx += v.x; avgy += v.y;            
        }
        var centerx = avgx/world_bounds.length;
        var centery = avgy/world_bounds.length;

        wb.add(new Vertex( 
            new Vector( 
                centerx,
                centery) 
            )
        );
        
        for(v in world_bounds) {
            wb.add(new Vertex(
                v.set(  
                        v.x,
                        v.y
                     )
                )
            );
        }

            //wb[0] is already scaled above
        wb.add(new Vertex(world_bounds[0]));

        level_debug_geometry.push(wb);
        
        show_debug(true);
    }

    public function show_debug(_show:Bool) {
        for(g in level_debug_geometry) {
            if(_show) {
                Luxe.addGeometry(g);
            } else {
                Luxe.removeGeometry(g);
            }
        }
    }

}