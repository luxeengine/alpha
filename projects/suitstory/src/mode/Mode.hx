package mode;

class Mode {

    public var game:Game;
	public var luxecore:luxe.Core;

	public var active : Bool = false;
	public var name : String = 'none';

	public function new (the_game:Game, _name:String ) {
		game = the_game;
        luxecore = game.luxecore;
        name = _name;
	}
	
	
}