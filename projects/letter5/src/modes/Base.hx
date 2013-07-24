package modes;

import lab.Input;
import lab.Modes;

import common.Block;
import common.Cell;
import common.Board;

class Base extends Mode {

	public var game : Main;

	public var words : Map<String, String>;
    public var board : Board;

    	//
   	public var currently_spelling : String = '';    
    public var current_game_words : Array<String>;
    public var current_long_words : Array<String>;

    	//whether or not the mode allows diagonals
    public var allowDiagonal : Bool = true;

	public function new() {
		super();
	} //new

	public function enter() {
		
	} //enter

	public function onkeydown(e) {		
        if(e.value == Input.Keys.escape) {
            game.modes.set('menu');
        } //if escape
	}	
}