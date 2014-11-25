package luxe.utils.unifill;

class Utf16 implements Utf {

    /**
       Converts the code point `code` to a character as a Utf16 string.
    **/
    public static inline function fromCodePoint(codePoint : Int) : Utf16 {
        var buf = new StringU16Buffer();
        Utf16Impl.encode_code_point(function (x) buf.addUnit(x), codePoint);
        return new Utf16(buf.getStringU16());
    }

    /**
       Converts `codePoints` to a Utf16 string.
    **/
    public static inline function fromCodePoints(codePoints : Iterable<Int>) : Utf16 {
        var buf = new StringU16Buffer();
        for (c in codePoints) {
            Utf16Impl.encode_code_point(function (x) buf.addUnit(x), c);
        }
        return new Utf16(buf.getStringU16());
    }

    public static inline function fromString(s : String) : Utf16 {
        return new Utf16(StringU16.fromString(s));
    }

    public static inline function fromArray(a : Array<Int>) : Utf16 {
        return new Utf16(StringU16.fromArray(a));
    }

    public var length(get, never) : Int;

    /**
       Returns the UTF-16 code unit at position `index` of `this`.
    **/
    public inline function codeUnitAt(index : Int) : Int {
        return this.str.codeUnitAt(index);
    }

    /**
       Returns the Unicode code point at position `index` of
       `this`.
    **/
    public function codePointAt(index : Int) : Int {
        return Utf16Impl.decode_code_point(length, codeUnitAt, index);
    }

    /**
       Returns the character as a String at position `index` of
       `this`.
    **/
    public inline function charAt(index : Int) : Utf16 {
        return new Utf16(this.str.substr(index, codePointWidthAt(index)));
    }

    /**
       Returns the number of Unicode code points from `beginIndex`
       to `endIndex` in `this`.
    **/
    public function codePointCount(beginIndex : Int, endIndex : Int) : Int {
        var index = beginIndex;
        var i = 0;
        while (index < endIndex) {
            index += codePointWidthAt(index);
            ++i;
        }
        return i;
    }

    /**
       Returns the number of units of the code point at position
       `index` of `this`.
    **/
    public inline function codePointWidthAt(index : Int) : Int {
        var c = codeUnitAt(index);
        return Utf16Impl.code_point_width(c);
    }

    /**
       Returns the number of units of the code point before
       position `index` of `this`.
    **/
    public inline function codePointWidthBefore(index : Int) : Int {
        return Utf16Impl.find_prev_code_point(codeUnitAt, index);
    }

    /**
       Returns the index within `this` that is offset from
       position `index` by `codePointOffset` code points.
    **/
    public inline function offsetByCodePoints(index : Int, codePointOffset : Int) : Int {
        return if (codePointOffset >= 0) {
            forward_offset_by_code_points(index, codePointOffset);
        } else {
            backward_offset_by_code_points(index, -codePointOffset);
        }
    }

    /**
       Returns `len` code units of `this`, starting at position pos.
    **/
    public inline function substr(index : Int, ?len : Int) : Utf16 {
        return new Utf16(this.str.substr(index, len));
    }

    /**
       Validates `this` Utf16 string.

       If the code unit sequence of `this` is invalid,
       `Exception.InvalidCodeUnitSequence` is throwed.
    **/
    public function validate() : Void {
        var len = this.str.length;
        var accessor = codeUnitAt;
        var i = 0;
        while  (i < len) {
            Utf16Impl.decode_code_point(len, accessor, i);
            i += codePointWidthAt(i);
        }
    }

    public inline function toString() : String {
        return this.str.toString();
    }

    public inline function toArray() : Array<Int> {
        return this.str.toArray();
    }

    var str : StringU16;

    inline function new(s : StringU16) {
        this.str = s;
    }

    inline function get_length() : Int {
        return this.str.length;
    }

    inline function forward_offset_by_code_points(index : Int, codePointOffset : Int) : Int {
        var len = this.str.length;
        var i = 0;
        while (i < codePointOffset && index < len) {
            index += codePointWidthAt(index);
            ++i;
        }
        return index;
    }

    inline function backward_offset_by_code_points(index : Int, codePointOffset : Int) : Int {
        var count = 0;
        while (count < codePointOffset && 0 < index) {
            index -= codePointWidthBefore(index);
            ++count;
        }
        return index;
    }

}

private class Utf16Impl {

    public static inline function code_point_width(c : Int) : Int {
        return (!Unicode.isHighSurrogate(c)) ? 1 : 2;
    }

    public static inline function find_prev_code_point(accessor : Int -> Int, index : Int) : Int {
        var c = accessor(index - 1);
        return (!Unicode.isLowSurrogate(c)) ? 1 : 2;
    }

    public static function encode_code_point(addUnit : Int -> Void, codePoint : Int) : Void {
        if (codePoint <= 0xFFFF) {
            addUnit(codePoint);
        } else {
            addUnit(Unicode.encodeHighSurrogate(codePoint));
            addUnit(Unicode.encodeLowSurrogate(codePoint));
        }
    }

    public static function decode_code_point(len : Int, accessor : Int -> Int, index : Int) : Int {
        if (index < 0 || len <= index)
            throw Exception.InvalidCodeUnitSequence(index);
        var hi = accessor(index);
        if (Unicode.isHighSurrogate(hi)) {
            if (index + 1 < 0 || len <= index + 1) {
                throw Exception.InvalidCodeUnitSequence(index);
            }
            var lo = accessor(index + 1);
            if (Unicode.isLowSurrogate(lo)) {
                return Unicode.decodeSurrogate(hi, lo);
            } else {
                throw Exception.InvalidCodeUnitSequence(index);
            }
        } else if (Unicode.isLowSurrogate(hi)) {
            throw Exception.InvalidCodeUnitSequence(index);
        } else {
            return hi;
        }
    }

}

#if !(neko || php || cpp || macro || python)

private abstract StringU16Buffer(StringBuf) {

    public inline function new() {
        this = new StringBuf();
    }

    public inline function addUnit(unit : Int) : Void {
        this.addChar(unit);
    }

    public inline function getStringU16() : StringU16 {
        return StringU16.fromString(this.toString());
    }

}

private abstract StringU16(String) {

    public static inline function fromString(s : String) : StringU16 {
        return new StringU16(s);
    }

    public static inline function ofArray(a : Array<Int>) : StringU16 {
        return fromArray(a);
    }

    public static inline function fromArray(a : Array<Int>) : StringU16 {
        var buf = new StringBuf();
        for (x in a) {
            buf.addChar(x);
        }
        return new StringU16(buf.toString());
    }

    public var length(get, never) : Int;

    public #if !flash inline #end function codeUnitAt(index : Int) : Int {
        return StringTools.fastCodeAt(this, index);
    }

    public inline function substr(index : Int, ?len : Int) : StringU16 {
        return new StringU16(this.substr(index, len));
    }

    public inline function toString() : String {
        return this;
    }

    public inline function toArray() : Array<Int> {
        var i = 0;
        var len = this.length;
        return [while (i < len) StringTools.fastCodeAt(this, i++)];
    }

    inline function new(s : String) {
        this = s;
    }

    inline function get_length() : Int {
        return this.length;
    }

}

#else

private abstract StringU16Buffer(Array<Int>) {

    public inline function new() {
        this = [];
    }

    public inline function addUnit(unit : Int) : Void {
        this.push(unit);
    }

    public inline function getStringU16() : StringU16 {
        return StringU16.ofArray(this);
    }

}

private abstract StringU16(Array<Int>) {

    public static function fromString(s : String) : StringU16 {
        var buf = new StringU16Buffer();
        var addUnit = function (x) buf.addUnit(x);
        for (i in new InternalEncodingIter(s, 0, s.length)) {
            var c = InternalEncoding.codePointAt(s, i);
            Utf16Impl.encode_code_point(addUnit, c);
        }
        return buf.getStringU16();
    }

    public static inline function ofArray(a : Array<Int>) : StringU16 {
        return new StringU16(a);
    }

    public static inline function fromArray(a : Array<Int>) : StringU16 {
        return new StringU16(a.copy());
    }

    public var length(get, never) : Int;

    public inline function codeUnitAt(index : Int) : Int {
        return this[index];
    }

    public inline function substr(index : Int, ?len : Int) : StringU16 {
        if (index < 0) {
            index += this.length;
            if (index < 0) index = 0;
        }
        var j = (len != null) ? index + len : this.length;
        var a = this.slice(index, j);
        return new StringU16(a);
    }

    public function toString() : String {
        var buf = new StringBuf();
        var i = 0;
        var len = this.length;
        var cua = function (i) return this[i];
        while (i < len) {
            var u = Utf16Impl.decode_code_point(len, cua, i);
            buf.add(InternalEncoding.fromCodePoint(u));
            i += Utf16Impl.code_point_width(codeUnitAt(i));
        }
        return buf.toString();
    }

    public inline function toArray() : Array<Int> {
        return this.copy();
    }

    inline function new(a : Array<Int>) {
        this = a;
    }

    inline function get_length() : Int {
        return this.length;
    }

}

#end
