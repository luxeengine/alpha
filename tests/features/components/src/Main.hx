
import luxe.Component;
import luxe.Entity;
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;


class Main extends luxe.Game {


    public var sprite:Sprite;
    public var sprite2:Sprite;


    override function ready() {

            //game object is a fake class below just for testing
        var go = new FakeGameObject({name:'go'});

            //what we want to test is that more than one layer deep affect the parent transform
        var child1_comp = new Child1();
            child1_comp.init_string = 'Test String';

        go.add('child1', child1_comp);
        child1_comp.add('child2', new Child2(123));

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

            var child1_comp2 = new Child1();
                child1_comp2.init_string = 'Test String 2';

        sprite.add('child1', child1_comp2);

        child1_comp2.add('child2', new Child2(565));

            //default camera is an entity, so give it a component!
        Luxe.camera.add('shaker', new RandomCameraShaker());

    } //ready

    override function onmousemove( e:MouseEvent ) {

        sprite.pos = e.pos;

    } //onmousemove

    private var spam = false;

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        if(e.keycode == Key.key_a) {
            sprite.active = !sprite.active;
        }

        if(e.keycode == Key.key_t) {
            spam = !spam;
        }

    } //onkeyup

    override function update(dt:Float) {

        if(spam) {
            trace(dt);
        }

    } //update

} //Main

class RandomCameraShaker extends Component {


    public var amount : Float = 20;
    private var next_shake : Float = 0;


    override function init() {
        set_shake();
    } //init

    public function shake() {
        Luxe.camera.shake(amount);
    } //shake

    function set_shake() {
        next_shake = Luxe.time + (5+(Math.random()*5));
    } //set_shake

    override function onkeyup(e:KeyEvent) {
        if(e.keycode == Key.space) {
            shake();
        }
    }

    override function update(dt:Float) {
        if(next_shake < Luxe.time) {
            Luxe.camera.shake(4);
            set_shake();
        }
    } //update


} //RandomCameraShaker


class FakeGameObject extends Entity {


    public var oncerun : Bool = false;


    override function init() {
        trace('\tgameobject init');
    } //init

    override function reset() {
        trace('\tgameobject reset');
    } //reset

    override function destroyed() {
        trace('\tgameobject destroyed');
    } //destroyed

    override function update(dt:Float) {
        if(!oncerun){
            trace('\tgameobject first update ' + dt);
            oncerun = true;
        }
    } //update


} //FakeGameObject


class Child1 extends Component {


    public var oncerun : Bool = false;
    public var init_string : String = '';

    override function init() {
        trace('\t\tchild1 init with string ' + init_string);
    } //init

    override function reset() {
        trace('\t\tchild1 reset');
    } //reset

    override function destroyed() {
        trace('\t\tchild1 destroyed');
    } //destroyed

    override function update(dt:Float) {
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
    public var unique_value : Int = 0;

    public function new(_value:Int) {
        super();
        unique_value = _value;
    }

    override function init() {
        trace('\t\t\tchild2 init with value ' + unique_value);
    } //init

    override function reset() {
        trace('\t\t\tchild2 reset');
    } //reset

    override function destroyed() {
        trace('\t\t\tchild2 destroyed');
    } //destroyed

    override function update(dt:Float) {

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
