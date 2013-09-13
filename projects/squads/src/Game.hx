
import luxe.Input;
import luxe.Modes;
import luxe.Color;

import menu.Menu;
import phoenix.BitmapFont;

enum GameMode {
    deathmatch;
    twovtwo;
}


class Game extends luxe.Game {

	var modes : Modes;
    var menu : Menu;

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
        menu = modes.add_mode(Menu, 'mainmenu');
            //and then init and set it
        menu.init(this);
        modes.set('mainmenu');

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