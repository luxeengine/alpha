
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#shaders)
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
---
I have written a comprehensive primer to shaders here!

[Shaders : A primer](http://notes.underscorediscovery.com/shaders-a-primer/)

The series talks about shaders in various ways,   
but for getting started with shaders in luxe, let's move along.

---

&nbsp;
<a name="usage" href="#usage">
## Using shaders in luxe </a>
---

luxe makes using shaders easier by wrapping up the details, allowing you to load and apply shaders to your sprites and geometry easily. It also makes it simple to send information into the shaders.

Take a look at the code from the demo, and you should be able to follow along as to what is happening.

        //we create a variable to hold the shader
    var hue_shader : Shader;

        //and then we load the shader code, and we leave the vertex parameter blank, to use the default shader!
    hue_shader = Luxe.loadShader('assets/huechange.glsl');

        //then we tell the sprite to use this shader when rendering
    hue_sprite.shader = hue_shader;

And finally, when we move the mouse, we send some information to the shader to change the color

    public function onmousemove( e:MouseEvent ) {

        var percent = e.pos.x / Luxe.screen.w;
        var hue = (Math.PI*2) * percent;

            //hue based on mouse x
        hue_shader.set_uniform_float('in_hue', hue);

    }

 ## shader code for the sample
 ---

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

#### full code from sample

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


            var _size = Luxe.screen.h * 0.8;
            if(_size > 512) _size = 512;

            distort_sprite = new Sprite({
                texture : luxe_tex,
                pos : new Vector(_size/2,_size),
                size : new Vector(_size,_size)
            });

            hue_sprite = new Sprite({
                texture : luxe_tex,
                pos : new Vector(_size+(_size*0.05),_size),
                size : new Vector(_size,_size)
            });

            level_sprite = new Sprite({
                texture : level_texture,
                pos : new Vector(Luxe.screen.w/2,Luxe.screen.h/2)
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

            }


        } //ready

        public function ontouchmove( e:TouchEvent ) {
            if(loaded && loaded_logo) {

                var percent = e.x / Luxe.screen.w;
                var hue = (Math.PI*2) * percent;

                    //distort based on mouse x
                distort_shader.set_uniform_float('distortamount', percent);
                    //hue based on mouse x
                hue_shader.set_uniform_float('in_hue', hue);
            }
        }

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


    } //Main

&nbsp;   

###[Back to feature guide](guide.html#shaders)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   