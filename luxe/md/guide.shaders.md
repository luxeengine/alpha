
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)


[jump to luxe shader usage?](#usage)

## Shaders in luxe
---

Mouse x axis controls the distortion in the distort shader.   
Mouse x axis controls the hue degrees in the Hue change shader.    
Level background has a severe tilt shift shader that also desaturates the image.   

<div data-content="samples/test_shaders/index.html" class="sample"> <p>Click to run example</p> </div>

---
## Wait, what are shaders exactly?

I have written a comprehensive primer to shaders here!

[Shaders : A primer](http://notes.underscorediscovery.com/shaders-a-primer/)

The series talks about shaders in various ways,   
but for getting started with shaders in luxe, let's move along.

<a name="usage" href="#usage">
## Using shaders in luxe </a>
---

luxe makes using shaders easier by wrapping up the details, allowing you to load and apply shaders to your sprites and geometry easily. It also makes it simple to send information into the shaders.

Take a look at the code from the demo, and you should be able to follow along as to what is happening.

        //we create a variable to hold the shader
    var hue_shader : Shader;

        //and then we fetch the already loaded shader 
    hue_shader = Luxe.resources.shader('hue');

        //then we tell the sprite to use this shader when rendering
    hue_sprite.shader = hue_shader;

And finally, when we move the mouse, we send some information to the shader to change the color

    override function onmousemove( e:MouseEvent ) {

        var percent = e.pos.x / Luxe.screen.w;
        var hue = (Math.PI*2) * percent;

            //hue based on mouse x
        hue_shader.set_float('in_hue', hue);

    }

 ---

## shader code

This is one of the two shaders shown

#### distort.glsl

```glsl
uniform sampler2D tex0;
uniform sampler2D tex1;

varying vec2 tcoord;
varying vec4 color;

uniform float distortamount;

void main() {

    vec4 direction = texture2D(tex1, tcoord);
    vec4 c = texture2D(tex0, tcoord + distortamount * (direction.rg - vec2(0.5, 0.5)));

    gl_FragColor = c;

}
```

---

## full code 

_can be found at tests/rendering/shaders/_

```

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

```
&nbsp;   

###[Back to feature guide](guide.html#list)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   