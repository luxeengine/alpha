package menu;

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

class Menu extends Mode {
	
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

	var player_sprites : Map<String,Sprite>;

	var midx : Float;
	var anim_list : Array<String>;
	var currentanim = 0;	

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
		player_sprites = new Map();

			//the controller image
		controller_tex = Luxe.loadTexture('assets/menu/controller.png');
			//the player image
		player_tex = Luxe.loadTexture('assets/game/player.png');

			//there are two controllers on the left
			//two controller on the right
		midx = Luxe.screen.w/2;
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

		player_sprites.set('player1', new Sprite({
			texture : player_tex,
			pos : new Vector( midx - (smaller_spacing) - spacing, yoffset  ),
			size : new Vector(64,64),
			uv : new Rectangle(384,64,64,64)
		}));

		player_sprites.set('player2', new Sprite({
			texture : player_tex,
			pos : new Vector( midx - (smaller_spacing), yoffset  ),
			size : new Vector(64,64),
			uv : startframe
		}));

		player_sprites.set('player3', new Sprite({
			texture : player_tex,
			pos : new Vector( midx + (smaller_spacing), yoffset  ),
			size : new Vector(64,64),
			uv : startframe
		}));

		player_sprites.set('player4', new Sprite({
			texture : player_tex,
			pos : new Vector( midx + (smaller_spacing) + spacing, yoffset  ),
			size : new Vector(64,64),
			uv : startframe
		}));

		var spr:Sprite = player_sprites.get('player1');

		var anim = spr.add( SpriteAnimation, 'anim' );

		var animdata = Luxe.loadText('assets/game/player.anims.json');

		anim.add_from_json( animdata );

		anim.animation = 'defib';
		anim.play();

	}

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

		anim_list = ['defib', 'dead', 'downdefib', 'diedie', 'die', 'menu', 'trauma', 'revived', 'idle'];
	}

	

	public function onkeydown(e:KeyEvent) {

		if(e.key == KeyValue.key_R) {
			player_sprites.get('player1').get('anim').restart();
		}

		if(e.key == KeyValue.key_A) {

			currentanim++;
			if(currentanim > anim_list.length-1) {
				currentanim = 0;
			}

			player_sprites.get('player1').get('anim').animation = anim_list[currentanim];
			player_sprites.get('player1').get('anim').restart();

		} //key_A


		if(e.key == KeyValue.space) {
			if(Luxe.timescale == 0) {
				Luxe.timescale = 1;
			} else {
				Luxe.timescale = 0;
			}
		}
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


