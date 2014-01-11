package pathing.core;

/**
 * @namespace PF.Heuristic
 * @description A collection of heuristic functions.
 */

class Heuristic {

      /**
       * Manhattan distance.
       * @param {Float} dx - Difference in x.
       * @param {Float} dy - Difference in y.
       * @return {Float} dx + dy
       */
    public static function manhattan(dx:Float, dy:Float) {
        return dx + dy;
    }

        /**
         * Euclidean distance.
         * @param {Float} dx - Difference in x.
         * @param {Float} dy - Difference in y.
         * @return {Float} sqrt(dx * dx + dy * dy)
         */
    public static function euclidean(dx:Float, dy:Float) {
        return Math.sqrt(dx * dx + dy * dy);
    }

        /**
         * Chebyshev distance.
         * @param {Float} dx - Difference in x.
         * @param {Float} dy - Difference in y.
         * @return {Float} max(dx, dy)
         */
    public static function chebyshev(dx:Float, dy:Float) {
        return Math.max(dx, dy);
    }

} //Heuristic
