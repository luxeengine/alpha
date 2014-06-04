package phoenix.geometry;


import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.Geometry;


class RectangleGeometry extends Geometry {


    public function new( options : Dynamic ) {
        super(options);
        set(options);
    }


    public function set(options:Dynamic) {

        vertices.splice(0, vertices.length);

            //tl
        var vert0 : Vertex = new Vertex( new Vector( 0, 0 ) );
            vert0.uv.uv0.set(0,0);
            //tr
        var vert1 : Vertex = new Vertex( new Vector( options.w, 0 ) );
            vert1.uv.uv0.set(1,0);

            //tr
        var vert2 : Vertex = new Vertex( new Vector( options.w, 0 ) );
            vert2.uv.uv0.set(1,0);
            //br
        var vert3 : Vertex = new Vertex( new Vector( options.w, options.h ) );
            vert3.uv.uv0.set(1,1);

            //br
        var vert4 : Vertex = new Vertex( new Vector( options.w, options.h ) );
            vert4.uv.uv0.set(1,1);
            //bl
        var vert5 : Vertex = new Vertex( new Vector( 0, options.h ) );
            vert5.uv.uv0.set(0,1);

            //bl
        var vert6 : Vertex = new Vertex( new Vector( 0, options.h ) );
            vert6.uv.uv0.set(0,1);
            //tl
        var vert7 : Vertex = new Vertex( new Vector( 0, 0 ) );
            vert7.uv.uv0.set(0,0);

        add(vert0); add(vert1); add(vert2); add(vert3);
        add(vert4); add(vert5); add(vert6); add(vert7); 

        primitive_type = PrimitiveType.lines;
        immediate = (options.immediate == null) ? false : options.immediate;
        visible = (options.visible == null) ? true : options.visible;
        color = (options.color == null) ? new Color() : options.color;

            //finally translate it, the 0.5 offset is so that it snaps to a pixel
        transform.pos = new Vector( options.x, options.y );

    } //set
    

} //RectangleGeometry
