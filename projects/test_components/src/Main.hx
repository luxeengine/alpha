
import lab.Entity;
import lab.Vector;
import lab.Input;


    /*Things we want to test in components 
        1) components having parents successfully bootstraps the children functions
        2) components having a root transform aliases as `transform`
    */

class Child2 extends Entity {
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
    }
} //Child2


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
} //Child2

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

class Main extends lab.Game {

    public function ready() {

        var go = new GameObject();
        var child1 = go.add(Child1,'child1');
        var child2 = child1.add(Child2,'child2');
        
    } //ready
  
    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Lab.shutdown();
      } else {
        trace(e);
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


