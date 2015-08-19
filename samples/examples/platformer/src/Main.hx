
import luxe.Input;
import luxe.importers.tiled.TiledMap;
import luxe.tilemaps.Ortho;
import luxe.utils.Maths;
import luxe.Vector;
import luxe.collision.shapes.Polygon;
import luxe.Rectangle;
import phoenix.geometry.Geometry;
import luxe.Color;
import phoenix.Texture.FilterType;
import luxe.importers.tiled.TiledObjectGroup;
import luxe.collision.data.ShapeCollision;
import luxe.Sprite;

class Main extends luxe.Game {

    var player:Polygon;
    var playerSprite:Sprite;
    var exit:Sprite;
    var spawn:Vector;
    var portals:Map<Int, Vector>;

    var engine:CollisionEngine;

    override function config(config:luxe.AppConfig) {
        config.preload.textures.push({id:'assets/collisionTiles.png'});
        config.preload.textures.push({id:'assets/player.png', filter_min:nearest, filter_mag:nearest });
        config.preload.textures.push({id:'assets/exit.png', filter_min:nearest, filter_mag:nearest });
        config.preload.textures.push({id:'assets/background.png', filter_min:nearest, filter_mag:nearest });
        config.preload.textures.push({id:'assets/tilesheet.png'});
        config.preload.texts.push({id:'assets/tilemap.tmx'});
        return config;

    } //config

    override function ready() {

        Luxe.renderer.clear_color.rgb(0x181c1f);
        Luxe.camera.size = new Vector(256, 144);
        player = Polygon.rectangle(0,0,8,8);

        //set by level load
        spawn = new Vector(120, 48);

        engine = Luxe.physics.add_engine(CollisionEngine);
        engine.draw = false;
        engine.player = player;

        var map = new TiledMap({
            format:'tmx', 
            tiled_file_data:Luxe.resources.text('assets/tilemap.tmx').asset.text
        });

        var scale = 1;
        map.display({ scale:scale, filter:FilterType.nearest });

        portals = new Map();
        for(_group in map.tiledmap_data.object_groups) {
            for(_object in _group.objects) {

                switch(_object.type) {

                    case 'spawn': {

                        spawn.set_xy(_object.pos.x, _object.pos.y);

                    } //spawn

                    case 'exit': {

                        var _y = _object.pos.y;

                        exit = new Sprite({
                            depth:8,
                            centered:false,
                            pos:new Vector(_object.pos.x, _y+2),
                            texture:Luxe.resources.texture('assets/exit.png')
                        });

                        luxe.tween.Actuate.tween(exit.pos, 1.5, { y:_y }).reflect().repeat();

                        var shape = Polygon.rectangle(_object.pos.x * scale, _object.pos.y * scale, _object.width * scale, _object.height * scale, false);
                            shape.tags.set('type', 'exit');

                        engine.levelTriggers.push(shape);

                    } //exit

                    case 'portal': {

                        portals.set(_object.id, _object.pos);

                        var shape = Polygon.rectangle(_object.pos.x * scale, _object.pos.y * scale, _object.width * scale, _object.height * scale, false);
                            shape.data = {target:Std.parseInt(_object.properties.get('target'))};
                            shape.tags.set('type', 'portal');

                        engine.levelTriggers.push(shape);

                    } //portal

                } //switch type
            } //each object
        } //each object group

            //we assume the spawn has loaded by now
        player.position.copy_from(spawn);
        playerSprite = new Sprite({
            pos:new Vector(spawn.x, spawn.y),
            size:new Vector(8,8),
            depth:2,
            texture:Luxe.resources.texture('assets/player.png')
        });

        for(layer in map.tiledmap_data.image_layers) {
            trace('loading image layer ${layer.name} pos:${layer.x},${layer.x} properties:${layer.properties} visible:${layer.visible} opacity:${layer.opacity}');
            var _scale = Luxe.camera.zoom;
            new luxe.Sprite({
                centered: false,
                depth:-1,
                pos:new Vector(map.pos.x+(layer.x*_scale), map.pos.y+(layer.y * _scale)),
                scale:new Vector(_scale, _scale),
                texture: Luxe.resources.texture('assets/'+layer.image.source),
                color: new Color(1,1,1,layer.opacity),
                visible: layer.visible
            });
        }

        var _rows = map.visual.geometry_for_layer('visualfg');
        for(_row in _rows) for(_geom in _row) if(_geom != null) _geom.depth = 5;



        var bounds = map.layer('collision').bounds_fitted();
        for(bound in bounds) {
            bound.x *= map.tile_width * scale;
            bound.y *= map.tile_height * scale;
            bound.w *= map.tile_width * scale;
            bound.h *= map.tile_height * scale;
            engine.levelObstacles.push(Polygon.rectangle(bound.x, bound.y, bound.w, bound.h, false));
        }

        Luxe.input.bind_key('left', Key.key_a);
        Luxe.input.bind_key('left', Key.left);
        Luxe.input.bind_key('right', Key.key_d);
        Luxe.input.bind_key('right', Key.right);
        Luxe.input.bind_key('jump', Key.key_w);
        Luxe.input.bind_key('jump', Key.up);
        Luxe.input.bind_key('jump', Key.space);

        Luxe.events.listen('CollisionEngine.touchedTriggers', onTouchedTriggers);
    } //ready

    var teleportDisabled:Bool = false;
    function onTouchedTriggers(collisions:Array<ShapeCollision>) {
        if(collisions.length == 0) teleportDisabled = false;
        for(collision in collisions) {
            if(!teleportDisabled && collision.shape2.tags.exists('type') && collision.shape2.tags.get('type') == 'portal') {
                player.position = portals.get(collision.shape2.data.target).clone();
                player.position.add_xyz(4,4);
                teleportDisabled = true;
            }
        }
    }

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.key_0) {
            engine.draw = !engine.draw;
        }

        if(e.keycode == Key.key_r) {
            player.position.copy_from(spawn);
            engine.playerVel.set_xy(0,0);
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
        if(Luxe.input.inputdown('left')) {
            engine.playerVel.x -= move_spd * dt;
        }
        else if(Luxe.input.inputdown('right')) {
            engine.playerVel.x += move_spd * dt;
        }
        else {
            if(engine.jumpAllowed) {
                engine.playerVel.x *= damp;
            } else {
                engine.playerVel.x *= damp_air;
            }
        }

        var _max_vel = (engine.jumpAllowed) ? max_vel : air_vel;
        engine.playerVel.x = Maths.clamp(engine.playerVel.x, -_max_vel, _max_vel);

        if(engine.jumpAllowed) {
            jumpsAvailable = 2;
        }

        if(jumpsAvailable > 0 && Luxe.input.inputpressed('jump')) {
            engine.playerVel.y = -jump_force;
            jumpsAvailable -= 1;
        }

        player.position.x = Maths.clamp(player.position.x, 4, 256 - 4);

        playerSprite.pos.copy_from(player.position);
        if(engine.playerVel.x > 0) {
            playerSprite.flipx = true;
        }
        else {
            playerSprite.flipx = false;
        }
    } //update
} //Main
