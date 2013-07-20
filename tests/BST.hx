package tests;

import phoenix.utils.BinarySearchTree;

class BST {
	
	var tree1 : BinarySearchTree<Int>;
	var tree2 : BinarySearchTree<Float>;
	var tree3 : BinarySearchTree<String>;

	public function new() {
			//test 1, default compare function, int
		tree1 = new BinarySearchTree<Int>();		
		test_integers(tree1);
			//test 2, default compare function, floats
		tree2 = new BinarySearchTree<Float>();
		test_float(tree2);
			//test 3, default compare function, string
		tree3 = new BinarySearchTree<String>();
		test_string(tree3);
	}

	public function print_tree<T>(_tree:BinarySearchTree<T>) {
		var _count = 0;
		var string = '\ttree: '+ _tree +' [ ';
		for(item in _tree) {
			if(_count != 0) string += ' , ';
			string += Std.string(item);
			++_count;
		}
		string += ' ];';
		trace(string);
	}

	public function test_integers( _tree:BinarySearchTree<Int> ) {
		trace("Testing integer sorting");
		var list = [7,2,5,6,1,0,7,36,3];
		for(item in list) {
			trace('tree before - ');
			print_tree(_tree);
			_tree.insert(item);
			trace('tree after - ' );
				trace('\t\tinserted ' + item);
					print_tree(_tree);				
		}		
	} //test_integers

	public function test_float( _tree:BinarySearchTree<Float> ) {
		trace("Testing floating point sorting");
		var list = [0.2,2.7,5.9,5.6,5.1,0,2.7,36.2,3.54];
		for(item in list) {
			trace('tree before - ');
			print_tree(_tree);
			_tree.insert(item);
			trace('tree after - ' );
				trace('\t\tinserted ' + item);
					print_tree(_tree);				
		}		
	} //test_float

	public function test_string( _tree:BinarySearchTree<String> ) {
		trace("Testing string sorting");
		var list = ['derp','able','good','all','able','fire','zero','one','bent','count','enquire'];
		for(item in list) {
			trace('tree before - ');
			print_tree(_tree);
			_tree.insert(item);
			trace('tree after - ' );
				trace('\t\tinserted ' + item);
					print_tree(_tree);				
		}		
	} //test_float
}