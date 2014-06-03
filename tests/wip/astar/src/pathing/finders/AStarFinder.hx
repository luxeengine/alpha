package pathing.finders;

import luxe.structural.Heap;
import pathing.core.Util;
import pathing.core.Heuristic;
import pathing.core.Grid;
import pathing.core.Node;

typedef AStarFinderOptions = {
    ? allowDiagonal : Bool,
    ? dontCrossCorners : Bool,
    ? heuristic : Float->Float->Float,
    ? weight : Float
}

class AStarFinder {

        /**
         * A* path-finder.
         * based upon https://github.com/bgrins/javascript-astar
         * @constructor
         * @param {object} opt
         * @param {boolean} opt.allowDiagonal Whether diagonal movement is allowed.
         * @param {boolean} opt.dontCrossCorners Disallow diagonal movement touching block corners.
         * @param {function} opt.heuristic Heuristic function to estimate the distance
         *     (defaults to manhattan).
         * @param {integer} opt.weight Weight to apply to the heuristic to allow for suboptimal paths, 
         *     in order to speed up the search.
         */
    public var allowDiagonal : Bool = true;
    public var dontCrossCorners : Bool = true;
    public var heuristic : Float->Float->Float;
    public var weight : Float = 1.0;

    public function new( ?options:AStarFinderOptions ) {

        heuristic = Heuristic.manhattan;

        if(options != null) {
            if(options.allowDiagonal != null)       allowDiagonal       = options.allowDiagonal;
            if(options.dontCrossCorners != null)    dontCrossCorners    = options.dontCrossCorners;
            if(options.heuristic != null)           heuristic           = options.heuristic;
            if(options.weight != null)              weight              = options.weight;
        }
    }

    static function compare_node( nodeA:Node, nodeB:Node ) : Float {
        var _result = nodeA.f - nodeB.f;
        if(_result < 0) return -1;        
        if(_result >= 0) return 1;
        return nodeA.f - nodeB.f;
    }

        /**
         * Find and return the the path.
         * @return {Array.<[number, number]>} The path, including both start and
         *     end positions.
         */
    public function findPath( startX:Int, startY:Int, endX:Int, endY:Int, grid:Grid ) {

        var max_path_length : Int = grid.width * grid.height;
        var openList = new Heap<Node>( max_path_length, compare_node );

        var startNode = grid.getNodeAt(startX, startY);
        var endNode = grid.getNodeAt(endX, endY);
        var SQRT2 = 1.4142135623730951;
        var node, neighbors, neighbor, i, l, x, y, ng;

        // set the `g` and `f` value of the start node to be 0
        startNode.g = 0;
        startNode.f = 0;

        // push the start node into the open list
        openList.enqueue(startNode);
        startNode.opened = true;

        // while the open list is not empty
        while (!openList.isEmpty()) {
            // pop the position of node which has the minimum `f` value.
            node = openList.dequeue();
            node.closed = true;

            // if reached the end position, construct the path and return it
            if (node == endNode) {
                return Util.backtrace(endNode);
            }

            // get neigbours of the current node
            neighbors = grid.getNeighbors(node, allowDiagonal, dontCrossCorners);
            var l = neighbors.length;
            for (i in 0 ... l) {
                neighbor = neighbors[i];

                if (neighbor.closed) {
                    continue;
                }

                x = neighbor.x;
                y = neighbor.y;

                // get the distance between current node and the neighbor
                // and calculate the next g score
                ng = node.g + ((x - node.x == 0 || y - node.y == 0) ? 1 : SQRT2);
                trace(ng < neighbor.g);
                trace(neighbor.opened);
                trace('--');

                // check if the neighbor has not been inspected yet, or
                // can be reached with smaller cost from the current node
                if (!neighbor.opened || ng < neighbor.g) {
                    neighbor.g = ng;
                    neighbor.h = (neighbor.h != null) ? neighbor.h : weight * heuristic(Math.abs(x - endX), Math.abs(y - endY));
                    neighbor.f = neighbor.g + neighbor.h;
                    neighbor.parent = node;

                    if (!neighbor.opened) {
                        openList.enqueue(neighbor);
                        neighbor.opened = true;                        
                    } else {
                        // the neighbor can be reached with smaller cost.
                        // Since its f value has been updated, we have to
                        // update its position in the open list
                        // openList.updateItem(neighbor); todo: totest!!
                        openList.reset();
                        trace("RESET OPeNLIST");
                    }
                }
            } // end for each neighbor
        } // end while not open list empty

        // fail to find the path
        return [];
    }

}
