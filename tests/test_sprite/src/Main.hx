
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;

class Main extends luxe.Game {

    var test_sprite1 : Sprite;


    public function ready() {
        
        test_sprite1 = new Sprite({
            texture : Luxe.loadTexture('assets/luxe.png'),
            pos : Luxe.screen.mid,
            centered : false,
            flipx:true,
            flipy:true
        });

        test_sprite1.centered = true;
        test_sprite1.flipx = false;
        test_sprite1.flipy = false;

        mouse = new Vector();

    } //ready
    
    var inside = false;
    var mouse : Vector;
    public function onmousemove( e:MouseEvent ) {
        mouse = e.pos;
    }

    public function hittest( e:Vector ) {
        if( test_sprite1.point_inside_exact(e) ) {
            if(!inside) {
                inside = true;
                // test_sprite1.color.tween(0.1, {r:0.8, b:0, g:0});
                test_sprite1.color.a = 0.2;
            }
        } else {
            if(inside) {
                inside = false;
                // test_sprite1.color.tween(0.1, {r:1, b:1, g:1});
                test_sprite1.color.a = 1;
            }
        }
    }

    public function onmouseup( e:MouseEvent ) {
        var m = new Vector(e.x,e.y);
            test_sprite1.pos = m;
    }


    var _next : Int = 0;
    var _next2 : Int = 0;
    var _scales : Array<Vector>;
    var _sizes : Array<Vector>;
    public function onkeyup(e) {

        if(e.value == Input.Keys.key_R) {
            if(_sizes == null) {
                _sizes = [                    
                    new Vector(128,128),
                    new Vector(64,64),
                    new Vector(32,32),
                    new Vector(512,512), 
                    new Vector(256,256),
                    new Vector(196,196)
                ];
            }
            _next2++; 
            if(_next2 > _sizes.length-1) {
                _next2 = 0;
            }

            var _size = _sizes[_next2];
            test_sprite1.size = _size;
        }

        if(e.value == Input.Keys.key_S) {
            if(_scales == null) {
                _scales = [                    
                    new Vector(1,1,1),
                    new Vector(0,0,0),
                    new Vector(2,2,2),
                    new Vector(0.5,0.5,0.5), 
                    new Vector(0.1,0.1,0.1),
                    new Vector(0.5,2,1)
                ];
            }
            _next++; 
            if(_next > _scales.length-1) {
                _next = 0;
            }

            var _scale = _scales[_next];
            test_sprite1.scale = _scale;
        }

      if(e.value == Input.Keys.escape) {
        Luxe.shutdown();
      }
    } //onkeyup

    public function update(dt:Float) {
        test_sprite1.rotation_z += 50 * dt;
        hittest(mouse);
    } //update

    public function destroyed() {

    } //destroyed
}


