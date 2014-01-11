package pathing.core;

import pathing.Pathing.Path;
import pathing.Pathing.PathCoord;

class Util {


        /**
         * Backtrace according to the parent records and return the path.
         * (including both start and end nodes)
         * @param {Node} node End node
         * @return {Array.<Array.<number>>} the path
         */
    public static function backtrace(node:Node) : Path {
        
        var path : Path = [[node.x, node.y]];
        while(node.parent != null) {
            node = node.parent;
            path.push([node.x, node.y]);
        }

        path.reverse();
        return path;

    } //backtrace

        /**
         * Backtrace from start and end node, and return the path.
         * (including both start and end nodes)
         * @param {Node}
         * @param {Node}
         */
    public static function biBacktrace(nodeA:Node, nodeB:Node) : Array<PathCoord>{
        var pathA = backtrace(nodeA),
            pathB = backtrace(nodeB);
            pathB.reverse();
        return pathA.concat(pathB);
    }

        /**
         * Compute the length of the path.
         * @param {Array.<Array.<number>>} path The path
         * @return {number} The length of the path
         */
    public static function pathLength(path:Path) : Float {

        var i:Int = 0;
        var sum : Float = 0;
        var a:PathCoord;      var b:PathCoord;
        var dx:Int;     var dy:Int;

        for (i in 1 ... path.length ) {
            a = path[i - 1];
            b = path[i];
            dx = a[0] - b[0];
            dy = a[1] - b[1];
            sum += Math.sqrt(dx * dx + dy * dy);
        }

        return sum;
    }

        /**
         * Given the start and end coordinates, return all the coordinates lying
         * on the line formed by these coordinates, based on Bresenham's algorithm.
         * http://en.wikipedia.org/wiki/Bresenham's_line_algorithm#Simplification
         * @param {number} x0 Start x coordinate
         * @param {number} y0 Start y coordinate
         * @param {number} x1 End x coordinate
         * @param {number} y1 End y coordinate
         * @return {Array.<Array.<number>>} The coordinates on the line
         */
    public static function getLine(x0:Int, y0:Int, x1:Int, y1:Int) : Path {

        var line : Path = [];
        var sx:Int, sy:Int, dx:Float, dy:Float, err:Float, e2:Float;

        dx = Math.abs(x1 - x0);
        dy = Math.abs(y1 - y0);

        sx = (x0 < x1) ? 1 : -1;
        sy = (y0 < y1) ? 1 : -1;

        err = dx - dy;

        while (true) {

            line.push([x0, y0]);

            if (x0 == x1 && y0 == y1) {
                break;
            }
            
            e2 = 2 * err;
            if (e2 > -dy) {
                err = err - dy;
                x0 = x0 + sx;
            }
            if (e2 < dx) {
                err = err + dx;
                y0 = y0 + sy;
            }
        }

        return line;

    } //getLine

        /**
         * Smoothen the give path.
         * The original path will not be modified; a new path will be returned.
         * @param {PF.Grid} grid
         * @param {Array.<Array.<number>>} path The path
         * @return {Array.<Array.<number>>} Smoothened path
         */
    public static function smoothenPath( grid:Grid, path:Path ) {

        var len : Int = path.length;
        var x0 : Int = path[0][0];              // path start x
        var y0 : Int = path[0][1];              // path start y
        var x1 : Int = path[len - 1][0];        // path end x
        var y1 : Int = path[len - 1][1];        // path end y

        var sx:Int; var sy:Int;                 // current start coordinate
        var ex:Int; var ey:Int;                 // current end coordinate
        var lx:Int; var ly:Int;                 // last valid end coordinate  

        var i:Int;
        var j:Int;
        var coord : PathCoord;
        var line : Path;
        var testCoord : PathCoord;
        var blocked : Bool;
        
        sx = x0;            sy = y0;
        lx = path[1][0];    ly = path[1][1];

        var newPath : Path = [[sx, sy]];

        for (i in 2 ... len) {

            coord = path[i];
            ex = coord[0];
            ey = coord[1];
            line = getLine(sx, sy, ex, ey);

            blocked = false;
            for (j in 1 ... line.length) {
                testCoord = line[j];

                if (!grid.isWalkableAt(testCoord[0], testCoord[1])) {
                    blocked = true;
                    newPath.push([lx, ly]);
                    sx = lx;
                    sy = ly;
                    break;
                }
            }
            if (!blocked) {
                lx = ex;
                ly = ey;
            }
        }

        newPath.push([x1, y1]);

        return newPath;
    }

} //Util
