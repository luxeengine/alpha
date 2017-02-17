package phoenix.geometry;

import luxe.Log.*;
import luxe.options.GeometryOptions;
import phoenix.*;
import phoenix.geometry.*;

class SphereGeometry extends Geometry {

    public function new( _options:SphereGeometryOptions ) {
        
        _options.primitive_type = triangles;
        
        super(_options);
        
        generate_vertices(_options);
        
    }
    
    function generate_vertices(_options:SphereGeometryOptions) {
        
        // https://github.com/glo-js/primitive-sphere/blob/master/primitive-sphere.js
        
        var radius = def(_options.radius, 1);
        var steps = def(_options.steps, 32);

        var z_steps = 2 + steps;
        var y_steps = 2 * z_steps;
        
        var rot_v = new Vector();
        var rot = new Matrix();
        var vec = new Vector();
        
        var verts = [];

        for (z in 0...z_steps + 1) {
            
            var normalized_z = z / z_steps;
            var radians_z = normalized_z * Math.PI;

            for (y in 0...y_steps + 1) {
                
                var normalized_y = y / y_steps;
                var radians_y = normalized_y * Math.PI * 2;
                
                rot_v.set_xyz(0, radians_y, -radians_z);
                rot.identity().makeRotationFromEuler(rot_v, XYZ);
                vec.set_xyz(0, -radius, 0).applyProjection(rot);
                
                var vertex = new Vertex(vec.clone(), _options.color, vec.normalize().clone());
                vertex.uv.uv0.set_uv(normalized_y, 1 - normalized_z);
                verts.push(vertex);
                
            }

            if (z > 0) {
                
                var num_verts = verts.length;
                var i = num_verts - 2 * (y_steps + 1);
                
                while(i + y_steps + 2 < num_verts) {
                    
                    add(verts[i]);
                    add(verts[i + 1]);
                    add(verts[i + y_steps + 1]);
                    
                    add(verts[i + y_steps + 1]);
                    add(verts[i + 1]);
                    add(verts[i + y_steps + 2]);
                    
                    i++;
                    
                }
                
            }
        }
    }
}

typedef SphereGeometryOptions = {
    
    > GeometryOptions,
    
        /** radius */
    @:optional var radius : Float;
        /** a number of steps to draw the sphere */
    @:optional var steps : Int;
    
}