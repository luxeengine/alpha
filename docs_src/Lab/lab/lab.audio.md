
![Haxe](http://underscorediscovery.com/sven/images/haxe.png) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Logo](http://underscorediscovery.com/sven/images/logo.png)

#[haxelab](../index.html)
###[Back to types](types.html)


To create and play a sound, you can currently use : 

	Lab.audio.create('clicksound', 'assets/sounds/click.wav');
	Lab.audio.volume('clicksound', 0.6);
	Lab.audio.play('clicksound');

_Create a named sound_

**create**	sound name, sound file, force music?
`Lab.audio.create(_name:String,_file:String, ?_forcemusic:Bool = false ) : Void`   

_Play a sound a by name_

**play**	sound name   
`Lab.audio.play(_name:String) : Void`    

_Configure a sound by name_

**volume**	sound name, volume value [0,1]   
   `Lab.audio.volume(_name:String, _volume:Float) : Void`   

**pan**		sound name, pan value [_1, 1]   
   `Lab.audio.pan(_name:String, _pan:Float) : Void`