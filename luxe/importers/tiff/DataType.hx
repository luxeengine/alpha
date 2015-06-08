package luxe.importers.tiff;

@:enum
abstract DataType(Int) {
    var BYTE = 1; // 8-bit unsigned integer

    // The value of the Count part of an ASCII field entry includes the NUL. If padding
    // is necessary, the Count does not include the pad byte. Note that there is no initial
    // "count byte" as in Pascal-style strings.
    // Any ASCII field can contain multiple strings, each terminated with a NUL. A
    // single string is preferred whenever possible. The Count for multi-string fields is
    // the number of bytes in all the strings in that field plus their terminating NUL
    // bytes. Only one NUL is allowed between strings, so that the strings following the
    // first string will often begin on an odd byte.
    var ASCII = 2; // 8-bit byte that contains a 7-bit ASCII code; the last byte must be NUL (binary zero)

    var SHORT = 3; // 16-bit (2-byte) unsigned integer
    var LONG = 4; // 32-bit (4-byte) unsigned integer
    var RATIONAL = 5; // Two LONGs: the first represents the numerator of a fraction; the second, the denominator

    var SBYTE = 6; // An 8-bit signed (twos-complement) integer
    var UNDEFINED = 7; // An 8-bit byte that may contain anything, depending on the definition of the field
    var SSHORT = 8; // A 16-bit (2-byte) signed (twos-complement) integer
    var SLONG = 9; // A 32-bit (4-byte) signed (twos-complement) integer
    var SRATIONAL = 10; // Two SLONG’s: the first represents the numerator of a fraction, the second the denominator
    var FLOAT = 11; // Single precision (4-byte) IEEE format
    var DOUBLE = 12; // Double precision (8-byte) IEEE format
}
