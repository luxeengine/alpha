package luxe.options;

import phoenix.Texture;
import luxe.Vector;
import luxe.Color;

import luxe.options.RenderProperties;

@:keep
@:enum abstract ParticleEmitterType(Int) from Int to Int {
    var luxe = 0;
    var pd_gravity = 1;
    var pd_radial = 2;
}

typedef ParticleEmitterOptions = {

    > RenderProperties,

    ? name : String,

    ? particle_image : Texture,
    ? emit_time : Float,
    ? cache_wrap : Bool,
    ? cache_size : Int,
    ? emit_count : Int,
    ? direction : Float,
    ? direction_random : Float,
    ? speed : Float,
    ? speed_random : Float,
    ? end_speed : Float,
    ? life : Float,
    ? life_random : Float,
    ? rotation : Float,
    ? rotation_random : Float,
    ? end_rotation : Float,
    ? end_rotation_random : Float,
    ? rotation_offset : Float,
    ? direction_vector : Vector,
    ? pos : Vector,
    ? pos_offset : Vector,
    ? pos_random : Vector,
    ? gravity : Vector,
    ? start_size : Vector,
    ? start_size_random : Vector,
    ? end_size : Vector,
    ? end_size_random : Vector,
    ? start_color : Color,
    ? start_color_random : Color,
    ? end_color : Color,
    ? end_color_random : Color,

    ? emitter_type : Int,
    ? default_duration : Float,
    ? y_multiplier : Float,
    ? gravity_radial_accel : Float,
    ? gravity_radial_accel_random : Float,
    ? gravity_tangential_accel : Float,
    ? gravity_tangential_accel_random : Float,
    ? radial_rotation : Float,
    ? radial_rotation_random : Float,
    ? radial_start_radius : Float,
    ? radial_start_radius_random : Float,
    ? radial_end_radius : Float,
    ? radial_end_radius_random : Float,

} //ParticleEmitterOptions


    //placeholder for the filename
typedef ParticleOptions = {}
