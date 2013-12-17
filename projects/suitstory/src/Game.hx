
    //mode management code
import luxe.Color;
import luxe.Vector;
import state.State;
import state.States;

    //the game classes
import luxe.Input;


class Game extends luxe.Game {

    public var states : States;
    
    var mainMenu : menus.Menu;
    var manager : systems.Manager;

    public function ready() {

        Luxe.renderer.clear_color = new Color();
        
        states = new States();
            //menus
        mainMenu = new menus.Menu(this, 'menu');
            //the game manager
        manager = new systems.Manager(this, 'manager');

            //add the states 
            //to the mode manager
        states.add( mainMenu );
        states.add( manager );

            //start up the menu mode
        mainMenu.init();
            //and set to that mode
        states.set('menu');

    }   

    public function prerender() {
        states.prerender();
    }
 
    public function onkeydown(e) {
        states.keydown(e);
    }
    public function onkeyup(e) {
        states.keyup(e);
    }

    public function onmousedown(e : MouseEvent) {
        states.mousedown(e);
    }   

    public function onmousemove(e : MouseEvent) {
        states.mousemove(e);
    }

    public function onmouseup(e : MouseEvent) {
        states.mouseup(e);
    }

    public function update(dt:Float) {
        states.update(dt);
    }

    public function shutdown() {

    }

}


