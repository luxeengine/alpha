package luxe.utils.unifill;

#if (neko || php || cpp || macro)
    private typedef UtfX = Utf8;
#elseif python
    private typedef UtfX = Utf32;
#else
    private typedef UtfX = Utf16;
#end

/**
   InternalEncoding provides primitive API to deal with strings across
   all platforms. You should consider adopting Unifill before this.
 **/
class InternalEncoding {

    /**
       Returns Encoding strings on the platform are encoded in.
     **/
    public static var internalEncoding(get, never) : String;

    static inline function get_internalEncoding() : String
    #if (neko || php || cpp || macro)
        return "UTF-8";
    #elseif python
        return "UTF-32";
    #else
        return "UTF-16";
    #end

    /**
       Returns the UTF-8/16/32 code unit at position `index` of
       String `s`.
     **/
    public static inline function codeUnitAt(s : String, index : Int) : Int {
        var u = UtfX.fromString(s);
        return u.codeUnitAt(index);
    }

    /**
       Returns the Unicode code point at position `index` of
       String `s`.
     **/
    public static inline function codePointAt(s : String, index : Int) : Int {
        var u = UtfX.fromString(s);
        return u.codePointAt(index);
    }

    /**
       Returns the character as a String at position `index` of
       String `s`.
     **/
    public static inline function charAt(s : String, index : Int) : String {
        var u = UtfX.fromString(s);
        return u.charAt(index).toString();
    }

    /**
       Returns the number of Unicode code points from `beginIndex`
       to `endIndex` in String `s`.
     **/
    public static inline function codePointCount(s : String, beginIndex : Int, endIndex : Int) : Int {
        var u = UtfX.fromString(s);
        return u.codePointCount(beginIndex, endIndex);
    }

    /**
       Returns the number of units of the code point at position
       `index` of String `s`.
     **/
    public static inline function codePointWidthAt(s : String, index : Int) : Int {
        var u = UtfX.fromString(s);
        return u.codePointWidthAt(index);
    }

    /**
       Returns the number of units of the code point before
       position `index` of String `s`.
     **/
    public static inline function codePointWidthBefore(s : String, index : Int) : Int {
        var u = UtfX.fromString(s);
        return u.codePointWidthBefore(index);
    }

    /**
       Returns the index within String `s` that is offset from
       position `index` by `codePointOffset` code points.
     **/
    public static inline function offsetByCodePoints(s : String, index : Int, codePointOffset : Int) : Int {
        var u = UtfX.fromString(s);
        return u.offsetByCodePoints(index, codePointOffset);
    }

    /**
       Returns the index within String `s` that is offset from
       position `index` by `codePointOffset` code points counting
       backward.
     **/
    public static inline function backwardOffsetByCodePoints(s : String, index : Int, codePointOffset : Int) : Int {
        var u = UtfX.fromString(s);
        return u.offsetByCodePoints(index, -codePointOffset);
    }

    /**
       Converts the code point `code` to a character as String.
     **/
    public static inline function fromCodePoint(codePoint : Int) : String {
        return UtfX.fromCodePoint(codePoint).toString();
    }

    /**
       Converts `codePoints` to a String.
     **/
    public static inline function fromCodePoints(codePoints : Iterable<Int>) : String {
        return UtfX.fromCodePoints(codePoints).toString();
    }

    /**
       Validates String `s`.

       If the code unit sequence of `s` is invalid,
       `Exception.InvalidCodeUnitSequence` is throwed.
     **/
    public static inline function validate(s : String) : Void {
        var u = UtfX.fromString(s);
        u.validate();
    }

    /**
       Returns if String `s` is valid.
     **/
    public static function isValidString(s : String) : Bool {
        try {
            validate(s);
            return true;
        } catch (e : Exception) {
            switch (e) {
            case InvalidCodeUnitSequence(index):
                return false;
            default:
                throw e;
            }
        }
    }

}
