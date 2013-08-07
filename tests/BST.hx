package tests;

import phoenix.geometry.Geometry;
import phoenix.geometry.QuadGeometry;
import tests.H;
import phoenix.utils.BinarySearchTree;

class TestPriority {

	public var priority = 0;
	public var tag = 'default_tag';
	public function new(p:Int = 0, _tag:String = 'default_tag') {
		priority = p;
		tag = _tag;
	}

	public function compare(other:TestPriority) {
			//if they are literally the same
		if(other == this) return 0;
			//if i am less, -1
		if(other.priority > priority) return -1;
			//if i am more, +1
		if(other.priority < priority) return 1;		
			//if value is equal, -1
		if(other.priority == priority) return -1;

		return 1;
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
	var tree6 : BinarySearchTree<TestPriority>;

	public function new() {

		var s = new Geometry(null);
		var t = new QuadGeometry(null);
		var a:Array<Geometry> = [s,t];
		var b:Array<Geometry> = [s,t];
		var c:Array<QuadGeometry> = [t];

		trace("IS SAME TYPE EQUAL!?");
		trace(a[0] == b[0]);
		trace("IS BASE TYPE EQUAL!?");
		trace(a[1] == b[1]);
		trace("IS BASE  EQUAL!?");
		trace(t == a[1]);
		trace("IS BASE 2 EQUAL!?");
		trace(c[0] == a[1]);

			//test 1, default compare function, int
		tree1 = new BinarySearchTree<Int>();		
		test_integers(tree1);
			//test 2, default compare function, floats
		tree2 = new BinarySearchTree<Float>();
		test_float(tree2);
			//test 3, default compare function, string
		tree3 = new BinarySearchTree<String>();
		test_string(tree3);
			//test 4, custom compare function, object
		tree4 = new BinarySearchTree<TestPriority>(compare_objects);
		test_object_sortable(tree4);
			//test 5, test object finding
		tree5 = new BinarySearchTree<TestPriority>(compare_objects);
		test_object_find(tree5);
			//test 6, test object finding and removing (affects tree)
		tree6 = new BinarySearchTree<TestPriority>(compare_objects);
		test_object_find_and_remove(tree6);

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

	public function test_object_sortable( _tree:BinarySearchTree<TestPriority> ) {

		H.it( 'should sort the list of objects correctly' , function(){
		
			var list = [new TestPriority(7),new TestPriority(3),
						new TestPriority(12),new TestPriority(2),
						new TestPriority(7,'specific_tag'),new TestPriority(1) ];
			var result = '';
			var expected = '\ttree: [BST, size=6] [ TestPriority(1) , TestPriority(2) , TestPriority(3) , TestPriority(7) , TestPriority(7) , TestPriority(12) ];';

			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);
			H.equal(result, expected);

			//Attempt to remove the twelve item
			result = '';
			expected = '\ttree: [BST, size=5] [ TestPriority(1) , TestPriority(2) , TestPriority(3) , TestPriority(7) , TestPriority(12) ];';
			
			var found = _tree.find( list[4] );
				//check that it found something			
			H.equal( found != null, true );
			trace('found :  ' + found.data.tag);
				//check that its the correct one
			H.equal( found.data.tag, 'specific_tag');

				//now remove it 
			if(found != null) {
				_tree.remove( found );
			} //found
				
				//Test the similarity
			var result = print_tree(_tree);
			H.equal(result, expected);

		});//it

	} //test_priority

	public function test_object_find( _tree:BinarySearchTree<TestPriority> ) {
		
		H.it( 'should find items correctly' , function(){

			var list = [new TestPriority(7, 'seven'),new TestPriority(3, 'three'),
						new TestPriority(12, 'twelve'),new TestPriority(2, 'two'),
						new TestPriority(7,'seven_two'),new TestPriority(1, 'one') ];

			var result = '';
			var expected = '\ttree: [BST, size=6] [ TestPriority(1) , TestPriority(2) , TestPriority(3) , TestPriority(7) , TestPriority(7) , TestPriority(12) ];';

			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);	
			H.equal(result, expected);

				//find a few
			trace(' find one ');
			var found = _tree.find( list[5] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'one' );			
			
			trace(' find two ');
			var found = _tree.find( list[3] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'two' );

			trace(' find three ');
			var found = _tree.find( list[1] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'three' );


			trace(' find seven ');
			var found = _tree.find( list[0] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'seven' );

			trace(' find seven_two ');
			var found = _tree.find( list[4] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'seven_two' );

			trace(' find twelve ');
			var found = _tree.find( list[2] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'twelve' );


		});//it

	} //test_object_find

	public function test_object_find_and_remove( _tree:BinarySearchTree<TestPriority> ) {
		
		H.it( 'should find and remove items correctly' , function(){

			var list = [new TestPriority(7, 'seven'),new TestPriority(3, 'three'),
						new TestPriority(12, 'twelve'),new TestPriority(2, 'two'),
						new TestPriority(7,'seven_two'),new TestPriority(1, 'one') ];

			var result = '';
			var expected = '\ttree: [BST, size=6] [ TestPriority(1) , TestPriority(2) , TestPriority(3) , TestPriority(7) , TestPriority(7) , TestPriority(12) ];';

			for(item in list) {
				_tree.insert(item);
			}

			result = print_tree(_tree);	
			H.equal(result, expected);

				//find a few
			trace(' find one ');
			var found = _tree.find( list[5] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'one' );
				//removing item after finding it
			_tree.remove( found );

			var expected = '\ttree: [BST, size=5] [ TestPriority(2) , TestPriority(3) , TestPriority(7) , TestPriority(7) , TestPriority(12) ];';
			result = print_tree(_tree);	
			H.equal(result, expected);
			

			trace(' find twelve ');
			var found = _tree.find( list[2] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'twelve' );
				//removing item after finding it
			_tree.remove( found );

			var expected = '\ttree: [BST, size=4] [ TestPriority(2) , TestPriority(3) , TestPriority(7) , TestPriority(7) ];';
			result = print_tree(_tree);	
			H.equal(result, expected);


			trace(' find seven_two ');
			var found = _tree.find( list[4] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'seven_two' );
				//removing item after finding it
			_tree.remove( found );

			var expected = '\ttree: [BST, size=3] [ TestPriority(2) , TestPriority(3) , TestPriority(7) ];';
			result = print_tree(_tree);	
			H.equal(result, expected);

			trace(' find two ');
			var found = _tree.find( list[3] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'two' );
				//removing item after finding it
			_tree.remove( found );

			var expected = '\ttree: [BST, size=2] [ TestPriority(3) , TestPriority(7) ];';
			result = print_tree(_tree);	
			H.equal(result, expected);

			trace(' find seven ');
			var found = _tree.find( list[0] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'seven' );
				//removing item after finding it
			_tree.remove( found );

			var expected = '\ttree: [BST, size=1] [ TestPriority(3) ];';
			result = print_tree(_tree);	
			H.equal(result, expected);

			trace(' find three ');
			var found = _tree.find( list[1] );
				//check that it found something			
			H.equal( found != null, true );
			H.equal( found.data.tag, 'three' );
				//removing item after finding it
			_tree.remove( found );

			var expected = '\ttree: [BST, size=0] [  ];';
			result = print_tree(_tree);	
			H.equal(result, expected);

		});//it

	} //test_object_find

}