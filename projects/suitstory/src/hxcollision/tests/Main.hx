
import nme.display.Sprite;
import nme.events.Event;
import nme.geom.Point;
import nme.Lib;

import hxcollision.math.Vector2D;
import hxcollision.shapes.BaseShape;
import hxcollision.shapes.Circle;
import hxcollision.shapes.Polygon;
import hxcollision.CollisionData;
import hxcollision.Collision;

class Main extends Sprite {


        //For viewing the collision states
    private var visualise : Sprite;
    private var collide_color : Int = 0xCC1111;
    private var collide_color2 : Int = 0x2233CC;
    private var collide_color3 : Int = 0x11CC88;
    private var normal_color : Int = 0x999999;    
    private var mouse_pos : Point;
    private var mouse_is_box : Bool = false;

        //A few static shapes to test against
    private var circle_static : Circle;
    private var box_static : Polygon;
        //A circle that follows the mouse
    private var circle_mouse : Circle;
    private var box_mouse : Polygon;

        //A collision data object for the mouse circle
    private var mouse_collide : CollisionData;

    public function new() {

        super();

        addEventListener (Event.ADDED_TO_STAGE, construct);   

    }
    public function construct(e: Event) {        

            //Our debug view
        visualise = new Sprite();
        addChild( visualise );

            //Init
        mouse_pos = new Point();

            //Create a bit of a space to play in 
        circle_static = new Circle( 50, new Vector2D(300,200) );
        circle_mouse = new Circle( 30, new Vector2D(250,250) );
        box_static = Polygon.rectangle(60,150, new Vector2D(120,300) );
        box_mouse = Polygon.normalPolygon(6, 50, new Vector2D(250,100) );

            //Variety
        box_static.rotation = 12;

            //Listen for the changes in mouse movement
        stage.addEventListener (nme.events.MouseEvent.MOUSE_MOVE, mousemove);
        stage.addEventListener (nme.events.MouseEvent.CLICK, mousedown);

            //Finally, hook up the event for updating.
        addEventListener( Event.ENTER_FRAME, update );
    }

    public function mousedown( e : nme.events.MouseEvent ) {
        mouse_is_box = !mouse_is_box;
    }

    public function mousemove( e : nme.events.MouseEvent ) {

        mouse_pos.x = e.stageX;
        mouse_pos.y = e.stageY;

        if(!mouse_is_box) {
            circle_mouse.x = mouse_pos.x;
            circle_mouse.y = mouse_pos.y;
        } else {
            box_mouse.x = mouse_pos.x;
            box_mouse.y = mouse_pos.y;
        }

    }

    public function update( e:Event ) {

        //draw things
        var mouse_color : Int = normal_color;

        visualise.graphics.clear();

            //Test the static circle
        if(!mouse_is_box) {
            
            mouse_collide = Collision.testShapes( circle_static, circle_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color;
            }

        } else {
            mouse_collide = Collision.testShapes( circle_static, box_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color;
            }

        }

            //Test the static box
        if(!mouse_is_box) {
            
            mouse_collide = Collision.testShapes( box_static, circle_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color2;
            }

        } else {
            mouse_collide = Collision.testShapes( box_static, box_mouse );

            if(mouse_collide != null) {
                mouse_color = collide_color2;
            }
            
        }
            
            //Test mouse box and circle
        mouse_collide = mouse_collide = Collision.testShapes( circle_mouse, box_mouse );        
        if(mouse_collide != null) {
            mouse_color = collide_color3;
        }

        visualise.graphics.lineStyle( 2, normal_color );

            circle_static.draw( visualise.graphics );
            box_static.draw( visualise.graphics );
            box_mouse.draw( visualise.graphics );

            if(!mouse_is_box) {
                box_mouse.draw( visualise.graphics );
            } else {
                circle_mouse.draw( visualise.graphics );
            }

        visualise.graphics.lineStyle( 2, mouse_color );
            if(!mouse_is_box) {
                circle_mouse.draw( visualise.graphics );
            } else {
                box_mouse.draw( visualise.graphics );
            }
    }



   public static function main () {
        var test = new Main();
        Lib.current.addChild(test);
    }

}