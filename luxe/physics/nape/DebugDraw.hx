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
		
		var bodiesGeometry:Map<Body, Geometry>;

        public function new( ?_options : RenderProperties) {

            geometry = [];
            options = (_options == null) ? { } : _options;
			
			if (options.immediate == null) options.immediate = false;
			
            if (options.batcher == null) options.batcher = Luxe.renderer.batcher;
			
			bodiesGeometry = new Map();

        } //new

    //Public API
		
		public function add(_body:Body) {
			if (options.immediate) return;
			
			var draw_color = new Color().rgb(0xCC0000);
			var bodyGeom = new Geometry({
                primitive_type : phoenix.Batcher.PrimitiveType.lines,
                immediate: options.immediate,
                depth: options.depth,
                group: options.group,
                visible: options.visible,
                batcher: options.batcher,
				color:draw_color
            });
			
			var shapeVerts:Array<Vertex>;
			for (_shape in _body.shapes) {
				if (_shape.isCircle()) {
					shapeVerts = make_circle_verts(_shape.castCircle.radius, draw_color);
				} else {
					shapeVerts = make_polygon_verts(_shape.castPolygon.localVerts, draw_color);
				}
				
				bodyGeom.vertices = bodyGeom.vertices.concat(shapeVerts);
			}
			bodiesGeometry.set(_body, bodyGeom);
		}
		
		public function remove(_body:Body) {
			if (options.immediate) return;
			var geom = bodiesGeometry.get(_body);
			if (geom == null) return;
			geom.drop();
			geom = null;
			bodiesGeometry.remove(_body);
		}
		
        public function clear() {
			if (options.immediate) {
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
			if (options.immediate) {
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
			
			for (key in bodiesGeometry.keys()) {
				remove(key);
			}

        } //destroy

    //Internal API

        function draw_space( _space:Space) {
            if(drawBodies) {
                for(_b in _space.bodies) {
                    draw_body(_b);
                }
            }
        } //space

        function draw_compound( _space:Compound) {

            //:todo :

        } //draw_compound

        function draw_body( _body:Body, _color:Int = 0xCC0000) {

            var _draw_color = new Color(1,1,1,1).rgb(_color);

            if(_body.debugDraw) {

                for(_shape in _body.shapes) {
                    draw_shape(_shape, _color);
                }

                if(drawBodyDetail) {
                        //details are white for now
                    _draw_color.rgb(0xffffff);
                        //always draw lesser details less visible
                    _draw_color.a = 0.1;
                        //center point
                    draw_point(_body.position, _draw_color);
                        //bounds
                    draw_AABB(_body.bounds, _draw_color);
                }

            } //_body.debugDraw

        } //draw_body

        function draw_shape( _shape:Shape, _color:Int = 0xCC0000) {

            var _draw_color = new Color(1,1,1,1).rgb(_color);

            if(_shape.body.isSleeping) {
                _draw_color.a = 0.3;
            }
			
			var geom = new Geometry( {
				primitive_type: phoenix.Batcher.PrimitiveType.lines,
				immediate: options.immediate,
				depth: options.depth,
				group: options.group,
				visible: options.visible,
				batcher: options.batcher
			});
			
			if (_shape.isCircle()) {
				var circle = _shape.castCircle;
				geom.vertices = make_circle_verts(circle.radius, _draw_color);
				geom.transform.rotation.setFromEuler(new Vector(0, 0, _shape.body.rotation));
				geom.transform.pos.set_xy(_shape.body.position.x, _shape.body.position.y);
			}
			else {
				var poly = _shape.castPolygon;
				geom.vertices = make_polygon_verts(poly.worldVerts, _draw_color);
			}
			
			geometry.push(geom);

        } //draw_shape

        function draw_constraint( _constraint:Constraint) {

            //:todo : I wanted to look at how nape default draws things to match if possible

        } //draw_constraint

    //Internal helpers
	
		function make_circle_verts(radius:Float, color:Color):Array<Vertex> {
			
			var verts = Luxe.draw.ring( {
				x: 0,
				y: 0,
				r: radius,
				color: color,
				no_batcher_add: true
			}).vertices;
			
			//add a center point
            verts.insert( 0, new Vertex( new Vector(0, 0), color ) );
            verts.insert( 0, verts[1].clone() );
			
			return verts;
		}

        function draw_point( _p:nape.geom.Vec2, color:Color) {

            geometry.push(
                Luxe.draw.ring({
                    x: _p.x,
                    y: _p.y,
                    r: 2,
                    color: color,
                    immediate: options.immediate,
                    depth: options.depth,
                    group: options.group,
                    visible: options.visible,
                    batcher: options.batcher
                })
            );

        } //draw_point

        function draw_AABB( _bounds:nape.geom.AABB, color:Color) {

            geometry.push(
                Luxe.draw.rectangle({
                    x: _bounds.x,
                    y: _bounds.y,
                    w: _bounds.width,
                    h: _bounds.height,
                    color: color,
                    immediate: true,
                    depth: options.depth,
                    group: options.group,
                    visible: options.visible,
                    batcher: options.batcher
                })
            );

        } //draw_AABB
		
		function make_polygon_verts( vertexList:Vec2List, color:Color):Array<Vertex> {
			var verts = new Array<Vertex>();
			
            var i = 0;
            for(v in vertexList) {

                verts.push( new Vertex( new Vector(v.x, v.y), color ) );
				
				if (i != 0) {
					verts.push(new Vertex(new Vector(v.x, v.y), color));
				}

                i++;
            }

            var last = vertexList.at(0);

			verts.push( new Vertex( new Vector(last.x, last.y), color ) );
			
			return verts;
		}

    } //DebugDraw

#end //nape
