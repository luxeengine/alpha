package levels;


import Luxe;

import luxe.Camera;
import luxe.Input;
import luxe.Rectangle;
import luxe.Text;
import luxe.utils.NineSlice;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;

import phoenix.Batcher;
import phoenix.geometry.Geometry;
import phoenix.Texture;
import phoenix.BitmapFont;

import mode.Mode;

import motion.Actuate;
import phoenix.RenderTexture;

class Level01 extends Mode {

    public var mouse : Vector;
    public var dragging : Bool = false;
    public var mouse_down : Bool = false;
    public var start_drag : Vector;
    public var start_camera_drag : Vector;

    public var map : Sprite;
    public var hudbar : Sprite;
    public var money_text : Text;

    public var acq_button : Sprite;
    public var apt_button : Sprite;

    public var msg_dialog : Sprite;
    public var msg_text : Text;


    public var beacon_list:Map<String,Vector>;
    public var sign_list:Map<String,Vector>;
    
    public var beacon_sprites:Map<String,Sprite>;
    public var sign_sprites:Map<String,Sprite>;
    public var sign_text_sprites:Map<String,Sprite>;

    public var map_scale : Float = 2;

        //the map batcher, for drawing it to a render texture, shares the default camera
    public var map_batch : Batcher;    
        //the map display sprite, showing the resulting rendered map with shaders
    public var map_view : Sprite;
        //the rendered texture of the map
    public var map_view_texture : RenderTexture;
        //the final view of the map
    public var map_view_batch : Batcher;

        //the world items on top of the map, shares the default camera
    public var world_batch : Batcher;

        //the hud batcher for static items
    public var hud_batch : Batcher;
        //the camera for the hud static view
    public var hud_view : Camera;


    public function init() {
            
        start_drag = new Vector();
        start_camera_drag = new Vector();

        sign_list = new Map<String,Vector>();
        beacon_list = new Map<String,Vector>();
        
        beacon_sprites = new Map<String,Sprite>();
        sign_sprites = new Map<String,Sprite>();
        sign_text_sprites = new Map<String,Sprite>();

        sign_list.set('university', new Vector(115,765) );
        sign_list.set('suburbia', new Vector(355,825) );

        beacon_list.set('apartment', new Vector(147,705) );

            //the batcher for drawing the map into the texture
        map_batch = new Batcher( Luxe.renderer, 'map batcher' );
            //the view batcher for the output of the map
        map_view_batch = new Batcher( Luxe.renderer, 'map view batcher' );
            //the world items that aren't to be blurred with the map
        world_batch = new Batcher( Luxe.renderer, 'world batcher' );

            //The hud batch renderer
        hud_batch = new Batcher( Luxe.renderer, 'hud batcher' );
            //The hud camera in fixed view
        hud_view = new Camera({name:'hud view'});
            //Set it to the batcher
        hud_batch.view = hud_view.view;
            //the hud camera matches the view too
        map_view_batch.view = hud_view.view;

            //map is below the world and hud
        map_view_batch.layer = 2;
            //world is above the map, below the hud
        world_batch.layer = 3;
            //the hud is last
        hud_batch.layer = 4; 

            //add the batchers to the renderer
        Luxe.renderer.add_batch( hud_batch );
        Luxe.renderer.add_batch( map_view_batch );
        Luxe.renderer.add_batch( world_batch );

        hudbar = new Sprite({
            depth:10,
            centered : false,
            pos : new Vector(),
            size : new Vector( Luxe.screen.w, 70 ),
            color : new Color().rgb(0x242424),
            batcher : hud_batch
        });

        msg_dialog = new Sprite({
            depth:10,
            centered : true,
            pos : new Vector(Luxe.screen.w/2, Luxe.screen.h/2),
            size : new Vector( 450, 300 ),
            color : new Color(0,0,0,0).rgb(0x242424),
            batcher : hud_batch
        });

        msg_text = new Text({
            depth : 11,
            size : 26,
            bounds : new Rectangle( (Luxe.screen.w/2)-225, (Luxe.screen.h/2)-150,450,300),
            color : new Color(0,0,0,0).rgb(0xe7e7e7),
            text : 'message dialog',
            align : TextAlign.center,
            align_vertical : TextAlign.center,
            batcher : hud_batch
        });

        msg_text.visible = false;
        msg_dialog.visible = false;

        acq_button = new Sprite({
            depth:11,
            centered : false,
            pos : new Vector(296,0),
            texture : Luxe.loadTexture('assets/map/hud/acq_inactive.png'),
            batcher : hud_batch
        });

        apt_button = new Sprite({
            depth:11,
            centered : false,
            pos : new Vector(523,0),
            texture : Luxe.loadTexture('assets/map/hud/apt_active.png'),
            batcher : hud_batch
        });

        for( _key in beacon_list.keys()) {

            haxe.Timer.delay( function(){
                var _beacon_pos = beacon_list.get(_key);
                _beacon_pos.multiplyScalar(map_scale);
                var _keyl = _key;

                add_beacon(_keyl, _beacon_pos);

            }, 1500);
        }


        for(_key in sign_list.keys()) {
                
                //fetch size
            var _sign_pos = sign_list.get(_key);

                //apply world scale to the position
            _sign_pos.multiplyScalar(map_scale);

                //the glow image
            var _sign_sprite = new Sprite({
                depth : 2,
                centered : true,
                origin : new Vector(64,450),
                texture : Luxe.loadTexture('assets/map/signs/sign.png'),
                pos : _sign_pos,
                batcher : world_batch
            });

                //the text name
            var _sign_text_sprite = new Sprite({
                depth : 3,
                centered : true,
                texture : Luxe.loadTexture('assets/map/signs/'+ _key +'.png'),
                pos : _sign_pos, 
                batcher : world_batch 
            });

                //store for access and removal
            sign_sprites.set(_key, _sign_sprite);
            sign_text_sprites.set(_key, _sign_text_sprite);

        }//for each sign
        

        map = new Sprite({
            centered : false,
            size : new Vector(2048,2048),
            pos : new Vector(0,0),
            color : new Color(),
            depth : 1,
            texture : Luxe.loadTexture('assets/map/map.png'),
            batcher : map_batch
        });

        map_view_texture = new RenderTexture( Luxe.resources,  new Vector(Luxe.screen.w,Luxe.screen.h) );

        map_view = new Sprite({
            centered : false,
            size : new Vector(Luxe.screen.w,Luxe.screen.h),
            pos : new Vector(0,0),
            depth : 1,
            texture : map_view_texture,
            batcher : map_view_batch,
            shader : Luxe.loadShader('assets/tilt.shift.glsl', 'default')
        });

        map.texture.filter = phoenix.Texture.FilterType.nearest;

        Luxe.camera.bounds = new Rectangle(0,0,2048,2048);
        Luxe.camera.pos = sign_list.get('university').clone().subtract( new Vector(Luxe.screen.w/2, Luxe.screen.h/2) );

        beacon_texture = Luxe.loadTexture('assets/map/beacons/beacon_with_shadow.png');

    } //init

    var beacon_texture : Texture;

    public function add_beacon( _name:String, _pos:Vector ) {

            var _beacon_sprite = new Sprite({
                origin : new Vector(70,113),
                color : new Color(1,1,1,0),
                depth : 4,
                centered : true,
                texture : beacon_texture,
                pos : _pos,
                batcher : world_batch
            });

            _beacon_sprite.scale.x = 0.1;

            Actuate.tween( _beacon_sprite.scale, 0.6, { x:1 }, true);
            Actuate.tween( _beacon_sprite.color, 0.8, { a:1 }, true);

            beacon_sprites.set(_name, _beacon_sprite);

    } //add_beacon

    public function prerender() {
        map_view_texture.bindBuffer();
        map_batch.draw( false );
        map_view_texture.unbindBuffer();
    } //prerender

    var showing_dialog : Bool = false;
    var text_alpha : Float = 0;

    public function show_dialog( text:String ) {

        if(msg_dialog.visible == false) {
            msg_dialog.visible = true;
            msg_text.visible = true;
        }

        Actuate.tween( this, 0.8, { text_alpha:1 }, true).onUpdate( function(){
            msg_text.color = new Color( msg_text.color.r, msg_text.color.g, msg_text.color.b, text_alpha );
        });

        Actuate.tween( msg_dialog.color, 0.5, { a:1 }).onComplete(function(){
            showing_dialog = true;
        });

        msg_text.text = text;

    } // show_dialog


    public function hide_dialog() {

        showing_dialog = false;

        Actuate.tween( this, 0.5, { text_alpha:0 }, true).onUpdate( function(){
            msg_text.color = new Color( msg_text.color.r, msg_text.color.g, msg_text.color.b, text_alpha );            
        });

        Actuate.tween( msg_dialog.color, 0.8, { a:0 }).onComplete(function(){
            msg_dialog.visible = false;            
        });

    } // hide_dialog

    public function destroy() {

        trace('destroying level 01');
        
        for(_key in beacon_sprites.keys()) {
            beacon_sprites.get(_key).destroy();
            beacon_sprites.remove(_key);
        }

        for(_key in sign_sprites.keys()) {
            sign_sprites.get(_key).destroy();
            sign_sprites.remove(_key);
            sign_text_sprites.get(_key).destroy();
            sign_text_sprites.remove(_key);
        }

        hudbar.destroy();
        apt_button.destroy();
        acq_button.destroy();
        msg_dialog.destroy();
        msg_text.destroy();
        map.destroy();
        map_view.destroy();

        hudbar = null;
        apt_button = null;
        acq_button = null;
        msg_dialog = null;
        msg_text = null;
        map = null;

        Luxe.camera.bounds = null;

    } //destroy

    public function keydown(e) {
        
        if( e.value == Input.Keys.escape ) {
            game.modes.set('menu');
        }


        if( e.value == Input.Keys.key_D ) {
            show_dialog('Welcome to the danger zone...');
        }

    } //keydown

    public function mousedown(e) {
        mouse = new Vector(e.x,e.y);        

        if(showing_dialog) return;

        mouse_down = true;        

            //in a short time from mousedown, check if it's still actually down before we start dragging
        haxe.Timer.delay(function(){
            if(mouse_down == false) return;
            if(!dragging) {
                dragging = true;
                start_drag.set(mouse.x, mouse.y);
                start_camera_drag.set(Luxe.camera.pos.x, Luxe.camera.pos.y);
            }
        }, 100);

    } //mousedown


    public function mouseup(e) {
        
        mouse = new Vector(e.x,e.y);
            //before the early outs, to undo any mouse downs
        mouse_down = false;

        if(showing_dialog) {
            return hide_dialog();
        } 

        if(dragging) {
            dragging = false;
        } else {
            Luxe.camera.center( Vector.Add( mouse, Luxe.camera.pos ), 0.6 );
            add_beacon( 'beacon' + Math.random(), Vector.Add( mouse, Luxe.camera.pos ) );
        }
    }

    public function mousemove(e) {

        mouse = new Vector(e.x,e.y);

        if(dragging) {
            var diffx = (e.x - start_drag.x);
            var diffy = (e.y - start_drag.y);
            Luxe.camera.pos.x = start_camera_drag.x - (diffx);
            Luxe.camera.pos.y = start_camera_drag.y - (diffy);
        } //if dragging

    }

    public function enter() {
       init();
    }

    public function leave() {
        Luxe.camera.pos = new Vector();
        destroy();
    }
}