package hxcollision.math ;

    import nme.display.Graphics;
    import nme.geom.Matrix;
    import nme.geom.Point;
    
    /**
     * 2D vector class
     */
    class Vector2D {
        
        private var _x:Float;
        private var _y:Float;
        
        /**
         * Constructor
         */
        public function new(x:Float = 0, y:Float = 0) {
            _x = x;
            _y = y;
        }

        public var x( get_x, set_x ) : Float;
        public var y( get_y, set_y ) : Float;
        public var angle( get_angle, set_angle ) : Float;
        public var length( get_length, set_length ) : Float;
        public var lengthSquared( get_lengthSquared, never ) : Float;
        public var perpendicular( get_perpendicular, never ) : Vector2D;
        
        /**
         * Creates an exact copy of this Vector2D
         * @return Vector2D A copy of this Vector2D
         */
        public function cloneVector():Vector2D {
            return new Vector2D(x, y);
        }
        
        /**
         *  Transforms Vector2D based on the given Matrix
         * @param matrix The matrix to use to transform this vector.
         * @return Vector2D returns a new, transformed Vector2D.
         */
        public function transform(matrix:Matrix):Vector2D {
            var v:Vector2D = cloneVector();
            v.x = _x*matrix.a + _y*matrix.c + matrix.tx;
            v.y = _x*matrix.b + _y*matrix.d + matrix.ty;
            return v;
        }
        
        /**
         * Makes x and y zero.
         * @return Vector2D This vector.
         */
        public function zeroVector():Vector2D {
            _x = 0;
            _y = 0;
            return this;
        }
        
        /**
         * Is this vector zeroed?
         * @return Bool Returns true if zeroed, else returns false.
         */
        public function isZero():Bool {
            return _x == 0 && _y == 0;
        }
        
        /**
         * Is the vector's length = 1?
         * @return Bool If length is 1, true, else false.
         */
        public function isNormalized():Bool {
            return length == 1.0;
        }
        
        /**
         * Does this vector have the same location as another?
         * @param vector2 The vector to test.
         * @return Bool True if equal, false if not.
         */
        public function equals(vector2:Vector2D):Bool {
            return _x == vector2.x && _y == vector2.y;
        }
        
        /**
         * Sets the length which will change x and y, but not the angle.
         */
        public function set_length(value:Float):Float {
            var _angle:Float = angle;
            _x = Math.cos(_angle) * value;
            _y = Math.sin(_angle) * value;
            if(Math.abs(_x) < 0.00000001) _x = 0;
            if(Math.abs(_y) < 0.00000001) _y = 0;
            return value;
        }
        /**
         * Returns the length of the vector.
         **/
        private function get_length():Float {
            return Math.sqrt(lengthSquared);
        }
        
        /**
         * Returns the length of this vector, before square root. Allows for a faster check.
         */
        private function get_lengthSquared():Float {
            return _x * _x + _y * _y;
        }
        
        /**
         * Changes the angle of the vector. X and Y will change, length stays the same.
         */
        private function set_angle(value:Float):Float {
            var len:Float = length;
            _x = Math.cos(value) * len;
            _y = Math.sin(value) * len;
            return value;
        }
        /**
         * Get the angle of this vector.
         **/
        private function get_angle():Float {
            return Math.atan2(_y, _x);
        }
        
        /**
         * Sets the vector's length to 1.
         * @return Vector2D This vector.
         */
        public function normalize():Vector2D {
            if(length == 0){
                _x = 1;
                return this;
            }
            var len:Float = length;
            _x /= len;
            _y /= len;
            return this;
        }
        
        /**
         * Sets the vector's length to len.
         * @param len The length to set it to.
         * @return Vector2D This vector.
         */
        public function normalcate(len:Float):Vector2D {
            length = len;
            return this;
        }
        
        /**
         * Sets the length under the given value. Nothing is done if the vector is already shorter.
         * @param max The max length this vector can be.
         * @return Vector2D This vector.
         */
        public function truncate(max:Float):Vector2D {
            length = Math.min(max, length);
            return this;
        }
        
        /**
         * Makes the vector face the opposite way.
         * @return Vector2D This vector.
         */
        public function reverse():Vector2D {
            _x = -_x;
            _y = -_y;
            return this;
        }
        
        /**
         * Calculate the dot product of this vector and another.
         * @param vector2 Another vector2D.
         * @return Float The dot product.
         */
        public function dotProduct( vector2:Vector2D ):Float {
            return _x * vector2.x + _y * vector2.y;
        }
        
        /**
         * Calculate the cross product of this and another vector.
         * @param vector2 Another Vector2D.
         * @return Float The cross product.
         */
        public function crossProd(vector2:Vector2D):Float {
            return _x * vector2.y - _y * vector2.x;
        }
        
        /**
         * Calculate angle between any two vectors.
         * @param vector1 First vector2d.
         * @param vector2 Second vector2d.
         * @return Float Angle between vectors.
         */
        public static function angleBetween(vector1:Vector2D, vector2:Vector2D):Float {
            if(!vector1.isNormalized()) vector1 = vector1.cloneVector().normalize();
            if(!vector2.isNormalized()) vector2 = vector2.cloneVector().normalize();
            return Math.acos(vector1.dotProduct(vector2));
        }
        
        /**
         * Is the vector to the right or left of this one?
         * @param vector2 The vector to test.
         * @return Bool If left, returns true, if right, false.
         */
        public function sign(vector2:Vector2D) : Int {
            return perpendicular.dotProduct(vector2) < 0 ? -1 : 1;
        }
        
        /**
         * Get the vector that is perpendicular.
         * @return Vector2D The perpendicular vector.
         */
        private function get_perpendicular():Vector2D {
            return new Vector2D(-y, x);
        }
        
        /**
         * Calculate between two vectors.
         * @param vector2 The vector to find distance.
         * @return Float The distance.
         */
        public function distance(vector2:Vector2D):Float {
            return Math.sqrt(distSQ(vector2));
        }
        
        /**
         * Calculate squared distance between vectors. Faster than distance.
         * @param vector2 The other vector.
         * @return Float The squared distance between the vectors.
         */
        public function distSQ(vector2:Vector2D):Float {
            var dx:Float = vector2.x - x;
            var dy:Float = vector2.y - y;
            return dx * dx + dy * dy;
        }
        
        /**
         * Add a vector to this vector.
         * @param vector2 The vector to add to this one.
         * @return Vector2D This vector.
         */
        public function add(vector2:Vector2D):Vector2D {
            _x += vector2.x;
            _y += vector2.y;
            return this;
        }
        
        /**
         * Subtract a vector from this one.
         * @param vector2 The vector to subtract.
         * @return Vector2D This vector.
         */
        public function subtract(vector2:Vector2D):Vector2D {
            _x -= vector2.x;
            _y -= vector2.y;
            return this;
        }
        
        /**
         * Mutiplies this vector by another one.
         * @param scalar The scalar to multiply by.
         * @return Vector2D This vector, multiplied.
         */
        public function multiply(scalar:Float):Vector2D {
            _x *= scalar;
            _y *= scalar;
            return this;
        }
        
        /**
         * Divide this vector by a scalar.
         * @param scalar The scalar to divide by.
         * @return Vector2D This vector.
         */
        public function divide(scalar:Float):Vector2D {
            _x /= scalar;
            _y /= scalar;
            return this;
        }
        
        /**
         * Set and get y component.
         */
        private function set_y(value:Float) : Float {
            _y = value;
            return _y;
        }
        private function get_y() : Float {
            return _y;
        }
        
        /**
         * Set and get x component.
         */
        private function set_x(value:Float) : Float {
            _x = value;
            return _x;
        }
        private function get_x():Float {
            return _x;
        }
        
        /**
         * Create a vector2D from a string
         * @param string The string to turn into a vector. Must be in the toString format.
         * @return Vector2D The vector from the string.
         **/
        public function fromString(string:String):Vector2D {
            var vector:Vector2D = new Vector2D();
            var tx:Float;
            var ty:Float;
            tx = Std.parseInt(string.substr(string.indexOf("x:"),string.indexOf(",")));
            ty = Std.parseInt(string.substr(string.indexOf("y:")));
            vector.x = tx;
            vector.y = ty;
            return vector;
        }
        
        /**
         * Turn this vector into a string.
         * @return String This vector in string form.
         */
        public function toString():String {
            return "Vector2D x:" + _x + ", y:" + _y;
        }
        
        
        /**
         * Draw vector, good to see where its pointing.
         * @param graphicsForDrawing The graphics to draw the vector.
         * @param drawingColor The color to draw the vector in.
         */
        public function drawVector(graphicsForDrawing:Graphics, drawingColor:Int = 0x00FF00, start:Vector2D=null):Void {
            graphicsForDrawing.lineStyle(0, drawingColor);
            if(start != null) graphicsForDrawing.moveTo(start.x,start.y);
            else if(start == null) graphicsForDrawing.moveTo(0,0);
            if(start != null){
                graphicsForDrawing.lineTo(_x+start.x, _y+start.y);
            }
            else graphicsForDrawing.lineTo(_x, _y);
        }
        
    }
