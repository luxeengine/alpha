/**
* Copyright (c) 2008 Chase Kernan, Laurence Taylor
* chase.kernan@gmail.com, polysemantic@gmail.com
* Based off of Michael Baczynski's as3ds project, http://www.polygonal.de.
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
**/

package phoenix.utils;

/**
    A Binary Search Tree (BST).
        
    A BST stores data in a recursive manner so that you can access it quickly
    by using a key. Therefore, a BST automatically sorts data as it is
    inserted. For a BST to be valid, every node has to follow two rules:
    <ol><li>The data value in the left subtree must be less than the data
    value in the current node.</li><li>The data value in the right subtree
    must be greater than the data value in the current node.</li></ol> 
**/
class BinarySearchTree<T> implements Collection<T> {
    
    /**
        The root node being referenced.
    **/
    public var root : Node<Null<T>>;
    
    public var length(get_length, null) : Int;
                
    private var compare : Null<T> -> Null<T> -> Int;
                
    /**
        Initializes a BST tree with a given comparison function. The function
        should return -1 if the left is 'less than' the right, 0 if they are
        equal, and 1 if the left is 'greater than' the right. 
        
        If the function is omitted, the BST uses [Reflect.compare]. There is a
        danger to this however. If the type of the tree isn't a standard type
        or doesn't implement [__compare(other) : Int], then the tree will fail.
    **/
    public function new(?compareFunc : Null<T> -> Null<T> -> Int) {
        root = null;
                        
        compare = if (compareFunc == null) Reflect.compare else compareFunc;
    }

    /**
        Inserts an item into the tree.
    **/
    public function insert(obj : Null<T>) {

        if (root == null) {
            
            root = new Node(obj);
            return root;

        } else { //root == null

            var cur = root;
            
            while(cur != null) {

                if (compare(obj, cur.data) < 0) {
                    if (cur.left != null) cur = cur.left;
                    else {
                        cur.setLeftData(obj);
                        return cur.left;
                    }
                } else {
                    if (cur.right != null) cur = cur.right;
                    else {
                        cur.setRightData(obj);
                        return cur.right;
                    }
                }

            } //while cur != null

            return null; //shouldn't happen?
        } //else root wasn't null
    } //insert
    
    /**
        Finds a piece of data in the tree and returns a reference to the node
        that contains a match, or null if no match is found.
    **/
    public function find(obj : Null<T> ) : Node<Null<T>> {
        var cur = root;
        
        while (cur != null) {
            var i = compare(obj, cur.data);
            if (i == 0) return cur;
            cur = (i < 0) ? cur.left : cur.right;
        }
        
        return null;
    }
    
    /**
        Removes a node from the BST.
    **/
    public function remove(node : Node<Null<T>>) {
        if (node.left != null && node.right != null) {
            var t = node;
            
            while (t.right != null) t = t.right;
                                
            if (node.left == t) {
                t.right = node.right;
                t.right.parent = t;
            } else {
                t.parent.right = t.left;
                if (t.left != null) t.left.parent = t.parent;
                
                t.left = node.left;
                t.left.parent = t;
                t.right = node.right;
                if(t.right!=null) {
                    t.right.parent = t;
                }
            }
             
            if (node == root) root = t;
            else {
                if (node.isLeft()) node.parent.left = t;
                else node.parent.right = t;
            }
            
            t.parent = node.parent;
            node.left = null;
            node.right = null;
            node = null;
        } else {
            var child : Node<T> = null;
                                
            if (node.left != null) child = node.left;
            else if (node.right != null) child = node.right;
                                        
            if (node == root) root = child;
            else {
                if (node.isLeft()) node.parent.left = child;
                else node.parent.right = child;
            }
                                
            if (child != null) child.parent = node.parent;
            node.left = node.right = node.parent = null;
            node = null;
        }
    }
    
    public function contains(obj : Null<T>) : Bool {
        return find(obj) != null;
    }
                
    /**
        The tree is cleared recursively, starting from the root.
    **/
    public function clear() {
        if (root != null) {
            root.destroy();
            root = null;
        }
    }
                
    /**
        Returns an iterator based on an in order traversal of the tree.
        NOTE: This returns the data NOT the node.
    **/
    public function iterator() : Iterator<Null<T>> {
        var a = new Array<Null<T>>();
        traverse(root, InOrder, function (node : Node<Null<T>>) {
            a.push(node.data);
        });
        
        return a.iterator();
    }
                
    private function get_length() : Int{
        return if (root == null) 0 else root.count();
    }
                
    public function isEmpty() : Bool {
        return if (root == null) true else root.count() == 0; 
    }
    
    /**
        Returns the DATA of the nodes based off an in order traversal.
    **/
    public function toArray() : Array<Null<T>> {
        var a = new Array<Null<T>>();
        traverse(root, InOrder, function(node : Node<Null<T>>) {
            a.push(node.data);
        });
        
        return a;
    }
                
    /**
        Prints out a string representing the current object.
        Example: "[BST, size=35]
    **/
    public function toString() : String {
        return "[BST, size=" + length + "]";
    }
                
    /**
        Prints out all elements (for debug/demo purposes).
    **/
    public function dump() : String {
        var s = "";
        
        traverse(root, InOrder, function(node : Node<Null<T>>) {
            s += node.toString() + "\n";
        });
        
        return s;
    }
                
    /**
        Performs a traversal (defined by [method]) on the node.   
    **/
    public static function traverse<U>(node : Node<U>, method : TraverseMethod, 
                                       process : Node<U> -> Void) {
        if (node != null) {
            switch(method) {
                
                case PreOrder:
                    process(node);
                    traverse(node.left, method, process);
                    traverse(node.right, method, process);
                    
                case InOrder:
                    traverse(node.left, method, process);
                    process(node);
                    traverse(node.right, method, process);
                    
                case PostOrder:
                    traverse(node.left, method, process);
                    traverse(node.right, method, process);
                    process(node);
            }
        }
    }
}

/**
    Method of traversing a binary tree.
    
    PreOrder: Vist root, left, right.
    InOrder: Vist left, root, right.
    PostOrder: Vist left, right, root.
**/
enum TraverseMethod {
    PreOrder;
    InOrder;
    PostOrder;
}

/**
    A binary tree node from which you can build a binary tree.
    
    A Binary Tree is a simplified tree structure in which every node is only
    allowed to have up to two children nodes, which are called the left and
    right child.
**/
class Node<T> {
    
    /**
        The left child node being referenced.
    **/
    public var left : Node<T>;
                
    /**
        The right child node being referenced.
    **/
    public var right : Node<T>;
                
    /**
        The parent node being referenced.
    **/
    public var parent : Node<T>;
                
    /**
        The node's data.
    **/
    public var data : T;
                
    /**
        Creates an empty node.
    **/
    public function new(obj : T) {
        data = obj;
        parent = left = right = null;
    }
                
    /**
        Writes data into the left child.
    **/
    public function setLeftData(obj : T) {
        if (left == null) {
            left = new Node(obj);
            left.parent = this;
        } else {
            left.data = data;
        }
    }
                
    /**
        Writes data into the right child.
    **/
    public function setRightData(obj : T) {
        if (right == null) {
            right = new Node(obj);
            right.parent = this;
        } else {
            right.data = data;
        }
    }
    
    /**
        Checks if the node is a left node relative to its parent node.
    **/
    public function isLeft() : Bool {
        return this == parent.left;
    }
                
    /**
        Checks if the node is a right node relative to its parent node.
    **/
    public function isRight() : Bool {
        return this == parent.right;
    }
                
    /**
        Computes the depth of a tree.
    **/
    public function getDepth() : Int {
        var leftData = -1; 
        var rightData = -1;
                        
        if (left != null) leftData = left.getDepth();
                        
        if (right != null) rightData = right.getDepth();
                        
        return ((if (leftData > rightData) leftData else rightData) + 1);
    }
                
    /**
        Recursively counts the total number of nodes including this node.
    **/
    public function count() : Int {
        var c = 1;
                        
        if (left != null) c += left.count();
        if (right != null) c += right.count();
                        
        return c;
    }
                
    /**
        Recursively clears the tree by deleting all child nodes underneath
        the node the method is called on.
    **/
    public function destroy() {
        if (left != null) left.destroy();
        left = null;
                        
        if (right != null) right.destroy();
        right = null;
    }
                
    /**
        Prints out a string representing the current object.
    **/
    public function toString() : String {
        return "[BinaryTree-Node, data= " + Std.string(data) + "]";
    }
}