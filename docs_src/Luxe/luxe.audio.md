
[![Logo](http://luxeengine.com/images/logo.png)](index.html)


[Methods](#Methods)   


&nbsp;   

&nbsp;   

<a class="lift" name="Methods" ></a>
###Methods   
---
<a class="lift" name="position" href="#position">position</a>



    position(_name:String, ?_pos:Float) : Float

<span class="small_desc_flat"> 
            get/set the position of a named audio reference    
            **name** The audio reference name to adjust    
            **pos** A new position value (set), or leave empty (get)   
            **returns** The position of `name` IF position is unspecified
         </span>   

<a class="lift" name="stop" href="#stop">stop</a>



    stop(_name:String) : Void

<span class="small_desc_flat"> 
            Stop a named audio reference from playing (or looping)   
            **name** The audio reference name to stop    
            **returns** nothing
         </span>   

<a class="lift" name="loop" href="#loop">loop</a>



    loop(_name:String) : Void

<span class="small_desc_flat"> 
            Loop a named audio reference indefinitely. Use `stop` if needed.  
            **name** The audio reference name to loop    
            **returns** nothing
         </span>   

<a class="lift" name="exists" href="#exists">exists</a>



    exists(_name:String) : Bool

<span class="small_desc_flat"> 
            Determine whether a named audio reference exists  
            **name** The audio reference name to check    
            **returns** true/false
         </span>   

<a class="lift" name="create" href="#create">create</a>



    create(_name:String, _file:String, ?_stream:Bool) : lime.helpers.Sound

<span class="small_desc_flat"> 
            Create a named audio reference, with optional stream flag   
            **name** The name to assign this audio reference    
            **file** The asset file id from which the audio is loaded/streamed    
            **stream** Whether or not to stream the audio, default `false`   
            **returns** The `Sound` instance, but the audio API stores this, use the API to manipulate it by name.
         </span>   

<a class="lift" name="volume" href="#volume">volume</a>



    volume(_name:String, ?_volume:Float) : Float

<span class="small_desc_flat"> 
            get/set the volume of a named audio reference    
            **name** The audio reference name to adjust    
            **volume** A new volume value (set), or leave empty (get)    
            **returns** The volume of `name` IF volume is unspecified
         </span>   

<a class="lift" name="playing" href="#playing">playing</a>



    playing(_name:String) : Bool

<span class="small_desc_flat"> 
            Determine whether a named audio reference is playing  
            **name** The audio reference name to check    
            **returns** true/false
         </span>   

<a class="lift" name="sound" href="#sound">sound</a>



    sound(_name:String) : lime.helpers.Sound

<span class="small_desc_flat"> 
            Fetch a named audio reference   
            **name** The name to acquire audio reference    
            **returns** The `Sound` instance
         </span>   

<a class="lift" name="play" href="#play">play</a>



    play(_name:String, ?_number_of_times:Int, ?_start_position_in_s:Float) : Void

<span class="small_desc_flat"> 
            Play a named audio reference   
            **name** The audio reference name to play    
            **number_of_times** The exact number of times to play    
            **start_position_in_s** The start time, in seconds    
            **returns** nothing
         </span>   

<a class="lift" name="pan" href="#pan">pan</a>



    pan(_name:String, ?_pan:Float) : Float

<span class="small_desc_flat"> 
            get/set the pan of a named audio reference    
            **name** The audio reference name to adjust    
            **pan** A new pan value (set), or leave empty (get)   
            **returns** The pan of `name` IF pan is unspecified
         </span>   

<a class="lift" name="on_complete" href="#on_complete">on_complete</a>



    on_complete(_name:String, handler:lime.helpers.Sound->Void) : Void

<span class="small_desc_flat"> 
            Set the on complete handler for a named audio reference   
            **name** The audio reference name to assign to   
            **handler** The callback to call when playback is complete   
            **returns** nothing   
         </span>   



&nbsp;
&nbsp;
&nbsp;

---  


&nbsp;   
&nbsp;   