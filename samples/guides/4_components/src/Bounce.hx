import luxe.components.Components.Component;


class Bounce extends Component {

	var dir : Int = 1;
	var speed : Int = 200;

    public function update(dt:Float) {
        pos.y += speed * dir * dt;
        	//hit the bottom? go back up
        if(pos.y > Luxe.screen.h) {
        	dir = -1;
        }
        	//hit the middle? go down
        if(pos.y < Luxe.screen.h/2) {
        	dir = 1;
        }
    }

}