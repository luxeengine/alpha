package luxe.importers.particledesigner;

import haxe.crypto.Base64;
import haxe.io.BytesInput;
import haxe.io.Path;
import luxe.Vector;
import luxe.options.ParticleOptions;
import phoenix.Batcher;
import phoenix.Texture;
import luxe.importers.tiff.TiffDecoder;

class ParticleDesigner {
    public static function parse(id:String, batcher_group:Int, ?opts:ParticleEmitterOptions):ParticleEmitterOptions {
        var ext = Path.extension(id).toLowerCase();

        switch (ext) {
            case "plist":
                return ParticleDesignerPLIST.parse(id, batcher_group, opts);

            case "json":
                return ParticleDesignerJSON.parse(id, batcher_group, opts);

            case "pex" | "lap":
                return ParticleDesignerPEXLAP.parse(id, batcher_group, opts);

            default:
                throw 'unsupported extension "${ext}"';
        }
    }

    public static function _setup_batcher(src_mode:BlendMode, dst_mode:BlendMode, batcher_group:Int):Void {
        if (src_mode == BlendMode.one) {
            src_mode = BlendMode.src_alpha;
        }

        Luxe.renderer.batcher.add_group(
            batcher_group,
            function (b:Batcher) {
                Luxe.renderer.blend_mode(src_mode, dst_mode);
            },
            function (b:Batcher){
                Luxe.renderer.blend_mode();
            }
        );
    }

    public static function _make_vector(value:Float):Vector {
        return new Vector(value, value);
    }

    public static function _load_texture(texture_image_data:String, texture_file_name:String, id:String):Texture {
        if (texture_image_data == null || texture_image_data.length == 0) {
            return Luxe.loadTexture(Path.directory(id) + "/" + texture_file_name);
        }

        var data = Base64.decode(texture_image_data);

        if (data.get(0) == 0x1f && data.get(1) == 0x8b) {
            #if format
                var reader = new format.gz.Reader(new BytesInput(data));
                data = reader.read().data;
            #else
                throw "haxelib \"format\" is required for compressed embedded textures";
            #end
        }

        var decoded = TiffDecoder.decode(data);
        return Texture.load_from_pixels(id + ":texture", decoded.width, decoded.height, decoded.pixels);
    }
}
