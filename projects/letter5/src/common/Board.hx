package common;

import common.Skin ;
import common.Skin;
import luxe.Color;
import luxe.Input.MouseEvent;
import luxe.Input.TouchEvent;
import luxe.Vector;

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
    public var spacing : Int = 0;
    	//the actual width
    public var width : Int = 0;
    public var height : Int = 0;

    	//the blocks and cells of the board
    public var blocks : Array< Array<Block> >;
    public var cells : Array< Array<Cell> >;
    	//the selected blocks
    public var selected : Array<Block>;

    	//alphabet
	public var alphabet : String = 'AEIOUSBCDFGHJKLMNPRTVWYXQZ';

        //top ui bar
    public var top_ui_bar : NineSlice;
    public var bottom_ui_bar : NineSlice;
    public var word_ui_bar : NineSlice;

        //any rectangle geometries
    public var rectboxes : Array<Geometry>;

    	//debug stuff
    var _debug_geometry : Array<Geometry>;

	public function new( _game:Main, ?options:Dynamic ) {
		
		game = _game;

		_debug_geometry = [];

		if(options == null) options = {};
		if(options.w != null) w = options.w;
		if(options.h != null) h = options.h;
		if(options.blockw != null) blockw = options.blockw;
		if(options.blockh != null) blockh = options.blockh;
		if(options.spacing != null) spacing = options.spacing;
		if(options.offsetx != null) offsetx = options.offsetx;
		if(options.offsety != null) offsety = options.offsety;

		blocks = [];
		cells = [];
        selected = [];
		rectboxes = [];

        touchpos = new Vector();

			//calculate the offset positions
        baseleft = Std.int(( Luxe.screen.w / 2) - ( ((blockw+spacing)*w)/2 )) + offsetx;
        basetop = Std.int(( Luxe.screen.h / 2) - ( ((blockh+spacing)*h)/2 )) + offsety;

        width = Std.int((blockw+spacing) * w);
        height = Std.int((blockw+spacing) * h);

        

	} //new 

    public function create_blocks() {
            //create cells
        for( _x in 0... w ) {

            var cell_column = [];
            var block_column = [];

            for( _y in 0 ... h ) {                

                var __x = baseleft+((_x * (blockw+spacing)));
                var __y = basetop+((_y * (blockh+spacing)));

                var c = new Cell(this, Std.int(__x), Std.int(__y));
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

	public function init() {

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
        top_ui_bar = new NineSlice({
            depth : skin.top.depth,
            texture : skin.texture,
            top : skin.top.t,
            right : skin.top.r,
            bottom : skin.top.b,
            left : skin.top.l,
            source_x : skin.top.sx,
            source_y : skin.top.sy,
            source_w : skin.top.sw,
            source_h : skin.top.sh,
        });

        top_ui_bar.create( new Vector(skin.top.x, skin.top.y), skin.top.w, skin.top.h );

            //create the UI bars
        bottom_ui_bar = new NineSlice({
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

        bottom_ui_bar.create( new Vector(skin.bottom.x, skin.bottom.y), skin.bottom.w, skin.bottom.h );

        for( _rect in skin.rects ) {

            var _rect_geom = Luxe.draw.box({
                x: _rect.rect.x, y: _rect.rect.y, 
                w: _rect.rect.w, h: _rect.rect.h,
                color : _rect.color, depth : _rect.depth
            });

            rectboxes.push(_rect_geom);
        }

        _debug_geometry.push(Luxe.draw.rectangle({
        	x: baseleft, y : basetop,
        	w : width, h : height,
        	color : new Color(1,1,1,0.1)
        })); //_debug_geometry


        create_blocks();

	} //init

	public function destroy() {
        
        top_ui_bar.destroy();
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

	} //destroy

    var _selected : Block;
    var mousedown : Bool;
    var touchpos : Vector;

    public function ontouchbegin(e:TouchEvent) {
        mousedown = true;
    }
    public function ontouchend(e:TouchEvent) {
        mousedown = false;
    }

    public function ontouchmove(e:TouchEvent) {
        touchpos.set(e.x,e.y);
        ondrag(touchpos);
    }

    public function onmousemove(e:MouseEvent) {
        ondrag(e.pos);
    }

    public function ondrag(pos:Vector) {

        if(mousedown) {

            var gridspacex = pos.x - baseleft;
            var gridspacey = pos.y - basetop;

            var gridx = Math.floor(gridspacex / (blockw+spacing));
            var gridy = Math.floor(gridspacey / (blockh+spacing));

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

    public function onmousedown(e:MouseEvent) {
        #if !ios
            mousedown = true;
        #end
    }

    public function onmouseup(e:MouseEvent) {
        #if !ios
            mousedown = false;
        #end
    }
	
}
