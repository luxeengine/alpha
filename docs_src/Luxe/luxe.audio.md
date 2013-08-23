
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

#[luxe](index.html)
###[Back to types](types.html)

## Luxe Audio API

To create and play a sound, you can use the following, for **ogg** and **wav** files : 

	Luxe.audio.create('clicksound', 'assets/sounds/click.wav');
	Luxe.audio.volume('clicksound', 0.6);
	Luxe.audio.play('clicksound');

_Create a named sound_

**create**	sound name, sound file, force music?
`Luxe.audio.create(_name:String,_file:String, ?_forcemusic:Bool = false ) : Void`   

_Play a sound a by name_

**play**	sound name   
`Luxe.audio.play(_name:String) : Void`    

_Configure a sound by name_

**volume**	sound name, volume value [0,1]   
   `Luxe.audio.volume(_name:String, _volume:Float) : Void`   

**pan**		sound name, pan value [_1, 1]   
   `Luxe.audio.pan(_name:String, _pan:Float) : Void`