
import luxe.Vector;
import luxe.Input;
import luxe.Sprite;

class Main extends luxe.Game {

    var test_sprite1 : Sprite;


    public function ready() {
        
        test_sprite1 = new Sprite({
            texture : Luxe.loadTexture('assets/luxe.png'),
            pos : new Vector(0,0)
        });

    } //ready
  
    public function onmousemove(e) {
        var m = new Vector(e.x,e.y);
        test_sprite1.pos = m;
    }


    var _next : Int = 0;
    var _scales : Array<Vector>;
    public function onkeyup(e) {

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
    } //update

    public function destroy() {

    } //destroy
}


