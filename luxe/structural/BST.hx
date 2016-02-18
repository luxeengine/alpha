package luxe.structural;


/**
    Copyright 2014-2016 Sven Bergström

    A unbalanced binary search tree,
    implemented based on various stack overflow answers,
    wikipedia articles and books read over the years.
    some other references : https://github.com/polygonal/ds

    Part of the structural library for haxe
    http://github.com/underscorediscovery/structural

    MIT license
*/

#if !display @:generic #end
class BST<K,T> {

        /** The tree root node */
    public var root : BSTNode<K,T>;
        /** The current comparison functoin */
    public var compare : K->K->Int;
        /** Whether or not the tree is empty (i.e root == null) */
    public var empty (get, null) : Bool;


        /** Create a new BST with the given comparison function */
    public function new( compare_function : K->K->Int ) {

        compare = compare_function;

    } //new

//Public API

        /** Return the number of nodes in the tree */
    public function size() {

        return node_count(root);

    } //size

        /** Return the depth of the tree */
    public function depth() {

        return node_depth(root);

    } //depth

        /** Insert a node into the tree */
    public function insert( _key:K, _value:T ) {

        root = node_insert( root, _key, _value );

    } //insert

        /** Returns true if the tree contains the key for this node */
    public function contains( _key:K ) : Bool {

            //if the find functions returns non-null it's here
        return find(_key) != null;

    } //contains

        /** Returns a node by key, if found. null otherwise */
    public function find( _key:K ) : T {

        return node_find( root, _key );

    } //find

        /** Return the number of nodes to the left of this node, by key.   
            http://en.wikipedia.org/wiki/Order_statistic_tree */
    public function rank( _key:K ) : Int {

        return node_rank(_key, root);

    } //rank

        /** Find a key by rank in the tree, i.e given a number of nodes, the key at this point.   
            http://en.wikipedia.org/wiki/Order_statistic_tree */
    public function select( _rank:Int ) : K {

        var _node = node_select(root,_rank);

        if(_node != null) {
            return _node.key;
        } else {
            return null;
        }

    } //select

        /** return the smallest node (key) in the tree (most left) */
    public function smallest() : K {

        var _node = node_smallest(root);

        if(_node != null) {
            return _node.key;
        } else {
            return null;
        }

    } //smallest

        /** return the largest node (key) in the tree (most right)*/
   public function largest() : K {

        var _node = node_largest(root);

        if(_node != null) {
            return _node.key;
        } else {
            return null;
        }

    } //largest

        /** remove a node by key. return false if the operation fails (i.e the node is not stored in this tree) */
    public function remove( _key:K ) : Bool {

        if(!contains(_key)) {
            return false;
        }

        root = node_remove(root, _key);

        return true;

    } //remove

        /** remove the smallest node in the tree (most left) */
    public function remove_smallest() {

        root = node_remove_smallest(root);

    } //remove_smallest

        /** remove the largest node in the tree (most right) */
    public function remove_largest() {

        root = node_remove_largest(root);

    } //remove_largest

        /** tree floor http://en.wikipedia.org/wiki/Floor_and_ceiling_functions */
    public function floor( _key:K ) : Null<K> {

        var _node = node_floor(root, _key);

        if(_node == null) {
            return null;
        }

        return _node.key;

    } //floor

        /** tree ceiling http://en.wikipedia.org/wiki/Floor_and_ceiling_functions */
    public function ceil( _key:K ) : Null<K> {

        var _node = node_ceil( root, _key );

        if (_node == null) {
            return null;
        }

        return _node.key;

    } //ceil

        /** return an array of the values in this tree */
    public function toArray() : Array<T> {

        var a = new Array<T>();

        traverse_node( root, order_retain, function( _node : BSTNode<K,T> ) {
            a.push( _node.value );
        });

        return a;

    } //toArray

        /** Return an array of the keys in this tree */
    public function keys() : Array<K> {

        var a = new Array<K>();

        traverse_node( root, order_retain, function( _node : BSTNode<K,T> ) {
            a.push( _node.key );
        });

        return a;

    } //keys

        /** returns an iterator from a conversion to array of this tree. Usable as `for(item in tree)`
            :todo: This should traverse directly and implement IIterator */
    public function iterator() : Iterator<T> {

        return toArray().iterator();

    } //iterator

        /** Traverse a node with the given method, and call the given function for each node traversed */
    public function traverse_node( _node:BSTNode<K,T>, _method:BSTTraverseMethod, _on_traverse : BSTNode<K,T> ->Void ) {

        if (_node != null) {

            switch(_method) {

                case order_pre:
                    _on_traverse(_node);
                    traverse_node(_node.left, _method, _on_traverse);
                    traverse_node(_node.right, _method, _on_traverse);

                case order_retain:
                    traverse_node(_node.left, _method, _on_traverse);
                    _on_traverse(_node);
                    traverse_node(_node.right, _method, _on_traverse);

                case order_post:
                    traverse_node(_node.left, _method, _on_traverse);
                    traverse_node(_node.right, _method, _on_traverse);
                    _on_traverse(_node);

            } //_method

        } //_node

    } //traverse

//Internal API

        //getter
    function get_empty() {

        return root == null;

    }

        /** the depth of a single node */
    function node_depth( _node:BSTNode<K,T>  ) {

        if (_node == null) {
            return 0;
        }

        var _n_depth = Math.max(
                         node_depth(_node.left),
                         node_depth(_node.right)
                       );

        return 1 + Std.int( _n_depth );

    } //node_depth

        /** the node count/children of a single node */
    function node_count( _node:BSTNode<K,T> ) {

        return _node == null ? 0 : _node.nodecount;

    } //node_count

        /** insert a single node */
    function node_insert( _node:BSTNode<K,T>, _key:K, _value:T ) : BSTNode<K,T> {

        if(_node == null) {

            return new BSTNode<K,T>(_key, _value, 1);

        } //_node

            var comparison = compare(_key, _node.key);

            if(comparison < 0) {

                _node.left = node_insert(_node.left, _key, _value);

            } else if(comparison > 0) {

                _node.right = node_insert(_node.right, _key, _value);

            } else {

                _node.value = _value;
            }

            node_update_count(_node);

        return _node;

    } //node_insert

        /* make sure the node count is up to date on a given node */
    function node_update_count( _node:BSTNode<K,T> ) {

        _node.nodecount = node_count(_node.left) + node_count(_node.right) + 1;

        return _node;

    } //node_update_count

        /** find a single node */
    function node_find( _node:BSTNode<K,T>, _key:K ) : T {

        if(_node == null) {
            return null;
        }

        var comparison = compare( _key, _node.key );

        if(comparison < 0) {
            return node_find(_node.left, _key);
        } else if(comparison > 0) {
            return node_find(_node.right, _key);
        } else { //comparison > 0
            return _node.value;
        }

    } //node_find

        /** find rank of single node */
    function node_rank( _key:K, _node:BSTNode<K,T> ) : Int {

        if(_node == null) {
            return 0;
        }

        var comparison = compare(_key, _node.key);

        if(comparison < 0) {
            return node_rank(_key, _node.left);
        } else if(comparison > 0) {
            return 1 + node_count(_node.left) + node_rank( _key, _node.right );
        } else {
            return node_count(_node.left);
        }

    } //node_rank

        /** find key of node by rank */
    function node_select( _node:BSTNode<K,T>, _rank:Int ) : BSTNode<K,T> {

        if(_node == null) {
            return null;
        }

        var _r = node_count(_node.left);

        if(_r > _rank) {
            return node_select(_node.left, _rank);
        } else if(_r < _rank) {
            return node_select(_node.right, _rank - _r - 1);
        } else {
            return _node;
        }

    } //node_select

        /** find smallest of the given node */
    function node_smallest( _node:BSTNode<K,T> ) : BSTNode<K,T> {

        if(_node.left == null) {
            return _node;
        }

        return node_smallest( _node.left );

    } //node_smallest

        /** find largest of the given node */
    function node_largest( _node : BSTNode<K,T> ) : BSTNode<K,T> {

        if (_node.right == null) {
            return _node;
        } else {
            return node_largest(_node.right);
        }

    } //node_largest

        /** node floor http://en.wikipedia.org/wiki/Floor_and_ceiling_functions */
    function node_floor(_node:BSTNode<K,T>, _key:K ) : BSTNode<K,T> {

        if(_node == null) {
            return null;
        }

        var comparison = compare(_key, _node.key);

        if(comparison == 0) {
            return _node;
        } else if(comparison < 0) {
            return node_floor(_node.left, _key);
        }

        var _n = node_floor(_node.right, _key);

        if(_n != null) {
            return _n;
        } else {
            return _node;
        }

    } //node_floor

        /** node ceiling http://en.wikipedia.org/wiki/Floor_and_ceiling_functions */
    function node_ceil( _node:BSTNode<K,T> , _key:K ) : BSTNode<K,T> {

        if (_node == null) {
            return null;
        }

        var comparison = compare(_key, _node.key);

        if(comparison == 0) {

            return _node;

        } else if(comparison < 0) {

            var _n = node_ceil(_node.left, _key);

            if (_n != null) {
                return _n;
            } else {
                return _node;
            }

        } //comparison < 0

        return node_ceil(_node.right, _key);

    } //node_ceil

        /** remove the smallest node in the tree (most left) */
    function node_remove_smallest( _node:BSTNode<K,T> ) : BSTNode<K,T> {

        if (_node.left == null) {
            return _node.right;
        }

        _node.left = node_remove_smallest(_node.left);
        node_update_count( _node );

        return _node;

    } //remove_smallest

        /** remove the largest node in the tree (most right) */
    function node_remove_largest( _node:BSTNode<K,T> ) : BSTNode<K,T> {

        if (_node.right == null) {
            return _node.left;
        }

            _node.right = node_remove_largest(_node.right);
            node_update_count( _node );

        return _node;

    } //node_remove_largest

        /** remove a single node by key */
    function node_remove( _node:BSTNode<K,T>, _key:K ) : BSTNode<K,T> {

        if (_node == null) {
            return null;
        }

            var comparison = compare( _key, _node.key );

            if(comparison < 0) {
                _node.left  = node_remove(_node.left,  _key);
            } else if(comparison > 0) {
                _node.right = node_remove(_node.right, _key);
            } else {

                if (_node.right == null) {
                    return _node.left;
                }

                if (_node.left  == null) {
                    return _node.right;
                }

                var _n = _node;

                _node = node_smallest(_n.right);
                _node.right = node_remove_smallest(_n.right);
                _node.left = _n.left;

            }

            node_update_count( _node );

        return _node;

    } //node_remove

} //BST


    /** A binary search tree node by `K` key and `T` value (type) */
#if !display @:generic #end
class BSTNode<K,T> {

        /** The node left of this node (less than) */
    public var left         : BSTNode<K,T>;
        /** The node right of this node (bigger than) */
    public var right        : BSTNode<K,T>;
        /** The node count of this node, including itself */
    public var nodecount    : Int;

        /** The key used to compare this node */
    public var key          : K;
        /** The value this node holds */
    public var value        : T;

        /** Create a new node with given key, value, count. Use `insert` on the tree instead. */
    public function new( _key:K, _value:T, _nodecount:Int ) {

        left = null;
        right = null;

        key = _key;
        value = _value;

        nodecount = _nodecount;

    } //new

} //BSTNode

    /** A traversal method for iterating a node in the tree */
enum BSTTraverseMethod {

    order_pre;
    order_retain;
    order_post;

} //enum
