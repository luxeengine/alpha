package luxe.importers.tiff;

@:enum
abstract Compression(Int) {
    var Uncompressed = 1;
    var CCITT_1D = 2;
    var Group_3_Fax = 3;
    var Group_4_Fax = 4;
    var LZW = 5;
    var JPEG = 6;
    var Uncompressed_Old = 32771;
    var Packbits = 32773;
}
