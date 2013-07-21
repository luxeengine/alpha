package levels;


import lab.utils.NineSlice;
import Lab;
import lab.Sprite;
import mode.Mode;

import lab.Vector;
import lab.Color;

import game.LevelWorld;
import phoenix.geometry.Geometry;
import phoenix.BitmapFont;

class Level01 extends Mode {

    public var back : Sprite;

    public var mouse : Vector;
    public var dragging : Bool = false;
    public var start_drag : Vector;
    public var start_camera_drag : Vector;

    public var guiback : NineSlice;
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
        //     texture : Lab.loadTexture('assets/ui/tiny.box.png'),
        //     depth : 2
        // });

        //guiback.create( new Vector(200,200), 400, 400 );

        map = new Sprite({
            centered:false,
            size:new Vector(4096,4096),
            texture:Lab.loadTexture('assets/map/map.png')
        });

        map.texture.filter = phoenix.Texture.FilterType.nearest;

    }

    public function destroy() {

        trace('destroying level1');
        
            //will destroy everyhing 
        Lab.scene.empty();

        guiback = null;
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
            start_camera_drag.set(Lab.camera.pos.x, Lab.camera.pos.y);
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
            Lab.camera.pos.x = start_camera_drag.x + (diffx);
            Lab.camera.pos.y = start_camera_drag.y + (diffy);
        } //if dragging

    }

    public function enter() {
       init();
    }

    public function leave() {
        destroy();
    }
}