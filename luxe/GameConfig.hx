package luxe;

import luxe.Parcel;

typedef GameConfig = {
    > snow.types.Types.AppConfig,
    ? headless : Bool,
    ? use_device_pixels : Bool,
    ? preload: {
        ? bytes: Array<BytesInfo>,
        ? texts: Array<TextInfo>,
        ? jsons: Array<JSONInfo>,
        ? textures: Array<TextureInfo>,
        ? fonts: Array<BitmapFontInfo>,
        ? shaders: Array<ShaderInfo>,
        ? sounds: Array<SoundInfo>
    }
}