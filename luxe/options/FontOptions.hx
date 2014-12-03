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

        /** The file asset id of the font data to use/load, exluding paths/folder. Required if using load. */
    @:optional var id : String;
        /** The path of the font textures. Textures are separate using embedded paths. default: 'assets/' */
    @:optional var path : String;
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