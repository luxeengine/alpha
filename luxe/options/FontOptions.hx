package luxe.options;

import phoenix.Texture;
import phoenix.BitmapFont;
import luxe.resource.ResourceManager;

private typedef FontOptions = {

        /** The resource manager to associate this font with. default: `Luxe.resources` */
    @:optional var resources : ResourceManager;

} //FontOptions

    /** Options for creating/loading a bitmap font */
typedef BitmapFontOptions = {

    > FontOptions,

        /** The file asset id of the font data to use/load. Textures inside the fnt file are loaded relative to the fnt file
            location, use `texture_path` to override this. Required if using load. */
    @:optional var id : String;
        /** An optional path for the font textures. This is to allow the .fnt file to be separate from the texture files.
            Take note that the font fnt file specifies the pages with a path as well, which would become relative to this given path,
            and if this is not specified the images will be relative to the .fnt file. */
    @:optional var texture_path : String;
        /** The callback to call when the font finishes loading */
    @:optional var onload : BitmapFont->Void;
        /** Whether or not this and it's resources load without logging. default: false */
    @:optional var silent : Bool;

        /** Whether or not the texture pages generate mipmaps automatically. default: false */
    @:optional var mipmaps : Bool;
        /** Loaded/assigned textures will use this filter mode. default: linear */
    @:optional var filter : FilterType;
        /** Loaded/assigned textures will use this filter minification mode. default: linear */
    @:optional var filter_min : FilterType;
        /** Loaded/assigned textures will use this filter magnification mode. default: linear */
    @:optional var filter_mag : FilterType;

} //BitmapFontOptions