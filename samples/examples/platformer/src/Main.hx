
import luxe.Input;
import luxe.Vector;
import luxe.Color;
import luxe.Sprite;
import luxe.Rectangle;
import luxe.utils.Maths;
import luxe.tilemaps.Ortho;
import phoenix.Texture.FilterType;

import luxe.collision.shapes.Polygon;
import luxe.collision.Collision.Results;
import luxe.collision.data.ShapeCollision;

import luxe.importers.tiled.TiledMap;
import luxe.importers.tiled.TiledObjectGroup;

class Fader extends luxe.Component {

    var overlay: Sprite;

    override function init() {
        overlay = new Sprite({
            size: Luxe.screen.size,
            color: new Color(0,0,0,1),
            centered: false,
            depth:99
        });
    }

    public function out(?t=0.15,?fn:Void->Void) {
        overlay.color.tween(t, {a:1}).onComplete(fn);
    }

    public function up(?t=0.15,?fn:Void->Void) {
        overlay.color.tween(t, {a:0}).onComplete(fn);
    }

    override function ondestroy() {
        overlay.destroy( );
    }

}

class Main extends luxe.Game {


        //Our visual items
    var player_sprite: Sprite;
    var exit: Sprite;
    var fade: Fader;

        //The level tiles
    var map: TiledMap;
    var map_scale: Int = 1;

        //Some helpers for information
    var spawn_pos:Vector;
    var portals:Map<Int, Vector>;

        //The simulation helper
    var sim:Simulation;


    override function ready() {

            //Set the sky/background color
        Luxe.renderer.clear_color.rgb(0x181c1f);

            //Add a fade component to the camera
        fade = Luxe.camera.add(new Fader({ name:'fade' }));

            //Tell the camera to keep the world size fixed,
            //And automatically fit the window size
        Luxe.camera.size = new Vector(256, 144);

            //Setup the simulation helper
        sim = Luxe.physics.add_engine(Simulation);
        sim.draw = false;
        sim.player_collider = Polygon.rectangle(0,0,8,8);

        create_map();
        create_map_collision();
        bind_input();

        Luxe.events.listen('simulation.triggers.collide', ontrigger);

            //start the simulation
        sim.paused = false;

            //fade in when the init event happens
        Luxe.on(luxe.Ev.init, function(_){ fade.up(0.5); });

    } //ready

    function bind_input() {

        Luxe.input.bind_key('left', Key.key_a);
        Luxe.input.bind_key('left', Key.left);

        Luxe.input.bind_key('right', Key.key_d);
        Luxe.input.bind_key('right', Key.right);

        Luxe.input.bind_key('jump', Key.key_w);
        Luxe.input.bind_key('jump', Key.up);
        Luxe.input.bind_key('jump', Key.space);
        Luxe.input.bind_key('jump', Key.key_z);
        Luxe.input.bind_key('jump', Key.key_x);

    } //bind_input

    function create_map_collision() {

        var bounds = map.layer('collision').bounds_fitted();
        for(bound in bounds) {
            bound.x *= map.tile_width * map_scale;
            bound.y *= map.tile_height * map_scale;
            bound.w *= map.tile_width * map_scale;
            bound.h *= map.tile_height * map_scale;
            sim.obstacle_colliders.push(Polygon.rectangle(bound.x, bound.y, bound.w, bound.h, false));
        }

    } //create_map_collision

    function create_map() {

            //Fetch the loaded tmx data from the assets
        var map_data = Luxe.resources.text('assets/tilemap.tmx').asset.text;

            //parse that data into a usable TiledMap instance
        map = new TiledMap({ format:'tmx', tiled_file_data: map_data });

            //Create the tilemap visuals
        map.display({ scale:map_scale, filter:FilterType.nearest });

        for(_group in map.tiledmap_data.object_groups) {
            for(_object in _group.objects) {

                switch(_object.type) {

                    case 'spawn': {

                            //The spawn position is set from the map
                        spawn_pos = new Vector(_object.pos.x, _object.pos.y);

                            //We use it to move the collider,
                        sim.player_collider.position.copy_from(spawn_pos);

                            //And create the visual
                        player_sprite = new Sprite({
                            pos: spawn_pos.clone(),
                            size: new Vector(8,8), depth:2,
                            texture:Luxe.resources.texture('assets/player.png')
                        });

                    } //spawn

                    case 'exit': {

                        var _y = _object.pos.y;

                            //create the exit collectible sprite
                        exit = new Sprite({
                            centered:false, depth:8,
                            pos: new Vector(_object.pos.x, _y+2),
                            texture:Luxe.resources.texture('assets/exit.png')
                        });

                            //Bounce the exit collectible sprite up and down
                        luxe.tween.Actuate.tween(exit.pos, 1.5, { y:_y }).reflect().repeat();

                        var shape = Polygon.rectangle(
                            _object.pos.x * map_scale,
                            _object.pos.y * map_scale,
                            _object.width * map_scale,
                            _object.height * map_scale,
                            false
                        );

                            //set the type tag on the collider
                        shape.tags.set('type', 'exit');

                            //store it in the list of triggers
                        sim.trigger_colliders.push(shape);

                    } //exit

                    case 'portal': {

                            //create the portal map if its not yet created
                        if(portals == null) portals = new Map();

                            //store the position of the portal for when we teleport
                        portals.set(_object.id, _object.pos);

                            //create the portal collision shape
                        var shape = Polygon.rectangle(
                            _object.pos.x * map_scale,
                            _object.pos.y * map_scale,
                            _object.width * map_scale,
                            _object.height * map_scale,
                            false
                        );

                            //fetch the information from tiled object property for the target teleporter
                        var target_id = Std.parseInt(_object.properties.get('target'));
                            //store it on the collider
                        shape.data = { target:target_id };
                            //and add a tag for the type of collider
                        shape.tags.set('type', 'portal');

                            //and finally add it to the list of triggers
                        sim.trigger_colliders.push(shape);

                    } //portal

                } //switch type
            } //each object
        } //each object group

        for(layer in map.tiledmap_data.image_layers) {

            new luxe.Sprite({
                name:'image_layer.${layer.name}',
                centered: false, depth:-1,
                pos: new Vector(map.pos.x+(layer.x*map_scale), map.pos.y+(layer.y * map_scale)),
                scale: new Vector(map_scale, map_scale),
                texture: Luxe.resources.texture('assets/'+layer.image.source),
                color: new Color(1,1,1, layer.opacity),
                visible: layer.visible
            });

        } //each image_layer


            //fetch the goemetry for the foreground
        var _rows = map.visual.geometry_for_layer('visualfg');

            //for each row in the tiles
        for(_row in _rows) {
                //for each tile in that row
            for(_geom in _row) {
                    //if there is a tile at all
                if(_geom != null) {
                        //move it above the player depth
                    _geom.depth = 5;
                }
            }
        } //each row

    } //create_map

    var teleport_disabled: Bool = false;

    function ontrigger(collisions:Results<ShapeCollision>) {

        if(collisions.length == 0) teleport_disabled = false;

        for(collision in collisions) {

            var _type = collision.shape2.tags.get('type');

            switch(_type) {
                case 'portal':
                        //can we teleport?
                    if(!teleport_disabled) {

                        var _destination = portals.get(collision.shape2.data.target);

                            //add 4 so that we are no longer colliding
                        sim.player_collider.position.x = _destination.x;
                        sim.player_collider.position.y = _destination.y + 4;

                        teleport_disabled = true;

                    } //if

                case 'exit':

                case _:

            } //switch type

        } //each collision

    } //ontrigger

    function respawn() {

        fade.out(function(){
            sim.player_collider.position.copy_from(spawn_pos);
            sim.player_velocity.set_xy(0,0);
            fade.up();
        });

    } //respawn

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_0) {
            sim.draw = !sim.draw;
        }

        if(e.keycode == Key.key_r) {
            respawn();
        }

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    var max_vel = 50;
    var air_vel = 60;
    var move_spd = 600;
    var jump_force = 200;
    var damp = 0.72;
    var damp_air = 0.9;
    var jumpsAvailable:Int = 0;
    override function update(dt:Float) {

        apply_input(dt);

        if(sim.player_can_jump) {
            jumpsAvailable = 2;
        }

        if(jumpsAvailable > 0 && Luxe.input.inputpressed('jump')) {
            sim.player_velocity.y = -jump_force;
            jumpsAvailable -= 1;
        }

        sim.player_collider.position.x = Maths.clamp(sim.player_collider.position.x, 4, 256 - 4);
        player_sprite.pos.copy_from(sim.player_collider.position);

        var _max_vel = (sim.player_can_jump) ? max_vel : air_vel;
        sim.player_velocity.x = Maths.clamp(sim.player_velocity.x, -_max_vel, _max_vel);

    } //update

    function apply_input(dt:Float) {

        if(Luxe.input.inputdown('left')) {

            sim.player_velocity.x -= move_spd * dt;
            player_sprite.flipx = false;

        } else if(Luxe.input.inputdown('right')) {

            sim.player_velocity.x += move_spd * dt;
            player_sprite.flipx = true;

        } else {

            if(sim.player_can_jump) {
                sim.player_velocity.x *= damp;
            } else {
                sim.player_velocity.x *= damp_air;
            }

        } //not left or right

    } //update_input


    override function config(config:luxe.GameConfig) {

        #if (web && sample)
            config.window.width = 720;
            config.window.height = 405;
        #end

        config.preload.textures.push({id:'assets/collisionTiles.png'});
        config.preload.textures.push({id:'assets/player.png', filter_min:nearest, filter_mag:nearest });
        config.preload.textures.push({id:'assets/exit.png', filter_min:nearest, filter_mag:nearest });
        config.preload.textures.push({id:'assets/background.png', filter_min:nearest, filter_mag:nearest });
        config.preload.textures.push({id:'assets/tilesheet.png'});

        config.preload.texts.push({id:'assets/tilemap.tmx'});

        return config;

    } //config

} //Main
