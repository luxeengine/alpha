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

        /**
            Create a named audio reference, with optional stream flag   
            **name** The name to assign this audio reference   
            **file** The asset file id from which the audio is loaded/streamed   
            **stream** Whether or not to stream the audio, default `false`   
            **returns** The `Sound` instance, but the audio API stores this, use the API to manipulate it by name.
        */
    public function create( _name:String, _file:String, ?_stream:Bool = false ) : snow.audio.Sound {
        return core.app.audio.create( _name, _file, _stream );
    } //create

        /**
            Fetch a named audio reference   
            **name** The name to acquire audio reference   
            **returns** The `Sound` instance
        */
    public function get( _name:String ) : snow.audio.Sound {
        return core.app.audio.get(_name);
    } //get

        /**
            Determine whether a named audio reference exists   
            **name** The audio reference name to check   
            **returns** true/false
        */
    public function exists( _name:String ) : Bool {
        return get(_name) != null;
    } //exists

        /**
            Set the on complete handler for a named audio reference   
            **name** The audio reference name to assign to   
            **handler** The callback to call when playback is complete   
            **returns** nothing
        */
    public function on_complete( _name:String, handler:Void->Void ) : Void {
        // return get( _name ).on_complete( handler );
    } //playing

        /**
            Loop a named audio reference indefinitely. Use `stop` if needed.   
            **name** The audio reference name to loop   
            **returns** nothing
        */
    public function loop( _name:String )  : Void{
        return core.app.audio.loop(_name);
    } //loop

        /**
            Stop a named audio reference from playing (or looping)   
            **name** The audio reference name to stop   
            **returns** nothing
        */
    public function stop( _name:String ) : Void {
        return core.app.audio.stop(_name);
    } //stop

        /**
            Play a named audio reference   
            **name** The audio reference name to play   
            **returns** nothing
        */
    public function play( _name:String ) {
        return core.app.audio.play( _name );
    } //play

        /**
            Pause a named audio reference   
            **name** The audio reference name to pause   
            **returns** nothing
        */
    public function pause( _name:String ) {
        return core.app.audio.pause( _name );
    } //pause


        /** Toggle a sound instance by name, pausing the sound or resuming it */
    public function toggle(_name:String) {
        return core.app.audio.toggle(_name);
    } //toggle

        /**
            set the volume of a named audio reference   
            **name** The audio reference name to adjust   
            **volume** A new volume value
        */
    public function volume( _name:String, _volume:Float ) : Void {
        return core.app.audio.volume(_name, _volume);
    } //volume

        /**
            set the pan of a named audio reference   
            **name** The audio reference name to adjust   
            **pan** A new pan value
        */
    public function pan( _name:String, _pan:Float ) : Void  {
        return core.app.audio.pan(_name,_pan);
    } //pan

        /**
            set the pitch of a named audio reference   
            **name** The audio reference name to adjust   
            **pitch** A new pitch value
        */
    public function pitch( _name:String, _pitch:Float ) : Void {
        return core.app.audio.pitch( _name, _pitch );
    } //pitch

    @:noCompletion public function process() {

    } //process

} //Audio
