
import game.Level;
import luxe.Input;
import luxe.States;
import luxe.Color;

import game.Manager;
import phoenix.BitmapFont;

enum GameMode {
    deathmatch;
    twovtwo;
}

class Game extends luxe.Game {

	var states : States;
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

    	states = new States();

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
        manager = states.add_state(Manager, 'mainmenu');
        level = states.add_state(Level, 'level');

            //and then init and set it
        manager.init(this);
        level.init(manager);

        states.set('mainmenu');

        Luxe.fixed_timestep = 0.0166666666667;

    } //ready

    public function onmousemove( e:MouseEvent ) {
    	states.onmousemove(e);
    } //onmousemove

    public function onmousedown( e:MouseEvent ) {
        states.onmousedown(e);
    } //onmousedown

    public function onmousewheel( e:MouseEvent ) {
    	states.onmousewheel(e);
    } //onmousedown

    public function onmouseup( e:MouseEvent ) {
    	states.onmouseup(e);
    } //onmouseup

    public function oninputup( _input:String, _event:InputEvent ) {
        states.oninputup(_input,_event);
    }

    public function oninputdown( _input:String, _event:InputEvent ) {
        states.oninputdown(_input, _event);
    }

    public function onkeydown( e:KeyEvent ) {
    	states.onkeydown(e);
    } //onkeydown

    public function onkeyup( e:KeyEvent ) {		
    	states.onkeyup(e);
    } //onkeyup

    public function update(dt:Float) {
    	states.update(dt);
    } //update

} //Game