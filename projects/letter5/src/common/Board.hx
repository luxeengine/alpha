package common;

import common.Skin ;
import common.Skin;
import luxe.Color;
import luxe.Vector;

import phoenix.geometry.Geometry;

import luxe.NineSlice;

class Board {

	public var game : Main;
	public var skin : Skin;	
		//the grid width and height
	public var w : Int = 7;
	public var h : Int = 7;
    	//the offset in the main view
    public var offsetx : Int = 0;
    public var offsety : Int = 0;
        //the position of the block
    public var baseleft : Int = 0;
    public var basetop : Int = 0;
    	//the block size of this board
    public var blockw : Float = 64; 
    public var blockh : Float = 64; 
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

			//calculate the offset positions
        baseleft = Std.int(( Luxe.screen.w / 2) - ( (blockw*w)/2 )) + offsetx;
        basetop = Std.int(( Luxe.screen.w / 2) - ( (blockh*h)/2 )) + offsety;

        width = Std.int((blockw+spacing) * w);
        height = Std.int((blockw+spacing) * h);

        	//create cells
        for( _x in 0... w ) {

            var cell_column = [];
            var block_column = [];

            for( _y in 0 ... h ) {                

                var __x = baseleft+((_x * (blockw+spacing)));
                var __y = basetop+((_y * (blockh+spacing)));

                var c = new Cell(this, Std.int(__x), Std.int(__y));
                var b = new Block(this, Std.int(__x), Std.int(__y));
                
                cell_column.push(c);
                block_column.push(b);
            }  

            cells.push(cell_column);
            blocks.push(block_column);
        }        

	} //new 

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
            depth : 1,
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
            depth : 1,
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

        _debug_geometry.push(Luxe.draw.rectangle({
        	x: baseleft, y : basetop,
        	w : width, h : height,
        	color : new Color(1,1,1,0.1)
        })); //_debug_geometry

        for( _x in 0... w ) {
            for( _y in 0 ... h ) {    
            	cells[_x][_y].init();
            	blocks[_x][_y].init();
            } //_y
		} //_x

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
		
        _debug_geometry.splice(0,_debug_geometry.length);

	} //destroy
	
}
