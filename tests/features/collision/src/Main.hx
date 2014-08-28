
import luxe.Input;
import luxe.Vector;
import luxe.Color;

import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Circle;
import luxe.collision.shapes.Polygon;
import luxe.collision.CollisionData;
import luxe.collision.Collision;

    //for debug view
import luxe.collision.ShapeDrawerLuxe;

class Main extends luxe.Game {


    var drawer : ShapeDrawerLuxe;

    var normal_color : Int = 0x999999;

    var collide_color1 : Int = 0xCC1111;
    var collide_color2 : Int = 0x2233CC;
    var collide_color3 : Int = 0x11CC88;
    var collide_color4 : Int = 0xCC55AA;
    var collide_color5 : Int = 0x5500CC;

        //for viewing when collisions happen, we change colors
    var mouse_pos : Vector;

        //whether we are using the box or polygon as the mouse
    var mouse_is_hexagon : Bool = false;

        //A few static shapes to test against
    var circle_static : Circle;
    var box_static : Polygon;
    var oct_static : Polygon;

        //A circle that can follow the mouse
    var circle_mouse : Circle;
        //A polygon that can follow the mouse
    var hexagon_mouse : Polygon;

        //A line to raycase across the screen
    var line_start : Vector;
    var line_end : Vector;
        //For movint the line, the current y position and movement direction
    var line_y : Float = 0;
    var line_dir : Int = 1;

        //A collision data object for the current mouse shape
    var mouse_collide : CollisionData;
        //True if there is a collision with the line and any shape
    var line_collide = false;


    override function ready() {

            //the shape drawer
        drawer = new ShapeDrawerLuxe();

            //init mouse
        mouse_pos = new Vector();

            //Create the collider shapes
        circle_static = new Circle( 300, 200, 50 );
        box_static = Polygon.rectangle( 0, 0, 50, 150 );
        oct_static = Polygon.create( 70,70, 8,60 );
            //and the noes that will follow the mouse
        circle_mouse = new Circle( 250, 250, 30 );
        hexagon_mouse = Polygon.create( 260,100, 6, 50 );

            //remember the order of operations is important
        box_static.rotation = 45;
        box_static.x = 150;
        box_static.y = 300;

            //the horizontal line for the raycast tests,
            //starting at the top of the screen
        line_start = new Vector(0,0);
        line_end = new Vector(500,0);

        Luxe.camera.pos.x -= 100;
        Luxe.camera.pos.y -= 100;

        on('keyup', keyup);
        on('mousemove', mousemove);
        on('mousedown', mousedown);

    } //ready

    function mousedown( e:MouseEvent ) {
        mouse_is_hexagon = !mouse_is_hexagon;
    } //onmousedown

    function mousemove( e:MouseEvent ) {

        mouse_pos = e.pos;

        if(!mouse_is_hexagon) {
            circle_mouse.x = mouse_pos.x + Luxe.camera.pos.x;
            circle_mouse.y = mouse_pos.y + Luxe.camera.pos.y;
        } else {
            hexagon_mouse.x = mouse_pos.x + Luxe.camera.pos.x;
            hexagon_mouse.y = mouse_pos.y + Luxe.camera.pos.y;
        }

    } //onmousemove

    function update_line(dt:Float) {

            //move the line up or down based on direction
        line_y += 50 * line_dir * dt;

            //going down and hit the bottom?
        if(line_dir == 1 && line_y >= 500) {
            line_dir = -1;
        } else  //going up and hit the top?
        if(line_dir == -1 && line_y <= 0) {
            line_dir = 1;
        }


        line_start.y = line_y;
        line_end.y = line_y;

    } //update_line

    var _main_color : Color;

    function draw_collision_response( pos:Vector, collision_response:CollisionData, _color:Int ) {

        if(_main_color == null) {
            _main_color = new Color();
        }

        _main_color.rgb(_color);

        drawer.drawLine( new Vector(pos.x, pos.y), new Vector( pos.x+(collision_response.unitVector.x*20), pos.y+(collision_response.unitVector.y*20) ), _main_color, true );

    } //draw_collision_response

    function keyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {

        update_line(dt);

        var mouse_color : Int = normal_color;

//Test the static circle

        if(!mouse_is_hexagon) {

            mouse_collide = Collision.test( circle_static, circle_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color1;
                draw_collision_response(new Vector(circle_static.x, circle_static.y), mouse_collide, mouse_color);
            }

        } else { //mouse_is_hexagon

            mouse_collide = Collision.test( circle_static, hexagon_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color1;
                draw_collision_response(new Vector(circle_static.x, circle_static.y), mouse_collide, mouse_color);
            }

        } //!mouse_is_hexagon else

//Test the static octagon, but do it inversely (mouse->static) so we can test the resultant collision data

        if(!mouse_is_hexagon) {

            mouse_collide = Collision.test( circle_mouse, oct_static );

            if(mouse_collide != null) {
                mouse_color = collide_color5;
                draw_collision_response(new Vector(oct_static.x, oct_static.y), mouse_collide, mouse_color);
            }

        } else { //mouse_is_hexagon

            mouse_collide = Collision.test( hexagon_mouse, oct_static );

            if(mouse_collide != null) {
                mouse_color = collide_color5;
                draw_collision_response(new Vector(oct_static.x, oct_static.y), mouse_collide, mouse_color);
            }

        } //!mouse_is_hexagon else

//Test the static box
        if(!mouse_is_hexagon) {

            mouse_collide = Collision.test( box_static, circle_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color2;
                draw_collision_response(new Vector(box_static.x, box_static.y), mouse_collide, mouse_color);
            }

        } else { //mouse_is_hexagon

            mouse_collide = Collision.test( box_static, hexagon_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color2;
                draw_collision_response(new Vector(box_static.x, box_static.y), mouse_collide, mouse_color);
            }

        } //!mouse_is_hexagon else

//Test mouse box and circle

        mouse_collide = Collision.test( circle_mouse, hexagon_mouse );

        if(mouse_collide != null) {
            mouse_color = collide_color3;
            if(mouse_is_hexagon) {
                draw_collision_response(new Vector(circle_mouse.x, circle_mouse.y), mouse_collide, mouse_color);
            } else {
                draw_collision_response(new Vector(hexagon_mouse.x, hexagon_mouse.y), mouse_collide, mouse_color);
            }
        }

//Test the line and all the shapes

        line_collide = Collision.ray( line_start, line_end, [ box_static, hexagon_mouse, circle_static, circle_mouse ]);

//Now draw them

        // visualise.graphics.lineStyle( 2, normal_color );

            drawer.drawCircle( circle_static, new Color().rgb(normal_color), true );
            drawer.drawPolygon( box_static, new Color().rgb(normal_color),  true );
            drawer.drawPolygon( hexagon_mouse, new Color().rgb(normal_color), true);
            drawer.drawPolygon( oct_static, new Color().rgb(normal_color), true );

            if(!mouse_is_hexagon) {
                drawer.drawPolygon( hexagon_mouse, new Color().rgb(normal_color), true );
            } else {
                drawer.drawCircle( circle_mouse, new Color().rgb(normal_color), true );
            }

        // visualise.graphics.lineStyle( 2, mouse_color );

            if(!mouse_is_hexagon) {
                drawer.drawCircle( circle_mouse, new Color().rgb(mouse_color), true );
            } else {
                drawer.drawPolygon( hexagon_mouse, new Color().rgb(mouse_color), true );
            }

        // visualise.graphics.lineStyle( 2, normal_color );
            var c = new Color().rgb(normal_color);

            if(line_collide) {
                // visualise.graphics.lineStyle( 2, collide_color4 );
                c.rgb( collide_color4 );
            }

            drawer.drawLine(line_start, line_end, c , true);

    } //update


} //Main
