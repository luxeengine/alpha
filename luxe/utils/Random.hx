package luxe.utils;

import luxe.Log.*;

//Adapted from code by Grant Skinner,
//see bottom of file for license information and sources.

/**
 Given an `initial` value for the seed, subsequent generated numbers will be predictable,
 and the `seed` value updated to reflect the current seed which can be used to resume predictability
 from an ongoing set. Uses a Park–Miller pseudo random number generator.

 Accessible through Luxe.utils.random.get(), or used as a class in your own code.
*/
class Random {

    public function new( _initial_seed:Float ) {

        #if !luxe_random_allow_negative_seed
            assert(
                _initial_seed > 0,
                'initial negative seed will return negative random results, if this was intentional, define luxe_random_allow_negative_seed'
            );
        #end

        seed = initial = _initial_seed;
    }

//Public API

        /** Returns a float number between [0,1) */
    public inline function get() : Float {
        return (seed = (seed * 16807) % 0x7FFFFFFF)/0x7FFFFFFF+0.000000000233;
    }

        /** Returns a number between [min,max).
            max is optional, returning a number between [0,min) */
    public inline function float( min:Float, ?max:Null<Float>=null ) : Float {
        if(max == null) { max = min; min = 0; }
        return get() * ( max - min ) + min;
    }

        /** Return a number between [min, max).
            max is optional, returning a number between [0,min) */
    public inline function int( min:Float, ?max:Null<Float>=null ) : Int {
        if(max == null) { max = min; min=0; }
        return Math.floor( float(min,max) );
    }

        /** Returns true or false based on a chance of [0..1] percent.
            Given 0.5, 50% chance of true, with 0.9, 90% chance of true and so on. */
    public inline function bool( chance:Float = 0.5 ) : Bool {
        return (get() < chance);
    }

        /** Returns 1 or -1 based on a chance of [0..1] percent.
            Given 0.5, 50% chance of 1, with 0.9, 90% chance of 1 and so on. */
    public inline function sign( chance:Float = 0.5) : Int {
        return (get() < chance) ? 1 : -1;
    }

        /** Returns 1 or 0 based on a chance of [0..1] percent.
            Given 0.5, 50% chance of 1, with 0.9, 90% chance of 1 and so on. */
    public inline function bit( chance:Float = 0.5) : Int {
        return (get() < chance) ? 1 : 0;
    }

        /** Reset the initial value to that of the current seed. */
    public inline function reset() {
        var s = seed;
        initial = s;
    }

        /** get the current seed (read only, change via `initial`)*/
    @:isVar public var seed (default,null): Float;
        /** get/set the initial base seed */
    @:isVar public var initial (default,set): Float;

        inline function set_initial( _initial : Float ) {
            initial = seed = _initial;
            return initial;
        }

} //Random


//Based on code from http://blog.gskinner.com/archives/2008/01/source_code_see.html
//With license:

/**
* Rndm by Grant Skinner. Jan 15, 2008
* Visit www.gskinner.com/blog for documentation, updates and more free code.
*
* Incorporates implementation of the Park Miller (1988) "minimal standard" linear
* congruential pseudo-random number generator by Michael Baczynski, www.polygonal.de.
* (seed * 16807) % 2147483647
*
*
*
* Copyright (c) 2008 Grant Skinner
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
*/
