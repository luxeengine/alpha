
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to api](api.html)

[Creating sounds](#CreatingSounds)   
[Configuring named sounds](#ConfiguringNamedSounds)   

## Luxe Audio API

To create and play a sound, you can use the following, for **ogg** and **wav** files : 

	Luxe.audio.create('clicksound', 'assets/sounds/click.wav');
	Luxe.audio.volume('clicksound', 0.6);
	Luxe.audio.play('clicksound');

<a name="CreatingSounds" ></a>

###Creating sounds

<a name="create" href="#create">create</a>

	Luxe.audio.create( _name:String, _file:String, ?_forcemusic:Bool = false ) : Void   
<span class="small_desc_flat"> Create a named sound </span>      

<a name="play" href="#play">play</a>

	Luxe.audio.play( _name:String ) : Void   
<span class="small_desc_flat"> Create a named sound </span>      

<a name="ConfiguringNamedSounds" ></a>

###Configuring named sounds

<a name="volume" href="#volume">volume</a>

	Luxe.audio.volume( _name:String, _volume:Float ) : Void   
<span class="small_desc_flat"> Set the volume of the named sound, in the range `[0,1]` </span>      

<a name="pan" href="#pan">pan</a>

	Luxe.audio.pan( _name:String, _pan:Float ) : Void   
<span class="small_desc_flat"> Set the pan of the named sound, in the range `[-1,1]` </span>      



<br/>
<br/>
<br/>