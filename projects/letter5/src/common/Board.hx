package common;

class Board {
			
		//the grid width and height
	public var w : Int = 7;
	public var h : Int = 7;
    	//the offset in the main view
    public var offsetx : Int = 0;
    public var offsety : Int = 0;
    	//the block size of this board
    public var blockw : Float = 64; 
    public var blockh : Float = 64; 
    	//the space between blocks in this board
    public var spacing : Int = 0;
    	//the blocks and cells of the board
    public var blocks : Array< Array<Block> >;
    public var cells : Array< Array<Cell> >;
    	//the selected blocks
    public var selected : Array<Block>;

	public function new() {

	}	
	
}