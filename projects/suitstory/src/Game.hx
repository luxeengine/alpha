
    //mode management code
import luxe.Color;
import luxe.Vector;
import mode.Mode;
import mode.Modes;

    //the game classes
import luxe.Input;


class Game extends luxe.Game {

    public var modes : Modes;
    
    var mainMenu : menus.Menu;
    var level01 : levels.Level01;

    public function ready() {

        Luxe.renderer.clear_color = new Color();
        
        modes = new Modes();
            //menus
        mainMenu = new menus.Menu(this, 'menu');
            //levels
        level01 = new levels.Level01(this, 'level01');

            //add the modes 
            //to the mode manager
        modes.add(mainMenu);
        modes.add(level01);

            //start up the menu mode
        mainMenu.init();
            //and set to that mode
        modes.set('menu');

    }   

    public function prerender() {
        modes.prerender();
    }
 
    public function onkeydown(e) {
        modes.keydown(e);
    }
    public function onkeyup(e) {
        modes.keyup(e);
    }

    public function onmousedown(e : MouseEvent) {
        modes.mousedown(e);
    }   

    public function onmousemove(e : MouseEvent) {
        modes.mousemove(e);
    }

    public function onmouseup(e : MouseEvent) {
        modes.mouseup(e);
    }

    public function update(dt:Float) {
        modes.update(dt);
    }

    public function shutdown() {

    }

}


