
import luxe.Color;
import luxe.Input;
import luxe.States;
import luxe.Text;
import luxe.Vector;

class Main extends luxe.Game {

    public static var state: States;
    public static var font: phoenix.BitmapFont;

    override function ready() {

            //create the state machine
        state = new States({ name:'state' });

            //simply wait for the font to load,
            //the rest will work out their delayed loads
        font = Luxe.loadFont('proclamate.fnt', 'assets/font/', function(_){

                //add the states we will use
            state.add( new Menu() );
            state.add( new Game() );
            state.add( new Pause() );

                //set the initial state to menu
            state.set('menu');

        });

    } //ready

} //Main
