package luxe.utils;

/*
 * Copyright (c) 2008, The Caffeine-hx project contributors
 * Original author : Mark Winterhalder
 * Contributors: Danny Wilson
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
 * THIS SOFTWARE IS PROVIDED BY THE CAFFEINE-HX PROJECT CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE CAFFEINE-HX PROJECT CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

class UUID {


    static var rule30 = Rule30.createWithLength( 24 );
    static var hexChars = "0123456789ABCDEF";

    /** Generate a Universal Unique Identifier string.
        For example: B859AA4C0A96CA94F7F82DBECD24205F **/

    public static function generate_undashed() {

        var sbuf = new StringBuf();
        var getBits = rule30.getBits;
        var hex = hex.bind(sbuf);

        // TimeLow
        hex(getBits( 16 ));
        hex(getBits( 16 ));

        // TimeMid
        hex(getBits( 16 ));

        // VersionAndTimeHigh
        hex((4 << 12) | getBits( 12 ));

        // VariantAndClockSeqHigh ClockSeqLow
        hex((2 << 14) | getBits( 14 ));

        // Node
        hex(getBits( 16 ));
        hex(getBits( 16 ));
        hex(getBits( 16 ));

        return sbuf.toString();

    } //generate_undashed

    /** Generate a Universal Unique Identifier string, with dashes according to the spec.
        For example: BD5FB953-0BD3-D6B4-82AB-E642B7036246 **/
    public static function get() {

        var sbuf = new StringBuf();
        var getBits = rule30.getBits;
        var hex = hex.bind(sbuf);

        // TimeLow
        hex(getBits( 16 ));
        hex(getBits( 16 ));

        // TimeMid
        sbuf.addChar(45); // "-"
        hex(getBits( 16 ));

        // VersionAndTimeHigh
        sbuf.addChar(45); // "-"
        hex((4 << 12) | getBits( 12 ));

        // VariantAndClockSeqHigh ClockSeqLow
        sbuf.addChar(45); // "-"
        hex((2 << 14) | getBits( 14 ));

        // Node
        sbuf.addChar(45); // "-"
        hex(getBits( 16 ));
        hex(getBits( 16 ));
        hex(getBits( 16 ));

        return sbuf.toString().toLowerCase();

    } //get

    static function hex( sbuf:StringBuf, n:Int ) {

        var s = new StringBuf();
        do {
            s.addChar(hexChars.charCodeAt(n%16));
            n = Std.int(n/16);
        } while( n > 0 );

        var s = s.toString();
        for( i in 0 ... 4-s.length ) // 4 Digits
            sbuf.addChar(48); // "0"

        sbuf.add(s);

    } //hex


} //UUID


@:noCompletion private class Rule30 {


    static public function createWithLength( length : Int ) : Rule30 {

        var str = new StringBuf();
        var f = Math.floor, r = Math.random;

        for(i in 0 ... length)
            str.addChar(  f(r() * 256) );

        return new Rule30( str.toString() );

    } //createWithLength

    var cells : String;
    var cellsLength : Int;

    function new( cells : String ) {

        this.cellsLength = cells.length;
        this.cells = untyped cells;
        var str = new StringBuf();

        var stir = cellsLength * 16;
        for(i in 0 ... stir)
            getBit();
        for(i in 0 ... cellsLength)
            str.addChar( getBits( 8 ) );

        this.cells = untyped str.toString();

    } //new

    public function getBits( length : Int ) : Int {

        if( length > 30 ) length = 30;

        var bits = 0;
        for(i in 0 ... length)
            bits = (bits << 1) | getBit();

        return bits;

    } //getBits

    function getBit() : Int {

        var cells = this.cells;
        var newCells = new StringBuf();
        var C = newCells.addChar;
        var newCell : Int = 0;
        var section : Int = (cells.charCodeAt( cellsLength - 1 ) << 8) | cells.charCodeAt( 0 );

        for( pos in 0 ... cellsLength )
        {
            section = (section << 8) | cells.charCodeAt( pos % cellsLength );
            newCell = 0;
            var i = 16;
            while( i-- > 8 )
                newCell = (newCell << 1) | ((30 >> ((section >> i) & 7)) & 1);
            newCells.addChar( newCell );
        }

        this.cells = newCells.toString();
        return newCell & 1;

    } //getBit


} //Rule30
