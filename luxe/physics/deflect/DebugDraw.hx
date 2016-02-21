package luxe.physics.deflect;

#if deflect

    import deflect.dynamics.dynamics.BtDiscreteDynamicsWorld;

    	//:todo : This class has a lack of options, and is really quick and dirty, since bullet features will be for 3D release

    import phoenix.geometry.Geometry;
    import phoenix.geometry.Vertex;
    import phoenix.Batcher.PrimitiveType;

    class DebugDraw {

    		//NOTE: geometry is not added to a batcher! You have to add it to see it
        public var geometry : Geometry;
        public var color : Color;


        public function new() {

        	color = new Color(1,1,1,1);
            geometry = new Geometry({
                primitive_type: PrimitiveType.lines
            });

        } //new

        public function draw( world:BtDiscreteDynamicsWorld ) {

                //update the world draw status
            world.debugDrawWorld();
                //collect the vert list from the draw, this is an array of floats
            var verts = world.getDebugDrawLineVertices();
                //the number of lines is 3 (x/y/z) * 2 (start/end)
            var _count = Std.int(verts.length/6);

            for(i in 0 ... _count) {

                	//from.x,from.y,from.z, to.x,to.y,to.z

                var _from = new Vector( verts[(i*6)+0], verts[(i*6)+1], verts[(i*6)+2] );
                var _to = new Vector( verts[(i*6)+3], verts[(i*6)+4], verts[(i*6)+5] );

                geometry.add(new Vertex(_from, color));
                geometry.add(new Vertex(_to, color));

            } //_v

        } //draw


        public function clear() {

            geometry.vertices = null;
            geometry.vertices = [];

        } //clear

        public function destroy() {

        	clear();
        	geometry.drop();

        } //destroy


    } //DebugDraw

#end //deflect

