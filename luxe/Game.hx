package luxe;

import luxe.Core;
import luxe.Input;

@:noCompletion @:keepSub class Game extends lumen.App {

    @:noCompletion public var _luxe : Core;

        /** Called when the application is about to render */
    public function pre_render() {}
        /** Called when the application is rendering */
    public function render() {}
        /** Called when the application is done rendering */
    public function post_render() {}

    public function oninputdown( _name:String, e:InputEvent ) {}
    public function oninputup( _name:String, e:InputEvent ) {}

} //Game
