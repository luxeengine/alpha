package luxe.physics.nape;

import haxe.ds.ObjectMap;
import nape.geom.Vec2List;
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
		
		public var drawImmediate : Bool = false;
		
		var bodiesGeometry:ObjectMap<Body, Geometry>;

        public function new( ?_options : RenderProperties ) {

            geometry = [];
            options = (_options == null) ? {} : _options;

                //force immediate for now

            options.immediate = true;
            if (options.batcher == null) options.batcher = Luxe.renderer.batcher;
			
			bodiesGeometry = new ObjectMap<Body, Geometry>();

        } //new

    //Public API
		
		public function add_body(_body:Body) {
			var draw_color = new Color(1, 1, 1, 1).rgb(0xCC0000);
			var bodyGeom = new Geometry({
                primitive_type : phoenix.Batcher.PrimitiveType.lines,
                immediate: false,
                depth: options.depth,
                group: options.group,
                visible: options.visible,
                batcher: options.batcher,
				color:draw_color
            });
			
			var shapeGeom:Geometry;
			for (_shape in _body.shapes) {
				if (_shape.isCircle()) {
					shapeGeom = gen_circle_geom(_body.position, _shape.castCircle.radius, draw_color, false);
				} else {
					shapeGeom = gen_polygon_geom(_shape.castPolygon.localVerts, draw_color, false);
				}
				
				bodyGeom.vertices = bodyGeom.vertices.concat(shapeGeom.vertices);
				shapeGeom.drop();
			}
			bodiesGeometry.set(_body, bodyGeom);
		}
		
		public function remove_body(_body:Body) {
			var geom = bodiesGeometry.get(_body);
			if (geom == null) return;
			geom.drop();
			bodiesGeometry.remove(_body);
		}
		
        public function clear() {
			if (drawImmediate) {
				for(g in geometry) {
					geometry.remove(g);
					if(!g.immediate) {
						g.drop();
					}
					g = null;
				}

				geometry = [];
			}
        } //clear

        public function draw(object:Dynamic) {
			if (drawImmediate) {
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
			}
			else {
				var geom:Geometry;
				var euler:Vector = new Vector();
				for (body in bodiesGeometry.keys()) {
					geom = bodiesGeometry.get(body);
					geom.transform.pos.x = body.position.x;
					geom.transform.pos.y = body.position.y;
					euler.set_xyz(0, 0, body.rotation);
					geom.transform.rotation.setFromEuler(euler);
					if (body.isSleeping) {
						geom.color.a = 0.3;
					}
					else {
						geom.color.a = 1;
					}
				} //for all bodies
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
			
			var geom:Geometry;
			if (_shape.isCircle()) {
				var circle = _shape.castCircle;
				geom = gen_circle_geom(circle.body.position, circle.radius, _draw_color, _immediate);
				geom.transform.rotation.setFromEuler(new Vector(0,0,_shape.body.rotation));
			}
			else {
				var poly = _shape.castPolygon;
				geom = gen_polygon_geom(poly.worldVerts, _draw_color, _immediate);
			}
			
			geometry.push(geom);

        } //draw_shape

        function draw_constraint( _constraint:Constraint, _immediate:Bool = true ) {

            //:todo : I wanted to look at how nape default draws things to match if possible

        } //draw_constraint

    //Internal helpers

        function draw_circle( position:Vec2, radius:Float, color:Color, _immediate:Bool = true ) {
            geometry.push( gen_circle_geom(position, radius, color, _immediate) );

        } //draw_circle
		
		function gen_circle_geom( position:Vec2, radius:Float, color:Color, _immediate:Bool = true) {
			
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
			
			//add a center point
            g.vertices.insert( 0, new Vertex( new Vector(0, 0), color ) );
            g.vertices.insert( 0, g.vertices[1].clone() );
			
			return g;
		}

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
			geometry.push(gen_polygon_geom(polygon.worldVerts, color, _immediate));

        } //draw_polygon
		
		function gen_polygon_geom( verts:Vec2List, color:Color, _immediate:Bool = true) {
			
			var g = new Geometry({
                primitive_type : phoenix.Batcher.PrimitiveType.lines,
                immediate: _immediate,
                depth: options.depth,
                group: options.group,
                visible: options.visible,
                batcher: options.batcher
            });

            var i = 0;
            for(v in verts) {

                g.add( new Vertex( new Vector(v.x, v.y), color ) );

                if(i < verts.length - 1) {
                    var vnext = verts.at(i+1);
                    g.add( new Vertex( new Vector(vnext.x, vnext.y), color ));
                }

                i++;

            }

            var last = verts.at(0);

                g.add( new Vertex( new Vector(last.x, last.y), color ) );
			
			return g;
		}

    } //DebugDraw

#end //nape
