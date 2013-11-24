
import luxe.Color;
import luxe.Sprite;
import luxe.Vector;
import luxe.Input;
import phoenix.BitmapFont;

import luxe.Modes;

import modes.Menu;
import modes.Base;

import luxe.tween.Actuate;


class Main extends luxe.Game {

    public var font : BitmapFont;
    public var modes : Modes;
    public var menu : Menu;
    public var base : Base;
    public var fade : Sprite;

    public var mouse : Vector;

    public function ready() {

        mouse = new Vector();
        font = new BitmapFont();
        fade = new Sprite({
            centered : false,
            size : new Vector(Luxe.screen.w, Luxe.screen.h),
            color : new Color(0,0,0,0).rgb(0xf6f6f6),
            depth : 100,
        });

        font.load_from_string( Luxe.loadText('assets/fonts/osb.fnt'), 'assets/fonts/' );

        modes = new Modes();
        menu = modes.add_mode(Menu, 'menu');
        base = modes.add_mode(Base, 'base');

        menu.game = base.game = this;

        #if luxe_native
            trace('disabling GC');
            // cpp.vm.Gc.enable(false);
        #end

            //create the modes
        modes.init();

            //set to the menu
        modes.set('menu');

    } //ready

    public function fade_in(?time=1,?delay=0.0,?complete){
        Actuate.tween(fade.color, time, {a:0}).onComplete(complete).delay(delay);
    }

    public function fade_out(?time=1,?delay=0.0,?complete){
        Actuate.tween(fade.color, time, {a:1}).onComplete(complete).delay(delay);
    }

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
    public function ontouchmove(e:TouchEvent) {
        modes.ontouchmove(e);
    } //ontouchmove
    public function ontouchbegin(e:TouchEvent) {
        modes.ontouchbegin(e);
    } //ontouchmove
    public function ontouchend(e:TouchEvent) {
        modes.ontouchend(e);
    } //ontouchmove

    public function update(dt:Float) {
        modes.update(dt);
    } //update

    public function shutdown() {
        modes.destroy();
    } //shutdown
}


