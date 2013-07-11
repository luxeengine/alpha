
![Haxe](http://underscorediscovery.com/sven/images/haxe.png) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Logo](http://underscorediscovery.com/sven/images/logo.png)

#[haxelab](../index.html)
## Lab API

All methods and objects are accessible via the Lab class. i.e

`var text_file : String = Lab.loadText('assets/test.txt');`   

### Public objects

[audio](lab.audio.html)   
[debug](lab.debug.html)   
[time](lab.time.html)   
[events](lab.events.html)   
[files](lab.files.html)   

### Public methods

######Core

`shutdown()`

######Assets

`loadText(_id:String) : String`   
`loadTexture(_id:String, ?_onloaded:Texture->Void ) : Texture `   

######Default Renderer

`addGeometry(_geom:Geometry) : Void`   
`removeGeometry(_geom:Geometry) : Void`   

&nbsp;
&nbsp;
&nbsp;

