package ;

import luxe.Vector;
import phoenix.geometry.Geometry;
import phoenix.Batcher;
import luxe.options.GeometryOptions.GeometryOptions;
import phoenix.geometry.Vertex;
import phoenix.Vector.ComponentOrder;
class SplineGeometry extends Geometry {

    public var p0(default,set) : Vector;
    public var p1(default,set) : Vector;
    public var p2(default,set) : Vector;
    public var p3(default,set) : Vector;

    public var DistPerPoint:Float = 250;
    public var MinPoints:Int = 20;
    public var lineWidth(default,set):Float = 2;

    public function new( ?options : SplineGeometryOptions ) {
        super(options);

        if (options == null) {
            return;
        }

        set(options);
    }

    public function set(options:SplineGeometryOptions):Void {
        setPoints(options);
        updateMesh();
        primitive_type = PrimitiveType.triangles;
        immediate = options.immediate;
    }

    public function setPoints(options:SplineGeometryOptions):Void {
        if (options.p0 != null) {
            p0 = options.p0;
        }
        else {
            p0 = new Vector();
        }

        if (options.p1 != null) {
            p1 = options.p1;
        }
        else {
            p1 = new Vector();
        }

        if (options.p2 != null) {
            p2 = options.p2;
        }
        else {
            p2 = new Vector();
        }

        if (options.p3 != null) {
            p3 = options.p3;
        }
        else {
            p3 = new Vector();
        }
    }

    function updateMesh():Void {
        trace("update called");
        vertices.splice(0, vertices.length);
        var length:Float = Vector.Subtract(p1, p0).lengthsq +
                           Vector.Subtract(p2, p1).lengthsq +
                           Vector.Subtract(p3, p2).lengthsq;

        var points:Int = Std.int(length / (DistPerPoint * DistPerPoint)) + MinPoints;

        var point:Vector;
        var tangent:Vector;

        var vertexOne:Vertex;
        var vertexTwo:Vertex;

        var previousVertexOne:Vertex = new Vertex(new Vector());
        var previousVertexTwo:Vertex = new Vertex(new Vector());

        var temp:Float;
        for (i in 0...points + 1) {
            point = getPoint(i / points);
            tangent = getFirstDerivative(i / points);
            tangent.length = lineWidth / 2;

            //Swap coordinates and negate for normal
            temp = tangent.x;
            tangent.x = tangent.y;
            tangent.y = temp;
            tangent.x *= -1;
            vertexOne = new Vertex(Vector.Add(point, tangent));
            //Invert normal to get opposite direction
            tangent.x *= -1;
            tangent.y *= -1;
            vertexTwo = new Vertex(Vector.Add(point, tangent));

            if (i != 0) {
                add(previousVertexOne);
                add(previousVertexTwo);
                add(vertexOne);
                add(previousVertexTwo);
                add(vertexOne);
                add(vertexTwo);
            }

            previousVertexOne = vertexOne;
            previousVertexTwo = vertexTwo;
        }
    }


    function getPoint(t:Float):Vector {
        var one:Float = (1 - t) * (1 - t) * (1 - t);
        var two:Float = 3 * (1 - t) * (1 - t) * t;
        var three:Float = 3 * (1 - t) * t * t;
        var four:Float = t * t * t;

        return new Vector(
            p0.x * one + p1.x * two + p2.x * three + p3.x * four,
            p0.y * one + p1.y * two + p2.y * three + p3.y * four,
            p0.z * one + p1.z * two + p2.z * three + p3.z * four
        );
    }

    function getFirstDerivative(t:Float):Vector {
        var one:Float = 3 * (1 - t) * (1 - t);
        var two:Float = 6 * (1 - t) * t;
        var three:Float = 3 * t * t;

        return new Vector(
            (p1.x - p0.x) * one + (p2.x - p1.x) * two + (p3.x - p2.x) * three,
            (p1.y - p0.y) * one + (p2.y - p1.y) * two + (p3.y - p2.y) * three,
            (p1.z - p0.z) * one + (p2.z - p1.z) * two + (p3.z - p2.z) * three
        );
    }

    function set_p0(v:Vector):Vector {
        if (vertices.length == 0) return p0 = v;
        p0 = v;
        updateMesh();
        return p0;
    }

    function set_p1(v:Vector):Vector {
        if (vertices.length == 0) return p1 = v;
        p1 = v;
        updateMesh();
        return p1;
    }

    function set_p2(v:Vector):Vector {
        if (vertices.length == 0) return p2 = v;
        p2 = v;
        updateMesh();
        return p2;
    }

    function set_p3(v:Vector):Vector {
        if (vertices.length == 0) return p3 = v;
        p3 = v;
        updateMesh();
        return p3;
    }

    function set_lineWidth(v:Float):Float {
        lineWidth = v;
        updateMesh();
        return lineWidth;
    }
}

typedef SplineGeometryOptions = {
    > GeometryOptions,
        /** start point of the spline **/
    @:optional var p0 : Vector;
        /** first control point of the spline **/
    @:optional var p1 : Vector;
        /** second control point of the spline **/
    @:optional var p2 : Vector;
        /** end point of the spline **/
    @:optional var p3 : Vector;
}