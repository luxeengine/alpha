package luxe;

import luxe.Core;
import luxe.Log._debug;

typedef AudioEvent = snow.types.Types.AudioEvent;
typedef AudioState = snow.types.Types.AudioState;
typedef AudioHandle = snow.types.Types.AudioHandle;
typedef AudioSource = snow.systems.audio.AudioSource;
typedef AudioInstance = snow.systems.audio.AudioInstance;

@:allow(luxe.Core)
class Audio {

    public var core : Core;
    public var active (get,set) : Bool;

    function new( _core:Core ) {

        core = _core;

    } //new

//events

    public inline function on(_event:AudioEvent, _handler:AudioHandle->Void) : Void {
        core.app.audio.on(_event, _handler);
    }
    
    public inline function off(_event:AudioEvent, _handler:AudioHandle->Void) : Bool {
        return core.app.audio.off(_event, _handler);
    }
    
    public inline function emit(_event:AudioEvent, _handle:AudioHandle) : Void {
        core.app.audio.emit(_event, _handle);
    }

    public function play(_source:AudioSource, ?_volume:Float=1.0, ?_paused:Bool=false) : AudioHandle {
        return core.app.audio.play(_source, _volume, _paused);
    }

    public function loop(_source:AudioSource, ?_volume:Float=1.0, ?_paused:Bool=false) : AudioHandle {
        return core.app.audio.loop(_source, _volume, _paused);
    }

    public inline function pause(_handle:AudioHandle) : Void {
        core.app.audio.pause(_handle);
    }

    public inline function unpause(_handle:AudioHandle) : Void {
        core.app.audio.unpause(_handle);
    }

    public inline function stop(_handle:AudioHandle) : Void {
        core.app.audio.stop(_handle);
    }

    public inline function volume(_handle:AudioHandle, _volume:Float) : Void {
        core.app.audio.volume(_handle, _volume);
    }

    public inline function pan(_handle:AudioHandle, _pan:Float) : Void {
        core.app.audio.pan(_handle, _pan);
    }

    public inline function pitch(_handle:AudioHandle, _pitch:Float) : Void {
        core.app.audio.pitch(_handle, _pitch);
    }

    public inline function position(_handle:AudioHandle, _position:Float) : Void {
        core.app.audio.position(_handle, _position);
    }

    public inline function state_of(_handle:AudioHandle) : AudioState {
        return core.app.audio.state_of(_handle);
    }

    public inline function loop_of(_handle:AudioHandle) : Bool {
        return core.app.audio.loop_of(_handle);
    }

    public inline function instance_of(_handle:AudioHandle) : AudioInstance {
        return core.app.audio.instance_of(_handle); 
    }

    public inline function volume_of(_handle:AudioHandle) : Float {
        return core.app.audio.volume_of(_handle); 
    }

    public inline function pan_of(_handle:AudioHandle) : Float {
        return core.app.audio.pan_of(_handle); 
    }

    public inline function pitch_of(_handle:AudioHandle) : Float {
        return core.app.audio.pitch_of(_handle); 
    }

    public inline function position_of(_handle:AudioHandle) : Float {
        return core.app.audio.position_of(_handle); 
    }

    public inline function suspend() {
        core.app.audio.suspend();
    }

    public inline function resume() {
        core.app.audio.resume();
    }

//properties

    inline function get_active()            return core.app.audio.active;
    inline function set_active(_val:Bool)   return core.app.audio.active = _val;

//Internal

    function init() {

        _debug('\t audio initialized.');

    } //init

    function destroy() {

        _debug('\t audio shut down.');

    } //destroy

    function process() {


    } //process

} //Audio
