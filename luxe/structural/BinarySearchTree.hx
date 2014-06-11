package luxe.structural;

class BinarySearchTree<K,T> {

    public var root : BinarySearchTreeNode<K,T>;
    public var compare : K->K->Int;

    public function new( compare_function : K->K->Int ) {
        compare = compare_function;
    }

    public function toString() : String {
        return "";
    } //toString

//Tree size

    public function size() {
        return _size(root);
    } //size

//Node  size
    function _size( _node:BinarySearchTreeNode<K,T> ) {
        if(_node == null) {
            return 0;
        } else {
            return _node.nodecount;
        }
    } //_size

//Insert
    public function insert( _key:K, _value:T ) {
        root = _insert( root, _key, _value );
    } //insert

    function _insert( _node:BinarySearchTreeNode<K,T>, _key:K, _value:T ) : BinarySearchTreeNode<K,T> {

        if(_node == null) {
            return new BinarySearchTreeNode<K,T>(_key, _value, 1);
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

    function _find( _node:BinarySearchTreeNode<K,T>, _key:K ) : T {

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

    function _rank( _key:K, _node:BinarySearchTreeNode<K,T> ) : Int {
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

    function _select( _node:BinarySearchTreeNode<K,T>, _rank:Int ) : BinarySearchTreeNode<K,T> {

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

    function _min( _node:BinarySearchTreeNode<K,T> ) : BinarySearchTreeNode<K,T> {
        if(_node.left == null) return _node;
        return _min( _node.left );
    } //_min
//Max
    public function max() : K {
        return _max(root).key;
    }

    function _max( _node : BinarySearchTreeNode<K,T> ) : BinarySearchTreeNode<K,T> {
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

    function _floor(_node:BinarySearchTreeNode<K,T>, _key:K ) : BinarySearchTreeNode<K,T> {

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

    function _ceil( _node:BinarySearchTreeNode<K,T> , _key:K ) : BinarySearchTreeNode<K,T> {

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
        root = _deleteMin(root);
    }

    function _deleteMin( _node:BinarySearchTreeNode<K,T> ) : BinarySearchTreeNode<K,T> {

        if (_node.left == null) {
            return _node.right;
        }

        _node.left = _deleteMin(_node.left);
        _node.nodecount = _size(_node.left) + _size(_node.right) + 1;

        return _node;

    } //deleteMin

    public function deleteMax() {
        root = _deleteMax(root);
    } //deleteMax

    function _deleteMax( _node:BinarySearchTreeNode<K,T> ) : BinarySearchTreeNode<K,T> {

        if (_node.right == null) {
            return _node.left;
        }

            _node.right = _deleteMax(_node.right);
            _node.nodecount = _size(_node.left) + _size(_node.right) + 1;

        return _node;

    } //_deleteMax

    public function remove( _key:K ) {
        root = _remove(root, _key);
    } //delete

    function _remove( _node:BinarySearchTreeNode<K,T>, _key:K ) : BinarySearchTreeNode<K,T> {

        if (_node == null) return null;

            var comparison = compare( _key, _node.key );

            if(comparison < 0) {
                _node.left  = _remove(_node.left,  _key);
            } else
            if(comparison > 0) {
                _node.right = _remove(_node.right, _key);
            } else {

                if (_node.right == null) {
                    return _node.left;
                }

                if (_node.left  == null) {
                    return _node.right;
                }

                var _n = _node;

                _node = _min(_n.right);
                _node.right = _deleteMin(_n.right);
                _node.left = _n.left;

            }

            _node.nodecount = _size(_node.left) + _size(_node.right) + 1;

        return _node;

    } //_delete

    public function toArray() : Array<T> {
        var a = new Array<T>();

        traverse( root, InOrder, function( _node : BinarySearchTreeNode<K,T> ) {
            a.push( _node.value );
        });

        return a;
    } //toArray

    public function keys() : Array<K> {
        var a = new Array<K>();

        traverse( root, InOrder, function( _node : BinarySearchTreeNode<K,T> ) {
            a.push( _node.key );
        });

        return a;
    } //keys

    public function iterator() : Iterator<T> {

        return toArray().iterator();

    } //iterator

    public function traverse( _node:BinarySearchTreeNode<K,T>, _traverse_method:BinarySearchTraverseMethod, _process_node_function : BinarySearchTreeNode<K,T> ->Void ) {

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
    //  if(_key < _other_key)  return -1;
    //  if(_key > _other_key)  return  1;
    //  if(_key == _other_key) return  0;
    //  return -1;
    // } // compare

} //BinarySearchTree


class BinarySearchTreeNode<K,T> {

    public var left         : BinarySearchTreeNode<K,T>;
    public var right        : BinarySearchTreeNode<K,T>;
    public var nodecount    : Int;

    public var key          : K;
    public var value        : T;

    public function new( _key:K, _value:T, _nodecount:Int ) {
        key = _key;
        value = _value;
        nodecount = _nodecount;
    } //new

} //BinarySearchTreeNode

enum BinarySearchTraverseMethod {
    PreOrder;
    InOrder;
    PostOrder;
} //enum
