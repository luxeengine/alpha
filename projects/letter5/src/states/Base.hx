package states;

import luxe.Input;
import luxe.States;

import common.Block;
import common.Cell;
import common.Board;

import luxe.tween.Actuate;

class Base extends State {

	public var game : Main;

    public var board : Board;

	public var words : Map<String, String>;
   	public var currently_spelling : String = '';    
    public var current_game_words : Array<String>;
    public var current_long_words : Array<String>;

    	//whether or not the mode allows diagonals
    public var allowDiagonal : Bool = true;

	public function init() {

			//initialize
		words = new Map();
		current_game_words = [];
		current_long_words = [];

			//create the game board
		board = new Board(game);

			//create the words map
        var wordres = Luxe.loadText('assets/words.txt');
        var wordstring = wordres.text;
        var wordarray = wordstring.split('\n');
        for(word in wordarray) {
            words.set(word, word);
        }

        	//cleanup
        wordstring = null;
        wordarray = null;

	} //new

	public function update(dt:Float) {	
		board.update(dt);	
	}

	public function enter() {				
		Actuate.tween(Luxe.renderer.clear_color, 1.8, {r:0.995,g:0.995,b:0.995}).onComplete(function(){
			board.init();
		});
	} //enter

	public function leave() {
		board.destroy();
	} //leave


	public function ontouchbegin(e:TouchEvent) {
		board.ontouchbegin(e);
	}
	public function ontouchend(e:TouchEvent) {
		board.ontouchend(e);
	}
	public function ontouchmove(e:TouchEvent) {
		board.ontouchmove(e);
	}
	public function onmousemove(e:MouseEvent) {
		board.onmousemove(e);
	}
	public function onmousedown(e:MouseEvent) {
		board.onmousedown(e);
	}
	public function onmouseup(e:MouseEvent) {
		board.onmouseup(e);
	}

	public function onkeydown(e) {		
        if(e.value == Input.Keys.escape) {
            game.states.set('menu');
        } //if escape
	}	
}