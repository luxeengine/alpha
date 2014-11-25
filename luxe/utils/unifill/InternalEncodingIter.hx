package luxe.utils.unifill;

class InternalEncodingIter {

    public var string : String;
    public var index : Int;
    public var endIndex : Int;

    public inline function new(s : String, beginIndex : Int, endIndex : Int) {
        string = s;
        this.index = beginIndex;
        this.endIndex = endIndex;
    }

    public inline function hasNext() : Bool {
        return index < endIndex;
    }

    public inline function next() : Int {
        var i = index;
        index += InternalEncoding.codePointWidthAt(string, index);
        return i;
    }

}
