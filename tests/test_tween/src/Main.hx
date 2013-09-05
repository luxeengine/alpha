
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;
import luxe.Color;

import phoenix.utils.Maths;

class Main extends luxe.Game {

    var sprite : Sprite;
    var sprite2 : Sprite;
    var mouse : Vector;
    var color : Color;

    public function ready() {

        sprite = new Sprite({
            pos : new Vector(480,320),
            size : new Vector(256,256),
            color : new Color(),
            depth : 2
        });

        sprite2 = new Sprite({
            pos : new Vector(480,320),
            size : new Vector(Luxe.screen.w,Luxe.screen.h),
            color : new Color().rgb(0x111111)
        });

        mouse = new Vector(480,320);

        color = new Color(Math.random(), 0, 0);

    } //ready
    
    
    public function onmousemove(e) {
        mouse.set(e.x, e.y);
        sprite.pos = mouse;
    }

    public function onmousedown(e) {
        
        sprite.color.tween(1.5, { 
            r:Math.random(), 
            g:Math.random(), 
            b:Math.random(), 
            a: Maths.clamp(0.5+(Math.random()),0,1) 
        }); //tween

        color.r = Math.random();
        
        sprite2.color.tween( 0.5, color ); //tween

    }

    public function onkeyup(e) {
      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {

    } //update

    public function shutdown() {

    } //shutdown
}


