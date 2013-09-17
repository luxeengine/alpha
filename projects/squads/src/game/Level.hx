
package game;

import game.Manager;
import hxcollision.math.Vector2D;
import hxcollision.ShapeDrawer ;
import hxcollision.shapes.Polygon;
import hxcollision.shapes.BaseShape;

import luxe.Modes;
import luxe.Sprite;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Color;
import phoenix.Texture;

class LuxeDrawer extends ShapeDrawer {
    override public function drawLine( start:Vector2D, end:Vector2D ) {
        Luxe.draw.line({
            p0 : new Vector(start.x, start.y),
            p1 : new Vector(end.x, end.y),
            color : new Color().rgb(0xff4b03),
            depth : 20,
            immediate : false
        });
    }
}

class Level extends Mode {

    var manager : Manager;

    public var bg : Sprite;
    public var top : Sprite;
    var ground_collision_rects:Array<Rectangle>;
    var air_collision_rects:Array<Rectangle>;
    

    public var ground_collision_shapes : Array<BaseShape>;
    public var air_collision_shapes : Array<BaseShape>;
    public var drawer : LuxeDrawer;

    var scale : Float = 4;

    public function init(_manager:Manager) {

        manager = _manager;
        drawer = new LuxeDrawer();

        bg = new Sprite({
            texture : Luxe.loadTexture('assets/levels/01.exposure.png'),
            centered : false,
            size : new Vector(Luxe.screen.w, Luxe.screen.h),
            visible : false,
            depth : 1
        });        

        top = new Sprite({
            texture : Luxe.loadTexture('assets/levels/01.exposure.top.png'),
            centered : false,
            size : new Vector(Luxe.screen.w, Luxe.screen.h),
            visible : false,
            depth : 8
        });

        bg.texture.filter = FilterType.nearest;
        top.texture.filter = FilterType.nearest;

        ground_collision_shapes = [];
        air_collision_shapes = [];
        ground_collision_rects = [];
        air_collision_rects = [];

            //load the json
        var jsontext = Luxe.loadText('assets/levels/01.exposure.collision.json');
        var jsonobj : Dynamic = luxe.utils.JSON.decode(jsontext, false);
            //ground shapes        
        var _ground_list : Array<Dynamic> = cast jsonobj.ground_collisions;
        for(item in _ground_list) {
            ground_collision_rects.push( rect_from_dynamic(item) );
        }
            //air shapes        
        var _air_list : Array<Dynamic> = cast jsonobj.air_collisions;
        for(item in _air_list) {
            air_collision_rects.push( rect_from_dynamic(item) );
        }

            //now create the colliders
        create_collision_rectangles(ground_collision_rects, ground_collision_shapes);
        create_collision_rectangles(air_collision_rects, air_collision_shapes);

        // for(shape in ground_collision_shapes) {
        //     drawer.drawPolygon( cast shape );
        // }
        // for(shape in air_collision_shapes) {
        //     drawer.drawPolygon( cast shape );
        // }

    } //init

    public function create_collision_rectangles( list:Array<Rectangle>, target:Array<BaseShape> ) {
        for(item in list) {
            target.push( Polygon.rectangle( item.w * scale, item.h * scale, new Vector2D(item.x * scale, item.y * scale) , false ) );
        }
    }

    public function rect_from_dynamic(d:Dynamic) : Rectangle {
        var x: Float = d.x;
        var y: Float = d.y;
        var w: Float = d.w;
        var h: Float = d.h;
        return new Rectangle(x,y,w,h);
    }

    public function oninputup(_name:String, _event:Dynamic) {
        switch(_name) {
            case 'quit':
                modes.set('mainmenu');
        }
    }

    public function update(dt:Float) {
        
    }

    public function enable() {
        bg.visible = true;
        top.visible = true;
    } //enter

    public function disable() {
        bg.visible = false;
        top.visible = false;
    } //leave

} //Level
    