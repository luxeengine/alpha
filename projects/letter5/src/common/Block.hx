package common;

import common.Board;
import luxe.Color;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.Text;
import luxe.Vector;
import phoenix.geometry.Geometry;

import luxe.tween.Actuate;

class Block {
	
	var _debug_geometry : Array<Geometry>;

	public var board : Board;
	public var sprite : Sprite;
	public var letter : Text;
	public var x : Int = 0;
	public var y : Int = 0;

	public function new( _board:Board, _x:Int, _y:Int ) {
		board = _board;
		_debug_geometry = [];
		x = _x; y = _y;
	}

	public function init() {
		
		sprite = new Sprite({
			centered : false,
			pos : new Vector(x,y),
			color : new Color(1,1,1,0),
			size : new Vector(board.blockw, board.blockh),			
			texture : board.skin.texture,
			depth : 3
		});

		sprite.uv = new Rectangle(board.skin.block.x,board.skin.block.y,board.skin.block.w,board.skin.block.h );

		letter = new Text({
			bounds : new Rectangle( x , y, board.blockw, board.blockh ),
			align : TextAlign.center,
			align_vertical : TextAlign.center,
			text : get_random_letter(),
			size : board.skin.text.h,
			color : new Color(0,0,0,0).rgb(0xa79b97),
			font : board.game.font,	
			depth : 3.1,
		});

		Actuate.tween(sprite.color, 2, {a:1});
		Actuate.tween(letter.color, 3, {a:0.8}).onUpdate(function(){
			letter.color = letter.color;
		}).onComplete(function(){
			// sprite.locked = true;
		});

	}

	public function destroy() {

		for(_g in _debug_geometry) {
			_g.drop();
			_g = null;
		} //_g

		_debug_geometry.splice(0,_debug_geometry.length);
		trace("destroy");
		letter.destroy();
		sprite.destroy();

	} //destroy

	public function get_random_letter() {

        var chance = 1 + Std.random(10);
        var index = 0;

        //5 in front, 3 at back
        //30% a vowel
        //60% a constanant
        //10% a 3

        if(chance <= 4) {
            index = (Std.random(5));
        } else if(chance > 4 && chance <= 9) {
            index = 5 + (Std.random(18));
        } else {
            index = 22 + (Std.random(3));
        }

        return board.alphabet.charAt(index);
    }	
	
}