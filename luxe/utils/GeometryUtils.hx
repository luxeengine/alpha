package luxe.utils;

import luxe.Vector;

class GeometryUtils {
    @:noCompletion public var luxe:luxe.Core;
    @:noCompletion public function new(_luxe:luxe.Core) {
        luxe = _luxe;
    }

    public function segments_for_smooth_circle( _radius:Float, _smooth:Float = 6 ) {
        return _smooth * Math.sqrt( _radius );
    } //segments_for_smooth_circle

    public function random_point_in_unit_circle() : Vector {
        var t = 2*Math.PI*Math.random();
        var u = Math.random()+Math.random();
        var r = (u > 1.0) ? (2.0 - u) : u;
        return new Vector( Math.cos(t), Math.cos(u) );
    }

    public function point_in_polygon(_point:Vector, _offset:Vector, _verts:Array<Vector> ) : Bool {

        if(_offset == null) _offset = new Vector();
        var c : Bool = false;
        var nvert : Int = _verts.length;
        var j : Int = nvert - 1;

        for(i in 0 ... nvert) {
            
            if ((( (_verts[i].y+_offset.y) > _point.y) != ((_verts[j].y+_offset.y) > _point.y)) &&
               (_point.x < ( (_verts[j].x+_offset.x) - (_verts[i].x+_offset.x)) * (_point.y - (_verts[i].y+_offset.y)) 
                 / ( (_verts[j].y+_offset.y) - (_verts[i].y+_offset.y)) + (_verts[i].x+_offset.x)) ) {
                c = !c;
            }
            
            j = i;
        }

        return c;

    } //point_in_polygon


        //plane_point is a point on the plane (anywhere) , can be 0,0,0 for infinite plane.
    public function intersect_ray_plane( _ray_start:Vector, _ray_dir:Vector, _plane_normal:Vector, _plane_point:Vector ) : Vector {

            //T = [planeNormal•(pointOnPlane - rayOrigin)]/planeNormal•rayDirection;
            //pointInPlane = rayOrigin + (rayDirection * T);

            //for [ ]
        var part1 = _plane_normal.dot( Vector.Subtract(_plane_point, _ray_start) );
        var part2 = _plane_normal.dot( _ray_dir );

        var T = part1 / part2;

        return Vector.Add(_ray_start, Vector.Multiply(_ray_dir, T));

    } //intersect_ray_plane
    

 } //GeometryUtils