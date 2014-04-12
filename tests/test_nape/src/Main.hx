
import luxe.Input;

import nape.constraint.Constraint;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.phys.Compound;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.shape.Shape;
import nape.shape.ShapeType;
import nape.space.Space;
import phoenix.Color;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.Vector;


class LuxeNapeDebug {

    /**
     * If true, then all bodies in the space (whether active or not) will be drawn.
     * @default true
     */
    public var drawBodies:Bool=true;
    /**
     * If true, then things like the body centre of mass, and bounding box will be drawn.
     * <br/><br/>
     * This will only have an effect if drawBodies is true.
     * @default false
     */
    public var drawBodyDetail:Bool=true;
    /**
     * If true, then things like shape centre of mass and bounding box will be drawn.
     * <br/><br/>
     * This will only have an effect if drawBodies is true.
     * @default false
     */
    public var drawShapeDetail:Bool=false;
    /**
     * If true, then indicators of the shapes rotation will be drawn.
     * <br/><br/>
     * This will only have an effect if drawBodies is true.
     * @default true
     */
    public var drawShapeAngleIndicators:Bool=true;
    /**
     * If true, then representations of the active constraints will be drawn.
     * @default false
     */
    public var drawConstraints:Bool=false;

    var geometry : Array<Geometry>;

    public function new() {
        geometry = [];
    }

    public function clear() {

        for(g in geometry) {
            geometry.remove(g);
            if(!g.immediate) {
                g.drop();
            }
            g = null;
        }

        geometry = [];

    } //clear

    function drawCircle( position:Vec2, radius:Float, color:Color, _immediate:Bool = true ) {
        
        var g = Luxe.draw.ring({
            x:position.x,
            y:position.y,
            r:radius,
            color : color,
            immediate:_immediate
        });

        geometry.push( g );

            //add a center point first
        g.vertices.insert(0, 
            new Vertex(
                new Vector(0, 0),
                new Vector(),
                color
            )
        );

            //and duplicate the first vertex at the end
            //because line loops yo
        g.add( g.vertices[1] );

        
    }

    function drawPoint( _p:nape.geom.Vec2, color:Color, _immediate:Bool = true ) {
        geometry.push(
            Luxe.draw.ring({
                x:_p.x,
                y:_p.y,
                r:2,
                color : color,
                immediate:_immediate
            })
        );
    } //drawPoint

    function drawAABB( _bounds:nape.geom.AABB, color:Color, _immediate:Bool = true ) {
        geometry.push(
            Luxe.draw.rectangle({
                x:_bounds.x,
                y:_bounds.y,
                w:_bounds.width,
                h:_bounds.height,
                color : color,
                immediate:_immediate
            })
        );
    }

    function drawPolygon( polygon:Polygon, color:Color, _immediate:Bool = true ) {
        
        var g = new Geometry({});

        g.primitive_type = phoenix.Batcher.PrimitiveType.line_loop;
        
        for(v in polygon.worldVerts) {
            g.add(
                new Vertex(
                    new Vector(v.x, v.y),
                    new Vector(),
                    color
                )
            );
        }

        g.immediate = true;

        geometry.push(g);

        Luxe.addGeometry(g);        

    } //drawPolygon


    function draw_space( _space:Space, _immediate:Bool = true ) {
        if(drawBodies) {
            for(_b in _space.bodies) {
                draw_body(_b, _immediate);                
            }
        }
    } //space

    function draw_compound( _space:Compound, _immediate:Bool = true ) {

    }

    function draw_body( _body:Body, _color:Int = 0xCC0000, _immediate:Bool = true ) {
        
        var _draw_color = new Color(1,1,1,1).rgb(_color);

        if(_body.debugDraw) {
            
            for(_shape in _body.shapes) {                
                draw_shape(_shape, _color, _immediate);
            }
            
            if(drawBodyDetail) {
                    //details are white for now
                _draw_color.rgb(0xffffff);
                    //always draw lesser details less visible
                _draw_color.a = 0.1;
                    //center point
                drawPoint(_body.position, _draw_color, _immediate);
                    //bounds
                drawAABB(_body.bounds, _draw_color, _immediate);
            }

        } //_body.debugDraw

    } //draw_body

    function draw_shape( _shape:Shape, _color:Int = 0xCC0000, _immediate:Bool = true ) {

        var _draw_color = new Color(1,1,1,1).rgb(_color);

        if(_shape.body.isSleeping) {
            _draw_color.a = 0.3;
        }

            //CIRCLE
        if(_shape.isCircle()) {
            var circle = _shape.castCircle;
            drawCircle( circle.body.position, circle.radius, _draw_color, _immediate );
            geometry[geometry.length-1].rotation.setFromEuler(new Vector(0,0,_shape.body.rotation));
        } else {
            //POLYGON
            var poly = _shape.castPolygon;
            drawPolygon( poly, _draw_color, _immediate );
        }

    }

    function draw_constraint( _constraint:Constraint, _immediate:Bool = true ) {

    }


    public function draw(object:Dynamic) {
        
        if(Std.is(object, Space)) {
            draw_space( cast object );
        } else 
        
        if(Std.is(object, Compound)) {
            draw_compound( cast object );
        } else
        
        if(Std.is(object, Body)) {
            draw_body( cast object );
        } else 

        if(Std.is(object, Shape)) {
            draw_shape( cast object );
        } else 

        if(Std.is(object, Constraint)) {
            draw_constraint( cast object );
        } 

    } //draw

}

class Main extends luxe.Game {


    var debug : LuxeNapeDebug;
    var ball : Body;

    public function ready() {

        debug = new LuxeNapeDebug();

        var w = Luxe.screen.w;
        var h = Luxe.screen.h;

        var floor = new Body(BodyType.STATIC);
        
            floor.shapes.add(new Polygon(Polygon.rect(50, (h - 50), (w - 100), 1)));
            floor.space = Luxe.physics.nape.space;

            for (i in 0...16) {
                var box = new Body(BodyType.DYNAMIC);
                box.shapes.add(new Polygon(Polygon.box(16, 32)));
                box.position.setxy((w / 2), ((h - 50) - 32 * (i + 0.5)));
                box.space = Luxe.physics.nape.space;
            }

             ball = new Body(BodyType.DYNAMIC);
                ball.shapes.add(new Circle(50));
                ball.position.setxy(50, h / 2);
                ball.angularVel = 10;
                ball.space = Luxe.physics.nape.space;        

    } //ready

    public function onkeyup( e:KeyEvent ) {

        var imp = 900;

        if(e.key == KeyValue.left) {
            ball.applyImpulse(new Vec2(-imp, -imp), ball.position);
        }
        if(e.key == KeyValue.right) {
            ball.applyImpulse(new Vec2(imp, -imp), ball.position);
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {
        debug.clear();
        debug.draw(Luxe.physics.nape.space);
    } //update


} //Main
