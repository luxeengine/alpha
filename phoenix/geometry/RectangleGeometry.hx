package phoenix.geometry;


import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.Geometry;

import luxe.options.GeometryOptions.RectangleGeometryOptions;

class RectangleGeometry extends Geometry {


    public function new( ?options : RectangleGeometryOptions ) {

        super(options);

        if(options == null) {
            return;
        }

        set(options);

    } //new

    public function set( options:RectangleGeometryOptions ) {

        vertices.splice(0, vertices.length);

        var _x : Float = options.x;
        var _y : Float = options.y;
        var _w : Float = options.w;
        var _h : Float = options.h;

        if(options.rect != null) {
            _x = options.rect.x;
            _y = options.rect.y;
            _w = options.rect.w;
            _h = options.rect.h;
        }

            //tl
        var vert0 : Vertex = new Vertex( new Vector( 0, 0 ) );
            vert0.uv.uv0.set_uv(0,0);
            //tr
        var vert1 : Vertex = new Vertex( new Vector( _w, 0 ) );
            vert1.uv.uv0.set_uv(1,0);

            //tr
        var vert2 : Vertex = new Vertex( new Vector( _w, 0 ) );
            vert2.uv.uv0.set_uv(1,0);
            //br
        var vert3 : Vertex = new Vertex( new Vector( _w, _h ) );
            vert3.uv.uv0.set_uv(1,1);

            //br
        var vert4 : Vertex = new Vertex( new Vector( _w, _h ) );
            vert4.uv.uv0.set_uv(1,1);
            //bl
        var vert5 : Vertex = new Vertex( new Vector( 0, _h ) );
            vert5.uv.uv0.set_uv(0,1);

            //bl
        var vert6 : Vertex = new Vertex( new Vector( 0, _h ) );
            vert6.uv.uv0.set_uv(0,1);
            //tl
        var vert7 : Vertex = new Vertex( new Vector( 0, 0 ) );
            vert7.uv.uv0.set_uv(0,0);

        add(vert0); add(vert1); add(vert2); add(vert3);
        add(vert4); add(vert5); add(vert6); add(vert7);

        primitive_type = PrimitiveType.lines;
        immediate = (options.immediate == null) ? false : options.immediate;
        visible = (options.visible == null) ? true : options.visible;
        color = (options.color == null) ? new Color() : options.color;

        transform.pos = new Vector( _x, _y );

    } //set


} //RectangleGeometry
