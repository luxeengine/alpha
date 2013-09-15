
[![Logo](http://luxeengine.com/images/logo.png)](index.html)


###[View all guides](guide.html)


### Assets

Currently luxe supports loading assets and resources from the assets paths described in your [project file](guide.projects.html). 
**Take note** that the id specified for an asset is relative to the `<assets />` tag inside your project file. See the section marked `the asset tag` below.
The following asset types are supported by the API for convenience :

- **textures** ( images, currently png/jpg )
- **text assets** ( any format, json, xml, txt )
- **bitmap fonts** ( usually a text description + image files )
- **shader files** ( currently glsl shaders )
- **binary files** ( any binary byte data )

&nbsp;
### Loading assets via the luxe API
&nbsp;

    loadText(_id:String) : String

Loads a text asset by id, and returns the data as string. If you are looking for binary files, see `loadData`.

    loadTexture(_id:String, ?_onloaded:Texture->Void ) : Texture

Loads an image file ( png/jpg ) by id, and takes an optional callback for when the loading is complete. **On native platforms loading is synchronous.** The callback is especially helpful for html5.

    loadFont( _id:String, ?_path:String, ?_onloaded:Void->Void ) : BitmapFont

    var font = Luxe.loadFont('font.fnt', 'assets/fonts/');

Loads a bitmap font file by id, but the path must be specified separately at the moment because fonts store the images separately. Also takes an optional callback for when the loading is complete. _On native platforms loading is synchronous._ The callback is especially helpful for html5.

    loadShader( ?_ps_id:String='default', ?_vs_id:String='default', ?_onloaded:Shader->Void ) : Shader

    var shader = Luxe.loadShader('textured', 'assets/shaders/customvert.glsl');
    var shader = Luxe.loadShader('assets/shaders/cooleffect.glsl');

Loads a shader, with a pixel shader and vertex shader file. If the fragment id (`_ps_id`) is `default`, the untextured colored geometry shader is used. If the fragment id is `textured`, the default internal textured shader is used. If the vertex shader id (`_vs_id`) is `default` the default vertex shader is used. Also takes an optional callback for when the loading is complete. _On native platforms loading is synchronous._ The callback is especially helpful for html5.

### Loading assets via the luxe API