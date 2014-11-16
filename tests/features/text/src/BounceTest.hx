import luxe.Component;


class BounceTest extends Component {

	var dir : Int = 1;
	var speed : Int = 50;
    var bottom : Float = 0;
    var top : Float = 0;

    override function init() {
        bottom = pos.y + 50;
        top = pos.y;
    }

    override function update(dt:Float) {
        pos.y += speed * dir * dt;
        	//hit the bottom? go back up
        if(pos.y > bottom) {
        	dir = -1;
        }
        	//hit the middle? go down
        if(pos.y < top) {
        	dir = 1;
        }
    }

}