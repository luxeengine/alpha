
import luxe.Input;
import luxe.Vector;
import luxe.Quaternion;
import luxe.Transform;
import luxe.Color;

import phoenix.geometry.Geometry;

class Transforms { 


    @:isVar public var transform    (get,set) : Transform;

    public var pos                  (get,set) : Vector;
    public var pos_world            (get,set) : Vector;
    public var rotation             (get,set) : Quaternion;
    public var rotation_world       (get,set) : Quaternion;
    public var rotation_euler       (get,set) : Vector;
    public var rotation_euler_world (get,set) : Vector;
    public var scale                (get,set) : Vector;
    public var scale_world          (get,set) : Vector;


    public function new() {

        transform = new Transform();

            //pos
        transform.pos_changed = trans_pos_changed;
        // transform.pos_world_changed = trans_pos_world_changed;
            //rotation        
        transform.rotation_changed = trans_rotation_changed;
        transform.rotation_euler_changed = trans_rotation_euler_changed;
        // transform.rotation_world_changed = trans_rotation_world_changed;
        // transform.rotation_euler_world_changed = trans_rotation_euler_world_changed;
            //scale
        transform.scale_changed = trans_scale_changed;
        // transform.scale_world_changed = trans_scale_world_changed;

    } //new

    function get_transform() : Transform {

        return transform;

    } //get_transform

    function set_transform(t:Transform) {

        return transform = t;

    } //set_transform

    function set_pos(_p:Vector) : Vector { 
        
        return transform.pos = _p;

    } //set_pos

    function set_rotation_euler( _r:Vector ) : Vector { 

        return transform.rotation_euler = _r;

    } //set_rotation_euler

    function set_rotation( _r:Quaternion ) : Quaternion { 

        return transform.rotation = _r;

    } //set_rotation

    function set_scale( _s:Vector ) : Vector { 

        return transform.scale = _s;

    } //set_scale

    function set_pos_world( _p:Vector ) : Vector {

        return transform.pos_world = _p;

    } //set_pos_world

    function set_scale_world( _s:Vector ) : Vector {

        return transform.scale_world = _s;

    } //set_scale_world

    function set_rotation_world( _q:Quaternion ) : Quaternion {

        return transform.rotation_world = _q;

    } //set_rotation_world

    function set_rotation_euler_world( _r:Vector ) : Vector {

        return transform.rotation_euler_world = _r;

    } //set_rotation_euler_world

    function get_pos() {

        return transform.pos;

    } //get_pos

    function get_pos_world() {

        return transform.pos_world;

    } //get_pos_world

    function get_rotation_euler() {

        return transform.rotation_euler;

    } //get_rotation_euler

    function get_rotation() {

        return transform.rotation;

    } //get_rotation

    function get_rotation_world() {

        return transform.rotation_world;

    } //get_rotation_world

    function get_rotation_euler_world() {

        return transform.rotation_euler_world;

    } //get_rotation_euler_world

    function get_scale() {

        return transform.scale;

    } //get_scale

    function get_scale_world() {

        return transform.scale_world;

    } //get_scale_world


        //pos
    function trans_pos_changed(_p:Vector) {}
    function trans_pos_world_changed(_p:Vector) {}
        //rotation
    function trans_rotation_changed(_r:Quaternion) {}
    function trans_rotation_euler_changed(_r:Vector) {}
    function trans_rotation_world_changed(_r:Quaternion) {}    
    function trans_rotation_euler_world_changed(_r:Vector) {}
        //scale
    function trans_scale_changed(_p:Vector) {}
    function trans_scale_world_changed(_p:Vector) {}


} //Transforms

class ST extends Transforms {
    

    public var geometry : Geometry;


    public function new() {

        super();

        geometry = Luxe.draw.rectangle({
            x : 0,
            y : 0,
            w : 10,
            h : 10,
            color : new Color().rgb(0xff403b)
        });

        geometry.origin = new Vector(5,5);

    } //new

    override function set_transform(t:Transform) : Transform {
        
        if(geometry == null) return transform = t;

            geometry.transform = t;
        
        return geometry.transform;

    } //set_transform

    override function get_transform() : Transform {
            
        if(geometry == null) return transform;

        return geometry.transform;

    } //get_transform

} //Transforms

// entity : has a transform
// camera : has a transform
// 

class Main extends luxe.Game {

    var st : ST;
    var st2 : ST;

    public function ready() {

        st = new ST();
        st2 = new ST();

        st2.pos = new Vector(50,50);
        st2.transform.parent = st.transform;

    } //ready

    public function onmousemove( e:MouseEvent ) {
        if(st != null) {
            st.pos = e.pos;
        }
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    var r:Float = 0;
    
    public function update( dt:Float ) {

        if(st != null) {
            r  += 2 * dt;
            st.rotation = new Quaternion().setFromEuler( new Vector(0,0,r) );
        }

    } //update


} //Main
