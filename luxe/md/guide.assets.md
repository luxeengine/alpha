
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

### Async 

By design, you should always consider asset loading to be asynchronous.   

If you load assets in a background thread, you wait. If you load assets on web, you wait.
Many game consoles load data async too. For this reason, and for portability, assets are treated as asynchronous.

The separation between _loading_, and _using_ an asset is important.   
To use an asset, it must already be loaded.
The resource manager employs the concept of Promises and Parcels to make this really simple,
and the luxe Game class includes an easy way to quickly load dev assets for prototyping/jamming.

&nbsp;
### Using assets

Once an asset has been loaded (see below) it is stored in the resource manager.   
To retrieve a stored asset by it's id, the following functions are available:

- `Luxe.resources.bytes`
- `Luxe.resources.text`
- `Luxe.resources.json`
- `Luxe.resources.texture`
- `Luxe.resources.font`
- `Luxe.resources.shader`
- `Luxe.resources.sound`

If the asset does not exist (i.e is not loaded) then the function returns null.
Since these functions return concrete types, you can make the code using the resource imperative and deterministic.
For example, this code can rely on the asset being loaded, if I ensured that it was ahead of time.

```
var sprite = new luxe.Sprite({
    pos: Luxe.screen.mid,
    texture: Luxe.resources.texture('assets/image.png')
});
```

&nbsp;
### Loading assets

---

&nbsp;
**Assets need to be loaded before they can be used.**   

`Luxe.resources` has a bunch of `load_*` functions for this purpose.

- `Luxe.resources.load_bytes`
- `Luxe.resources.load_text`
- `Luxe.resources.load_json`
- `Luxe.resources.load_texture`
- `Luxe.resources.load_font`
- `Luxe.resources.load_shader`
- `Luxe.resources.load_sound`

These functions return something called a Promise, which promises a value when it's ready.   
This just means that it will call a function for you, when the asset has finished loading.

&nbsp;   

```
var load = Luxe.resources.load_texture('assets/image.png');

load.then(function(texture:phoenix.Texture) {

    //now use the texture value
    trace('Loaded texture ${texture.id} with size ${texture.width}x${texture.height}');

});

```

&nbsp;   

To handle multiple returned load promises, you can use `Promise.all` from `snow.api.Promise`.
Take note that the array returned from Promise.all will be typed as `Dynamic` if mixing resource types.

&nbsp;   

```
var list = [
    Luxe.resources.load_texture('assets/image.png'),
    Luxe.resources.load_texture('assets/image2.png'),
    Luxe.resources.load_texture('assets/image3.png')
];

var load = Promise.all(list);

load.then(function(loaded:Array<phoenix.Texture>) {
    for(image in loaded) {
        trace('Loaded texture ${image.id}');
    }
});
```

&nbsp;   

**Resource content**   
Some of these load functions return a Resource instance,   
which contains the asset data within it.

For example, to access the loaded text data from a `load_text` call, it will give you a `TextResource`, which contains a `TextAsset`. To access the value, you would use `loaded_text.asset.text`.

The resource [API docs](api/index.html#luxe) have further details.

### Loading assets in a Parcel

A parcel is simply a related group of assets that would like to load together.   
This can include all the assets for your game, or just a subsection like a specific level.

A parcel includes the same default types as listed above, `bytes`, `texts`, `jsons`, `textures`, `fonts`, `shaders` and `sounds`.   
These are simple arrays, that you fill when creating a parcel before calling the load function.

Taken from [a tutorial guide](guide.three.html):

```
var parcel = new luxe.Parcel({
    jsons:[ { id:'assets/anim.json' } ],
    textures : [
        { id: 'assets/apartment.png' },
        { id: 'assets/player.png' }
    ],
});
```

We could now call `parcel.load()` which would load the assets,   
but we would probably like to see a progress bar.

There is a simple default one built in, but you can feel free to implement one yourself.

```
    //this will call a function named assets_loaded when done
new luxe.ParcelProgress({
    parcel      : parcel,
    background  : new Color(1,1,1,0.85),
    oncomplete  : assets_loaded
});

    //load the assets
parcel.load();
```

### The default preload parcel

To aid rapid development and for convenience,   
the `Game` class (your application) offers you a “default preload parcel”.   
This parcel is loaded before anything happens, and assets in it will be available before `ready` is called.

Take note that the preload parcel serves a simple purpose:
- Handle really early asset/data dependency
- Rapid development to avoid creating a parcel manually (yet)

It is not suited for preloading game content in general,
- It does not include a progress bar (no renderer available yet)
- Failed assets in this early loader are fatal, the application stops

This makes it good for early required data, less so for loading levels and menus and so on.

To use the preload parcel, you fill in the parcel arrays within your config function.

```
override function config(config:luxe.AppConfig) {

    config.preload.textures.push({ id:'assets/logo.png' });

    config.preload.jsons = [
        { id:'assets/1.json' },
        { id:'assets/2.json' }
    ];

    return config;

} //config

```

---

&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   