
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
        var child1_comp = new Child1('child1', 'Test string 1');

        go.add(child1_comp);
        child1_comp.add(new Child2('child2', 123));

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

        var child1_comp2 = new Child1('child1', 'Test String 2');

            sprite.add(child1_comp2);

        child1_comp2.add(new Child2('child2', 565));

            //default camera is an entity, so give it a component!
        Luxe.camera.add(new RandomCameraShaker({'name': 'shaker'}));

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

    override function onreset() {
        trace('\tgameobject reset');
    } //onreset

    override function ondestroy() {
        trace('\tgameobject destroyed');
    } //ondestroy

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

    public function new(_name:String, _str:String) {
        super({ name:_name });
        init_string = _str;
    }

    override function init() {
        trace('\t\tchild1 init with string ' + init_string);
    } //init

    override function onreset() {
        trace('\t\tchild1 onreset');
    } //onreset

    override function ondestroy() {
        trace('\t\tchild1 destroyed');
    } //ondestroy

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

    public function new(_name:String, val:Int) {
        super({ name:_name });
        unique_value = val;
    }

    override function init() {
        trace('\t\t\tchild2 init with value ' + unique_value);
    } //init

    override function onreset() {
        trace('\t\t\tchild2 onreset');
    } //onreset

    override function ondestroy() {
        trace('\t\t\tchild2 ondestroy');
    } //ondestroy

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
