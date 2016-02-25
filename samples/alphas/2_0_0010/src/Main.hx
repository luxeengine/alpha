
import luxe.Color;
import luxe.Input;
import luxe.States;
import luxe.Text;
import luxe.Vector;

class Main extends luxe.Game {

    public static var state: States;
    public static var font: phoenix.BitmapFont;

    override function config(config:luxe.AppConfig) {

        config.preload.textures = [
            { id:'assets/particles/snowflake.png' },
            { id:'assets/particles/flame.png' },
            { id:'assets/particles/smoke.png' },
            { id:'assets/particles/embers.png' },
            { id:'assets/detail_top.png' },
            { id:'assets/stones_top.png' },
            { id:'assets/stones_bottom.png'}
        ];

        config.preload.fonts.push({
            id:'assets/font/proclamate.fnt'
        });

        config.preload.sounds.push({ id: 'assets/181563__kingsrow__fire-crackling-01.ogg', is_stream: true });
        config.preload.sounds.push({ id: 'assets/69509__zixem__ruin-wind.ogg', is_stream: true });

        return config;

    } //config

    override function ready() {

            //create the state machine
        state = new States({ name:'state' });

            //simply wait for the font to load,
            //the rest will work out their delayed loads
        font = Luxe.resources.font('assets/font/proclamate.fnt');

            //add the states we will use
        state.add( new Menu() );
        state.add( new Game() );
        state.add( new Pause() );

            //set the initial state to menu
        state.set('menu');

    } //ready

} //Main
