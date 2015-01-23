package luxe.physics.nape;

import phoenix.Color;
import phoenix.geometry.Geometry;
import phoenix.geometry.Vertex;
import phoenix.Vector;
import luxe.options.RenderProperties;

#if nape

    import nape.shape.Circle;
    import nape.shape.Polygon;
    import nape.shape.Shape;
    import nape.shape.ShapeType;
    import nape.space.Space;
    import nape.geom.Vec2;
    import nape.phys.Body;
    import nape.phys.BodyType;
    import nape.phys.Compound;
    import nape.constraint.Constraint;

    class DebugDraw {

         // If true, then all bodies in the space (whether active or not) will be drawn.
        public var drawBodies:Bool = true;
         // If true, then things like the body centre of mass, and bounding box will be drawn.
         // This will only have an effect if drawBodies is true.
        public var drawBodyDetail:Bool = true;
         // If true, then things like shape centre of mass and bounding box will be drawn.
         // This will only have an effect if drawBodies is true.
        public var drawShapeDetail:Bool = false;
         // If true, then indicators of the shapes rotation will be drawn.
         // This will only have an effect if drawBodies is true.
        public var drawShapeAngleIndicators:Bool = true;
         // If true, then representations of the active constraints will be drawn.
        public var drawConstraints:Bool = false;

        public var geometry : Array<Geometry>;

        public var options : RenderProperties;

        public function new( ?_options : RenderProperties ) {

            geometry = [];
            options = (_options == null) ? {} : _options;

                //force immediate for now

            options.immediate = true;
            if(options.batcher == null) options.batcher = Luxe.renderer.batcher;

        } //new

    //Public API

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

        public function destroy() {

            clear();

        } //destroy

    //Internal API

        function draw_space( _space:Space, _immediate:Bool = true ) {
            if(drawBodies) {
                for(_b in _space.bodies) {
                    draw_body(_b, _immediate);
                }
            }
        } //space

        function draw_compound( _space:Compound, _immediate:Bool = true ) {

            //:todo :

        } //draw_compound

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
                    draw_point(_body.position, _draw_color, _immediate);
                        //bounds
                    draw_AABB(_body.bounds, _draw_color, _immediate);
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
                    draw_circle( circle.body.position, circle.radius, _draw_color, _immediate );
                    geometry[geometry.length-1].transform.rotation.setFromEuler(new Vector(0,0,_shape.body.rotation));
                } else {
            //POLYGON
                    var poly = _shape.castPolygon;
                    draw_polygon( poly, _draw_color, _immediate );
                }

        } //draw_shape

        function draw_constraint( _constraint:Constraint, _immediate:Bool = true ) {

            //:todo : I wanted to look at how nape default draws things to match if possible

        } //draw_constraint

    //Internal helpers

        function draw_circle( position:Vec2, radius:Float, color:Color, _immediate:Bool = true ) {

            var g = Luxe.draw.ring({
                x: position.x,
                y: position.y,
                r: radius,
                color: color,
                immediate: _immediate,
                depth: options.depth,
                group: options.group,
                visible: options.visible,
                batcher: options.batcher
            });

            geometry.push( g );

                //add a center point
            g.vertices.insert( 0, new Vertex( new Vector(0, 0), color ) );
            g.vertices.insert( 0, g.vertices[1].clone() );

        } //draw_circle

        function draw_point( _p:nape.geom.Vec2, color:Color, _immediate:Bool = true ) {

            geometry.push(
                Luxe.draw.ring({
                    x: _p.x,
                    y: _p.y,
                    r: 2,
                    color: color,
                    immediate: _immediate,
                    depth: options.depth,
                    group: options.group,
                    visible: options.visible,
                    batcher: options.batcher
                })
            );

        } //draw_point

        function draw_AABB( _bounds:nape.geom.AABB, color:Color, _immediate:Bool = true ) {

            geometry.push(
                Luxe.draw.rectangle({
                    x: _bounds.x,
                    y: _bounds.y,
                    w: _bounds.width,
                    h: _bounds.height,
                    color: color,
                    immediate: _immediate,
                    depth: options.depth,
                    group: options.group,
                    visible: options.visible,
                    batcher: options.batcher
                })
            );

        } //draw_AABB

        function draw_polygon( polygon:Polygon, color:Color, _immediate:Bool = true ) {

            var g = new Geometry({
                primitive_type : phoenix.Batcher.PrimitiveType.lines,
                immediate: _immediate,
                depth: options.depth,
                group: options.group,
                visible: options.visible,
                batcher: options.batcher
            });

            var i = 0;
            for(v in polygon.worldVerts) {

                g.add( new Vertex( new Vector(v.x, v.y), color ) );

                if(i < polygon.worldVerts.length - 1) {
                    var vnext = polygon.worldVerts.at(i+1);
                    g.add( new Vertex( new Vector(vnext.x, vnext.y), color ));
                }

                i++;

            }

            var last = polygon.worldVerts.at(0);

                g.add( new Vertex( new Vector(last.x, last.y), color ) );

            geometry.push(g);

        } //draw_polygon

    } //DebugDraw

#end //nape
