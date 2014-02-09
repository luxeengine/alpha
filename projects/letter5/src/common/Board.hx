package common;

import common.Skin ;
import common.Skin;
import luxe.Color;
import luxe.Input.MouseEvent;
import luxe.Input.TouchEvent;
import luxe.Rectangle;
import luxe.Text;
import luxe.tween.Actuate;
import luxe.Vector;

import luxe.Visual;
import phoenix.Color.ColorHSV;
import phoenix.geometry.Geometry;

import luxe.NineSlice;

enum ActionType {
    move;
    down;
    up;
}

class Board {

	public var game : Main;
	public var skin : Skin;	
		//the grid width and height
	public var w : Int = 6;
	public var h : Int = 6;
    	//the offset in the main view
    public var offsetx : Int = 0;
    public var offsety : Int = 0;
        //the position of the block
    public var baseleft : Int = 0;
    public var basetop : Int = 0;
    	//the block size of this board
    public var blockw : Float = 100; 
    public var blockh : Float = 100; 
    	//the space between blocks in this board
    public var spacing : Int = 8;
    public var padding : Int = 8;
    	//the actual width
    public var width : Int = 0;
    public var height : Int = 0;

    var ready : Bool = false;

    	//the blocks and cells of the board
    public var blocks : Array< Array<Block> >;
    public var cells : Array< Array<Cell> >;
    	//the selected blocks
    public var selected : Array<Block>;

     public var delta_time_text : luxe.Text;

     public var desc_created    : luxe.Text;
     public var desc_words      : luxe.Text;
     public var desc_destroyed  : luxe.Text;
     public var desc_swapped    : luxe.Text;
     
     public var score_created    : luxe.Text;
     public var score_words      : luxe.Text;
     public var score_destroyed  : luxe.Text;
     public var score_swapped    : luxe.Text;
     
     public var combo_score    : luxe.Text;
     public var combo_ring     : Visual;

    	//alphabet
	public var alphabet : String = 'AEIOUSBCDFGHJKLMNPRTVWYXQZ';

        //top ui bar
    public var bottom_ui_bar : NineSlice;

        //any rectangle geometries
    public var rectboxes : Array<Geometry>;

    	//debug stuff
    var _debug_geometry : Array<Geometry>;

    var red : Color;
    var black : Color;
    var lit : Color;

	public function new( _game:Main, ?options:Dynamic ) {
		
		game = _game;

		if(options == null) options = {};
		if(options.w != null) w = options.w;
		if(options.h != null) h = options.h;
		if(options.blockw != null) blockw = options.blockw;
		if(options.blockh != null) blockh = options.blockh;
		if(options.spacing != null) spacing = options.spacing;
		if(options.offsetx != null) offsetx = options.offsetx;
		if(options.offsety != null) offsety = options.offsety;

        touchpos = new Vector();
        
        delta_time_text = new luxe.Text({
            color : new Color(0,0,0,1).rgb(0xf6007b),
            pos : new Vector(30,30),
            font : Luxe.renderer.default_font,
            size : 16 * game.ratio,
            depth : 20,
        });

        red = new ColorHSV(0,1,0.82,1).toColor();
        black = new ColorHSV(132,0.16,0.12,1).toColor();
        lit = new Color().rgb(0xA29595);

	} //new 

    public function create_blocks() {

            //create cells
        for( _x in 0... w ) {

            var cell_column = [];
            var block_column = [];

            for( _y in 0 ... h ) {                

                var __x = baseleft+(Math.floor(spacing/2)+(_x * (blockw+spacing)));
                var __y = basetop+(Math.floor(spacing/2)+(_y * (blockh+spacing)));

                var c = new Cell(this, Std.int(__x), Std.int(__y), _x, _y);
                var b = new Block(this, Std.int(__x), Std.int(__y));

                c.init();
                b.init();
                
                cell_column.push(c);
                block_column.push(b);
            }  

            cells.push(cell_column);
            blocks.push(block_column);
        } 

    } //create_blocks

    function create_ui() {

        var ring_radius : Float = Luxe.screen.h * 0.05;

        combo_ring = new Visual({
            geometry : Luxe.draw.circle({ r: ring_radius }),
            pos : new Vector(Luxe.screen.mid.x, basetop / 2),
            color : black.clone(),
            depth : 6
        });

        combo_score = new Text({
            size : 24 * game.ratio,
            font : game.font,
            text : 'x1',
            align : TextAlign.center,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x-(ring_radius), (basetop/2)-(ring_radius), ring_radius*2, ring_radius*1.75 )
        });

        var bottom_mid = (basetop+height) + ((Luxe.screen.h-(basetop+height))/2);
        var textheight = (ring_radius*0.25);

        desc_created = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : red.clone(),
            text : 'CREATED',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid-(textheight*3), Luxe.screen.mid.x, textheight )
        });        

        desc_destroyed = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : red.clone(),
            text : 'DESTROYED',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid-(textheight), Luxe.screen.mid.x, textheight )
        });

        desc_swapped = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : red.clone(),
            text : 'SWAPPED',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid+(textheight), Luxe.screen.mid.x, textheight )
        });

        desc_words = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : red.clone(),
            text : 'WORDS',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid+(textheight*3), Luxe.screen.mid.x, textheight )
        });

        score_created = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : black.clone(),
            text : '0',
            align : TextAlign.left,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x+textheight, bottom_mid-(textheight*3), Luxe.screen.mid.x-textheight, textheight )
        });

        score_destroyed = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : black.clone(),
            text : '0',
            align : TextAlign.left,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x+textheight, bottom_mid-(textheight), Luxe.screen.mid.x-textheight, textheight )
        });

        score_swapped = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : black.clone(),
            text : '0',
            align : TextAlign.left,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x+textheight, bottom_mid+(textheight), Luxe.screen.mid.x-textheight, textheight )
        });

        score_words = new Text({
            size : 12 * game.ratio,
            font : game.font,
            color : black.clone(),
            text : '0',
            align : TextAlign.left,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x+textheight, bottom_mid+(textheight*3), Luxe.screen.mid.x-textheight, textheight )
        });


    }

    function refresh_combo() {

        combo_ring.color.tween(0.2, {r:red.r,g:red.g,b:red.b}).onComplete(function(){
            combo_ring.color.tween(0.1, {r:black.r,g:black.g,b:black.b});
        });

        Actuate.tween( combo_ring.scale, 0.2, { x:1.1, y:1.1 }).onComplete(function(){
            Actuate.tween( combo_ring.scale, 0.1, { x:1, y:1 } );
        });

    }

    function start_select() {

        combo_ring.color.tween(0.5, {r:lit.r,g:lit.g,b:lit.b}, true);
        Actuate.tween( combo_ring.scale, 0.5, { x:1.1, y:1.1 }).onComplete(function(){
            combo_ring.scale.x = 1;
            combo_ring.scale.y = 1;
        });

    }

    function start_target() {
        combo_ring.color.tween(0.5, {r:red.r,g:red.g,b:red.b}, true);
        Actuate.tween( combo_ring.scale, 0.5, { x:1.1, y:1.1 }).onComplete(function(){
            combo_ring.scale.x = 1;
            combo_ring.scale.y = 1;
        });
    }

    function stop_target() {
        combo_ring.color.tween(0.001, {r:lit.r,g:lit.g,b:lit.b}, true);
        Actuate.tween( combo_ring.scale, 0.001, { x:1, y:1 }, true);
    }

    function stop_select() {
        
        if(!highlighting) {
            combo_ring.color.tween(0.001, {r:black.r,g:black.g,b:black.b}, true);
        }

        Actuate.tween( combo_ring.scale, 0.001, { x:1, y:1 }, true);

    }

    function highlight_current() {
        if(_selected != null) {
            _highlighted = _selected;
            _highlighted.highlight();
            highlighting = true;
        }
    }

	public function init() {

        _debug_geometry = [];
        
        blocks = [];
        cells = [];
        selected = [];
        rectboxes = [];
        
        var mid_s_x = Luxe.screen.w / 2;
        var mid_s_y = Luxe.screen.h / 2;

        padding = Math.floor(mid_s_x * 0.1);

            //calculate the best blockw and blockh
            //take the width of the screen, fit the number of blocks in + spacing
        blockw = Math.round( (Luxe.screen.w - (padding*2) - (w*spacing)) / w );
        blockh = blockw;

            //calculate the offset positions
        baseleft = Math.floor((mid_s_x) - ( ((blockw+spacing)*w)/2 )) + offsetx;
        basetop = Math.floor((mid_s_y) - ( ((blockh+spacing)*h)/2 )) + offsety;

        width = Math.floor((blockw+spacing) * w);
        height = Math.floor((blockh+spacing) * h);

            //Load json skin file
		var template_text = Luxe.loadText('assets/skins/default/skin.json');
            //if it's valid
		if(template_text != null) {
			var template = luxe.utils.JSON.parse(template_text);
			skin = new Skin(template, this);
			skin.init();
		} else {
			throw "can't find skin " + 'default';
		} 

            //create the UI bars
        bottom_ui_bar = new NineSlice({
            name : 'bottom_ui_bar',
            depth : skin.bottom.depth,
            texture : skin.texture,
            top : skin.bottom.t,
            right : skin.bottom.r,
            bottom : skin.bottom.b,
            left : skin.bottom.l,
            source_x : skin.bottom.sx,
            source_y : skin.bottom.sy,
            source_w : skin.bottom.sw,
            source_h : skin.bottom.sh,
        });

        for( _rect in skin.rects ) {

            var _rect_geom = Luxe.draw.box({
                x: _rect.rect.x, y: _rect.rect.y, 
                w: _rect.rect.w, h: _rect.rect.h,
                color : _rect.color, depth : _rect.depth
            });

            rectboxes.push(_rect_geom);
        }


        // _debug_geometry.push(
        //     Luxe.draw.line({
        //         p0: new Vector(Luxe.screen.mid.x, 0),
        //         p1: new Vector(Luxe.screen.mid.x, Luxe.screen.h),
        //         color : new Color(1,0.3,0.1,1), depth:50
        //     })
        // ); //_debug_geometry

        // _debug_geometry.push(
        //     Luxe.draw.rectangle({
        //         x: baseleft, y:basetop,
        //     	w : width, h:height,
        //     	color : new Color(1,0.3,0.1,1)
        //     })
        // ); //_debug_geometry
        
        _selected = null;
        _highlighted = null;
        highlighting = false;

        create_blocks();
        create_ui();

        ready = true;

	} //init

	public function destroy() {
        
        bottom_ui_bar.destroy();

        for( _x in 0 ... w ) {
            for( _y in 0 ... h ) {    
            	cells[_x][_y].destroy();
            	blocks[_x][_y].destroy();
            } // _y 
		} //for _x

        for(_g in _debug_geometry) {
            _g.drop();
            _g = null;
        } //drop all geometry

		for(_g in rectboxes) {
			_g.drop();
			_g = null;
		} //drop all geometry
		
        _debug_geometry.splice(0,_debug_geometry.length);
        rectboxes.splice(0,rectboxes.length);

        combo_ring.destroy();
        combo_score.destroy();

        desc_created.destroy();
        desc_destroyed.destroy();
        desc_swapped.destroy();
        desc_words.destroy();

        score_created.destroy();
        score_destroyed.destroy();
        score_swapped.destroy();
        score_words.destroy();

        cells = null;
        blocks = null;

	} //destroy

    var _selected : Block;
    var _highlighted : Block;
    var _targeted : Block;
    var mousedown : Bool;
    var touchpos : Vector;

    public function ontouchbegin(e:TouchEvent) {
        
        if(mousedown == false) {
            released = false;
        }

        mousedown = true;
        touchpos.set(e.x,e.y);

        ondrag( touchpos, ActionType.down );
    }
    public function ontouchend(e:TouchEvent) {

        released = true;
        mousedown = false;

        touchpos.set(e.x,e.y);
        
        ondrag( touchpos, ActionType.up );
    }

    public function ontouchmove(e:TouchEvent) {
        
        touchpos.set(e.x,e.y);
        ondrag( touchpos, ActionType.move );

    }

    public function onmousemove(e:MouseEvent) {
        ondrag( e.pos, ActionType.move );
    }

    public function update(dt:Float) {
        
        if(_selected != null && _highlighted == null) {
            if(Luxe.time - current_block_time >= 0.5) {
                highlight_current();
            }
        }

        if(mousedown) {
            // delta_time_text.text = ''+(Luxe.time - current_block_time) ;
        } else {
            // delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;
        }

         // if( current_block_time )
    }

    var highlighting : Bool = false;
    var released : Bool = true;
    var block_margin : Float = 0.20;

    public function ondrag( pos:Vector, _type:ActionType ) {

        if(!ready) return;

        var gridspacex = pos.x - baseleft;
        var gridspacey = pos.y - basetop;

        var subx = (gridspacex / (blockw+spacing));
        var suby = (gridspacey / (blockh+spacing));
        var gridx = Math.floor(subx);
        var gridy = Math.floor(suby);

        var inside_grid = (gridx > -1 && gridx < w && gridy > -1 && gridy < h && blocks != null && blocks.length != 0);
        
        var subx_n = subx - gridx;
        var suby_n = suby - gridy;
        
        var in_block_x = luxe.utils.Maths.within_range(subx_n, block_margin, 1.0 - block_margin);
        var in_block_y = luxe.utils.Maths.within_range(suby_n, block_margin, 1.0 - block_margin);

        if( mousedown ) {

            if( inside_grid && in_block_x && in_block_y ) {
                
                if(current_block_x != gridx && current_block_y != gridy) {
                    current_block_time = Luxe.time;                    
                    current_block_x = gridx;
                    current_block_y = gridy;
                    if(!highlighting) {
                        start_select(); 
                    } else {
                        start_target();
                    }
                } 

                var block = blocks[gridx][gridy];

                if(!highlighting) {

                    if(block != _selected) {
                        
                        if(_selected != null) {
                            _selected.unselect();
                        }

                        _selected = block;
                        block.select();

                    } //block != selected

                } else { //highlighting?

                    if(block == _highlighted) {

                        if(_type == ActionType.up || _type == ActionType.down) {                        
                            unhighlight();
                            unset_current();
                        } //tap/click

                    } else { //block == _highlighted

                        if(_targeted != null) {
                            _targeted.unhighlight();
                            _targeted = null;
                        }

                            //store the new target
                        _targeted = block;
                        _targeted.select();

                    } //not highlighting same block?

                }

            } else {

                if(!highlighting) {
                    unset_current();
                    unhighlight();
                }

            } //mouse inside block

        }

        if(_type == ActionType.down) {

        }

        if(_type == ActionType.up) {

            unset_current();

            if(gridx == 0 && gridy == 0) {
                game.states.set('menu');
                return;
            }

        }

    } //ondrag

    function unhighlight() {

        highlighting = false;
        
        if(_highlighted != null) {
            _highlighted.unhighlight();
        }

        _highlighted = null;
    }

    function unset_current() {
        
        if(!ready) return;

        current_block_x = -1;
        current_block_y = -1;
        current_block_time = 0.0;

        if(!highlighting) {
            stop_select();
        } else {
            stop_target();
        }        

        if(_selected != null) {
            
            if(_selected != _highlighted){
                _selected.unselect();
            }

            _selected = null;            
        } //selected != null

    } //unset_current

    var score : Int = 1;
    var current_block_time : Float = 0.0;

    var current_block_x : Int = -1;
    var current_block_y : Int = -1;

    public function onmousedown(e:MouseEvent) {
        
        // score++;
        // if(score > 5) score = 1;
        // combo_score.text = 'x'+score;

        // refresh_combo();

        #if !ios
            if(mousedown == false) {
                released = false;
            }
            mousedown = true;
            ondrag( e.pos, ActionType.down );
        #end

    } //onmousedown

    public function onmouseup(e:MouseEvent) {

        #if !ios
            released = true;
            mousedown = false;
            ondrag( e.pos, ActionType.up );
        #end

    } //onmouseup
	
}
