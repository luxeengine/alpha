package luxe.structures;


class BalancedBinarySearchTree<K,T> {

	public static inline var RED : Bool = true;
	public static inline var BLACK : Bool = false;

	public var root : BalancedBinarySearchTreeNode<K,T>;
	public var compare : K->K->Int;

	public function new( compare_function : K->K->Int ) {
		compare = compare_function;
	}

	public function toString() : String {
		return "";
	} //toString

//Tree size
	public function empty() {
		return root == null;
	}

	public function size() {
		return _size(root);
	} //size

    public function height() { 
    	return _height(root);
   	} //height

    private function _height( _node:BalancedBinarySearchTreeNode<K,T>  ) {
        if (_node == null) return 0;

        return 1 + Std.int(Math.max( _height(_node.left), _height(_node.right) ));
    } //_height

//Node  size
	private function _size( _node:BalancedBinarySearchTreeNode<K,T> ) {
		if(_node == null) {
			return 0;
		} else {
			return _node.nodecount;
		}
	} //_size

//Insert
	public function insert( _key:K, _value:T ) {
		root = _insert( root, _key, _value );
		root.color = BLACK;
	} //insert

	private function _insert( _node:BalancedBinarySearchTreeNode<K,T>, _key:K, _value:T ) : BalancedBinarySearchTreeNode<K,T> {
		
		if(_node == null) {
			return new BalancedBinarySearchTreeNode<K,T>(_key, _value, 1, RED);
		} //_node

			var comparison = compare(_key, _node.key);
			if(comparison < 0) {
				_node.left = _insert(_node.left, _key, _value);
			} else
			if(comparison > 0) {
				_node.right = _insert(_node.right, _key, _value);
			} else {
				_node.value = _value;
			}

			if(is_red(_node.right) && !is_red(_node.left)) {
				_node = rotate_left(_node);
			}

			if(is_red(_node.left) && is_red(_node.left.left)) {
				_node = rotate_right(_node);
			}

			if(is_red(_node.left) && is_red(_node.right)) {
				flip_colors(_node);
			}

		_node.nodecount = _size(_node.left) + _size(_node.right) + 1;

		return _node;

	} //_insert

//Contains
	public function contains( _key:K ) : Bool {
        return find(_key) != null;
    } //contains

//Find
	public function find( _key:K ) : T {
		return _find( root, _key );
	} //find

	private function _find( _node:BalancedBinarySearchTreeNode<K,T>, _key:K ) : T {
		
		if(_node == null) {
			return null;
		} //_node

		var comparison = compare( _key, _node.key );
		if(comparison < 0) {
			return _find(_node.left, _key);
		} else //comparison < 0
		if(comparison > 0) {
			return _find(_node.right, _key);
		} else { //comparison > 0
			return _node.value;
		}

	} //_find

//Rank
	public function rank( _key:K ) : Int {
		return _rank(_key, root);
	} //rank

	private function _rank( _key:K, _node:BalancedBinarySearchTreeNode<K,T> ) : Int {
		if(_node == null) return 0;
		
		var comparison = compare(_key, _node.key);
		if(comparison < 0) {
			return _rank(_key, _node.left);
		} else
		if(comparison > 0) {
			return 1 + _size(_node.left) + _rank( _key, _node.right );
		} else {
			return _size(_node.left);
		}
	}

//Select
	public function select( _rank:Int ) : K {
		return _select(root,_rank).key;
	} //select

	private function _select( _node:BalancedBinarySearchTreeNode<K,T>, _rank:Int ) : BalancedBinarySearchTreeNode<K,T> {
		
		if(_node == null) return null;
		var _r = _size(_node.left);

		if(_r > _rank) {
			return _select(_node.left, _rank);
		} else 
		if(_r < _rank) {
			return _select(_node.right, _rank - _r - 1);
		} else {
			return _node;
		}

	} //_select

//Min
	public function min() : K {
		return _min(root).key;
	} //min

	public function _min( _node:BalancedBinarySearchTreeNode<K,T> ) : BalancedBinarySearchTreeNode<K,T> {
		if(_node.left == null) return _node;
		return _min( _node.left );
	} //_min
//Max
	public function max() : K {
        return _max(root).key;
    } 

    private function _max( _node : BalancedBinarySearchTreeNode<K,T> ) : BalancedBinarySearchTreeNode<K,T> { 
        if (_node.right == null) {
        	return _node; 
        } else {
        	return _max(_node.right);
        }
    } //max
//Floor
	public function floor( _key:K ) : Null<K> {
		var _node = _floor(root, _key);
		if(_node == null) {
			return null;
		} 

		return _node.key;
	} //floor

	private function _floor(_node:BalancedBinarySearchTreeNode<K,T>, _key:K ) : BalancedBinarySearchTreeNode<K,T> {
		
		if(_node == null) return null;

		var comparison = compare(_key, _node.key);
		
		if(comparison == 0) return _node;
		if(comparison < 0)  return _floor(_node.left, _key);

		var _n = _floor(_node.right, _key);
		if(_n != null) {
			return _n;
		} else {
			return _node;
		}

	} //_floor
//Ceil
	public function ceil( _key:K ) : Null<K> {
        var _node = _ceil( root, _key );
        if (_node == null) {
        	return null;
        } else {
        	return _node.key;
        }
    } //ceil

    private function _ceil( _node:BalancedBinarySearchTreeNode<K,T> , _key:K ) : BalancedBinarySearchTreeNode<K,T> {

        if (_node == null) return null;

        var comparison = compare(_key, _node.key);

        if(comparison == 0) return _node;
        if(comparison < 0) {
            var _n = _ceil(_node.left, _key); 
            if (_n != null) {
            	return _n;
            } else {
            	return _node;
            }
        } //comparison < 0
        return _ceil(_node.right, _key); 
    } //_ceil

//Delete
    public function deleteMin() {
    	
    		// if both children of root are black, set root to red
        if( !is_red(root.left) && !is_red(root.right) ) {
            root.color = RED;
        }

        root = _deleteMin(root);

        if(!empty()) {
        	root.color = BLACK;
        }
    } //deleteMin

    private function _deleteMin( _node:BalancedBinarySearchTreeNode<K,T> ) : BalancedBinarySearchTreeNode<K,T> {
        
        if(_node.left == null) {
        	return null;
        }

 		if( !is_red(_node.left) && !is_red(_node.left.left)) {
            _node = move_red_left( _node );
        }

        _node.left = _deleteMin(_node.left);

        return balance(_node);

    } //deleteMin

    public function deleteMax() {

			// if both children of root are black, set root to red
        if (!is_red(root.left) && !is_red(root.right)) {
            root.color = RED;
        } 

        root = _deleteMax(root);

        if(!empty()) {
        	root.color = BLACK;
        }

    } //deleteMax

    private function _deleteMax( _node:BalancedBinarySearchTreeNode<K,T> ) : BalancedBinarySearchTreeNode<K,T> {

		if( is_red(_node.left) ) {
            _node = rotate_right(_node);
        }

        if (_node.right == null) {
            return null;
        }

        if( !is_red(_node.right) && !is_red(_node.right.left) ) {
            _node = move_red_right(_node);
        }

        _node.right = _deleteMax(_node.right);

        return balance(_node);

    } //_deleteMax

    public function remove( _key:K ) {

        // if both children of root are black, set root to red
        if( !is_red(root.left) && !is_red(root.right) ) {
            root.color = RED;
        }

        root = _remove(root, _key);

        if( !empty() ) {
        	root.color = BLACK;
        }

    } //delete

    private function _remove( _node:BalancedBinarySearchTreeNode<K,T>, _key:K ) : BalancedBinarySearchTreeNode<K,T> {
        if(!contains(_key)) {
            return _node;
        }

    	var comparison = compare( _key, _node.key );
		if( comparison < 0 )  {
            
            if( !is_red(_node.left) && !is_red(_node.left.left) ) {
                _node = move_red_left(_node);
            }

            _node.left = _remove(_node.left, _key);

        } else {

            if( is_red(_node.left) ) {
                _node = rotate_right(_node);
            }

            var comparison = compare( _key, _node.key );

            if ((comparison == 0) && (_node.right == null)) {
                return null;
            }

            if (!is_red(_node.right) && !is_red(_node.right.left)) {
                _node = move_red_right(_node);
            }

            var comparison = compare( _key, _node.key );
            if(comparison == 0) {

                var _n = _min(_node.right);
                	_node.key = _n.key;
                	_node.value = _n.value;
                	// _node.val = _find(_node.right, _min(_node.right).key);
                	// _node.key = _min(_node.right).key;
                _node.right = _deleteMin(_node.right);

            } else {
            	_node.right = _remove(_node.right, _key);
            }

        }

        return balance(_node);

    } //_delete

//Balanced changes
	private function is_red( _node:BalancedBinarySearchTreeNode<K,T> ) {
		if(_node == null) return BLACK;
		return _node.color == RED;
	} //is_red

	public function rotate_left( _node:BalancedBinarySearchTreeNode<K,T> ) {
		var _n = _node.right;
			_node.right = _n.left;
			_n.left = _node;
			_n.color = _node.color;
			_node.color = RED;
			_n.nodecount = _node.nodecount;
			_node.nodecount = 1 + _size(_node.left) + _size(_node.right);
		return _n;
	} //rotate_left

	public function rotate_right( _node:BalancedBinarySearchTreeNode<K,T> ) {
		var _n = _node.left;
			_node.left = _n.right;
			_n.right = _node;
			_n.color = _node.color;
			_node.color = RED;
			_n.nodecount = _node.nodecount;
			_node.nodecount = 1 + _size(_node.left) + _size(_node.right);
		return _n;
	} //rotate_left

	public function flip_colors( _node:BalancedBinarySearchTreeNode<K,T> ) {
        _node.color = !_node.color;
        _node.left.color = !_node.left.color;
        _node.right.color = !_node.right.color;
	} //flip_colors

    // Assuming that h is red and both h.left and h.left.left
    // are black, make h.left or one of its children red.
    private function move_red_left( _node:BalancedBinarySearchTreeNode<K,T> ) : BalancedBinarySearchTreeNode<K,T> {

        flip_colors(_node);

        if( is_red(_node.right.left) ) { 
            _node.right = rotate_right(_node.right);
            _node = rotate_left(_node);
        }

        return _node;
    }

    // Assuming that h is red and both h.right and h.right.left
    // are black, make h.right or one of its children red.
    private function move_red_right( _node:BalancedBinarySearchTreeNode<K,T> ) : BalancedBinarySearchTreeNode<K,T> {
        
        flip_colors(_node);

        if (is_red(_node.left.left)) { 
            _node = rotate_right(_node);
        }

        return _node;
    }

    // restore red-black tree invariant
    private function balance( _node:BalancedBinarySearchTreeNode<K,T> ) : BalancedBinarySearchTreeNode<K,T> {

        if (is_red(_node.right))	{
        	_node = rotate_left(_node);
        }

        if (is_red(_node.left) && is_red(_node.left.left)) {
        	_node = rotate_right(_node);
        }

        if (is_red(_node.left) && is_red(_node.right)) {
        	flip_colors(_node);
        }

        	_node.nodecount = _size(_node.left) + _size(_node.right) + 1;

        return _node;

    } //balance

    public function toArray() : Array<T> {
		var a = new Array<T>();

  		traverse( root, InOrder, function( _node : BalancedBinarySearchTreeNode<K,T> ) {
  			a.push( _node.value );
  		});

  		return a;
    } //toArray

    public function keys() : Array<K> {
    	var a = new Array<K>();

  		traverse( root, InOrder, function( _node : BalancedBinarySearchTreeNode<K,T> ) {
  			a.push( _node.key );
  		});

  		return a;
    } //keys
    
    public function iterator() : Iterator<T> {
        
  		return toArray().iterator();

    } //iterator

	public function traverse( _node:BalancedBinarySearchTreeNode<K,T>, _traverse_method:BalancedBinarySearchTraverseMethod, _process_node_function : BalancedBinarySearchTreeNode<K,T> ->Void ) {
        
        if (_node != null) {

            switch(_traverse_method) {
                
                case PreOrder:
                    _process_node_function(_node);
                    traverse(_node.left, _traverse_method, _process_node_function);
                    traverse(_node.right, _traverse_method, _process_node_function);
                    
                case InOrder:
                    traverse(_node.left, _traverse_method, _process_node_function);
                    _process_node_function(_node);
                    traverse(_node.right, _traverse_method, _process_node_function);
                    
                case PostOrder:
                    traverse(_node.left, _traverse_method, _process_node_function);
                    traverse(_node.right, _traverse_method, _process_node_function);
                    _process_node_function(_node);

            } //_traverse_method

        } //_node

    } //traverse


	// public function compare( _key:K, _other_key:K ) {
	// 	if(_key < _other_key)  return -1;
	// 	if(_key > _other_key)  return  1;
	// 	if(_key == _other_key) return  0;
	// 	return -1;
	// } // compare	

} //BinarySearchTree


class BalancedBinarySearchTreeNode<K,T> {

	public var left 		: BalancedBinarySearchTreeNode<K,T>;
	public var right 		: BalancedBinarySearchTreeNode<K,T>;
	public var nodecount 	: Int;
	public var color 		: Bool;

	public var key 			: K;
	public var value 		: T;

	public function new( _key:K, _value:T, _nodecount:Int, _color:Bool ) {
		key = _key;
		value = _value;
		nodecount = _nodecount;
		color = _color;
	} //new

} //BalancedBinarySearchTreeNode

enum BalancedBinarySearchTraverseMethod {
    PreOrder;
    InOrder;
    PostOrder;
} //enum
