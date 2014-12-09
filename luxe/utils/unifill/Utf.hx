package luxe.utils.unifill;

interface Utf {

    /**
       The number of code units in `this`.
    **/
    var length(get, never) : Int;

    /**
       Returns the code unit at position `index` of `this`.
    **/
    function codeUnitAt(index : Int) : Int;

    /**
       Returns the Unicode code point at position `index` of `this`.
    **/
    function codePointAt(index : Int) : Int;

    /**
       Returns the number of units of the code point at position
       `index` of `this`.
    **/
    function codePointWidthAt(index : Int) : Int;

    /**
       Returns the number of units of the code point before
       position `index` of `this`.
    **/
    function codePointWidthBefore(index : Int) : Int;

    /**
       Validates `this`.

       If the code unit sequence of `this` is invalid,
       `Exception.InvalidCodeUnitSequence` is throwed.
    **/
    function validate() : Void;

}
