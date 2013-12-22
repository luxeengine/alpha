package luxe.collision.shapes;
    
import luxe.collision.math.Matrix;
import luxe.collision.math.Vector2D;

class Shape {
    
    private var _position : Vector2D;
    private var _rotation : Float = 0;

    private var _scaleX : Float = 1;
    private var _scaleY : Float = 1;

    private var _transformed : Bool = false;
    private var _transformMatrix : Matrix;

    private var _transformedVertices : Array<Vector2D>;
    private var _vertices : Array<Vector2D>;

    public var name : String = 'shape';
    public var data : Dynamic;

//Constructor

    public function new( _x:Float, _y:Float ) {

        _position = new Vector2D(_x,_y);
        _rotation = 0;

        _scaleX = 1;
        _scaleY = 1;

        _transformMatrix = new Matrix();
        _transformMatrix.tx = _position.x;
        _transformMatrix.ty = _position.y;

        _transformedVertices = new Array<Vector2D>();
        _vertices = new Array<Vector2D>();
    }

//Getters/Setters
    
    public var position( get_position, set_position ) : Vector2D;
    public var x( get_x, set_x ) : Float;
    public var y( get_y, set_y ) : Float;

    public var rotation( get_rotation, set_rotation ) : Float;

    public var scaleX( get_scaleX, set_scaleX ) : Float;
    public var scaleY( get_scaleY, set_scaleY ) : Float;

    public var transformedVertices( get_transformedVertices, never ) : Array<Vector2D>;
    public var vertices( get_vertices, never ) : Array<Vector2D>;

//.position

    private function get_position() : Vector2D {
        return _position;
    }

    private function set_position( v : Vector2D ) : Vector2D {
        _transformMatrix.tx = v.x;
        _transformMatrix.ty = v.y;
        _position = v;
        _transformed = false;
        return _position;
    }

//.x 

    private function get_x() : Float {
        return _position.x;
    }
    
    private function set_x(x : Float) : Float {
        _position.x = x;
        _transformMatrix.tx = x;
        _transformed = false;
        return _position.x;
    }
    
//.y

    private function get_y() : Float {
        return _position.y;
    }
    
    private function set_y(y : Float) : Float {
        _position.y = y;
        _transformMatrix.ty = y;
        _transformed = false;
        return _position.y;
    }    

//.rotation 

    private function get_rotation() : Float {
        return _rotation;
    }

    private function set_rotation( v : Float ) : Float {
        _transformMatrix.rotate( (v - _rotation) * Math.PI / 180 );
        _rotation = v;
        _transformed = false;
       return _rotation;
    }

//.scaleX 

    private function get_scaleX():Float {
        return _scaleX;
    }
    
    private function set_scaleX( scale : Float ) : Float {
        _scaleX = scale;
        _transformMatrix.scale( _scaleX, _scaleY );
        _transformed = false;
        return _scaleX;
    }

//.scaleY

    private function get_scaleY():Float {
        return _scaleY;
    }
    
    private function set_scaleY(scale:Float) : Float {
        _scaleY = scale;
        _transformMatrix.scale( _scaleX, _scaleY );
        _transformed = false;
        return _scaleY;
    }    

//.transformedVertices

    private function get_transformedVertices() : Array<Vector2D> {

        if(!_transformed) {
            _transformedVertices = new Array<Vector2D>();
            _transformed = true;

            var _count : Int = _vertices.length;

            for(i in 0..._count) {
                _transformedVertices.push( _vertices[i].transform( _transformMatrix ) );
            }
        }

        return _transformedVertices;
    }

//.vertices 

    private function get_vertices() : Array<Vector2D> {
        return _vertices;
    }

//Public Methods 

    public function destroy():Void {
        _position = null;
    }
	
}
