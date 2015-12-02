package luxe;

import luxe.Core;
import luxe.Log._debug;

@:allow(luxe.Core)
class Audio {

    public var core : Core;

    function new( _core:Core ) {

        core = _core;

    } //new

    function init() {

        _debug('\t audio initialized.');

    } //init

    function destroy() {

        _debug('\t audio shut down.');

    } //destroy

    function process() {


    } //process

} //Audio
