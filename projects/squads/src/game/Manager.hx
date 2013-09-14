package game;

import game.PlayerAim;
import game.PlayerTeam;
import game.PlayerWeapon;
import luxe.Input.KeyEvent;
import luxe.Input.KeyValue;
import luxe.Modes;
import luxe.Rectangle;
import luxe.Sprite;
import luxe.Vector;
import luxe.Color;
import luxe.Text;

import phoenix.geometry.LineGeometry;
import phoenix.geometry.RectangleGeometry;
import phoenix.Texture;

import luxe.components.sprite.SpriteAnimation;

import Game;
import game.PlayerMovement;
import game.PlayerKeyInput;

class Manager extends Mode {
    
    public var game : Game;

    var controller_sprites : Map<String,Sprite>;    
    
    var controller_tex : Texture;
    var player_tex : Texture;

    var midline : LineGeometry;

    var class_text : Map<String, Text>;
    var weapon_text : Map<String, Text>;
    var ability_text : Map<String, Text>;
    var team_texts : Map<String, Text>;

    var bar_sprites : Map<String,Sprite>;
    var bar_borders : Map<String,RectangleGeometry>;

    var players : Map<String,Sprite>;

    var midx : Float;

    public function init(_game:Game) {

            //store a local reference
        game = _game;

            //the sprites for the controllers
        controller_sprites = new Map();
            
            //the text maps
        class_text = new Map();
        weapon_text = new Map();
        ability_text = new Map();
        team_texts = new Map();
            //health maps
        bar_borders = new Map();
        bar_sprites = new Map();
            //players
        players = new Map();

        midx = Luxe.screen.w/2;        

            //the controller image
        controller_tex = Luxe.loadTexture('assets/menu/controller.png');
        var squads_tex = Luxe.loadTexture('assets/menu/squads.png');

        var squads_image = new Sprite({
            texture : squads_tex,
            pos : new Vector(midx,128)
        });

            //the player image
        player_tex = Luxe.loadTexture('assets/game/player.png');        

            //create onscreen items
        create_players();
        create_controllers();
        create_menu_texts();
        create_texts();
        create_bars();

            //draw the mid line
        midline = Luxe.draw.line({ 
            p0:new Vector(midx, 0),
            p1:new Vector(midx, Luxe.screen.h),
            color0: new Color(1,1,1,0.2),
            color1: new Color(1,1,1,0),
        });

    } //init

    function create_players() {

        var total_mid_space = midx;
        var spacing = midx/4;
        var smaller_spacing = spacing/2;
        var yoffset = (Luxe.screen.h * 0.8) - 60;
        var startframe = new Rectangle(256,0,64,64);

        var animdata = Luxe.loadText('assets/game/player.anims.json');

//Player 1
        var player1sprite = new Sprite({
            name : 'player1',
            texture : player_tex,
            pos : new Vector( midx - (smaller_spacing) - spacing, yoffset  ),
            size : new Vector(64,64),
            uv : new Rectangle(384,64,64,64)
        });

            var player1anim = player1sprite.add( SpriteAnimation, 'anim' );     
                player1anim.add_from_json( animdata );
                player1anim.animation = 'idle';
                player1anim.play();

//Player 2
        var player2sprite = new Sprite({
            name : 'player2',
            texture : player_tex,
            pos : new Vector( midx - (smaller_spacing), yoffset  ),
            size : new Vector(64,64),
            uv : startframe
        });

            var player2anim = player2sprite.add( SpriteAnimation, 'anim' );     
                player2anim.add_from_json( animdata );
                player2anim.animation = 'menu';
                player2anim.play();

//Player 3
        var player3sprite = new Sprite({
            name : 'player3',
            texture : player_tex,
            pos : new Vector( midx + (smaller_spacing), yoffset  ),
            size : new Vector(64,64),
            uv : startframe
        });

            var player3anim = player3sprite.add( SpriteAnimation, 'anim' );     
                player3anim.add_from_json( animdata );
                player3anim.animation = 'menu';
                player3anim.play();

//Player 4
        var player4sprite = new Sprite({
            name : 'player4',
            texture : player_tex,
            pos : new Vector( midx + (smaller_spacing) + spacing, yoffset  ),
            size : new Vector(64,64),
            uv : startframe
        });

            var player4anim = player4sprite.add( SpriteAnimation, 'anim' );     
                player4anim.add_from_json( animdata );
                player4anim.animation = 'menu';
                player4anim.play();

//attach Player components

        player1sprite.add(PlayerMovement,   'move');
        player1sprite.add(PlayerKeyInput,   'keyinput');
        player1sprite.add(PlayerAim,        'aim');
        player1sprite.add(PlayerWeapon,     'weapon');
        player1sprite.add(PlayerShoot,      'shoot');
        
        var team = player1sprite.add(PlayerTeam, 'team');
            team.set_team_color(game.team1color);

//Attach listeners
        
        player1sprite.events.listen('player.ui.*', onplayeruievent );

//Store them in the list

        players.set('player1', player1sprite );
        players.set('player2', player2sprite );
        players.set('player3', player3sprite );
        players.set('player4', player4sprite );

    }

    function onplayeruievent( e:Dynamic ) {
        
        var player_emitting = e.player;

        switch(e.type) {
            case 'weapon':
                var new_weapon_text = e.value;
                    //get the resulting text
                var text = weapon_text.get(player_emitting + '.weapon');
                    text.text = new_weapon_text;
        }

    }  //for all player ui events

    function create_bars() {
        
        var height = 8;
        var width = 145;
        var hwidth = 72.5;
        var spacing = Luxe.screen.w * 0.05;
        var xspacing = spacing*1.8;


        bar_sprites.set('player1.health', new Sprite({
            pos: new Vector(xspacing - hwidth, spacing+60),
            centered : false,
            size : new Vector(width, height),
            color : game.team1color
        }));
        bar_sprites.set('player2.health', new Sprite({
            pos: new Vector( xspacing - hwidth, Luxe.screen.h - spacing + 20),
            centered : false,
            size : new Vector(width, height),
            color : game.team1color
        }));
        bar_sprites.set('player3.health', new Sprite({
            pos : new Vector(Luxe.screen.w - xspacing - hwidth, spacing + 60),
            size : new Vector(width, height),
            centered : false,
            color : game.team2color,
        }));
        bar_sprites.set('player4.health', new Sprite({
            pos : new Vector(Luxe.screen.w - xspacing - hwidth, Luxe.screen.h - spacing + 20),
            size : new Vector( width, height),
            centered : false,
            color : game.team2color,
        }));

        bar_borders.set('player1.border', Luxe.draw.rectangle({
            x: xspacing - hwidth, 
            y: spacing+60,
            w: width,
            h: height,
            color : game.blackcolor,
        }));
        bar_borders.set('player2.border', Luxe.draw.rectangle({
            x: xspacing - hwidth, 
            y: Luxe.screen.h - spacing + 20,
            w: width,
            h: height,
            color : game.blackcolor,
        }));
        bar_borders.set('player3.border', Luxe.draw.rectangle({
            x: Luxe.screen.w - xspacing - hwidth, 
            y: spacing + 60,
            w: width,
            h: height,
            color : game.blackcolor,
        }));
        bar_borders.set('player4.border', Luxe.draw.rectangle({
            x: Luxe.screen.w - xspacing - hwidth, 
            y: Luxe.screen.h - spacing + 20,
            w: width,
            h: height,
            color : game.blackcolor,
        }));


    } //create_bars
    
    function create_texts() {

        var spacing = Luxe.screen.w * 0.05;
        var xspacing = spacing*1.8;

//Classes text

        class_text.set('player1.class', new Text({
            pos : new Vector( xspacing, spacing ),
            align : TextAlign.center,
            text : 'ENGINEER',
            size : 40,
            color : new Color().rgb(0x505050),
            font : game.font
        }));

        class_text.set('player2.class', new Text({
            pos : new Vector( xspacing, Luxe.screen.h - spacing - 40 ),
            align : TextAlign.center,
            text : 'ENGINEER',
            size : 40,
            color : new Color().rgb(0x505050),
            font : game.font
        }));

        class_text.set('player3.class', new Text({
            pos : new Vector( Luxe.screen.w - xspacing, spacing ),
            align : TextAlign.center,
            text : 'RECON',
            size : 40,
            color : new Color().rgb(0x505050),
            font : game.font
        }));

        class_text.set('player4.class', new Text({
            pos : new Vector( Luxe.screen.w - xspacing, Luxe.screen.h - spacing - 40 ),
            align : TextAlign.center,
            text : 'RECON',
            size : 40,
            color : new Color().rgb(0x505050),
            font : game.font
        }));

//Weapon texts

        var small_size = 24;
        var small_offset = 42;

        weapon_text.set('player1.weapon', new Text({
            pos : new Vector( xspacing, spacing - 40 ),
            align : TextAlign.center,
            text : 'GRENADE\nLAUNCHER',
            size : small_size,
            color : game.team1color,
            font : game.font
        }));

        weapon_text.set('player2.weapon', new Text({
            pos : new Vector( xspacing, (Luxe.screen.h - spacing - 40) - small_offset ),
            align : TextAlign.center,
            text : 'GRENADE\nLAUNCHER',
            size : small_size,
            color : game.team1color,
            font : game.font
        }));

        weapon_text.set('player3.weapon', new Text({
            pos : new Vector( Luxe.screen.w - xspacing, spacing - small_offset),
            align : TextAlign.center,
            text : 'SUB\nMACHINE GUN',
            size : small_size,
            color : game.team2color,
            font : game.font
        }));

        weapon_text.set('player4.weapon', new Text({
            pos : new Vector( Luxe.screen.w - xspacing, (Luxe.screen.h - spacing - 40) - small_offset ),
            align : TextAlign.center,
            text : 'SUB\nMACHINE GUN',
            size : small_size,
            color : game.team2color,
            font : game.font
        }));

//Ability texts

        ability_text.set('player1.ability', new Text({
            pos : new Vector( xspacing, spacing + 35 ),
            align : TextAlign.center,
            text : 'CREATE COVER',
            size : small_size,
            color : game.whitecolor,
            font : game.font
        }));

        ability_text.set('player2.ability', new Text({
            pos : new Vector( xspacing, (Luxe.screen.h - spacing - 40) + 35 ),
            align : TextAlign.center,
            text : 'CREATE COVER',
            size : small_size,
            color : game.whitecolor,
            font : game.font
        }));

        ability_text.set('player3.ability', new Text({
            pos : new Vector( Luxe.screen.w - xspacing, spacing + 35),
            align : TextAlign.center,
            text : 'FAST CLIPS',
            size : small_size,
            color : game.whitecolor,
            font : game.font
        }));

        ability_text.set('player4.ability', new Text({
            pos : new Vector( Luxe.screen.w - xspacing, (Luxe.screen.h - spacing - 40) + 35 ),
            align : TextAlign.center,
            text : 'FAST CLIPS',
            size : small_size,
            color : game.whitecolor,
            font : game.font
        }));



    } //create_texts

    function create_menu_texts() {
        var spacing = midx/4;
        var yoffset = Luxe.screen.h*0.8;
        var yup = 140;

//TEAM
        team_texts.set('team_1_team', new Text({
            pos : new Vector( midx - spacing, yoffset - yup ),
            align : TextAlign.right,
            text : 'TEAM',
            size : 48,
            color : new Color(1,1,1,1),
            font : game.font
        }));
//ONE
        team_texts.set('team_1_one', new Text({
            pos : new Vector( midx - spacing, yoffset - yup ),
            align : TextAlign.left,
            text : 'ONE',
            size : 48,
            color : game.team1color,
            font : game.font
        }));
//TEAM
        team_texts.set('team_2_team', new Text({
            pos : new Vector( midx + spacing, yoffset - yup ),
            align : TextAlign.right,
            text : 'TEAM',
            size : 48,
            color : new Color(1,1,1,1),
            font : game.font
        }));
//TWO
        team_texts.set('team_2_two', new Text({
            pos : new Vector( midx + spacing, yoffset - yup ),
            align : TextAlign.left,
            text : 'TWO',
            size : 48,
            color : game.team2color,
            font : game.font
        }));

    }

    

    public function oninputdown(_name:String, _event:Dynamic) {
        _event.input_type = 'input.down';
        _event.input_name = _name;
        players.get('player1').events.fire('input.down.' + _name, _event );
    }

    public function oninputup(_name:String, _event:Dynamic) {
        _event.input_type = 'input.up';
        _event.input_name = _name;
        players.get('player1').events.fire('input.up.' + _name, _event );
    }

    public function onkeydown(e:KeyEvent) {

    }

    function create_controllers() {

        var total_mid_space = midx;
        var spacing = midx/4;
        var smaller_spacing = spacing/2;

        controller_sprites.set('player1', new Sprite({
            texture : controller_tex,
            pos : new Vector( midx - (smaller_spacing) - spacing, Luxe.screen.h * 0.8 ),
            color : new Color(1,1,1,0.2)
        }));

        controller_sprites.set('player2', new Sprite({
            texture : controller_tex,
            pos : new Vector( midx - (smaller_spacing), Luxe.screen.h * 0.8 ),
            color : new Color(1,1,1,0.2)
        }));

        controller_sprites.set('player3', new Sprite({
            texture : controller_tex,
            pos : new Vector( midx + (smaller_spacing), Luxe.screen.h * 0.8 ),
            color : new Color(1,1,1,0.2)
        }));

        controller_sprites.set('player4', new Sprite({
            texture : controller_tex,
            pos : new Vector( midx + (smaller_spacing) + spacing, Luxe.screen.h * 0.8 ),
            color : new Color(1,1,1,0.2)
        }));

    } //create_controllers

    public function enter() {
        trace('enter menu');
    }

    public function leave() {
        trace('exit menu');
    }


}


// --cwd,/Users/Sven/Library/Application Support/Sublime Text 2/Packages,
// -cp,/Users/Sven/dev/lab/luxe/projects/squads/src,
// -lib,luxe,
// -lib,lime,
// --cwd,/Users/Sven/dev/lab/luxe/projects/squads,
// -D,st_display,
// --display,/Users/Sven/dev/lab/luxe/projects/squads/src/menu/Main.hx@203,
// --no-output,
// -swf,
///Users/Sven/dev/lab/luxe/projects/squads/squads


