package luxe.importers.particledesigner;

import luxe.Vector;
import luxe.Color;
import luxe.options.ParticleOptions;
import phoenix.Batcher;

class ParticleDesignerJSON {
    public static function parse(id:String, batcher_group:Int, ?opts:ParticleEmitterOptions):ParticleEmitterOptions {
        var json = Luxe.loadJSON(id).json;

        var emit_count = parse_int(json, "maxParticles");
        var life = parse_float(json, "particleLifespan");

        ParticleDesigner._setup_batcher(
            parse_int(json, "blendFuncSource"),
            parse_int(json, "blendFuncDestination"),
            batcher_group
        );

        return {
            // common
            name: (opts != null && opts.name != null ? opts.name : id),
            particle_image: ParticleDesigner._load_texture(parse_string(json, "textureImageData"), parse_string(json, "textureFileName"), id),
            emit_count: emit_count,
            cache_size: emit_count,
            emit_time: 1.0 / (emit_count / life),
            life: life,
            life_random: parse_float(json, "particleLifespanVariance"),
            pos_random: parse_vector(json, "sourcePositionVariance"),
            start_color: parse_color(json, "startColor"),
            start_color_random: parse_color(json, "startColorVariance"),
            end_color: parse_color(json, "finishColor"),
            end_color_random: parse_color(json, "finishColorVariance"),
            start_size: ParticleDesigner._make_vector(parse_float(json, "startParticleSize")),
            start_size_random: ParticleDesigner._make_vector(parse_float(json, "startParticleSizeVariance")),
            end_size: ParticleDesigner._make_vector(parse_float(json, "finishParticleSize")),
            end_size_random: ParticleDesigner._make_vector(parse_float(json, "finishParticleSizeVariance")),
            rotation: parse_float(json, "rotationStart"),
            rotation_random: parse_float(json, "rotationStartVariance"),
            end_rotation: parse_float(json, "rotationEnd"),
            end_rotation_random: parse_float(json, "rotationEndVariance"),
            direction: parse_float(json, "angle"),
            direction_random: parse_float(json, "angleVariance"),
            emitter_type: parse_int(json, "emitterType") + 1,
            default_duration: parse_float(json, "duration"),
            y_multiplier: (parse_int(json, "yCoordFlipped") == 1 ? -1.0 : 1.0),

            // gravity
            gravity: parse_vector(json, "gravity"),
            speed: parse_float(json, "speed"),
            speed_random: parse_float(json, "speedVariance"),
            gravity_radial_accel: parse_float(json, "radialAcceleration"),
            gravity_radial_accel_random: parse_float(json, "radialAccelVariance"),
            gravity_tangential_accel: parse_float(json, "tangentialAcceleration"),
            gravity_tangential_accel_random: parse_float(json, "tangentialAccelVariance"),

            // radial
            radial_rotation: parse_float(json, "rotatePerSecond"),
            radial_rotation_random: parse_float(json, "rotatePerSecondVariance"),
            radial_start_radius: parse_float(json, "minRadius"),
            radial_start_radius_random: parse_float(json, "minRadiusVariance"),
            radial_end_radius: parse_float(json, "maxRadius"),
            radial_end_radius_random: parse_float(json, "maxRadiusVariance"),
        };
    }

    private static function parse_string(json:Dynamic, field:String):String {
        var value = Reflect.field(json, field);
        return (value == null ? "" : Std.string(value));
    }

    private static function parse_int(json:Dynamic, field:String):Int {
        var value = Reflect.field(json, field);

        if (Std.is(value, Int)) {
            return value;
        } else if (Std.is(value, Float)) {
            return Std.int(value);
        } else {
            return 0;
        }
    }

    private static function parse_float(json:Dynamic, field:String):Float {
        var value = Reflect.field(json, field);

        if (Std.is(value, Float) || Std.is(value, Float)) {
            return value;
        } else {
            return 0.0;
        }
    }

    private static function parse_vector(json:Dynamic, prefix:String):Vector {
        return new Vector(parse_float(json, '${prefix}x'), parse_float(json, '${prefix}y'));
    }

    private static function parse_color(json:Dynamic, prefix:String):Color {
        return new Color(
            parse_float(json, '${prefix}Red'),
            parse_float(json, '${prefix}Green'),
            parse_float(json, '${prefix}Blue'),
            parse_float(json, '${prefix}Alpha')
        );
    }
}
