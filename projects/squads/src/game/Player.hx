
package game;

import luxe.Vector;
import luxe.Sprite;

class Player {
	
	public var sprite : Sprite;
	public var velocity : Vector;
	public var pos : Vector;

	public function new( _sprite:Sprite ) {

		sprite = _sprite;
		velocity = new Vector();
		pos = new Vector();

	} //new



} //Player