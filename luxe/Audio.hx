package luxe;

import luxe.Core;

import lime.helpers.AudioHelper.Sound;

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

        /**
            Create a named audio reference, with optional stream flag   
            **name** The name to assign this audio reference    
            **file** The asset file id from which the audio is loaded/streamed    
            **stream** Whether or not to stream the audio, default `false`   
            **returns** The `Sound` instance, but the audio API stores this, use the API to manipulate it by name.
        */
    public function create( _name:String, _file:String, ?_stream:Bool = false ) : Sound {
        return core.lime.audio.create( _name, _file, _stream );
    } //create

        /**
            Fetch a named audio reference   
            **name** The name to acquire audio reference    
            **returns** The `Sound` instance
        */
    public function sound( _name:String ) : Sound {
        return core.lime.audio.sound(_name);
    } //sound

        /**
            Determine whether a named audio reference exists  
            **name** The audio reference name to check    
            **returns** true/false
        */
    public function exists( _name:String ) : Bool { 
        return core.lime.audio.exists(_name);
    } //exists

        /**
            Determine whether a named audio reference is playing  
            **name** The audio reference name to check    
            **returns** true/false
        */
    public function playing( _name:String ) : Bool {
        return core.lime.audio.playing( _name );
    } //playing

        /**
            Set the on complete handler for a named audio reference   
            **name** The audio reference name to assign to   
            **handler** The callback to call when playback is complete   
            **returns** nothing   
        */
    public function on_complete( _name:String, handler:Sound->Void ) : Void {
        return core.lime.audio.sound( _name ).on_complete( handler );
    } //playing

        /**
            Loop a named audio reference indefinitely. Use `stop` if needed.  
            **name** The audio reference name to loop    
            **returns** nothing
        */
    public function loop( _name:String )  : Void{
        return core.lime.audio.loop(_name);
    } //loop

        /**
            Stop a named audio reference from playing (or looping)   
            **name** The audio reference name to stop    
            **returns** nothing
        */
    public function stop( _name:String ) : Void {
        return core.lime.audio.stop(_name);
    } //stop

        /**
            Play a named audio reference   
            **name** The audio reference name to play    
            **number_of_times** The exact number of times to play    
            **start_position_in_s** The start time, in seconds    
            **returns** nothing
        */
    public function play( _name:String, ?_number_of_times:Int=1, ?_start_position_in_s:Float = 0 ) {
        return core.lime.audio.play(_name,_number_of_times, _start_position_in_s * 1000.0 );
    } //play

        /**
            get/set the volume of a named audio reference    
            **name** The audio reference name to adjust    
            **volume** A new volume value (set), or leave empty (get)    
            **returns** The volume of `name` IF volume is unspecified
        */
    public function volume( _name:String, ?_volume:Float = null ) : Float {
        return core.lime.audio.volume(_name, _volume);
    } //volume

        /**
            get/set the pan of a named audio reference    
            **name** The audio reference name to adjust    
            **pan** A new pan value (set), or leave empty (get)   
            **returns** The pan of `name` IF pan is unspecified
        */
    public function pan( _name:String, ?_pan:Float = null ) : Float  {
        return core.lime.audio.pan(_name,_pan);       
    } //pan

        /**
            get/set the position of a named audio reference    
            **name** The audio reference name to adjust    
            **pos** A new position value (set), or leave empty (get)   
            **returns** The position of `name` IF position is unspecified
        */
    public function position( _name:String, ?_pos:Float = null ) : Float {
        return core.lime.audio.position( _name, _pos );       
    } //position

    @:noCompletion public function process() {
        
    } //process

} //Audio
