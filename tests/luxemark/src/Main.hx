
import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import phoenix.Texture;

class Item {
	public var sprite : Sprite;
	public var dirx : Int = 1;
	public var diry : Int = 1;
	public var rotate : Int = 5;
	public function new(t:Texture) {
		if(Math.floor(Math.random()*2) == 1) { dirx = -1; }
		if(Math.floor(Math.random()*2) == 1) { diry = -1; }
		rotate = 4 - (2 + Math.round(Math.random()*6));
		var s = Math.random();
		sprite = new Sprite({
			texture:t,
			pos : new Vector(Math.random()*Luxe.screen.w,Math.random()*Luxe.screen.h),
			color : new Color(Math.random(),Math.random(),Math.random(),1),
			rotation_z : Math.random() * 360,
			size : new Vector(20+(s*60), 25+(s*75))
		});
	}
}

class Main extends luxe.Game {

	var num : Int = 2000;
	var list : Array<Item>;
	var tex : Texture;
	var speed : Int = 3;

    public function ready() {

    	list = [];

    	tex = Luxe.loadTexture('assets/luxe.png');

    	for(i in 0 ... num) {
    		list.push(new Item(tex));    		
    	}

    } //ready

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {
    	for(i in 0 ... num) {
    		var _i:Item = list[i];
    		_i.sprite.pos.x += _i.dirx * speed;
    		_i.sprite.pos.y += _i.diry * speed;
    		_i.sprite.rotation_z += _i.rotate;
    		if(_i.sprite.pos.x >= Luxe.screen.w) _i.dirx = -1;
    		if(_i.sprite.pos.x <= 0) _i.dirx = 1;
    		if(_i.sprite.pos.y >= Luxe.screen.h) _i.diry = -1;
    		if(_i.sprite.pos.y <= 0) _i.diry = 1;
    	}
    } //update

} //Main