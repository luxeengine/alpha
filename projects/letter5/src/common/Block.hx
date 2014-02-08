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
			bounds : new Rectangle( x+0.5 , y+0.5, Math.round(board.blockw*1.05), Math.round(board.blockh*0.9) ),
			align : TextAlign.center,
			align_vertical : TextAlign.center,
			text : get_random_letter(),
			size : board.skin.text.h,
			color : board.skin.text.normal_color,
			font : board.game.font,	
			depth : 3.1
		});

		Actuate.tween(sprite.color, 0.5, {a:1});
		letter.color.tween(0.4, {a:0.8}).onComplete(function(){

		}).delay(0.2);

	}

	public function select() {
		sprite.uv = new Rectangle(board.skin.block_selected.x,board.skin.block_selected.y,board.skin.block_selected.w,board.skin.block_selected.h );
		letter.color = board.skin.text.highlight_color;
	}

	public function deselect() {
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