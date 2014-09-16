
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

---
## Assets

The following asset types are supported directly by the API for convenience :

- **textures** ( images, png, jpg, tga, psd, gif, bmp )
- **text assets** ( any format, xml, txt etc )
- **json assets** ( parses and returns a usable json object )
- **sound assets** ( audio, ogg/wav/pcm )
- **bitmap fonts** ( a text .fnt description + image files [see font guide](guide.fonts.html) )
- **shader files** ( glsl shaders, with custom vertex or fragment shaders )
- **binary files** ( any binary byte data )

&nbsp;
### Loading assets via the luxe API

---

To load assets from luxe you simply use the `Luxe` object, and call any of the functions :


- Luxe.loadText : `TextResource`
- Luxe.loadJSON : `JSONResource`
- Luxe.loadData : `DataResource`
- Luxe.loadSound : `SoundResource`
- Luxe.loadTexture : `Phoenix.texture`
- Luxe.loadTextures : `Array<phoenix.Texture>`
- Luxe.loadFont : `phoenix.BitmapFont`
- Luxe.loadShader : `phoenix.Shader`


It's important to note that a `Resource` instance holds the data inside of it, where some asset types (like a Texture) are already a Resource instance. What this means is that a TextResource, DataResource, or SoundResource are not the "final" object. A text resource holds a string, yet it does not return a string. This is because the resource manager will hold onto your assets for you, so you can manually control their lifetime if you need to, or reload them from the source asset.

To access to information itself, you would access the `text` property on the `TextResource`. For JSON, it's data is named `json`. For data, it's named `data` and so on. The resource [API docs](api/index.html#luxe) have all the details.

### Async 

By design, and by default, you should always consider asset loading to be asynchronous. If you load assets in a background thread, you wait. If you load assets on web, you wait. For this reason, [parcels](guide.parcels.html) are used to simplify this work, but also all loading functions have an oncomplete handler that you can leverage.

Where things can load in safely (like a texture) the engine will account for asset loading allowing immediate use of the instance without anything breaking down. This of course will result in textures popping into place or geometry not showing up until it has loaded (and if the asset is not found, not at all) so preloading or loading your assets async-aware is very important.

It is not an optional design pattern for small to large games, but as much as possible, luxe will gracefully wait for assets to complete to ease development. This will continue to be the case and improve over time as well.

_note : async loading implies that the calling code returns immediately, not that the asset itself will be loaded in the background. Loading can still block, and any GPU resources (like shaders or textures) will always block the main loop, as this is unnavoidable and how GPU resources work._


---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   