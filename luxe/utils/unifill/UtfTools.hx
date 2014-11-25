package luxe.utils.unifill;

/**
   UtfTools provides primitive API to deal with strings across all
   platforms. You should consider adopting Unifill before this.
 **/
class UtfTools {

    public static function compare<T : Utf>(a : T, b : T) : Int {
        var alen = a.length;
        var blen = b.length;
        var len = if (alen < blen) blen else alen;
        var i = 0;
        while (i < len) {
            if (i == alen)
                return -1;
            if (i == blen)
                return 1;
            var acode = a.codeUnitAt(i);
            var bcode = b.codeUnitAt(i);
            if (acode < bcode)
                return -1;
            if (acode > bcode)
                return 1;
            ++i;
        }
        return 0;
    }

}
