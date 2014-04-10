package luxe.collision.shapes;

import luxe.Quaternion;
import luxe.Vector;
import luxe.Matrix4;

class Shape {
    
    private var _position : Vector;
    private var _scale : Vector;
    private var _rotation : Quaternion;
    private var _rotation_z : Float = 0;

    private var _scaleX : Float = 1;
    private var _scaleY : Float = 1;

    private var _transformed : Bool = false;
    private var _transformMatrix : Matrix4;

    private var _transformedVertices : Array<Vector>;
    private var _vertices : Array<Vector>;

    public var name : String = 'shape';
    public var data : Dynamic;

//Constructor

    public function new( _x:Float, _y:Float ) {

        _position = new Vector(_x,_y);
        _rotation = new Quaternion();
        _scale = new Vector(1,1);

        _scaleX = 1;
        _scaleY = 1;

        _transformMatrix = new Matrix4();
        _transformMatrix.makeTranslation( _position.x, _position.y, 0 );

        _transformedVertices = new Array<Vector>();
        _vertices = new Array<Vector>();
    }

//Getters/Setters
    
    public var position     ( get, set ) : Vector;
    public var x            ( get, set ) : Float;
    public var y            ( get, set ) : Float;
    public var rotation     ( get, set ) : Float;
    public var scaleX       ( get, set ) : Float;
    public var scaleY       ( get, set ) : Float;

    public var transformedVertices  ( get, never ) : Array<Vector>;
    public var vertices             ( get, never ) : Array<Vector>;

    function refresh_transform() {
        _transformMatrix.compose( _position, _rotation, _scale );
        _transformed = false;
    }
//.position

    private function get_position() : Vector {
        return _position;
    }

    private function set_position( v : Vector ) : Vector {
        _position = v;
        refresh_transform();
        return _position;
    }

//.x 

    private function get_x() : Float {
        return _position.x;
    }
    
    private function set_x(x : Float) : Float {
        _position.x = x;
        refresh_transform();
        return _position.x;
    }
    
//.y

    private function get_y() : Float {
        return _position.y;
    }
    
    private function set_y(y : Float) : Float {
        _position.y = y;
        refresh_transform();
        return _position.y;
    }    

//.rotation 

    private function get_rotation() : Float {
        return _rotation_z;
    }

    private function set_rotation( v : Float ) : Float {
        _rotation_z = v;
        
        _rotation.setFromEuler(new Vector(0,0,_rotation_z).toRadians());
        refresh_transform();

       return _rotation_z;
    }

//.scaleX 

    private function get_scaleX():Float {
        return _scaleX;
    }
    
    private function set_scaleX( scale : Float ) : Float {
        _scaleX = scale;
        _scale.x = _scaleX;
        refresh_transform();
        return _scaleX;
    }

//.scaleY

    private function get_scaleY():Float {
        return _scaleY;
    }
    
    private function set_scaleY(scale:Float) : Float {
        _scaleY = scale;
        _scale.y = _scaleY;
        refresh_transform();
        return _scaleY;
    }    

//.transformedVertices

    private function get_transformedVertices() : Array<Vector> {

        if(!_transformed) {

            _transformedVertices = new Array<Vector>();
            _transformed = true;

            var _count : Int = _vertices.length;

            for(i in 0..._count) {
                _transformedVertices.push( _vertices[i].clone().applyMatrix4( _transformMatrix ) );
            }
        }

        return _transformedVertices;
    }

//.vertices 

    private function get_vertices() : Array<Vector> {
        return _vertices;
    }

//Public Methods 

    public function destroy():Void {

        _position = null;
        _rotation = null;
        _scale = null;
        _transformMatrix = null;
        _transformedVertices = null;
        _vertices = null;

    } //destroy
	
}
