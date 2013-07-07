package lab.utils;

import lab.Vector;

class GeometryUtils {
    public var lab:lab.Core;
    public function new(_lab:lab.Core) {
        lab = _lab;
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

 }