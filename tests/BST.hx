package tests;

import phoenix.utils.BinarySearchTree;

class BST {
	
	var tree1 : BinarySearchTree<Int>;

	public function new() {
			//test 1, default compare function
		tree1 = new BinarySearchTree<Int>();

		test_integers(tree1);
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
		var list = [7,2,5,6,1,0,7,36,3];
		for(item in list) {
			trace('tree before - ');
			print_tree(_tree);
			_tree.insert(item);
			trace('tree after - ' );
				trace('\t\tinserted ' + item);
					print_tree(_tree);				
		}		
	}
}