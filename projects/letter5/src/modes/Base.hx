package modes;

import lab.Input;
import lab.Modes;

import common.Block;
import common.Cell;
import common.Board;

import motion.Actuate;

class Base extends Mode {

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
        var wordstring = Lab.loadText('assets/words.txt');
        var wordarray = wordstring.split('\n');
        for(word in wordarray) {
            words.set(word, word);
        }

        	//cleanup
        wordstring = null;
        wordarray = null;

	} //new

	public function enter() {				
		Actuate.tween(Lab.renderer.clear_color, 0.5, {r:0.9412,g:0.9412,b:0.9412}).onComplete(function(){
			board.init();
		});
	} //enter

	public function leave() {
		board.destroy();
	} //leave

	public function onkeydown(e) {		
        if(e.value == Input.Keys.escape) {
            game.modes.set('menu');
        } //if escape
	}	
}