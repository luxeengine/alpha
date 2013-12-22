
package game;

import game.items.Explosive;
import game.Manager;

import luxe.collision.math.Vector2D;
import luxe.collision.ShapeDrawer;
import luxe.collision.shapes.Polygon;
import luxe.collision.shapes.Shape;

import luxe.States;
import luxe.Sprite;
import luxe.Rectangle;
import luxe.Vector;
import luxe.Color;
import phoenix.Texture;

class ShapeDrawerLuxe extends ShapeDrawer {
    override public function drawLine( start:Vector2D, end:Vector2D ) {
        Luxe.draw.line({
            p0 : new Vector(start.x,start.y),
            p1 : new Vector(end.x, end.y),
            color : new Color().rgb(0xff4b03),
            depth : 20,
            immediate : false
        });
    }
}

class Level extends State {

    var manager : Manager;

    public var bg : Sprite;
    public var top : Sprite;
    public var items : Array<Sprite>;

    var ground_collision_rects:Array<Rectangle>;
    var air_collision_rects:Array<Rectangle>;
    var item_collision_rects:Array<Rectangle>;
    
    public var ground_collision_shapes : Array<Shape>;
    public var air_collision_shapes : Array<Shape>;

    public var drawer : ShapeDrawerLuxe;

    var scale : Float = 4;

    public function init(_manager:Manager) {

        manager = _manager;
        drawer = new ShapeDrawerLuxe();

        bg = new Sprite({
            name:'bg',
            texture : Luxe.loadTexture('assets/levels/01.exposure.png'),
            centered : false,
            size : new Vector(Luxe.screen.w, Luxe.screen.h),
            visible : false,
            depth : 1
        });        

        top = new Sprite({
            name:'bgtop',
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
        item_collision_rects = [];
        items = [];

            //load the json for collisions
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

            //now create the items
        jsontext = Luxe.loadText('assets/levels/01.exposure.items.json');
        jsonobj = luxe.utils.JSON.decode(jsontext, false);
            //item list
        var _item_list : Array<Dynamic> = cast jsonobj;
        for(item in _item_list) {
            var _rect = rect_from_dynamic(item);
            var _colpoly = create_collision_rectangle(_rect);
            
                air_collision_shapes.push(_colpoly);
                ground_collision_shapes.push(_colpoly);

            var item = create_item( item );

                _colpoly.data = item;
        }

        for(shape in ground_collision_shapes) {
            drawer.drawPolygon( cast shape );
        }
        for(shape in air_collision_shapes) {
            drawer.drawPolygon( cast shape );
        }        

    } //init

    public function create_item( item:Dynamic ) {
        var type : String = item.type;
        switch(type) {
            case 'explosives':
                var tex = Luxe.loadTexture('assets/items/explosives.png');
                tex.filter = FilterType.nearest;
                var sprite = new Sprite({
                    name : 'explosives' + items.length,
                    pos : new Vector(item.sx*scale, item.sy*scale),
                    centered : false,
                    texture : tex,
                    visible : false,
                    depth : 4
                });

                var exp = sprite.add( Explosive, 'explosive');
                    exp.desc = item;

                sprite.scale = new Vector(scale,scale);
                items.push( sprite );
                return sprite;
        }
        return null;
    }

    public function create_collision_rectangle( _rect:Rectangle ) {
        return Polygon.rectangle( _rect.x * scale, _rect.y * scale, _rect.w * scale, _rect.h * scale , false ) ;
    }   

    public function create_collision_rectangles( list:Array<Rectangle>, target:Array<Shape> ) {
        for(item in list) {
            target.push( Polygon.rectangle( item.x * scale, item.y * scale, item.w * scale, item.h * scale, false ) );
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
                machine.set('mainmenu');
        }
    }

    public function update(dt:Float) {
        
    }

    public function enable() {
        bg.visible = true;
        top.visible = true;
        for(item in items) {
            item.visible = true;
        }
    } //enter

    public function disable() {
        bg.visible = false;
        top.visible = false;
        for(item in items) {
            item.visible = false;
        }
    } //leave

} //Level
    