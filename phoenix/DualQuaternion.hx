package phoenix;

import phoenix.Quaternion;
import phoenix.Vector;
import phoenix.Matrix4;

//http://wscg.zcu.cz/wscg2012/short/A29-full.pdf
//Abstracted from Ben Kenwright's paper on A Beginners Guide To Dual Quaternions

class DualQuaternion {
    
    public var real : Quaternion;
    public var dual : Quaternion;

    public var rotation (get,null) : Quaternion;
    public var translation (get,null) : Vector;

        //used for removing need for cloning items
    var _temp:Quaternion;

    public function new() {

        _temp = new Quaternion();

        real = new Quaternion(0,0,0,1);
        dual = new Quaternion(0,0,0,0);

    } //new

    public function set( _real:Quaternion, _dual:Quaternion ) : DualQuaternion {

        real = _real.clone().normalize();
        dual = _dual.clone();

        return this;

    } //set

    public function clone() : DualQuaternion {

        return new DualQuaternion().set(real, dual);

    } //clone

    public function setFromTranslationRotation( _translation:Vector, _rotation:Quaternion ) : DualQuaternion {

        real = _rotation.clone().normalize();
        dual = new Quaternion(_translation.x, _translation.y, _translation.z, 0).multiply( real ).multiplyScalar( 0.5 );

        return this;

    } //set_translation_rotation    

    public function dot( _other:DualQuaternion ) : Float {
        
        return real.dot( _other.real );

    } //dot

    public function normalize() : DualQuaternion {

        var mag:Float = real.dot( real );

            #if debug 
                if( mag < 0.000001 ) {
                    throw "Invalid DualQuaternion for normalization";
                }
            #end

        var factor: Float = 1.0/mag;

            real.multiplyScalar(factor);
            dual.multiplyScalar(factor);

        return this;

    } //normalize

    public function scale( _scale:Float ) : DualQuaternion {
        
        real.multiplyScalar( _scale );
        dual.multiplyScalar( _scale );

        return this;

    } //scale

    public function conjugate() : DualQuaternion {
        
        real.conjugate();
        dual.conjugate();

        return this;

    } //conjugate


    public function multiply( _other : DualQuaternion ) : DualQuaternion {

            //:todo: tidy these clone()s using _temp etc

        var _real:Quaternion = _other.real.clone().multiply(real);
        var _dual = _other.dual.clone().multiply(real).add( _other.real.clone().multiply(dual) );

        real = _real;
        dual = _dual;

        return this;
    }

    function get_rotation() : Quaternion {
        
        return real.clone();

    } //get_rotation

    function get_translation() : Vector {
        
        var t = dual.clone().multiplyScalar(2.0);

            t.multiply( real.clone().conjugate() );

        return new Vector( t.x, t.y, t.z );

    } //get_translation

    public static function ToMatrix( _dq:DualQuaternion ) {

            //normalize first
        var _q = _dq.clone().normalize();

        var M = new Matrix4();

        var w:Float = _q.real.w; 
        var x:Float = _q.real.x; 
        var y:Float = _q.real.y; 
        var z:Float = _q.real.z;

        // Extract rotational information
            M.M11 = w*w + x*x - y*y - z*z; 
            M.M12 = 2*x*y + 2*w*z;
            M.M13 = 2*x*z - 2*w*y;

            M.M21 = 2*x*y - 2*w*z;
            M.M22 = w*w + y*y - x*x - z*z; 
            M.M23 = 2*y*z + 2*w*x;

            M.M31 = 2*x*z + 2*w*y;
            M.M32 = 2*y*z - 2*w*x;
            M.M33 = w*w + z*z - x*x - y*y;

        // Extract translation information
        var t = _q.translation;

            M.M41 = t.x; 
            M.M42 = t.y; 
            M.M43 = t.z; 

        return M;

    } //ToMatrix


    public static function Dot( _a:DualQuaternion, _b:DualQuaternion ) : Float {

        return Quaternion.Dot( _a.real, _b.real );

    } //Dot

    public static function Normalize( _dq:DualQuaternion ) {
        
        return _dq.clone().normalize();

    } //Normalize

    public static function Add( _a:DualQuaternion, _b:DualQuaternion ) {

            //real + real and dual + dual, but + is multiply for quats to concatenate them
        var _real = _a.real.clone().multiply(_b.real);
        var _dual = _a.dual.clone().multiply(_b.dual);

        return new DualQuaternion().set( _real, _dual );

    } //Add

        // Multiplication order - left to right
    public static function Multiply( _a:DualQuaternion, _b:DualQuaternion ) {

            // real = rhs.real * lhs.real 
            // dual = (rhs.dual * lhs.real) + (rhs.real*lhs.dual)
            // :todo: tidy up clone()s and all that here

        var _real:Quaternion = _b.real.clone().multiply(_a.real);

        var _dual = _b.dual.clone().multiply(_a.real).add( _b.real.clone().multiply(_a.dual) );

        return new DualQuaternion().set(_real,_dual);

    } //Multiply

    public static function Conjugate( _q:DualQuaternion ) : DualQuaternion {

        var _d = _q.clone();

        return new DualQuaternion().set( _d.real.conjugate() , _d.dual.conjugate() );

    } //Conjugate

    public static function GetRotation( _q:DualQuaternion ) : Quaternion {

        return _q.real.clone(); 

    }

    public static function GetTranslation( _q:DualQuaternion ) : Vector {
        
        return _q.clone().translation;        

    } //GetTranslation


} //DualQuaternion