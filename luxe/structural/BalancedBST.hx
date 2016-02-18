package luxe.structural;


/**
    Copyright 2014-2016 Sven Bergström

    A balanced binary search tree,
    implemented based on various stack overflow answers,
    wikipedia articles and books read over the years.
    some other references : https://github.com/polygonal/ds

    Part of the structural library for haxe
    http://github.com/underscorediscovery/structural

    MIT License
*/

#if !display @:generic #end
@:allow(luxe.structural.BalancedBSTIterator)
class BalancedBST<K,T> {

        /** The tree root node */
    public var root : BalancedBSTNode<K,T>;
        /** The current comparison functoin */
    public var compare : K->K->Int;
        /** Whether or not the tree is empty (i.e root == null) */
    public var empty (get, null) : Bool;

        /** Create a new balanced BST with the given comparison function */
    public function new( compare_function : K->K->Int ) {

        compare = compare_function;

    } //new

//Public API

        /** Return the number of nodes in the tree */
    public inline function size() {

        return node_count(root);

    } //size

        /** Return the depth of the tree */
    public inline function depth() {

        return node_depth(root);

    } //depth

        /** Insert a node into the tree */
    public inline function insert( _key:K, _value:T ) {

        root = node_insert( root, _key, _value );
        root.color = NodeColor.black;

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

        if( !is_red(root.left) && !is_red(root.right) ) {
            root.color = NodeColor.red;
        }

        if(!contains(_key)) {
            return false;
        }

        root = node_remove(root, _key);

        if( root != null  ) {
            root.color = NodeColor.black;
        }

        return true;

    } //remove

        /** remove the smallest node in the tree (most left) */
    public function remove_smallest() {

        if( !is_red(root.left) && !is_red(root.right) ) {
            root.color = NodeColor.red;
        }

        root = node_remove_smallest(root);

        if(root != null) {
            root.color = NodeColor.black;
        }

        return true;

    } //remove_smallest

        /** remove the largest node in the tree (most right) */
    public function remove_largest() {

            // if both children of root are black, set root to red
        if (!is_red(root.left) && !is_red(root.right)) {
            root.color = NodeColor.red;
        }

        root = node_remove_largest(root);

        if(root != null ) {
            root.color = NodeColor.black;
        }

        return true;

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

        traverse_node( root, order_retain, function( _node : BalancedBSTNode<K,T> ) {
            a.push( _node.value );
        });

        return a;

    } //toArray

        /** Return an array of the keys in this tree */
    public function keys() : Array<K> {

        var a = new Array<K>();

        traverse_node( root, order_retain, function( _node : BalancedBSTNode<K,T> ) {
            a.push( _node.key );
        });

        return a;

    } //keys

        /** returns an iterator from a conversion to array of this tree. Usable as `for(item in tree)` */
    public inline function iterator() {

        return new BalancedBSTIterator<K,T>(this);
        // return toArray().iterator();

    } //iterator

        /** Traverse a node with the given method, and call the given function for each node traversed */
    public function traverse_node( _node:BalancedBSTNode<K,T>, _method:BalancedBSTTraverseMethod, _on_traverse : BalancedBSTNode<K,T> ->Void ) {

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
    function node_depth( _node:BalancedBSTNode<K,T>  ) {

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
    inline function node_count( _node:BalancedBSTNode<K,T> ) {

        return _node == null ? 0 : _node.nodecount;

    } //node_count

        /** insert a single node */
    function node_insert( _node:BalancedBSTNode<K,T>, _key:K, _value:T ) : BalancedBSTNode<K,T> {

        if(_node == null) {

            return new BalancedBSTNode<K,T>(_key, _value, 1, NodeColor.red);

        } //_node

            var comparison = compare(_key, _node.key);

            if(comparison < 0) {

                _node.left = node_insert(_node.left, _key, _value);

            } else if(comparison > 0) {

                _node.right = node_insert(_node.right, _key, _value);

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
                swap_color(_node);
            }

            node_update_count(_node);

        return _node;

    } //node_insert

        /* make sure the node count is up to date on a given node */
    inline function node_update_count( _node:BalancedBSTNode<K,T> ) {

        _node.nodecount = node_count(_node.left) + node_count(_node.right) + 1;

        return _node;

    } //node_update_count

        /** find a single node */
    function node_find( _node:BalancedBSTNode<K,T>, _key:K ) : T {

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
    function node_rank( _key:K, _node:BalancedBSTNode<K,T> ) : Int {

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
    function node_select( _node:BalancedBSTNode<K,T>, _rank:Int ) : BalancedBSTNode<K,T> {

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
    function node_smallest( _node:BalancedBSTNode<K,T> ) : BalancedBSTNode<K,T> {

        if(_node.left == null) {
            return _node;
        }

        return node_smallest( _node.left );

    } //node_smallest

        /** find largest of the given node */
    function node_largest( _node : BalancedBSTNode<K,T> ) : BalancedBSTNode<K,T> {

        if (_node.right == null) {
            return _node;
        } else {
            return node_largest(_node.right);
        }

    } //node_largest

        /** node floor http://en.wikipedia.org/wiki/Floor_and_ceiling_functions */
    function node_floor(_node:BalancedBSTNode<K,T>, _key:K ) : BalancedBSTNode<K,T> {

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
    function node_ceil( _node:BalancedBSTNode<K,T> , _key:K ) : BalancedBSTNode<K,T> {

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
    function node_remove_smallest( _node:BalancedBSTNode<K,T> ) : BalancedBSTNode<K,T> {

        if(_node.left == null) {
            return null;
        }

        if( !is_red(_node.left) && !is_red(_node.left.left)) {
            _node = move_red_left( _node );
        }

        _node.left = node_remove_smallest(_node.left);
        node_update_count(_node);

        return balance(_node);

    } //remove_smallest

        /** remove the largest node in the tree (most right) */
    function node_remove_largest( _node:BalancedBSTNode<K,T> ) : BalancedBSTNode<K,T> {

        if( is_red(_node.left) ) {
            _node = rotate_right(_node);
        }

        if (_node.right == null) {
            return null;
        }

        if( !is_red(_node.right) && !is_red(_node.right.left) ) {
            _node = move_red_right(_node);
        }

        _node.right = node_remove_largest(_node.right);
        node_update_count(_node);

        return balance(_node);

    } //node_remove_largest

        /** remove a single node by key */
    function node_remove( _node:BalancedBSTNode<K,T>, _key:K ) : BalancedBSTNode<K,T> {

        var comparison = compare( _key, _node.key );

        if( comparison < 0 )  {

            if( !is_red(_node.left) && !is_red(_node.left.left) ) {
                _node = move_red_left(_node);
            }

            _node.left = node_remove(_node.left, _key);

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

                var _n = node_smallest(_node.right);
                    _node.key = _n.key;
                    _node.value = _n.value;

                _node.right = node_remove_smallest(_node.right);

            } else {
                _node.right = node_remove(_node.right, _key);
            }

        }

        return balance(_node);

    } //_delete

    inline function is_red( _node:BalancedBSTNode<K,T> ) {

        if(_node == null) {
            return NodeColor.black;
        }

        return _node.color == NodeColor.red;

    } //is_red

    @:noCompletion public function rotate_left( _node:BalancedBSTNode<K,T> ) {

        var _n = _node.right;

                //update colors
            _n.color = _node.color;
            _node.color = NodeColor.red;
                //swap the right with left node
            _node.right = _n.left;
            _n.left = _node;

                //update the node count values
            _n.nodecount = _node.nodecount;
            node_update_count(_node);

        return _n;

    } //rotate_left

    @:noCompletion public function rotate_right( _node:BalancedBSTNode<K,T> ) {

        var _n = _node.left;

                //update node colors
            _n.color = _node.color;
            _node.color = NodeColor.red;
                //swap the left and right node
            _node.left = _n.right;
            _n.right = _node;

                //update the nodecount values
            _n.nodecount = _node.nodecount;
            node_update_count(_node);

        return _n;

    } //rotate_left

    @:noCompletion public function swap_color( _node:BalancedBSTNode<K,T> ) {

        _node.color = !_node.color;
        _node.left.color = !_node.left.color;
        _node.right.color = !_node.right.color;

    } //swap_color

    inline function move_red_left( _node:BalancedBSTNode<K,T> ) : BalancedBSTNode<K,T> {

        swap_color(_node);

        if( is_red(_node.right.left) ) {
            _node.right = rotate_right(_node.right);
            _node = rotate_left(_node);
        }

        return _node;
    }

    inline function move_red_right( _node:BalancedBSTNode<K,T> ) : BalancedBSTNode<K,T> {

        swap_color(_node);

        if (is_red(_node.left.left)) {
            _node = rotate_right(_node);
        }

        return _node;
    }

    inline function balance( _node:BalancedBSTNode<K,T> ) : BalancedBSTNode<K,T> {

        if (is_red(_node.right))    {
            _node = rotate_left(_node);
        }

        if (is_red(_node.left) && is_red(_node.left.left)) {
            _node = rotate_right(_node);
        }

        if (is_red(_node.left) && is_red(_node.right)) {
            swap_color(_node);
        }

        node_update_count(_node);

        return _node;

    } //balance

} //BalancedBST


#if !display @:generic #end
class BalancedBSTIterator<K,T> {

    var tree : BalancedBST<K,T>;
    var current : BalancedBSTNode<K,T>;
    var rightest : BalancedBSTNode<K,T>;

    public inline function new(_tree:BalancedBST<K,T>) {

        if(_tree == null) return;
        if(_tree.root == null) return;

        tree = _tree;
        current = _min(tree.root);
        rightest = _max(tree.root);

    } //new

    public inline function hasNext():Bool {

        if(current == null || rightest == null) return false;

        return tree.compare(current.key, rightest.key) <= 0;

    } //hasNext

    public inline function next() {
        var _temp = current;
        current = update_next();
        return _temp.value;
    }

    inline function update_next() {

        if(!hasNext()) return null;
        if(current.right!=null) return _min(current.right);

            var _next = null;
            var _temp = tree.root;
            while(_temp != null) {

                var _comp = tree.compare(current.key, _temp.key);
                if(_comp < 0) {
                    _next = _temp;
                    _temp = _temp.left;
                } else if(_comp > 0){
                    _temp = _temp.right;
                } else {
                    current = _next;
                    break;
                }

            } //while

        return _next;

    } //update_next

    inline function _min(_node:BalancedBSTNode<K,T>) {

        while(_node.left != null) _node = _node.left;

        return _node;

    } //_min

    inline function _max(_node:BalancedBSTNode<K,T>) {

        while(_node.right != null) _node = _node.right;

        return _node;

    } //_max

} //BalancedBSTIterator


@:noCompletion
private class NodeColor {
    public static inline var red = true;
    public static inline var black = false;
}

    /** A balanced binary search tree node by `K` key and `T` value (type) */
#if !display @:generic #end
class BalancedBSTNode<K,T> {


        /** The node left of this node (less than) */
    public var left         : BalancedBSTNode<K,T>;
        /** The node right of this node (bigger than) */
    public var right        : BalancedBSTNode<K,T>;
        /** The node count of this node, including itself */
    public var nodecount    : Int;
        /** The node color, red or black, for maintaining balance */
    public var color        : Bool;

        /** The key used to compare this node */
    public var key          : K;
        /** The value this node holds */
    public var value        : T;

        /** Create a new node with given key, value, count and color. Use `insert` on the tree instead. */
    public function new( _key:K, _value:T, _node_count:Int, _color:Bool ) {

        left = null;
        right = null;

        key = _key;
        value = _value;

        nodecount = _node_count;
        color = _color;

    } //new


} //BalancedBSTNode

    /** A traversal method for iterating a node in the tree */
enum BalancedBSTTraverseMethod {

    order_pre;
    order_retain;
    order_post;

} //enum
