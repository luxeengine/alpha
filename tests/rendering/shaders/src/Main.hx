
import luxe.Input;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import phoenix.Shader;


class Main extends luxe.Game {


	var distort_sprite : Sprite;
	var hue_sprite : Sprite;
	var level_sprite : Sprite;

	var level_tiltshift : Shader;
	var hue_shader : Shader;
	var distort_shader : Shader;

	var loaded : Bool = false;
	var loaded_logo : Bool = false;


    override function ready() {

    	var luxe_tex = Luxe.loadTexture('assets/luxe.png');

    	var level_texture = Luxe.loadTexture('assets/level.png');
    		level_texture.filter = phoenix.Texture.FilterType.nearest;

    	var distort_map = Luxe.loadTexture('assets/distort.png');


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
    	luxe_tex.onload = function(tt) {

    		distort_sprite.scale = new Vector(0.5,0.5);
	    	hue_sprite.scale = new Vector(0.5,0.5);

	    	hue_shader = Luxe.loadShader('assets/huechange.glsl');
	    	hue_sprite.shader = hue_shader;

	    	loaded_logo = true;

    	} //luxe_tex on load

    	level_texture.onload = function(tt) {

            level_sprite.scale = new Vector(Luxe.screen.w/240,Luxe.screen.h/160);

            // #if !mobile
    		  level_tiltshift = Luxe.loadShader('assets/gray_tilt_shift.glsl');
	    	  level_sprite.shader = level_tiltshift;
            // #end

    	} //level tex on load

    	distort_map.onload = function(tt) {

	    	distort_shader = Luxe.loadShader('assets/distort.glsl');
	    	distort_sprite.shader = distort_shader;

	    		//move to second slot
	    	distort_map.slot = 1;
	    		//set the uniform
	    	distort_shader.set_uniform_texture('tex1', distort_map);

	    	loaded = true;

    	} //distort map onload

    } //ready

    override function ontouchmove( e:TouchEvent ) {

        if(loaded && loaded_logo) {

            var percent = e.x / Luxe.screen.w;
            var hue = (Math.PI*2) * percent;

                //distort based on mouse x
            distort_shader.set_uniform_float('distortamount', percent);
                //hue based on mouse x
            hue_shader.set_uniform_float('in_hue', hue);
        }

    } //ontouchmove

    override function onmousemove( e:MouseEvent ) {

    	if(loaded && loaded_logo) {

	    	var percent = e.pos.x / Luxe.screen.w;
    		var hue = (Math.PI*2) * percent;

    			//distort based on mouse x
    		distort_shader.set_uniform_float('distortamount', percent);
    			//hue based on mouse x
    		hue_shader.set_uniform_float('in_hue', hue);
    	}

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.ESCAPE) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Main
