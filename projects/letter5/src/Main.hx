
import luxe.Color;
import luxe.Sprite;
import luxe.Vector;
import luxe.Input;
import phoenix.BitmapFont;

import luxe.States;

import states.Menu;
import states.Base;

import luxe.tween.Actuate;


class Main extends luxe.Game {

    public var font : BitmapFont;
    public var states : States;
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

        states = new States();
        menu = states.add_state(Menu, 'menu');
        base = states.add_state(Base, 'base');

        menu.game = base.game = this;

            //create the states
        states.init();

            //set to the menu
        states.set('menu');

    } //ready

    public function fade_in(?time=1,?delay=0.0,?complete){
        Actuate.tween(fade.color, time, {a:0}).onComplete(complete).delay(delay);
    }

    public function fade_out(?time=1,?delay=0.0,?complete){
        Actuate.tween(fade.color, time, {a:1}).onComplete(complete).delay(delay);
    }

    public function onkeyup(e) {
        states.onkeyup(e);
    } //onkeyup

    public function onkeydown(e) {
        states.onkeydown(e);
    } //onkeydown
    public function onmousedown(e) {
        mouse.set(e.x,e.y);
        states.onmousedown(e);
    } //onkeydown    
    public function onmousemove(e) {        
        mouse.set(e.x,e.y);
        states.onmousemove(e);
    } //onkeydown
    public function onmouseup(e) {
        mouse.set(e.x,e.y);
        states.onmouseup(e);
    } //onkeydown
    public function ontouchmove(e:TouchEvent) {
        states.ontouchmove(e);
    } //ontouchmove
    public function ontouchbegin(e:TouchEvent) {
        states.ontouchbegin(e);
    } //ontouchmove
    public function ontouchend(e:TouchEvent) {
        states.ontouchend(e);
    } //ontouchmove

    public function update(dt:Float) {
        states.update(dt);
    } //update

    public function destroy() {
        states.destroy();
    } //destroy
}


