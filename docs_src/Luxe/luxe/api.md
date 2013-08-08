
![Logo](http://underscorediscovery.com/sven/images/logo.png)

#[luxe](../index.html)
## Luxe API

All methods and objects are accessible via the Luxe class. i.e

`var text_file : String = Luxe.loadText('assets/test.txt');`   

### Public objects

[audio](luxe.audio.html)   
[time](luxe.time.html)   
[events](luxe.events.html)   

### Public methods

######Core

`shutdown()`

######Assets

`loadText(_id:String) : String`   
`loadTexture(_id:String, ?_onloaded:Texture->Void ) : Texture `   

######Access to the Default Renderer

`addGeometry(_geom:Geometry) : Void`   
`removeGeometry(_geom:Geometry) : Void`   

&nbsp;
&nbsp;
&nbsp;

