package luxe;

import luxe.Parcel;

typedef AppConfig = {
    > snow.types.Types.AppConfig,
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