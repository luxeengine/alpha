
import lab.Vector;
import lab.Input;
import phoenix.BitmapFont;

import lab.Modes;

import modes.Menu;
import modes.Base;

class Main extends lab.Game {


    public var font : BitmapFont;
    public var modes : Modes;
    public var menu : Menu;
    public var base : Base;

    public var mouse : Vector;

    public function ready() {

        mouse = new Vector();
        font = new BitmapFont();
        font.load_from_string( Lab.loadText('assets/fonts/osb.fnt'), 'assets/fonts/' );

        modes = new Modes();
        menu = modes.add_mode(Menu, 'menu');
        base = modes.add_mode(Base, 'base');        

        menu.game = base.game = this;

            //create the modes
        modes.init();

            //set to the menu
        modes.set('menu');

    } //ready
  
    public function onkeyup(e) {
        modes.onkeyup(e);
    } //onkeyup

    public function onkeydown(e) {
        modes.onkeydown(e);
    } //onkeydown
    public function onmousedown(e) {
        mouse.set(e.x,e.y);
        modes.onmousedown(e);
    } //onkeydown    
    public function onmousemove(e) {
        mouse.set(e.x,e.y);
        modes.onmousemove(e);
    } //onkeydown
    public function onmouseup(e) {
        mouse.set(e.x,e.y);
        modes.onmouseup(e);
    } //onkeydown

    public function update(dt:Float) {
        modes.update(dt);
    } //update

    public function shutdown() {
        modes.destroy();
    } //shutdown
}


