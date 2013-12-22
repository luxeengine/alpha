
import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.Lib;

import luxe.collision.math.Vector2D;
import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Circle;
import luxe.collision.shapes.Polygon;
import luxe.collision.CollisionData;
import luxe.collision.Collision;
import luxe.collision.OpenFLDrawer;

class Main extends Sprite {

        //For viewing the collision states
    var drawer : OpenFLDrawer;
    var visualise : Sprite;

        //for viewing when collisions happen, we change colors
    var normal_color : Int = 0x999999;
    var collide_color1 : Int = 0xCC1111;
    var collide_color2 : Int = 0x2233CC;
    var collide_color3 : Int = 0x11CC88;
    var collide_color4 : Int = 0xCC55AA;
    var collide_color5 : Int = 0x5500CC;

        //the mouse position
    var mouse_pos : Point;
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
    var line_start : Vector2D;
    var line_end : Vector2D;
        //For movint the line, the current y position and movement direction
    var line_y : Float = 0;
    var line_dir : Int = 1;

        //A collision data object for the current mouse shape
    var mouse_collide : CollisionData;
        //True if there is a collision with the line and any shape
    var line_collide = false;

    public function new() {

        super();

        addEventListener(Event.ADDED_TO_STAGE, construct);

    } //new

    public function construct(e: Event) {        

            //Our debug view
        visualise = new Sprite();
            //the shape drawer
        drawer = new OpenFLDrawer( visualise.graphics );
            //add to the stage so we can see it
        addChild( visualise );


        mouse_pos = new Point();

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
        line_start = new Vector2D(0,0);
        line_end = new Vector2D(500,0);

            //Listen for the changes in mouse movement
        stage.addEventListener( flash.events.MouseEvent.MOUSE_MOVE, mousemove );
        stage.addEventListener( flash.events.MouseEvent.CLICK, mousedown );

            //And finally, listen for updates.
        addEventListener( Event.ENTER_FRAME, update );

    } //construct

    public function mousedown( e : flash.events.MouseEvent ) {
        mouse_is_hexagon = !mouse_is_hexagon;
    } //mousedown

    public function mousemove( e : flash.events.MouseEvent ) {

        mouse_pos.x = e.stageX;
        mouse_pos.y = e.stageY;

        if(!mouse_is_hexagon) {

            circle_mouse.x = mouse_pos.x;
            circle_mouse.y = mouse_pos.y;

        } else {

            hexagon_mouse.x = mouse_pos.x;
            hexagon_mouse.y = mouse_pos.y;

        }

    } //mousemove

    public function update_line() {

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

    public function draw_collision_response( pos:Vector2D, collision_response:CollisionData ) {
        visualise.graphics.lineStyle( 1, collide_color3 );
            
            drawer.drawLine( new Vector2D(pos.x, pos.y), new Vector2D( pos.x+(collision_response.unitVector.x*20), pos.y+(collision_response.unitVector.y*20) ) );
    }

    var end_dt : Float = 0;
    var dt : Float = 0;

    public function update( e:Event ) {

        dt = haxe.Timer.stamp() - end_dt;
        end_dt = haxe.Timer.stamp();

            update_line();

            //draw things
        var mouse_color : Int = normal_color;
            //start clean each update
        visualise.graphics.clear();

//Test the static circle

        if(!mouse_is_hexagon) {
            
            mouse_collide = Collision.testShapes( circle_static, circle_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color1;
                draw_collision_response(new Vector2D(circle_static.x, circle_static.y), mouse_collide);
            }

        } else { //mouse_is_hexagon

            mouse_collide = Collision.testShapes( circle_static, hexagon_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color1;
                draw_collision_response(new Vector2D(circle_static.x, circle_static.y), mouse_collide);
            }

        } //!mouse_is_hexagon else

//Test the static octagon, but do it inversely (mouse->static) so we can test the resultant collision data

        if(!mouse_is_hexagon) {
            
            mouse_collide = Collision.testShapes( circle_mouse, oct_static );

            if(mouse_collide != null) {
                mouse_color = collide_color5;
                draw_collision_response(new Vector2D(oct_static.x, oct_static.y), mouse_collide);
            }

        } else { //mouse_is_hexagon

            mouse_collide = Collision.testShapes( hexagon_mouse, oct_static );

            if(mouse_collide != null) {
                mouse_color = collide_color5;
                draw_collision_response(new Vector2D(oct_static.x, oct_static.y), mouse_collide);
            }

        } //!mouse_is_hexagon else

//Test the static box
        if(!mouse_is_hexagon) {
            
            mouse_collide = Collision.testShapes( box_static, circle_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color2;
                draw_collision_response(new Vector2D(box_static.x, box_static.y), mouse_collide);
            }

        } else { //mouse_is_hexagon

            mouse_collide = Collision.testShapes( box_static, hexagon_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color2;
                draw_collision_response(new Vector2D(box_static.x, box_static.y), mouse_collide);
            }
            
        } //!mouse_is_hexagon else
            
//Test mouse box and circle

        mouse_collide = Collision.testShapes( circle_mouse, hexagon_mouse );

        if(mouse_collide != null) {
            mouse_color = collide_color3;
            if(mouse_is_hexagon) {
                draw_collision_response(new Vector2D(circle_mouse.x, circle_mouse.y), mouse_collide);
            } else {
                draw_collision_response(new Vector2D(hexagon_mouse.x, hexagon_mouse.y), mouse_collide);
            }
        }

//Test the line and all the shapes

        line_collide = Collision.rayCollision( line_start, line_end, [ box_static, hexagon_mouse, circle_static, circle_mouse ]);

//Now draw them

        visualise.graphics.lineStyle( 2, normal_color );

            drawer.drawCircle( circle_static );
            drawer.drawPolygon( box_static );
            drawer.drawPolygon( hexagon_mouse );
            drawer.drawPolygon( oct_static );

            if(!mouse_is_hexagon) {
                drawer.drawPolygon( hexagon_mouse );
            } else {
                drawer.drawCircle( circle_mouse );
            }

        visualise.graphics.lineStyle( 2, mouse_color );

            if(!mouse_is_hexagon) {
                drawer.drawCircle( circle_mouse );
            } else {
                drawer.drawPolygon( hexagon_mouse );
            }

        visualise.graphics.lineStyle( 2, normal_color );

            if(line_collide) {
                visualise.graphics.lineStyle( 2, collide_color4 );
            } 

            drawer.drawLine(line_start, line_end);

    } //update


   public static function main () {
        var test = new Main();
        Lib.current.addChild(test);
    } //entry point

} //Main 

