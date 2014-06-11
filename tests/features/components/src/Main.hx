
import luxe.Component;
import luxe.Entity;
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;


    /*
        Things we want to test in components         

        1) components having parents successfully bootstraps the children functions (init, destroyed, reset, update)
        2) components having a root transform aliases to the parent transform (pos,rotation,scale affect the root entity, not the child)
        3) nested components affect the root transform as well  : see Child2 class changes rotation, pos and scale on the root sprite but its a child1 child
        4) The default scene propogates events properly (Sprite will add itself)
        5) fetching and referencing component functions from other classes and locally
        6) todo ; A non dynamic (as in the type, .get() returns a Dynamic you could cast but it calls blindly )
            what would be better is probably accessing through something similar to SendMessage (like  get('component').call('hello', args) ), i guess profiling is needed to test
            but also add() returns the instance, so cacheing and calling functions directly is possible anyway.
    */


class Main extends luxe.Game {


    public var sprite:Sprite;
    public var sprite2:Sprite;


    public function ready() {

            //game object is a fake class below just for testing
        var go = Luxe.scene.create(FakeGameObject, 'go');
        
            //what we want to test is that more than one layer deep affect the parent transform
        var child1 = go.add(Child1,'child1');
        var child2 = child1.add(Child2,'child2');

            //Actual entity classes (Sprite, Camera atm)
        sprite = new Sprite({
            name : 'test_sprite',
            texture:Luxe.loadTexture('assets/dev.png'),
            pos : new Vector(480,320)
        });
            //Actual entity classes (Sprite, Camera atm)
        sprite2 = new Sprite({
            name : 'test_sprite2',
            texture:Luxe.loadTexture('assets/dev.png'),
            pos : new Vector(480,320),
            scale : new Vector(0.5,0.5)
        });

        sprite2.rotation_z = 90;
        sprite2.radians = Math.PI;
        
        var child1 = sprite.add(Child1,'child1', { init_with:'Test string' });
        var child2 = child1.add(Child2,'child2', { init_with:565 });

            //default camera is an entity, so give it a component!
        Luxe.camera.add(RandomCameraShaker,'shaker');        

    } //ready
  
    public function onmousemove( e:MouseEvent ) {

        sprite.pos = e.pos;

    } //onmousemove

    private var spam = false;

    public function onkeyup( e:KeyEvent ) {

        if(e.value == Input.Keys.escape) {
            Luxe.shutdown();
        } 

        if(e.value == Input.Keys.space) {
            spam = !spam;
        }

    } //onkeyup

    public function update(dt:Float) {

        if(spam) {
            trace(dt);
        }

    } //update

    public function destroyed() {

    } //destroyed


} //Main

class RandomCameraShaker extends Component {

    
    public var amount : Float = 20;
    private var next_shake : Float = 0;


    public function init() {
        set_shake();
    } //init

    public function shake() {
        Luxe.camera.shake(amount);
    } //shake

    private function set_shake() {
        next_shake = Luxe.time + (2+(Math.random()*3));   
    } //set_shake

    public function update(dt:Float) {
        if(next_shake < Luxe.time) {
            Luxe.camera.shake(4);
            set_shake();
        }        
    } //update


} //RandomCameraShaker


class FakeGameObject extends Entity {


    public var oncerun : Bool = false;


    public function init() {
        trace('\tgameobject init');
    } //init

    public function reset() {
        trace('\tgameobject reset');
    } //reset

    public function destroyed() {
        trace('\tgameobject destroyed');
    } //destroyed

    public function update(dt:Float) {
        if(!oncerun){
            trace('\tgameobject first update ' + dt);
            oncerun = true;
        }
    } //update


} //FakeGameObject


class Child1 extends Component {    


    public var oncerun : Bool = false;


    public function init( init_string:String ) {
        trace('\t\tchild1 init with string ' + init_string);
    } //init

    public function reset() {
        trace('\t\tchild1 reset');
    } //reset

    public function destroyed() {
        trace('\t\tchild1 destroyed');
    } //destroyed

    public function update(dt:Float) {
        if(!oncerun){
            trace('\t\tchild1 first update ' + dt);
            oncerun = true;
        }

    } //update


} //Child1

class Child2 extends Component {


    public var dir : Float = 1;
    public var z : Float = 0;
    public var oncerun : Bool = false;

    public function init( from_add_value:Int ) {
        trace('\t\t\tchild2 init with value ' + from_add_value);
    } //init

    public function reset() {
        trace('\t\t\tchild2 reset');
    } //reset

    public function destroyed() {
        trace('\t\t\tchild2 destroyed');
    } //destroyed

    public function update(dt:Float) {

        if(!oncerun){
            trace('\t\t\tchild2 first update ' + dt);
            oncerun = true;
        }

        z += 25*dt;
        entity.rotation = entity.rotation.setFromEuler(new Vector(0,0,z).radians());
        entity.pos.x += 300*dir*dt;

        var swap = false;
        if(entity.pos.x > Luxe.screen.w) {
            entity.pos.x = Luxe.screen.w;
            swap = true;
        } else
        if(entity.pos.x < 0) {
            entity.pos.x = 0;
            swap = true;
        }     

        if(swap) {
            dir = -dir;
            var ns = 1+(Math.random());
            entity.scale = new Vector(ns,ns);
            Luxe.camera.get('shaker').shake( 8+9*Math.random() );
        }

    } //update


} //Child2
