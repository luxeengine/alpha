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
            size : 24,
             depth : 20,
        });

        red = new ColorHSV(0,1,0.82,1).toColor();
        black = new ColorHSV(132,0.16,0.12,1).toColor();

	} //new 

    public function create_blocks() {

            //create cells
        for( _x in 0... w ) {

            var cell_column = [];
            var block_column = [];

            for( _y in 0 ... h ) {                

                var __x = baseleft+(Math.round(spacing/2)+(_x * (blockw+spacing)));
                var __y = basetop+(Math.round(spacing/2)+(_y * (blockh+spacing)));

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
            size : 24,
            font : game.font,
            text : 'x1',
            align : TextAlign.center,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x-(ring_radius), (basetop/2)-(ring_radius), ring_radius*1.9, ring_radius*1.75 )
        });

        var bottom_mid = (basetop+height) + ((Luxe.screen.h-(basetop+height))/2);
        var textheight = (ring_radius*0.25);

        desc_created = new Text({
            size : 12,
            font : game.font,
            color : red.clone(),
            text : 'CREATED',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid-(textheight*3), Luxe.screen.mid.x, textheight )
        });        

        desc_destroyed = new Text({
            size : 12,
            font : game.font,
            color : red.clone(),
            text : 'DESTROYED',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid-(textheight), Luxe.screen.mid.x, textheight )
        });

        desc_swapped = new Text({
            size : 12,
            font : game.font,
            color : red.clone(),
            text : 'SWAPPED',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid+(textheight), Luxe.screen.mid.x, textheight )
        });

        desc_words = new Text({
            size : 12,
            font : game.font,
            color : red.clone(),
            text : 'WORDS',
            align : TextAlign.right,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( 0, bottom_mid+(textheight*3), Luxe.screen.mid.x, textheight )
        });

        score_created = new Text({
            size : 12,
            font : game.font,
            color : black.clone(),
            text : '0',
            align : TextAlign.left,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x+textheight, bottom_mid-(textheight*3), Luxe.screen.mid.x-textheight, textheight )
        });

        score_destroyed = new Text({
            size : 12,
            font : game.font,
            color : black.clone(),
            text : '0',
            align : TextAlign.left,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x+textheight, bottom_mid-(textheight), Luxe.screen.mid.x-textheight, textheight )
        });

        score_swapped = new Text({
            size : 12,
            font : game.font,
            color : black.clone(),
            text : '0',
            align : TextAlign.left,
            align_vertical : TextAlign.center,
            depth : 6,
            bounds : new Rectangle( Luxe.screen.mid.x+textheight, bottom_mid+(textheight), Luxe.screen.mid.x-textheight, textheight )
        });

        score_words = new Text({
            size : 12,
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

	public function init() {

        _debug_geometry = [];
        
        blocks = [];
        cells = [];
        selected = [];
        rectboxes = [];
        
        var mid_s_x = Luxe.screen.w / 2;
        var mid_s_y = Luxe.screen.h / 2;

        padding = Std.int(mid_s_x * 0.1);

            //calculate the best blockw and blockh
            //take the width of the screen, fit the number of blocks in + spacing
        blockw = Std.int( (Luxe.screen.w - (padding*2) - (w*spacing))/w );
        blockh = blockw;

            //calculate the offset positions
        baseleft = Std.int((mid_s_x) - ( ((blockw+spacing)*w)/2 )) + offsetx;
        basetop = Std.int((mid_s_y) - ( ((blockh+spacing)*h)/2 )) + offsety;

        width = Std.int((blockw+spacing) * w);
        height = Std.int((blockh+spacing) * h);

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
        //         color : new Color(1,0.3,0.1,1)
        //     })
        // ); //_debug_geometry

        // _debug_geometry.push(
        //     Luxe.draw.rectangle({
        //         x: baseleft, y:basetop,
        //     	w : width, h:height,
        //     	color : new Color(1,0.3,0.1,1)
        //     })
        // ); //_debug_geometry


        create_blocks();
        create_ui();

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
    var mousedown : Bool;
    var touchpos : Vector;

    public function ontouchbegin(e:TouchEvent) {
        mousedown = true;
        touchpos.set(e.x,e.y);
        ondrag(touchpos);
    }
    public function ontouchend(e:TouchEvent) {
        mousedown = false;
        touchpos.set(e.x,e.y);
        ondrag(touchpos);
    }

    public function ontouchmove(e:TouchEvent) {
        touchpos.set(e.x,e.y);
        ondrag(touchpos);
    }

    public function onmousemove(e:MouseEvent) {
        ondrag(e.pos);
    }

    public function update(dt:Float) {
         // delta_time_text.text = 'dt : ' + dt + '\n average : ' + Luxe.debug.dt_average;
    }

    public function ondrag(pos:Vector) {

        if(mousedown) {

            var gridspacex = pos.x - baseleft;
            var gridspacey = pos.y - basetop;

            var gridx = Math.floor(gridspacex / (blockw+spacing));
            var gridy = Math.floor(gridspacey / (blockh+spacing));

            if(gridx == 0 && gridy == 0) {
                game.states.set('menu');
                return;
            }

            if(gridx > -1 && gridx < w && gridy > -1 && gridy < h && blocks != null && blocks.length != 0) {
                //get the block
                var block = blocks[gridx][gridy];

                if(block != _selected) {
                    
                    if(_selected != null) {
                        _selected.deselect();
                    }

                    _selected = block;
                    block.select();

                }

            } else {
                if(_selected != null) {
                    _selected.deselect();
                    _selected = null;
                }
            }

        } //mousedown

    } //ondrag

    var score : Int = 1;
    public function onmousedown(e:MouseEvent) {
        score++;
        if(score > 5) score = 1;
        combo_score.text = 'x'+score;        
        refresh_combo();

        #if !ios
            mousedown = true;
            ondrag(e.pos);
        #end
    }

    public function onmouseup(e:MouseEvent) {
        #if !ios
            mousedown = false;
            ondrag(e.pos);
        #end
    }
	
}
