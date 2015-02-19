package luxe.importers.particledesigner;

import haxe.io.Path;
import luxe.Vector;
import luxe.options.ParticleOptions;
import phoenix.Batcher;

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
}
