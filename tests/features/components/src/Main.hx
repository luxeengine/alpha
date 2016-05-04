
import luxe.Component;
import luxe.Entity;
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;
import luxe.Log.log;


class Main extends luxe.Game {


    public var sprite:Sprite;
    public var sprite2:Sprite;


    override function config(config:luxe.GameConfig) {

        config.preload.textures.push({ id:'assets/dev.png' });

        return config;

    } //config

    override function ready() {

            //game object is a fake class below just for testing
        var go = new FakeGameObject({name:'go'});

            //what we want to test is that more than one layer deep affect the parent transform
        var comp1_comp = new Comp1('comp1', 'Test string 1');

        go.add(comp1_comp);
        comp1_comp.add(new Comp2('comp2', 123));

            //Actual entity classes (Sprite, Camera atm)
        sprite = new Sprite({
            name : 'test_sprite',
            texture:Luxe.resources.texture('assets/dev.png'),
            pos : new Vector(480,320)
        });
            //Actual entity classes (Sprite, Camera atm)
        sprite2 = new Sprite({
            name : 'test_sprite2',
            texture:Luxe.resources.texture('assets/dev.png'),
            pos : new Vector(480,320),
            scale : new Vector(0.5,0.5)
        });

        sprite2.rotation_z = 90;
        sprite2.radians = Math.PI;

        var comp1_comp2 = new Comp1('comp1', 'Test String 2');

            sprite.add(comp1_comp2);

        comp1_comp2.add(new Comp2('comp2', 565));

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
            log(dt);
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
        log('\tgameobject init');
    } //init

    override function onreset() {
        log('\tgameobject reset');
    } //onreset

    override function ondestroy() {
        log('\tgameobject destroyed');
    } //ondestroy

    override function update(dt:Float) {
        if(!oncerun){
            log('\tgameobject first update ' + dt);
            oncerun = true;
        }
    } //update


} //FakeGameObject


class Comp1 extends Component {


    public var oncerun : Bool = false;
    public var init_string : String = '';

    public function new(_name:String, _str:String) {
        super({ name:_name });
        init_string = _str;
    }

    override function init() {
        log('\t\t\t\tcomp1 init with string ' + init_string);
    } //init

    override function onreset() {
        log('\t\t\t\tcomp1 onreset');
    } //onreset

    override function ondestroy() {
        log('\t\t\t\tcomp1 destroyed');
    } //ondestroy

    override function onremoved() {
        log('\t\t\t\tcomp1 onremoved');
    } //onremoved

    override function update(dt:Float) {
        if(!oncerun){
            log('\t\tcomp1 first update ' + dt);
            oncerun = true;
        }

    } //update


} //Comp1

class Comp2 extends Component {


    public var dir : Float = 1;
    public var z : Float = 0;
    public var oncerun : Bool = false;
    public var unique_value : Int = 0;

    public function new(_name:String, val:Int) {
        super({ name:_name });
        unique_value = val;
    }

    override function init() {
        log('\t\t\t\tcomp2 init with value ' + unique_value);
    } //init

    override function onreset() {
        log('\t\t\t\tcomp2 onreset');
    } //onreset

    override function ondestroy() {
        log('\t\t\t\tcomp2 ondestroy');
    } //ondestroy

    override function onremoved() {
        log('\t\t\t\tcomp2 onremoved');
    } //onremoved

    override function update(dt:Float) {

        if(!oncerun){
            log('\t\t\tcomp2 first update ' + dt);
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


} //Comp2
