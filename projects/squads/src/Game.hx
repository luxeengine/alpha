
import game.Level;
import luxe.Input;
import luxe.Modes;
import luxe.Color;

import game.Manager;
import phoenix.BitmapFont;

enum GameMode {
    deathmatch;
    twovtwo;
}

class Game extends luxe.Game {

	var modes : Modes;
    public static var manager : Manager;
    public static var level : Level;

        //game shared resources
    public var font : BitmapFont;  

    public var team1color : Color;  
    public var team2color : Color;  
    public var whitecolor : Color;  
    public var blackcolor : Color;  

        //game specifics
    public var current_game_mode : GameMode;

    public function ready() {

    	modes = new Modes();

            //Load the font
        font = Luxe.loadFont('osb.fnt', 'assets/fonts/');
            //Set the colors
        whitecolor = new Color();
        blackcolor = new Color(0,0,0);
        team1color = new Color().rgb(0x50adee);
        team2color = new Color().rgb(0xd01414);

            //default to 2v2 team play
        current_game_mode = GameMode.twovtwo;   

            //add the menu mode, 
        manager = modes.add_mode(Manager, 'mainmenu');
        level = modes.add_mode(Level, 'level');

            //and then init and set it
        manager.init(this);
        level.init(manager);

        modes.set('mainmenu');

        Luxe.fixed_timestep = 0.0166666666667;

    } //ready

    public function onmousemove( e:MouseEvent ) {
    	modes.onmousemove(e);
    } //onmousemove

    public function onmousedown( e:MouseEvent ) {
    	modes.onmousedown(e);
    } //onmousedown

    public function onmouseup( e:MouseEvent ) {
    	modes.onmouseup(e);
    } //onmouseup

    public function oninputup( _input:String, _event:Dynamic ) {
        modes.oninputup(_input,_event);
    }

    public function oninputdown( _input:String, _event:Dynamic ) {
        modes.oninputdown(_input, _event);
    }

    public function onkeydown( e:KeyEvent ) {
    	modes.onkeydown(e);
    } //onkeydown

    public function onkeyup( e:KeyEvent ) {		
    	modes.onkeyup(e);
    } //onkeyup

    public function update(dt:Float) {
    	modes.update(dt);
    } //update

} //Game