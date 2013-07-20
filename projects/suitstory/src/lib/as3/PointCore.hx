/**
 * Copyright (c) 2010, Jeash contributors.
 * 
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

package lib.as3;

import lib.as3.TypeDefs;

using Math;

class PointCore {

	/**
	 * The length of the line segment from (0,0) to this point.
	 */
	public static function distanceFromOrigin( p : Point ) : Number {
		return Math.sqrt(p.x * p.x + p.y * p.y);
	}
	
	public static function distance( a : Point, b : Point ) : Number {
		return (	(a.x - b.x).pow(2)
				  + (a.y - b.y).pow(2)	).sqrt();
	}

	/**
	 * Determines a point between two specified points. The parameter f determines where the new interpolated point is 
	 * located relative to the two end points specified by parameters pt1 and pt2. The closer the value of the parameter f 
	 * is to 1.0, the closer the interpolated point is to the first point (parameter pt1). The closer the value of the
	 * parameter f is to 0, the closer the interpolated point is to the second point (parameter pt2).
	 * @param	pt1 The first point.
	 * @param	pt2 The second point.
	 * @param	f The level of interpolation between the two points. Indicates where the new point will be, along the line between pt1 and pt2. If f=1, pt1 is returned; if f=0, pt2 is returned.
	 * @return The new, interpolated point.
	 */
	public static function interpolate(pt1:Point, pt2:Point, f:Number):Point {
		return { x:(pt1.x - pt2.x) * f + pt2.x, y:(pt1.y - pt2.y) * f + pt2.y };
	}	

	/**
	 * Scales the line segment between (0,0) and the current point to a set length.
	 * @param	thickness The scaling value. For example, if the current point is (0,5), and you normalize it to 1, the point returned is at (0,1).
	 */
	public static function normalize( p : Point, thickness : Float) : Void {
		if (p.x==0 && p.y==0)
			p.x = thickness;
		else {
			var norm = thickness / Math.sqrt(p.x * p.x + p.y * p.y);
			p.x *= norm;
			p.y *= norm;
		}
	}
	
	/**
	 * Adds the coordinates of 2 points to create a new point.
	 */
	public static function add( p1 : Point, p2 : Point) : Point {
		return { x: p2.x + p1.x, y: p2.y + p1.y };
	}
   
	/**
	 * subtract first point and second point
	 * @param	p0
	 * @param	p1
	 * @return
	 */
    public static inline function subtract(p0:Point, p1:Point) : Point {
        return { x:p0.x - p1.x, y:p0.y - p1.y };
    }
	
	public static function hash(p:Point):String {
		return p.x + "," + p.y;
	}
	
}