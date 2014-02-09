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
	public var x : Float = 0;
	public var y : Float = 0;

	public var selected : Bool = false;
	public var highlighted : Bool = false;
	public var locked : Bool = false;

	public function new( _board:Board, _x:Int, _y:Int ) {
		board = _board;		
		x = _x; y = _y;
	}

	public function init() {
		
		_debug_geometry = [];
		
		sprite = new Sprite({
			name : 'block' + Math.floor(x/board.blockw) + '-' + Math.floor(y/board.blockh),
			centered : false,
			pos : new Vector(x,y),
			color : new Color(1,1,1,0),
			size : new Vector(board.blockw, board.blockh),			
			texture : board.skin.texture,
			depth : 3, 
			no_scene : true
		});

		sprite.uv = new Rectangle(board.skin.block.x,board.skin.block.y,board.skin.block.w,board.skin.block.h );

		letter = new Text({
			bounds : new Rectangle( x , y, Math.round(board.blockw*1.05), Math.round(board.blockh*0.9) ),
			align : TextAlign.center,
			align_vertical : TextAlign.center,
			text : get_random_letter(),
			size : board.skin.text.h * board.game.ratio,
			color : board.skin.text.normal_color,
			font : board.game.font,	
			depth : 3.1
		});

		Actuate.tween(sprite.color, 0.5, {a:1});
		letter.color.tween(0.4, {a:0.8}).onComplete(function(){
			// sprite.locked = true;
			// letter.locked = true;
		}).delay(0.2);

	}

	public function select() {
		selected = true;
		sprite.uv = new Rectangle(board.skin.block_selected.x,board.skin.block_selected.y,board.skin.block_selected.w,board.skin.block_selected.h );
		letter.color = board.skin.text.highlight_color;
	}

	public function unselect() {
		selected = false;
		sprite.uv = new Rectangle(board.skin.block.x,board.skin.block.y,board.skin.block.w,board.skin.block.h );
		letter.color = board.skin.text.normal_color;
	}

	public function highlight() {
		highlighted = true;
		sprite.uv = new Rectangle(board.skin.block_highlighted.x,board.skin.block_highlighted.y,board.skin.block_highlighted.w,board.skin.block_highlighted.h );
		letter.color = board.skin.text.highlight_color;
	}

	public function unhighlight() {
		highlighted = false;
		sprite.uv = new Rectangle(board.skin.block.x,board.skin.block.y,board.skin.block.w,board.skin.block.h );
		letter.color = board.skin.text.normal_color;
	}

	public function lock() {
		locked = true;
		sprite.uv = new Rectangle(board.skin.block_locked.x,board.skin.block_locked.y,board.skin.block_locked.w,board.skin.block_locked.h );
		letter.color = board.skin.text.highlight_color;
	}

	public function unlock() {
		locked = false;
		sprite.uv = new Rectangle(board.skin.block.x,board.skin.block.y,board.skin.block.w,board.skin.block.h );
		letter.color = board.skin.text.normal_color;
	}

	public function destroy() {

		for(_g in _debug_geometry) {
			_g.drop();
			_g = null;
		} //_g

		_debug_geometry.splice(0,_debug_geometry.length);

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