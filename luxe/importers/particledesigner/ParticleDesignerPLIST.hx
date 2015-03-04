package luxe.importers.particledesigner;

import luxe.Vector;
import luxe.Color;
import luxe.options.ParticleOptions;
import phoenix.Batcher;

class ParticleDesignerPLIST {
    public static function parse(id:String, batcher_group:Int, ?opts:ParticleEmitterOptions):ParticleEmitterOptions {
        var root = Xml.parse(Luxe.loadText(id).text).firstElement().firstElement();

        if (root.nodeName != "dict") {
            throw 'expecting "dict", but "${root.nodeName}" found';
        }

        var key:String = null;
        var map:Map<String, Dynamic> = new Map<String, Dynamic>();

        for (node in root.elements()) {
            if (key == null) {
                if (node.nodeName == "key") {
                    key = parse_inner_text(node);

                    if (key == "") {
                        throw "empty key is not supported";
                    }

                    continue;
                }

                throw 'expecting element "key", but "${node.nodeName}" found';
            }

            var textValue = parse_inner_text(node);

            switch (node.nodeName) {
                case "false":
                    map[key] = false;

                case "true":
                    map[key] = true;

                case "real":
                    var value = Std.parseFloat(textValue);

                    if (Math.isNaN(value)) {
                        throw 'could not parse "${textValue}" as real (for key "${key}")';
                    }

                    map[key] = value;

                case "integer":
                    var value = Std.parseInt(textValue);

                    if (value == null) {
                        throw 'could not parse "${textValue}" as integer (for key "${key}")';
                    }

                    map[key] = value;

                case "string":
                    map[key] = textValue;

                default:
                    throw 'unsupported element "${node.nodeName}"';
            }

            key = null;
        }

        var emit_count = parse_int(map, "maxParticles");
        var life = parse_float(map, "particleLifespan");

        ParticleDesigner._setup_batcher(
            parse_int(map, "blendFuncSource"),
            parse_int(map, "blendFuncDestination"),
            batcher_group
        );

        return {
            // common
            name: (opts != null && opts.name != null ? opts.name : id),
            particle_image: ParticleDesigner._load_texture(parse_string(map, "textureImageData"), parse_string(map, "textureFileName"), id),
            emit_count: emit_count,
            cache_size: emit_count,
            emit_time: 1.0 / (emit_count / life),
            life: life,
            life_random: parse_float(map, "particleLifespanVariance"),
            pos_random: parse_vector(map, "sourcePositionVariance"),
            start_color: parse_color(map, "startColor"),
            start_color_random: parse_color(map, "startColorVariance"),
            end_color: parse_color(map, "finishColor"),
            end_color_random: parse_color(map, "finishColorVariance"),
            start_size: ParticleDesigner._make_vector(parse_float(map, "startParticleSize")),
            start_size_random: ParticleDesigner._make_vector(parse_float(map, "startParticleSizeVariance")),
            end_size: ParticleDesigner._make_vector(parse_float(map, "finishParticleSize")),
            end_size_random: ParticleDesigner._make_vector(parse_float(map, "finishParticleSizeVariance")),
            rotation: parse_float(map, "rotationStart"),
            rotation_random: parse_float(map, "rotationStartVariance"),
            end_rotation: parse_float(map, "rotationEnd"),
            end_rotation_random: parse_float(map, "rotationEndVariance"),
            direction: parse_float(map, "angle"),
            direction_random: parse_float(map, "angleVariance"),
            emitter_type: parse_int(map, "emitterType") + 1,
            default_duration: parse_float(map, "duration"),
            y_multiplier: (parse_int(map, "yCoordFlipped") == 1 ? -1.0 : 1.0),
            group: batcher_group,

            // gravity
            gravity: parse_vector(map, "gravity"),
            speed: parse_float(map, "speed"),
            speed_random: parse_float(map, "speedVariance"),
            gravity_radial_accel: parse_float(map, "radialAcceleration"),
            gravity_radial_accel_random: parse_float(map, "radialAccelVariance"),
            gravity_tangential_accel: parse_float(map, "tangentialAcceleration"),
            gravity_tangential_accel_random: parse_float(map, "tangentialAccelVariance"),

            // radial
            radial_rotation: parse_float(map, "rotatePerSecond"),
            radial_rotation_random: parse_float(map, "rotatePerSecondVariance"),
            radial_start_radius: parse_float(map, "minRadius"),
            radial_start_radius_random: parse_float(map, "minRadiusVariance"),
            radial_end_radius: parse_float(map, "maxRadius"),
            radial_end_radius_random: parse_float(map, "maxRadiusVariance"),
        };
    }

    private static function parse_string(map:Map<String, Dynamic>, key:String):String {
        var value = map[key];
        return (value == null ? "" : Std.string(value));
    }

    private static function parse_int(map:Map<String, Dynamic>, key:String):Int {
        var value = map[key];

        if (Std.is(value, Int)) {
            return value;
        } else if (Std.is(value, Float)) {
            return Std.int(value);
        } else {
            return 0;
        }
    }

    private static function parse_float(map:Map<String, Dynamic>, key:String):Float {
        var value = map[key];

        if (Std.is(value, Float) || Std.is(value, Float)) {
            return value;
        } else {
            return 0.0;
        }
    }

    private static function parse_vector(map:Map<String, Dynamic>, prefix:String):Vector {
        return new Vector(parse_float(map, '${prefix}x'), parse_float(map, '${prefix}y'));
    }

    private static function parse_color(map:Map<String, Dynamic>, prefix:String):Color {
        return new Color(
            parse_float(map, '${prefix}Red'),
            parse_float(map, '${prefix}Green'),
            parse_float(map, '${prefix}Blue'),
            parse_float(map, '${prefix}Alpha')
        );
    }

    private static function parse_inner_text(node:Xml):String {
        var child = node.firstChild();

        if (child != null && (child.nodeType == Xml.PCData || child.nodeType == Xml.CData)) {
            return child.nodeValue;
        }

        return "";
    }
}
