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
            Create a named audio reference, with optional streaming flag   
            **id** The asset file id from which the audio is loaded/streamed.   
            **name** The name to assign the sound for the named api    
            **streaming** Whether or not to stream the audio, default `false`   
            **returns** The `Sound` instance, if needed. can be manipulated through named api as well.
        */
    public function create( _id:String, ?_name:String = '', ?_streaming:Bool = false ) : snow.api.Promise {
        return core.app.audio.create( _id, _name, _streaming );
    } //create

    // wip alpha-2.0
    @:noCompletion
    public function create_from_bytes( ?_name:String = '', _bytes:snow.api.buffers.Uint8Array, _format:snow.types.Types.AudioFormatType ) : luxe.Sound {
        return core.app.audio.create_from_bytes( _name, _bytes, _format);
    } //create_from_bytes


        /**
            Destroy a named audio reference.
            Use the reference directly with sound.destroy if you have an instance. */
    public function uncreate( _name:String ) {
        return core.app.audio.uncreate( _name );
    } //uncreate

        /** Add a manually created sound instance to the audio system.
            Once added the regular named api should apply.
            Do not add sounds returned from `create` calls. */
    @:noCompletion public function add( sound:luxe.Sound ) {
        return core.app.audio.add( sound );
    }


        /** Listen for an event on a named sound. `load` and `end` are valid */
    public function on(_name:String, _event:String, _handler:luxe.Sound->Void) {
        return core.app.audio.on(_name, _event, _handler);
    } //on

        /** Stop listening for an event on a named sound. See `on` */
    public function off(_name:String, _event:String, _handler:luxe.Sound->Void) {
        return core.app.audio.off(_name, _event, _handler);
    } //off

        /**
            Fetch a named audio reference   
            **name** The name to acquire audio reference   
            **returns** The `Sound` instance
        */
    public function get( _name:String ) : luxe.Sound {
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
            get/set the volume of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **volume** A new volume value
        */
    public function volume( _name:String, ?_volume:Float ) : Float {
        return core.app.audio.volume(_name, _volume);
    } //volume

        /**
            get/set the pan of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **pan** A new pan value
        */
    public function pan( _name:String, ?_pan:Float ) : Float  {
        return core.app.audio.pan(_name,_pan);
    } //pan

        /**
            get/set the pitch of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **pitch** A new pitch value
        */
    public function pitch( _name:String, ?_pitch:Float ) : Float {
        return core.app.audio.pitch( _name, _pitch );
    } //pitch
        /**
            get/set the position in `seconds` of a named audio reference,   
            leave the second argument empty for get   
            **name** The audio reference name to adjust   
            **pan** A new pan value
        */
    public function position( _name:String, ?_position:Float ) : Float  {
        return core.app.audio.position(_name, _position);
    } //pan

        /**
            get the position in seconds of a named audio reference   
            **name** The audio reference name to get   
        */
    public function duration( _name:String ) : Float {
        return core.app.audio.duration( _name );
    } //pitch

    @:noCompletion public function process() {

    } //process

} //Audio
