package tests;

import tests.H;
import phoenix.utils.BinarySearchTree;

class TestPriority {
	public var priority = 0;
	public function new(p:Int = 0){
		priority = p;
	}
	public function compare(other:TestPriority) {
			//if i am less, -1
		if(other.priority > priority) return -1;
			//if i am more, +1
		if(other.priority < priority) return 1;		
			//if im equal or values equal, 0
		return 0;
	}

	public function toString() {
		return 'TestPriority(' + priority + ')';
	}
}
class BST {
	
	var tree1 : BinarySearchTree<Int>;
	var tree2 : BinarySearchTree<Float>;
	var tree3 : BinarySearchTree<String>;
	var tree4 : BinarySearchTree<TestPriority>;
	var tree5 : BinarySearchTree<TestPriority>;

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
			//test 4, default compare function, object
		tree4 = new BinarySearchTree<TestPriority>();
		test_object(tree4);
			//test 5, custom compare function, object
		tree5 = new BinarySearchTree<TestPriority>(compare_objects);
		test_object_sortable(tree5);
	}

	public function compare_objects<T>(obj1:T,obj2:T) {
		return Reflect.callMethod(obj1,'compare',[obj2]);
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
		// trace(string);
		return string;
	}

	public function test_integers( _tree:BinarySearchTree<Int> ) {
		
		H.it( 'should sort the list of integers correctly' , function(){

			var list = [7,2,5,6,1,0,7,36,3];
			var result = '';
			var expected = '\ttree: [BST, size=9] [ 0 , 1 , 2 , 3 , 5 , 6 , 7 , 7 , 36 ];';

			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);
			H.equal(result,expected);

		});	//it

	} //test_integers

	public function test_float( _tree:BinarySearchTree<Float> ) {

		H.it( 'should sort the list of floats correctly' , function(){

			var list = [0.2,2.7,5.9,5.6,5.1,0,2.7,36.2,3.54];
			var result = '';
			var expected = '\ttree: [BST, size=9] [ 0 , 0.2 , 2.7 , 2.7 , 3.54 , 5.1 , 5.6 , 5.9 , 36.2 ];';

			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);
			H.equal(result,expected);

		}); //it



	} //test_float

	public function test_string( _tree:BinarySearchTree<String> ) {
		
		H.it( 'should sort the list of strings correctly' , function(){

			var list = ['derp','able','good','all','able','fire','zero','one','bent','count','enquire'];
			var result = '';
			var expected = '\ttree: [BST, size=11] [ able , able , all , bent , count , derp , enquire , fire , good , one , zero ];';
			
			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);	
			H.equal(result, expected);

		});//it

	} //test_string

	public function test_object( _tree:BinarySearchTree<TestPriority> ) {

		H.it( 'should NOT sort the list of objects correctly' , function(){
		
			var list = [new TestPriority(7),new TestPriority(3),
						new TestPriority(12),new TestPriority(2),
						new TestPriority(7),new TestPriority(1) ];
			var result = '';
			var expected = '\ttree: [BST, size=6] [ TestPriority(7) , TestPriority(3) , TestPriority(12) , TestPriority(2) , TestPriority(7) , TestPriority(1) ];';

			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);
			H.equal(result, expected);

		});//it

	} //test_priority

	public function test_object_sortable( _tree:BinarySearchTree<TestPriority> ) {

		H.it( 'should sort the list of objects correctly' , function(){
		
			var list = [new TestPriority(7),new TestPriority(3),
						new TestPriority(12),new TestPriority(2),
						new TestPriority(7),new TestPriority(1) ];
			var result = '';
			var expected = '\ttree: [BST, size=6] [ TestPriority(1) , TestPriority(2) , TestPriority(3) , TestPriority(7) , TestPriority(7) , TestPriority(12) ];';

			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);
			H.equal(result, expected);

		});//it

	} //test_priority
}