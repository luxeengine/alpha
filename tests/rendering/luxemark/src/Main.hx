
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;

class Item {


    public var sprite : Sprite;
    public var dirx : Int = 1;
    public var diry : Int = 1;
    public var rotate : Int = 5;


    public function new(t:Texture) {
        if(Math.floor(Math.random()*2) == 1) { dirx = -1; }
        if(Math.floor(Math.random()*2) == 1) { diry = -1; }
        rotate = 4 - (2 + Math.round(Math.random()*6));
        var s = Math.random();
        sprite = new Sprite({
            texture:t,
            no_scene : true,
            pos : new Vector(Math.random()*Luxe.screen.w,Math.random()*Luxe.screen.h),
            color : new Color(Math.random(),Math.random(),Math.random(),1),
            rotation_z : Math.random() * 360,
            size : new Vector(26, 37)
        });
    } //new

} //Item

class Main extends luxe.Game {

    var num : Int = 200;

    var list : Array<Item>;
    var list2 : Array<Item>;
    var list3 : Array<Item>;
    var list4 : Array<Item>;

    var tex : Texture;
    var speed : Int = 2;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/luxe.png' });

        return config;

    } //config

    override function ready() {

        list = [];
        list2 = [];
        list3 = [];
        list4 = [];

        tex = Luxe.resources.texture('assets/luxe.png');

        for(i in 0 ... num) {
            list.push(new Item(tex));
        }
        for(i in 0 ... num) {
            list2.push(new Item(tex));
        }
        for(i in 0 ... num) {
            list3.push(new Item(tex));
        }
        for(i in 0 ... num) {
            list4.push(new Item(tex));
        }

        #if (luxe_native && luxemark_threads)
            cpp.vm.Thread.create(_update);
            cpp.vm.Thread.create(_update2);
            cpp.vm.Thread.create(_update3);
            cpp.vm.Thread.create(_update4);
        #end

    } //ready

    override function update( dt:Float ) {
        #if (!luxemark_threads)
            _update();
            _update2();
            _update3();
            _update4();
        #end
    } //update

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    var continued : Bool = true;
    public function _update() {
        #if (luxe_native && luxemark_threads) while(continued) { #end
            for(i in 0 ... num) {
                var _i:Item = list[i];
                _i.sprite.pos.x += _i.dirx * speed;
                _i.sprite.pos.y += _i.diry * speed;
                _i.sprite.rotation_z += _i.rotate;
                if(_i.sprite.pos.x >= Luxe.screen.w) _i.dirx = -1;
                if(_i.sprite.pos.x <= 0) _i.dirx = 1;
                if(_i.sprite.pos.y >= Luxe.screen.h) _i.diry = -1;
                if(_i.sprite.pos.y <= 0) _i.diry = 1;
            }
            #if (luxe_native && luxemark_threads) Sys.sleep(0.016); #end
       #if (luxe_native && luxemark_threads) } #end
    } //_update

    var continued2 : Bool = true;
    public function _update2() {
        #if (luxe_native && luxemark_threads) while(continued2) { #end
            for(i in 0 ... num) {
                var _i:Item = list2[i];
                _i.sprite.pos.x += _i.dirx * speed;
                _i.sprite.pos.y += _i.diry * speed;
                _i.sprite.rotation_z += _i.rotate;
                if(_i.sprite.pos.x >= Luxe.screen.w) _i.dirx = -1;
                if(_i.sprite.pos.x <= 0) _i.dirx = 1;
                if(_i.sprite.pos.y >= Luxe.screen.h) _i.diry = -1;
                if(_i.sprite.pos.y <= 0) _i.diry = 1;
            }
            #if (luxe_native && luxemark_threads) Sys.sleep(0.016); #end
        #if (luxe_native && luxemark_threads) } #end
    } //_update2

    var continued3 : Bool = true;
    public function _update3() {
        #if (luxe_native && luxemark_threads) while(continued3) { #end
            for(i in 0 ... num) {
                var _i:Item = list3[i];
                _i.sprite.pos.x += _i.dirx * speed;
                _i.sprite.pos.y += _i.diry * speed;
                _i.sprite.rotation_z += _i.rotate;
                if(_i.sprite.pos.x >= Luxe.screen.w) _i.dirx = -1;
                if(_i.sprite.pos.x <= 0) _i.dirx = 1;
                if(_i.sprite.pos.y >= Luxe.screen.h) _i.diry = -1;
                if(_i.sprite.pos.y <= 0) _i.diry = 1;
            }
            #if (luxe_native && luxemark_threads) Sys.sleep(0.016); #end
        #if (luxe_native && luxemark_threads) } #end
    } //_update3

    var continued4 : Bool = true;
    public function _update4() {
        #if (luxe_native && luxemark_threads) while(continued4) { #end
            for(i in 0 ... num) {
                var _i:Item = list4[i];
                _i.sprite.pos.x += _i.dirx * speed;
                _i.sprite.pos.y += _i.diry * speed;
                _i.sprite.rotation_z += _i.rotate;
                if(_i.sprite.pos.x >= Luxe.screen.w) _i.dirx = -1;
                if(_i.sprite.pos.x <= 0) _i.dirx = 1;
                if(_i.sprite.pos.y >= Luxe.screen.h) _i.diry = -1;
                if(_i.sprite.pos.y <= 0) _i.diry = 1;
            }
            #if (luxe_native && luxemark_threads) Sys.sleep(0.016); #end
        #if (luxe_native && luxemark_threads) } #end
    } //_update4


} //Main
