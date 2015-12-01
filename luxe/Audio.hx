package luxe;

import luxe.Core;

import luxe.Log._debug;

class Audio {

    @:noCompletion public var core : Core;

    @:noCompletion public function new( _core:Core ) {

        core = _core;

    } //new

    @:noCompletion public function init() {
        _debug('\t audio initialized.');
    } //init

    @:noCompletion public function destroy() {
        _debug('\t audio shut down.');
    } //destroy

    @:noCompletion public function process() {

    } //process

} //Audio
