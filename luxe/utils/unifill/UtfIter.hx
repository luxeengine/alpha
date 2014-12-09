package luxe.utils.unifill;

class UtfIter<S : Utf> {

    public var string : S;
    public var index : Int;
    public var endIndex : Int;

    public inline function new(s : S, beginIndex : Int, endIndex : Int) {
        string = s;
        this.index = beginIndex;
        this.endIndex = endIndex;
    }

    public inline function hasNext() : Bool {
        return index < endIndex;
    }

    public inline function next() : Int {
        var i = index;
        index += string.codePointWidthAt(index);
        return i;
    }

}
