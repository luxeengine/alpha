package phoenix.geometry;

import luxe.Log.*;
import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.Geometry;

import luxe.options.GeometryOptions.LineGeometryOptions;

class LineGeometry extends Geometry {

    @:isVar public var p0(default,set) : Vector;
    @:isVar public var p1(default,set) : Vector;

    public function new( ?options : LineGeometryOptions ) {

        super(options);

        if(options == null) {
            return;
        }

        def(options.color, new Color());
        def(options.color0, options.color);
        def(options.color1, options.color);

            if(options.p0 != null) {
                p0 = options.p0;
            } else {
                p0 = new Vector();
            }

            if(options.p1 != null) {
                p1 = options.p1;
            } else {
                p1 = new Vector();
            }

        set(options);

    } //new

    public function set_p0(_p:Vector) : Vector {

        if(vertices.length == 0) return p0 = _p;

            vertices[0].pos.x = _p.x;
            vertices[0].pos.y = _p.y;
            vertices[0].pos.z = _p.z;

        return p0 = _p;

    } //set_p0

    public function set_p1(_p:Vector) : Vector {

        if(vertices.length == 0) return p1 = _p;

            vertices[1].pos.x = _p.x;
            vertices[1].pos.y = _p.y;
            vertices[1].pos.z = _p.z;

        return p1 = _p;

    } //set_p1

    public function set(options:Dynamic) {

        vertices.splice(0, vertices.length);

        //p0
        var vert0 : Vertex = new Vertex( new Vector( options.p0.x, options.p0.y, options.p0.z ), options.color0 );
            vert0.uv.uv0.set_uv(0,0);

        var vert1 : Vertex = new Vertex( new Vector( options.p1.x, options.p1.y, options.p1.z ), options.color1 );
            vert1.uv.uv0.set_uv(1,0);

        add(vert0);
        add(vert1);

        primitive_type = PrimitiveType.lines;
        immediate = options.immediate;

    } //set


} //LineGeometry
