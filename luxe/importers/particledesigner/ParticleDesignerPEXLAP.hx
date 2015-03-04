package luxe.importers.particledesigner;

import luxe.Vector;
import luxe.Color;
import luxe.options.ParticleOptions;
import phoenix.Batcher;

class ParticleDesignerPEXLAP {
    public static function parse(id:String, batcher_group:Int, ?opts:ParticleEmitterOptions):ParticleEmitterOptions {
        var root = Xml.parse(Luxe.loadText(id).text).firstElement();

        if (root.nodeName != "particleEmitterConfig" && root.nodeName != "lanicaAnimoParticles") {
            throw 'expecting "particleEmitterConfig" or "lanicaAnimoParticles", but "${root.nodeName}" found';
        }

        var map:Map<String, Xml> = new Map<String, Xml>();

        for (node in root.elements()) {
            map[node.nodeName] = node;
        }

        var emit_count = parse_int_node(map["maxParticles"]);
        var life = parse_float_node(map["particleLifeSpan"]);

        ParticleDesigner._setup_batcher(
            parse_int_node(map["blendFuncSource"]),
            parse_int_node(map["blendFuncDestination"]),
            batcher_group
        );

        return {
            // common
            name: (opts != null && opts.name != null ? opts.name : id),
            particle_image: ParticleDesigner._load_texture(parse_string_node(map["texture"], "data"), parse_string_node(map["texture"], "name"), id),
            emit_count: emit_count,
            cache_size: emit_count,
            emit_time: 1.0 / (emit_count / life),
            life: life,
            life_random: parse_float_node(map["particleLifespanVariance"]),
            pos_random: parse_vector_node(map["sourcePositionVariance"]),
            start_color: parse_color_node(map["startColor"]),
            start_color_random: parse_color_node(map["startColorVariance"]),
            end_color: parse_color_node(map["finishColor"]),
            end_color_random: parse_color_node(map["finishColorVariance"]),
            start_size: ParticleDesigner._make_vector(parse_float_node(map["startParticleSize"])),
            start_size_random: ParticleDesigner._make_vector(parse_float_node(map["startParticleSizeVariance"])),
            end_size: ParticleDesigner._make_vector(parse_float_node(map["finishParticleSize"])),
            end_size_random: ParticleDesigner._make_vector(parse_float_node(map["finishParticleSizeVariance"])),
            rotation: parse_float_node(map["rotationStart"]),
            rotation_random: parse_float_node(map["rotationStartVariance"]),
            end_rotation: parse_float_node(map["rotationEnd"]),
            end_rotation_random: parse_float_node(map["rotationEndVariance"]),
            direction: parse_float_node(map["angle"]),
            direction_random: parse_float_node(map["angleVariance"]),
            emitter_type: parse_int_node(map["emitterType"]) + 1,
            default_duration: parse_float_node(map["duration"]),
            y_multiplier: (parse_int_node(map["yCoordFlipped"]) == 1 ? -1.0 : 1.0),
            group: batcher_group,

            // gravity
            gravity: parse_vector_node(map["gravity"]),
            speed: parse_float_node(map["speed"]),
            speed_random: parse_float_node(map["speedVariance"]),
            gravity_radial_accel: parse_float_node(map["radialAcceleration"]),
            gravity_radial_accel_random: parse_float_node(map["radialAccelVariance"]),
            gravity_tangential_accel: parse_float_node(map["tangentialAcceleration"]),
            gravity_tangential_accel_random: parse_float_node(map["tangentialAccelVariance"]),

            // radial
            radial_rotation: parse_float_node(map["rotatePerSecond"]),
            radial_rotation_random: parse_float_node(map["rotatePerSecondVariance"]),
            radial_start_radius: parse_float_node(map["minRadius"]),
            radial_start_radius_random: parse_float_node(map["minRadiusVariance"]),
            radial_end_radius: parse_float_node(map["maxRadius"]),
            radial_end_radius_random: parse_float_node(map["maxRadiusVariance"]),
        };
    }

    private static function parse_string_node(node:Xml, att:String):String {
        if (node == null) {
            return "";
        }

        var value = node.get(att);
        return (value == null ? "" : value);
    }

    private static function parse_int_node(node:Xml):Int {
        return (node == null ? 0 : parse_int_string(node.get("value")));
    }

    private static function parse_float_node(node:Xml):Float {
        return (node == null ? 0 : parse_float_string(node.get("value")));
    }

    private static function parse_vector_node(node:Xml):Vector {
        if (node == null) {
            return new Vector();
        }

        return new Vector(parse_float_string(node.get("x")), parse_float_string(node.get("y")));
    }

    private static function parse_color_node(node:Xml):Color {
        if (node == null) {
            return new Color();
        }

        return new Color(
            parse_float_string(node.get("red")),
            parse_float_string(node.get("green")),
            parse_float_string(node.get("blue")),
            parse_float_string(node.get("alpha"))
        );
    }

    private static function parse_int_string(s:String):Int {
        if (s == null) {
            return 0;
        }

        var result = Std.parseInt(s);
        return (result == null ? 0 : result);
    }

    private static function parse_float_string(s:String):Float {
        if (s == null) {
            return 0;
        }

        var result = Std.parseFloat(s);
        return (Math.isNaN(result) ? 0.0 : result);
    }
}
