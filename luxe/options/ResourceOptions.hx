package luxe.options;

import luxe.Parcel;
import snow.api.buffers.Uint8Array;
import snow.systems.assets.Asset;
import phoenix.Texture;

typedef ResourceOptions = {

        /** The unique resource ID.
            If the resource is loaded from disk, this matches the asset id.
            If not from disk, the id can be anything but must be unique to this resource. */
    var id: String;
        /** Internal: The Resources system that contains this resource. Defaults to Luxe.resources,
            and is very rarely required to be specified manually. */
    @:optional var system:Resources;
        /** Internal: The Resource type id for this resource. Usually overridden by the Resource types.
            Corresponds with ResourceType, but used as int for user typed resource type ids. */
    @:optional var resource_type:Int;

} //ResourceOptions

    /** Options for creating a Bytes Resource instance.
        These are usually `load`ed via `Luxe.resources.load_bytes(...)` and
        `fetch`ed via `Luxe.resources.bytes(...)`, not created manually */
typedef BytesResourceOptions = {
    > ResourceOptions,
        /** The snow asset that contains the bytes data, that this resource will hold.*/
    @:optional var asset: AssetBytes;
}

    /** Options for creating a Text Resource instance.
        These are usually `load`ed via `Luxe.resources.load_text(...)` and
        `fetch`ed via `Luxe.resources.text(...)`, not created manually */
typedef TextResourceOptions = {
    > ResourceOptions,
        /** The snow asset that contains the text data, that this resource will hold.*/
    @:optional var asset: AssetText;
}

    /** Options for creating a JSON Resource instance.
        These are usually `load`ed via `Luxe.resources.load_json(...)` and
        `fetch`ed via `Luxe.resources.json(...)`, not created manually */
typedef JSONResourceOptions = {
    > ResourceOptions,
        /** The snow asset that contains the json data, that this resource will hold.*/
    @:optional var asset: AssetJSON;
}

    /** Options for creating an Audio Resource instance.
        These are usually `load`ed via `Luxe.resources.load_audio(...)` and
        `fetch`ed via `Luxe.resources.audio(...)`, not created manually */
typedef AudioResourceOptions = {
    > ResourceOptions,
        /** The snow asset that contains the audio asset, that this resource will hold.*/
    @:optional var asset: AssetAudio;
        /** Whether or not this resource is loaded as a stream */
    @:optional var is_stream: Bool;
}

    /** Options for creating a Texture instance.
        These are usually `load`ed via `Luxe.resources.load_texture(...)` and
        `fetch`ed via `Luxe.resources.texture(...)`.
        Textures are created manually if they are created with specific needs,
        see the Texture documentation for the exact configurations */
typedef TextureOptions = {

    > ResourceOptions,
    > LoadTextureOptions,

        /** When creating a texture manually, the width this texture should be. */
    @:optional var width: Int;
        /** When creating a texture manually, the height this texture should be. */
    @:optional var height: Int;
        /** When creating a texture manually, the pixels for this texture. */
    @:optional var pixels: Uint8Array;

        /** Advanced: Specify the type this texture represents, like Texture 2D, Cube map. */
    @:optional var type: TextureType;
        /** Advanced: Specify the renderer specific format for this texture, i.e `GL.RGBA` or similar.
            Note that this is dependent on the hardware, renderer API level, and more. */
    @:optional var format: TextureFormat;
        /** Advanced: Specify the renderer specific data type for this texture, i.e `GL.UNSIGNED_BYTE` or similar.
            Note that this is dependent on the hardware, renderer API level, and more. */
    @:optional var data_type: TextureDataType;
        /** Advanced: Specify a pre-created renderer specific TextureID for this Texture. */
    @:optional var texture: TextureID;
        /** Advanced: Specify if this is a compressed pixel format */
    @:optional var compressed: Bool;

} //TextureOptions

    /** Options for creating a RenderTexture instance.
        Note that width/height are the mainly used options,
        and if not specified the render target will default to `Luxe.screen` size. */
typedef RenderTextureOptions = {

    > TextureOptions,

} //RenderTextureOptions

typedef BitmapFontOptions = {

    > ResourceOptions,
    > LoadFontOptions,

        /** If creating manually, the font data (requires `pages`) to parse for this font */
    @:optional var font_data:String;
        /** If creating manually, the font pages (requires `font_data`) to use for this font */
    @:optional var pages:Array<Texture>;

} //BitmapFontOptions

typedef ShaderOptions = {

    > ResourceOptions,
    > LoadShaderOptions,

} //ShaderOptions


//Load options

    typedef LoadTextureOptions = {
            /** Specify the minification filter type */
        @:optional var filter_min: FilterType;
            /** Specify the magnification filter type */
        @:optional var filter_mag: FilterType;
            /** Sets the S (horizontal) clamp type */
        @:optional var clamp_s: ClampType;
            /** Sets the T (vertical) clamp type */
        @:optional var clamp_t: ClampType;
            /** Advanced: When reloading from an asset id, the pixels will be
                premultiplied with their alpha value before `submit`.
                Only applies to asset based load calls. Subsequent `submit` calls
                should use Luxe.utils.premultiply_alpha if needed. `default: false` */
        @:optional var load_premultiply_alpha: Bool;
    }

    typedef LoadFontOptions = {
            /** An optional path for the font textures. This is to allow the .fnt file to be separate from the texture files.
                Take note that the font fnt file specifies the pages with a path as well, which would become relative to this given path,
                and if this is not specified the images will be relative to the .fnt file. */
        @:optional var texture_path : String;

    } //LoadFontOptions

    typedef LoadShaderOptions = {
            
            /** The fragment shader asset id */
        var frag_id : String;
            /** The vertex shader asset id */
        var vert_id : String;
            /** Set this to avoid setting any default
                uniforms initially or each frame */
        @:optional var no_default_uniforms : Bool;

    }    

    typedef LoadAudioOptions = {
            
        @:optional var is_stream : Bool;

    }
