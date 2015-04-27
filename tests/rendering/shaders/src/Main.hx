
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import phoenix.Shader;
import phoenix.Texture.FilterType;


class Main extends luxe.Game {


	var distort_sprite : Sprite;
	var hue_sprite : Sprite;
	var level_sprite : Sprite;

	var level_tiltshift : Shader;
	var hue_shader : Shader;
	var distort_shader : Shader;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/level.png' });
        config.preload.textures.push({ id:'assets/luxe.png' });
        config.preload.textures.push({ id:'assets/distort.png' });

        config.preload.shaders.push({ id:'hue', frag_id:'assets/huechange.glsl', vert_id:'default' });
        config.preload.shaders.push({ id:'gray-tilt', frag_id:'assets/gray_tilt_shift.glsl', vert_id:'default' });
        config.preload.shaders.push({ id:'distort', frag_id:'assets/distort.glsl', vert_id:'default' });

        return config;

    } //config


    override function ready() {

    	var luxe_tex = Luxe.resources.texture('assets/luxe.png');
    	var level_texture = Luxe.resources.texture('assets/level.png');
        var distort_map = Luxe.resources.texture('assets/distort.png');

    		level_texture.filter_min = level_texture.filter_mag = FilterType.nearest;

        var _size = Luxe.screen.h * 0.8;
        if(_size > 512) _size = 512;

    	distort_sprite = new Sprite({
    		texture : luxe_tex,
    		pos : new Vector(_size/2,_size),
            size : new Vector(_size,_size),
            depth : 2
    	});

    	hue_sprite = new Sprite({
    		texture : luxe_tex,
    		pos : new Vector(_size+(_size*0.05),_size),
            size : new Vector(_size,_size),
            depth : 2
    	});

    	level_sprite = new Sprite({
    		texture : level_texture,
    		pos : new Vector(Luxe.screen.w/2,Luxe.screen.h/2),
            depth : 0
    	});

    		//for the logo blocks image

		distort_sprite.scale = new Vector(0.5,0.5);
    	hue_sprite.scale = new Vector(0.5,0.5);

    	hue_shader = Luxe.resources.shader('hue');
    	hue_sprite.shader = hue_shader;

        level_sprite.scale = new Vector(Luxe.screen.w/240,Luxe.screen.h/160);

        // #if !mobile
		  level_tiltshift = Luxe.resources.shader('gray-tilt');
    	  level_sprite.shader = level_tiltshift;
        // #end

    	distort_shader = Luxe.resources.shader('distort');
    	distort_sprite.shader = distort_shader;

    		//move to second slot
    	distort_map.slot = 1;
    		//set the uniform
    	distort_shader.set_texture('tex1', distort_map);

    } //ready

    #if mobile
        override function ontouchmove( e:TouchEvent ) {

            var percent = e.x / Luxe.screen.w;
            var hue = (Math.PI*2) * percent;

                //distort based on mouse x
            distort_shader.set_float('distortamount', percent);
                //hue based on mouse x
            hue_shader.set_float('in_hue', hue);

        } //ontouchmove
    #end //mobile

    override function onmousemove( e:MouseEvent ) {

    	var percent = e.pos.x / Luxe.screen.w;
		var hue = (Math.PI*2) * percent;

			//distort based on mouse x
		distort_shader.set_float('distortamount', percent);
			//hue based on mouse x
		hue_shader.set_float('in_hue', hue);

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
