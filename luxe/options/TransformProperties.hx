package luxe.options;

import phoenix.Vector;
import phoenix.Quaternion;

typedef TransformProperties = {

        /** the transform position */
    @:optional var pos : Vector;
        /** the transform rotation */
    @:optional var rotation : Quaternion;
        /** the transform scale */
    @:optional var scale : Vector;
        /** the transform origin */
    @:optional var origin : Vector;

} //TransformProperties
