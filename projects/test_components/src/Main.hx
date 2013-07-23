
import lab.Entity;
import lab.Vector;
import lab.Input;
import lab.Sprite;


    /*
        Things we want to test in components         

        1) components having parents successfully bootstraps the children functions (init, destroy, start, update)
        2) components having a root transform aliases to the parent transform (pos,rotation,scale affect the root entity, not the child)
        3) nested components affect the root transform as well  : see Child2 class changes rotation, pos and scale on the root sprite but its a child1 child
        4) The default scene propogates events properly (Sprite will add itself)
        5) fetching and referencing component functions from other classes and locally
        6) todo ; A non dynamic (as in the type, .get() returns a Dynamic you could cast but it calls blindly )
            what would be better is probably accessing through something similar to SendMessage (like  get('component').call('hello', args) ), i guess profiling is needed to test
            but also add() returns the instance, so cacheing and calling functions directly is possible anyway.
    */


class Main extends lab.Game {

    public var sprite:Sprite;
    public function ready() {

            //game object is a fake class below just for testing
        var go = new GameObject();
        var child1 = go.add(Child1,'child1');
        var child2 = child1.add(Child2,'child2');

            //Actual entity classes (Sprite, Camera atm)
        sprite = new Sprite({
            name : 'test_sprite',
            texture:Lab.loadTexture('assets/dev.png'),
            pos : new Vector(480,320)
        });
        
        var child1 = sprite.add(Child1,'child1');
        var child2 = child1.add(Child2,'child2');

        Lab.camera.add(RandomCameraShaker,'shaker');        

    } //ready
  
    public function onmousemove(e) {
        var m = new Vector(e.x,e.y);        
        sprite.pos = m;
    }

    private var spam = false;

    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Lab.shutdown();
      } 

      if(e.value == Input.Keys.space) {
        spam = !spam;
      }
    } //onkeyup

    public function update(dt:Float) {
        if(spam) trace(dt);
    } //update

    public function shutdown() {

    } //shutdown
}

class RandomCameraShaker extends Entity {
    public var amount : Float = 20;
    private var next_shake : Float = 0;
    public function init() {
        set_shake();
    }
    public function shake() {
        Lab.camera.shake(amount);
    }

    private function set_shake() {
        next_shake = haxe.Timer.stamp() + (2+(Math.random()*3));   
    }
    public function update(dt:Float) {
        if(next_shake < haxe.Timer.stamp()) {
            Lab.camera.shake(4);
            set_shake();
        }        
    }
}


class GameObject extends Entity {
    public var oncerun : Bool = false;
    public function new() {
        super();
        name = 'go';

            //add to the default scene
        Lab.scene.add(this);
    }

    public function init() {
        trace('\tgameobject init');
    }
    public function start() {
        trace('\tgameobject start');
    }
    public function destroy() {
        trace('\tgameobject destroy');
    }
    public function update(dt:Float) {
        if(!oncerun){
            trace('\tgameobject first update ' + dt);
            oncerun = true;
        }
    }
}


class Child1 extends Entity {    

    public var oncerun : Bool = false;
    public function init() {
        trace('\t\tchild1 init');
    }
    public function start() {
        trace('\t\tchild1 start');
    }
    public function destroy() {
        trace('\t\tchild1 destroy');
    }
    public function update(dt:Float) {
        if(!oncerun){
            trace('\t\tchild1 first update ' + dt);
            oncerun = true;
        }

    }
} //Child1

class Child2 extends Entity {

    public var dir : Float = 1;
    
    public var oncerun : Bool = false;
    public function init() {
        trace('\t\t\tchild2 init');
    }
    public function start() {
        trace('\t\t\tchild2 start');
    }
    public function destroy() {
        trace('\t\t\tchild2 destroy');
    }
    public function update(dt:Float) {
        if(!oncerun){
            trace('\t\t\tchild2 first update ' + dt);
            oncerun = true;
        }        

        rotation += 25*dt;
        pos.x += 300*dir*dt;
        var swap = false;
        if(pos.x > Lab.screen.w) {
            pos.x = Lab.screen.w;
            swap = true;
        } else
        if(pos.x < 0) {
            pos.x = 0;
            swap = true;
        }     

        if(swap) {
            dir = -dir;            
            var ns = 1+(Math.random());
            scale = new Vector(ns,ns);
            Lab.camera.get('shaker').amount = 1+9*Math.random();
            Lab.camera.get('shaker').shake();
        }
    }
} //Child2


