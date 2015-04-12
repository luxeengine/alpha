package luxe.physics.nape;

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

        public var options : RenderProperties;
		
		public var geometry:Map<Body, CachedGeometry>;
		
		//Use our own visible instead of options.visible for the accessor
		@:allow(luxe.physics.nape.PhysicsNape)
		var visible(default, set):Bool = true;
		
        public function new( ?_options : RenderProperties) {
			
            options = (_options == null) ? { } : _options;
			
            if (options.batcher == null) options.batcher = Luxe.renderer.batcher;
			
			geometry = new Map();

        } //new

    //Public API
		
		public function add(_body:Body, _active_color:Color, ?_inactive_color:Color) {
			var bodyGeom = new Geometry({
				primitive_type : phoenix.Batcher.PrimitiveType.lines,
				immediate: options.immediate,
				depth: options.depth,
				group: options.group,
				visible: visible,
				batcher: options.batcher
			});
			
			var shapeVerts:Array<Vertex>;
			for (_shape in _body.shapes) {
				if (_shape.isCircle()) {
					shapeVerts = make_circle_verts(_shape.castCircle.radius);
				} else {
					shapeVerts = make_polygon_verts(_shape.castPolygon.localVerts);
				}
				
				bodyGeom.vertices = bodyGeom.vertices.concat(shapeVerts);
			}
			
			bodyGeom.color = _active_color;
			
			if (_inactive_color == null) {
				_inactive_color = _active_color.clone();
				_inactive_color.a = _active_color.a * 0.3;
			}
			
			geometry.set(_body, {geometry: bodyGeom, active_color: _active_color, inactive_color: _inactive_color});
		}
		
		public function remove(_body:Body) {
			var cache = geometry.get(_body);
			if (cache == null) return;
			cache.geometry.drop();
			cache.active_color = null;
			cache.inactive_color = null;
			cache = null;
			geometry.remove(_body);
		}
		
		public function update() {
			if (!visible) return;
			
			var cache:CachedGeometry;
			var euler:Vector = new Vector();
			for (body in geometry.keys()) {
				
				cache = geometry.get(body);
				
				cache.geometry.transform.pos.x = body.position.x;
				cache.geometry.transform.pos.y = body.position.y;
				
				euler.set_xyz(0, 0, body.rotation);
				cache.geometry.transform.rotation.setFromEuler(euler);
				
				if (body.isSleeping) {
					cache.geometry.color = cache.inactive_color;
				}
				else {
					cache.geometry.color = cache.active_color;
				}
					
			} //for all bodies
		} //update

		public function draw_immediate(?_options:RenderProperties) {
			var previous_options = options;
			
			var previous_immediate = options.immediate;
			
			if (_options != null) {
				options = _options;
			}
			
			options.immediate = true;
			
			var cache:CachedGeometry;
			for (body in geometry.keys()) {
				cache = geometry.get(body);
				draw_body(body, cache.active_color, cache.inactive_color);
			}
			
			options = previous_options;
			options.immediate = previous_immediate;
		}
		
        public function destroy() {
			
			//Handle cached geometry
			for (key in geometry.keys()) {
				remove(key);
			}
			
			geometry = null;

        } //destroy

    //Internal API
		
		
		function set_visible(state:Bool) {
			if (visible == state) return visible;
			
			for (cache in geometry.iterator()) {
				cache.geometry.visible = state;
			}
			return visible = state;
		}
		
        function draw_body( _body:Body, _active_color:Color, _inactive_color:Color) {
			
            if(_body.debugDraw) {

                for(_shape in _body.shapes) {
                    draw_shape(_shape, _active_color, _inactive_color);
                }

                if(drawBodyDetail) {
                        //details are white for now
                    var detail_color = new Color().rgb(0xffffff);
                        //always draw lesser details less visible
                   detail_color.a = 0.1;
                        //center point
                    draw_point(_body.position, detail_color);
                        //bounds
                    draw_AABB(_body.bounds, detail_color);
                }

            } //_body.debugDraw

        } //draw_body

        function draw_shape( _shape:Shape, _active_color:Color, _inactive_color:Color) {

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
				geom.vertices = make_circle_verts(circle.radius);
				geom.transform.rotation.setFromEuler(new Vector(0, 0, _shape.body.rotation));
				geom.transform.pos.set_xy(_shape.body.position.x, _shape.body.position.y);
			}
			else {
				var poly = _shape.castPolygon;
				geom.vertices = make_polygon_verts(poly.worldVerts);
			}
			
			geom.color = _shape.body.isSleeping ? _inactive_color : _active_color;

        } //draw_shape

        function draw_constraint( _constraint:Constraint) {

            //:todo : I wanted to look at how nape default draws things to match if possible

        } //draw_constraint
		
		function draw_compound( _space:Compound) {

            //:todo :

        } //draw_compound

    //Internal helpers
	
        function draw_point( _p:nape.geom.Vec2, color:Color) {

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
			});

        } //draw_point

        function draw_AABB( _bounds:nape.geom.AABB, color:Color) {

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
			});

        } //draw_AABB
		
		function make_circle_verts(radius:Float):Array<Vertex> {
			
			var verts = Luxe.draw.ring( {
				x: 0,
				y: 0,
				r: radius,
				no_batcher_add: true
			}).vertices;
			
			//add a center point
            verts.insert( 0, new Vertex( new Vector(0, 0)) );
            verts.insert( 0, verts[1].clone() );
			
			return verts;
		}
		
		function make_polygon_verts( vertexList:Vec2List):Array<Vertex> {
			var verts = new Array<Vertex>();
			
            var i = 0;
            for(v in vertexList) {

                verts.push( new Vertex( new Vector(v.x, v.y)) );
				
				if (i != 0) {
					verts.push(new Vertex(new Vector(v.x, v.y)));
				}

                i++;
            }

            var last = vertexList.at(0);

			verts.push( new Vertex( new Vector(last.x, last.y)) );
			
			return verts;
		}

    } //DebugDraw
	
	typedef CachedGeometry = {
		var geometry:Geometry;
		var active_color:Color;
		var inactive_color:Color;
	}
#end //nape
