package luxe.options;

import luxe.Resources;
import luxe.resource.Resource;
import luxe.Parcel;

typedef ParcelOptions = {

        /** The id of this parcel. */
    @:optional var id: String;
        /** The Resources system that manages this parcel. default: Luxe.resources */
    @:optional var system: Resources;
        /** An optional callback for when all items are loaded in a `load` call.  */
    @:optional var oncomplete: Parcel->Void;
        /** An optional callback for when an item in the parcel completes loading. */
    @:optional var onprogress: ParcelChange->Void;
        /** An optional callback for when an item in the parcel fails to load. */
    @:optional var onfailed: ParcelChange->Void;

        /** A short gap before subsequent loads are triggered.
            Having a small window allows the rendering + progress to update, if
            the load calls are synchronous they will prevent
            updates from happening, having the appearance of freezing. default: `1/20` */
    @:optional var load_time_spacing: Float;
        /** A delay before starting the actually work
            when `load` is called. Having a small window
            allows the rendering + progress to update, if
            the load calls are synchronous they will prevent
            updates from happening, having the appearance of freezing. `default: 0.2` */
    @:optional var load_start_delay: Float;

        /** Adds these bytes items to the parcel initially */
    @:optional var bytes: Array<BytesInfo>;
        /** Adds these text items to the parcel initially */
    @:optional var texts: Array<TextInfo>;
        /** Adds these json items to the parcel initially */
    @:optional var jsons: Array<JSONInfo>;
        /** Adds these texture items to the parcel initially */
    @:optional var textures: Array<TextureInfo>;
        /** Adds these font items to the parcel initially */
    @:optional var fonts: Array<BitmapFontInfo>;
        /** Adds these shader items to the parcel initially */
    @:optional var shaders: Array<ShaderInfo>;
        /** Adds these sound items to the parcel initially */
    @:optional var sounds: Array<SoundInfo>;

} //ParcelOptions
