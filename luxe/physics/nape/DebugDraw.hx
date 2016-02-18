package luxe.physics.nape;

import phoenix.Color;
import phoenix.geometry.Geometry;
import phoenix.geometry.RingGeometry;
import phoenix.geometry.Vertex;
import phoenix.Vector;
import luxe.options.RenderProperties;

#if nape

    import nape.geom.Vec2List;
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

    @:allow(luxe.physics.nape.PhysicsNape)
    class DebugDraw {

            /* If true, then all bodies in the space (whether active or not) will be drawn.*/
        @:noCompletion public var drawBodies:Bool = true;
            /* If true, then things like the body centre of mass, and bounding box will be drawn.
               This will only have an effect if drawBodies is true. */
        @:noCompletion public var drawBodyDetail:Bool = true;
            /** If true, then things like shape centre of mass and bounding box will be drawn.
                This will only have an effect if drawBodies is true. */
        @:noCompletion public var drawShapeDetail:Bool = false;
            /** If true, then indicators of the shapes rotation will be drawn.
                This will only have an effect if drawBodies is true. */
        @:noCompletion public var drawShapeAngleIndicators:Bool = true;
            /* If true, then representations of the active constraints will be drawn. */
        @:noCompletion public var drawConstraints:Bool = false;

            /** The options stored during construction, mostly used internally. */
        @:noCompletion public var options : RenderProperties;
            /** The geometry stored in the debug draw. Used internally, interact via the add/remove calls instead. */
        @:noCompletion public var geometry:Map<Body, CachedGeometry>;

            //Visible flag from PhysicsNape
        var visible(default, set):Bool = true;
            //internal cache vector
        static var cache_euler:Vector = new Vector();

            /** Create a new debugdrawer for use with the given RenderProperties.
                Usually, you would do `Luxe.physics.nape.debugdraw = new DebugDraw({ .. })`
                and then add your bodies to the drawer. */
        public function new( ?_options : RenderProperties ) {

            options = (_options == null) ? { } : _options;

            if (options.batcher == null) options.batcher = Luxe.renderer.batcher;

            geometry = new Map();

        } //new

    //Public API

            /** Add a body to the debug drawer. It will automatically follow the body. */
        public function add(_body:Body, ?_active_color:Color, ?_inactive_color:Color) {

            if(_active_color == null) _active_color = new Color().rgb(0xf6007b);

            var bodyGeom = new Geometry({
                primitive_type : phoenix.Batcher.PrimitiveType.lines,
                immediate: options.immediate,
                depth: options.depth,
                visible: visible,
                batcher: options.batcher
            });

            var shapeVerts:Array<Vertex>;
            for (_shape in _body.shapes) {

                if (_shape.isCircle()) {
                    shapeVerts = make_circle_verts(_shape.castCircle);
                } else {
                    shapeVerts = make_polygon_verts(_shape.castPolygon.localVerts);
                }

                bodyGeom.vertices = bodyGeom.vertices.concat(shapeVerts);

            } //each shape

            bodyGeom.color = _active_color;

            if (_inactive_color == null) {
                _inactive_color = _active_color.clone();
                _inactive_color.a = _active_color.a * 0.4;
            }

            geometry.set(_body, {geometry: bodyGeom, active_color: _active_color, inactive_color: _inactive_color});

        } //add

            /** Remove a body from the debug drawer. */
        public function remove(_body:Body) {

            var cache = geometry.get(_body);

            if (cache == null) {
                return;
            }

            cache.geometry.drop();
            cache.active_color = null;
            cache.inactive_color = null;
            cache = null;

            geometry.remove(_body);

        } //remove

    // Internal public API

            /** Called automatically by PhysicsNape.
                Exposed for flexibility, don't call this manually! */
        @:noCompletion public function update() {

            if (!visible) {
                return;
            }

            var cache:CachedGeometry;

            for (body in geometry.keys()) {

                cache = geometry.get(body);

                cache.geometry.transform.pos.x = body.position.x;
                cache.geometry.transform.pos.y = body.position.y;

                cache_euler.set_xyz(0, 0, body.rotation);
                cache.geometry.transform.rotation.setFromEuler(cache_euler);

                if(body.isSleeping) {
                    cache.geometry.color = cache.inactive_color;
                } else {
                    cache.geometry.color = cache.active_color;
                }

            } //for all bodies

        } //update


            /** A convenience API for potential future use. */
        @:noCompletion
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

        } //draw_immediate

        public function destroy() {

            //Handle cached geometry
            for(key in geometry.keys()) {
                remove(key);
            }

            geometry = null;

        } //destroy

    //Internal API

        function set_visible(state:Bool) {

            if (visible == state) {
                return visible;
            }

            for (cache in geometry.iterator()) {
                cache.geometry.visible = state;
            }

            return visible = state;

        } //set_visible

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

            var geom = new Geometry({
                primitive_type: phoenix.Batcher.PrimitiveType.lines,
                immediate: options.immediate,
                depth: options.depth,
                visible: options.visible,
                batcher: options.batcher
            });

            if (_shape.isCircle()) {
                var circle = _shape.castCircle;
                geom.vertices = make_circle_verts(circle);
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

            //:todo : I wanted to look at how nape default draws things to match if possible

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
                visible: options.visible,
                batcher: options.batcher
            });

        } //draw_AABB

        function make_circle_verts(circle:Circle):Array<Vertex> {

            var _color = new Color();
            var _tmp = Luxe.draw.ring({
                x: 0,
                y: 0,
                r: circle.radius,
                immediate:true,
                no_batcher_add: true
            });

            var _verts = _tmp.vertices.copy();
            
            _tmp.drop();

			for (v in _verts) {
				v.pos.x += circle.localCOM.x;
				v.pos.y += circle.localCOM.y;
                v.color = _color;
			}
			
                //add a center point
            _verts.insert( 0, new Vertex(new Vector(circle.localCOM.x, circle.localCOM.y), _color) );
            _verts.insert( 1, _verts[1].clone() );

            return _verts;

        } //make_circle_verts

        function make_polygon_verts( vertexList:Vec2List):Array<Vertex> {

            var i = 0, verts = [];

            for(v in vertexList) {

                verts.push( new Vertex(new Vector(v.x, v.y)) );

                if (i != 0) {
                    verts.push( new Vertex(new Vector(v.x, v.y)) );
                }

                i++;

            } //each vertexList

            var last = vertexList.at(0);

            verts.push( new Vertex(new Vector(last.x, last.y)) );

            return verts;

        } //make_polygon_verts

    } //DebugDraw

    private typedef CachedGeometry = {

        var geometry:Geometry;
        var active_color:Color;
        var inactive_color:Color;

    } //

#end //nape
