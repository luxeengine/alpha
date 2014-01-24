
import luxe.Color;
import luxe.Sprite;
import luxe.Input;
import luxe.Entity;
import luxe.components.Components.Component;
import luxe.Vector;

//
//  The point of this test is to test the state of a component, like init, reset, remove, destroyed etc
//

class Toggler extends Component {
    var sprite : Sprite;
    public function init() {
        sprite = cast entity;
        trace('init toggler ');
    }
    public function reset() {
        trace('reset toggler');
        sprite.color = new Color().rgb(0xcc0000);
    }
    public function removed() {
        sprite.color = new Color();
        trace('removed toggler');        
    }
}

class Main extends luxe.Game {

    var entity_one : Sprite;
    var toggle_value : Bool = false;

    public function ready() {

        entity_one = new Sprite({
            name : "entity_one",
            size : new Vector(64,64),
            pos : Luxe.screen.mid
        }); 

    } //ready

    function toggle_component( new_value:Bool ) {
        if(new_value) {
            //add component again
            entity_one.add(Toggler, 'toggler');
        } else {
            //remove component again
            trace( 'removed? ' + entity_one.remove('toggler') );
        }
    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.key_A) {
            toggle_value = !toggle_value;
            toggle_component( toggle_value );
        }

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main