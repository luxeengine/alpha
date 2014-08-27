package luxe;

import luxe.Core;
import luxe.Objects;
import luxe.Input;
import snow.App;
import luxe.AppConfig;

@:noCompletion
@:keepSub
class Game extends Emitter {

    @:noCompletion public var app : Core;

        /** Empty constructor. Use `ready` instead. */
    public function new() {
        super();
    }

        /** Called by luxe to request config changes, override this to change the defaults.
            This happens before ready, so the values are available when ready is called. */
    public function config( config:AppConfig ) : AppConfig  { return config; }
        /** Your entry point. Called for you when you can initialize your application */
    public function ready() {}
        /** Your update loop. Called every frame for you. The dt value depends on the timing configuration (see the {App Guide}) */
    public function update(dt:Float) {}

} //Game
