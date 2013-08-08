package levels;


import Luxe;

import luxe.utils.NineSlice;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import phoenix.geometry.Geometry;
import phoenix.BitmapFont;


import mode.Mode;
import game.LevelWorld;

class Level01 extends Mode {

    public var back : Sprite;

    public var mouse : Vector;
    public var dragging : Bool = false;
    public var start_drag : Vector;
    public var start_camera_drag : Vector;

    public var map : Sprite;

    public function init() {
            
        start_drag = new Vector();
        start_camera_drag = new Vector();

         back = new Sprite({
            centered : false,
            pos : new Vector(0, 0),
            size : new Vector(960, 640),
            color : new Color().rgb(0xa4c781),
            depth : 0
        });

        // guiback = new NineSlice({
        //     texture : Luxe.loadTexture('assets/ui/tiny.box.png'),
        //     depth : 2
        // });

        //guiback.create( new Vector(200,200), 400, 400 );

        map = new Sprite({
            centered:false,
            size : new Vector(2048,2048),
            pos : new Vector(-10, Luxe.screen.h - 2048),
            depth:1,
            texture : Luxe.loadTexture('assets/map/map.png')
        });

        map.texture.filter = phoenix.Texture.FilterType.nearest;

    }

    public function destroy() {

        trace('destroying level1');
        
            //will destroy everyhing 
        back.destroy();
        map.destroy();

        back = null;
    }

    public function keydown(e) {
        if(e.value == 27 || e.keyCode == 27) {
            game.modes.set('menu');
        }
    }

    public function mousedown(e) {
        mouse = new Vector(e.x,e.y);
        if(!dragging) {
            dragging = true;
            start_drag.set(e.x,e.y);
            start_camera_drag.set(Luxe.camera.pos.x, Luxe.camera.pos.y);
        }
    }
    public function mouseup(e) {
        mouse = new Vector(e.x,e.y);
        if(dragging) {
            dragging = false;
        }
        
    }

    public function mousemove(e) {

        mouse = new Vector(e.x,e.y);

        if(dragging) {
            var diffx = (e.x - start_drag.x);
            var diffy = (e.y - start_drag.y);
            Luxe.camera.pos.x = start_camera_drag.x - (diffx);
            Luxe.camera.pos.y = start_camera_drag.y - (diffy);
        } //if dragging

    }

    public function enter() {
       init();
    }

    public function leave() {
        Luxe.camera.pos = new Vector();
        destroy();
    }
}