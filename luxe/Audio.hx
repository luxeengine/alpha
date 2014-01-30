package luxe;

import luxe.Core;

import lime.helpers.AudioHelper.Sound;

class Audio {
    
    @:noCompletion public var core : Core;
    
    @:noCompletion public function new( _core:Core ) {

        core = _core;

    } //new

    @:noCompletion public function init() {
        core._debug(':: luxe :: \t Audio Initialized.');
    } //init

    @:noCompletion public function destroy() {
        core._debug(':: luxe :: \t Audio shut down.');
    } //destroy

    public function create(_name:String,_file:String, ?_is_music:Bool = false ) : Sound {
        return core.lime.audio.create( _name, _file, _is_music );
    } //create

    public function sound( _name:String ) : Sound {
        return core.lime.audio.sound(_name);
    } //sound

    public function exists( _name:String ) : Bool { 
        return core.lime.audio.exists(_name);
    } //exists

    public function playing( _name:String ) : Bool {
        return core.lime.audio.playing( _name );
    } //playing

        //will loop a sound indefinitely until stop is called
    public function loop( _name:String ) {
        return core.lime.audio.loop(_name);
    } //loop

    public function stop( _name:String ) {
        return core.lime.audio.stop(_name);
    } //stop

    public function play( _name:String, ?_number_of_times:Int=1, ?_start_position_in_ms:Float = 0 ) {
        return core.lime.audio.play(_name,_number_of_times, _start_position_in_ms);
    } //play

    public function volume( _name:String, ?_volume:Float = null ) : Float {
        return core.lime.audio.volume(_name, _volume);
    } //volume

    public function pan( _name:String, ?_pan:Float = null ) : Float  {
        return core.lime.audio.pan(_name,_pan);       
    } //pan

    public function position( _name:String, ?_pos:Float = null ) : Float {
        return core.lime.audio.position( _name, _pos );       
    } //position

    @:noCompletion public function process() {
        
    } //process
}