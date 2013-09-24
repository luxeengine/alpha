
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

    public function ready() {

    	var luxe_tex = Luxe.loadTexture('assets/luxe.png');
    	
    	var level_texture = Luxe.loadTexture('assets/level.png');
    		level_texture.filter = phoenix.Texture.FilterType.nearest;

    	var distort_map = Luxe.loadTexture('assets/distort.png');
    		

    	distort_sprite = new Sprite({
    		texture : luxe_tex,
    		pos : new Vector(150,320)
    	});

    	hue_sprite = new Sprite({
    		texture : luxe_tex,
    		pos : new Vector(430,320)
    	});

    	level_sprite = new Sprite({
    		texture : level_texture,
    		pos : new Vector(480,320)
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
    		level_sprite.scale = new Vector(4,4);
    		level_tiltshift = Luxe.loadShader('assets/gray_tilt_shift.glsl');
	    	level_sprite.shader = level_tiltshift;
    	} //level tex on load

    	distort_map.onload = function(tt) {
	    	
	    	distort_shader = Luxe.loadShader('assets/distort.glsl');
	    	distort_sprite.shader = distort_shader;

	    		//move to second slot
	    	distort_map.slot = 1;
	    		//set the uniform
	    	distort_shader.set_uniform_texture('tex1', distort_map);

	    	loaded = true;

    	}	


    } //ready

    public function onmousemove( e:MouseEvent ) {

    	if(loaded && loaded_logo) {

	    	var percent = e.pos.x / Luxe.screen.w;
    		var hue = (Math.PI*2) * percent;

    			//distort based on mouse x
    		distort_shader.set_uniform_float('distortamount', percent);
    			//hue based on mouse x 
    		hue_shader.set_uniform_float('in_hue', hue);
    	}

    }

    public function onkeyup( e:KeyEvent ) {

        if(e.key == KeyValue.escape) {
            Luxe.shutdown();
        }
        
    } //onkeyup

    public function update(dt:Float) {

    } //update

} //Main