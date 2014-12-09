package luxe.utils.unifill;

class CodePointIter {
    var s : String;
    var itr : InternalEncodingIter;

    public inline function new(s : String) {
        this.s = s;
        this.itr = new InternalEncodingIter(s, 0, s.length);
    }

    public inline function hasNext() : Bool {
        return itr.hasNext();
    }

    public inline function next() : CodePoint {
        return cast InternalEncoding.codePointAt(s, itr.next());
    }
}
