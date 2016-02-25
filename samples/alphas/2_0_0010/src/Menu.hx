
import luxe.resource.Resource.AudioResource;
import luxe.tween.Actuate;
import luxe.Sprite;
import luxe.tween.actuators.GenericActuator.IGenericActuator;
import luxe.Vector;
import luxe.States;
import luxe.Text;
import luxe.Color;
import luxe.Entity;
import luxe.Input;
import luxe.Particles;
import phoenix.Batcher;
import snow.types.Types.AudioHandle;

class Menu extends luxe.State {

    var detail_top: Sprite;
    var stones_top: Sprite;
    var stones_bottom: Sprite;

    var title: Text;
    var items: Map<String, Text>;
    var active_item: Text;

    var particles: ParticleSystem;

    var left_fire: Vector;
    var right_fire: Vector;

    var title_shader: phoenix.Shader;
    var items_shader: phoenix.Shader;
    var active_items_shader: phoenix.Shader;
    var glowing : Batcher;

    var glow_amount: Float = 0.4;
    var prev_select: Text;

    var fire: AudioResource;
    var fire_sound: AudioHandle;

    static var idx = 0;

    public function new() {

        super({ name:'menu' });

        glowing = Luxe.renderer.create_batcher({ name:'glowing', camera:Luxe.camera.view });
        left_fire = new Vector(Luxe.screen.mid.x - 180, -171);
        right_fire = new Vector(Luxe.screen.mid.x + 180, -171);
        items = new Map();

            //because the text effects are set through shaders,
            //if you share a shader across text items, and change "just one"
            //they all get affected. For this reason, the default bitmap font
            //shader will refuse effects set on it via text objects because
            //it directly affects the shared shader for the debug console etc
            //so, for unique items, you want a unique shader for each effect.
        title_shader = Luxe.renderer.shaders.bitmapfont.shader.clone('title-shader');
        items_shader = Luxe.renderer.shaders.bitmapfont.shader.clone('items-shader');
        active_items_shader = Luxe.renderer.shaders.bitmapfont.shader.clone('active-items-shader');


        inline function create_sound() {

            fire = Luxe.resources.audio('assets/181563__kingsrow__fire-crackling-01.ogg');

        } //create_sound

        inline function create_particles( pos:Vector ) {

            idx++;
            trace('creating particles.$idx');

            var t1 = Luxe.resources.texture('assets/particles/flame.png');
            var t2 = Luxe.resources.texture('assets/particles/smoke.png');
            var t3 = Luxe.resources.texture('assets/particles/embers.png');

            particles = new ParticleSystem({name:'particles.$idx' });
            particles.pos = pos;

            particles.add_emitter({
                name : 'flames.$idx',
                cache_size:12,
                particle_image:t1,
                pos : new Vector(0,0),
                start_size:new Vector(96,64),
                end_size:new Vector(16,16),
                gravity : new Vector(0,-90),
                life:0.9,
                depth:2,
                rotation_random:360,
                emit_time : 0.05,
                batcher: glowing
            });

            particles.add_emitter({
                name : 'smoke.$idx',
                cache_size:12,
                particle_image : t2,
                start_color : new Color(0.0,0.0,0.0,0.7),
                end_color : new Color(0.3,0.3,0.3,0),
                start_size : new Vector(64,64),
                end_size : new Vector(200,200),
                end_size_random : new Vector(40,40),
                gravity : new Vector(0,-40),
                life : 1.2,
                rotation_random:360,
                depth:1,
                emit_time : 0.2
            });

            particles.add_emitter({
                name : 'embers.$idx',
                cache_size:12,
                particle_image : t3,
                end_color : new Color(0,0,0,0).rgb(0xff8a00),
                start_size : new Vector(64,64),
                end_size : new Vector(96,96),
                gravity : new Vector(0,-90),
                life : 0.8,
                end_speed : 0,
                depth:3,
                emit_time : 0.3,
                batcher: glowing
            });

            glowing.on(prerender, function(_){ Luxe.renderer.blend_mode(BlendMode.src_alpha, BlendMode.one); });
            glowing.on(postrender, function(_){ Luxe.renderer.blend_mode(); });

        } //create_particles

        inline function create_title() {

            detail_top = new Sprite({
                texture: Luxe.resources.texture('assets/detail_top.png'),
                pos: new Vector(Luxe.screen.mid.x, -171),
                depth: 1
            });

            title = new Text({
                text: 'menu',
                depth: 1.5,
                align: center,
                align_vertical: center,
                point_size: 96,
                letter_spacing: 0,
                pos: new Vector(Luxe.screen.mid.x, -171),
                color: new Color().rgb(0x7f7243),
                font: Main.font,
                sdf: true,
                shader: title_shader,
                outline: 0.6,
                outline_color: new Color().rgb(0x1d150c),
            });


        } //create_title

        inline function create_background() {

            stones_top = new Sprite({
                texture: Luxe.resources.texture('assets/stones_top.png'),
                pos: new Vector(Luxe.screen.mid.x, (151/2)),
            });

            stones_bottom = new Sprite({
                texture: Luxe.resources.texture('assets/stones_bottom.png'),
                pos: new Vector(Luxe.screen.mid.x, Luxe.screen.h - (54/2)),
            });

        } //create_background

        inline function create_items() {

            var item_list = ['play', 'quit'];
            var item_height = 64;
            var mid = ((Luxe.screen.h-151)/2);
            var top = 151+(mid - (item_list.length * item_height)/2);


            var item_idx = 0;
            for(item in item_list) {

                var text = new Text({
                    text: item,
                    depth: 2,
                    font: Main.font,
                    sdf: true,
                    shader: items_shader,
                    align: center,
                    align_vertical: center,
                    point_size: 60,
                    pos: new Vector(Luxe.screen.mid.x, top + (item_idx * item_height) ),
                    color: new Color().rgb(0x7f7243)
                });

                text.color.a = 0;
                items.set(item, text);

                if(item_idx == 0) {
                    prev_select = text;
                }

                item_idx++;

            } //each item_list

        } //create_items

        create_particles( left_fire );
        create_particles( right_fire );
        create_background();
        create_title();
        create_items();
        create_sound();

    } //new

    function select_item( item:Text ) {

            //reset others, the lazy way
        for( other in items ) {
            other.shader = items_shader;
            var pre_a = other.color.a;
            other.color.rgb(0x7f7243);
            other.color.a = pre_a;
            other.glow_amount = 0;
        }

        if(item != null) {
            item.shader = active_items_shader;
            item.color = new Color().rgb(0x131313);
            item.outline_color = new Color(0,0,0,1).rgb(0xfefefe);
            item.outline = 0.53;
            item.smoothness = 0.6;
            item.glow_amount = 0.1;
            item.glow_color = new Color(0,0,0,1).rgb(0xffde00);
            item.glow_threshold = 0.8;
        }

        active_item = item;

    } //select_item

    override function init() {

        title.color.a = 0;
        detail_top.color.a = 0;
        stones_top.color.a = 0;
        stones_bottom.color.a = 0;

    } //init


    override function onenter<T>(_:T) {

            //fade to menu color
        Luxe.renderer.clear_color.tween(0.2,{ r:0.06, g:0.075, b:0.098 });

        //details

            Actuate.tween(detail_top.pos, 2, { y:171/2 })
                   .ease( luxe.tween.easing.Bounce.easeOut );

            Actuate.tween(title.pos, 2, { y:128/2 })
                   .ease( luxe.tween.easing.Bounce.easeOut );

        //fire

            Actuate.tween(left_fire, 2, { y:171/2 })
                   .ease( luxe.tween.easing.Bounce.easeOut );

            Actuate.tween(right_fire, 2, { y:171/2 })
                   .ease( luxe.tween.easing.Bounce.easeOut );

        // stones

            Actuate.tween(stones_top.pos, 1, { y:151/2 });
            Actuate.tween(stones_bottom.pos, 1, { y:Luxe.screen.h - 54/2 });

        for( item in items ) {
            item.color
                .tween(0.4, {a:1})
                .delay(0.6)
                .onComplete(function(){
                    input_ready = true;
                    if(prev_select != null) {
                        select_item(prev_select);
                        prev_select = null;
                    }
                });
        }

        title.color.tween(0.4, {a:1});
        detail_top.color.tween(0.4, {a:1});
        stones_top.color.tween(0.3, {a:1});
        stones_bottom.color.tween(0.3, {a:1});

            //start the glow tween
        glow_amount = 0.4;
        Actuate.tween(this, 1.5, { glow_amount:0.65 }).repeat().reflect();

            //play the sound
        fire_sound = Luxe.audio.loop(fire.source);

    } //onenter

    override function onleave<T>(_:T) {

        Luxe.audio.stop(fire_sound);

            //no input when not in state
        input_ready = false;
            //store the last selected item
        prev_select = active_item;
            //select no items
        select_item(null);
            //stop the glow tween
        Actuate.stop(this, { glow_amount:0.65 });
            //hide menu items
        for( item in items ) {
            item.color.tween(0.1, {a:0});
        }

        //details
            Actuate.tween(detail_top.pos, 1, { y:-171 });
            Actuate.tween(title.pos, 1, { y:-171 });
        //fire
            Actuate.tween(left_fire, 1, { y:-171 });
            Actuate.tween(right_fire, 1, { y:-171 });
        //stones
            Actuate.tween(stones_top.pos, 1, { y:-151 });
            Actuate.tween(stones_bottom.pos, 1, { y:Luxe.screen.h + 54 });

        detail_top.color.tween(0.4, {a:0});
        stones_top.color.tween(0.3, {a:0});
        stones_bottom.color.tween(0.3, {a:0});

    } //onenter


    var input_ready : Bool = false;
    override function onmouseup(e:MouseEvent) {
        if(!input_ready) return;

        for( item in items ) {
            if( item.point_inside(e.pos) ) {
                switch(item.text){
                    case 'play': Main.state.set('game');
                    case 'quit': Luxe.shutdown();
                }
            } //if mouse inside
        } //each menu item

    } //onmouseup

    override function onmousemove(e:MouseEvent) {
        if(!input_ready) return;

        for( item in items ) {
            if( item.point_inside(e.pos) && active_item != item ) {
                select_item(item);
            } //if mouse inside
        } //each menu item

    } //onmousemove

    override function update( dt:Float ) {

            //set the active item glow from our tweened
            //value, just easier than changing tweens over
            //each time a selection changes
        if(active_item != null) {
            active_item.glow_amount = glow_amount;
        }

    } //update

    override function onkeyup( e:KeyEvent ) {

            //escape from the menu state quits
        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup


} //Menu
