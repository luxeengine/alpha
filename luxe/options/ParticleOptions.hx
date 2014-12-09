package luxe.options;

import phoenix.Texture;
import luxe.Vector;
import luxe.Color;

import luxe.options.RenderProperties;

typedef ParticleEmitterOptions = {

    > RenderProperties,

    ? name : String,

    ? particle_image : Texture,
    ? emit_time : Float,
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
    ? end_color_random : Color

} //ParticleEmitterOptions


    //placeholder for the filename
typedef ParticleOptions = {}
