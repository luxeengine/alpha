package luxe.importers.tiff;

@:enum
abstract SampleFormat(Int) {
    var Unsigned = 1; // unsigned integer data
    var Signed = 2; // two's complement signed integer data
    var IEEE = 3; // IEEE floating point data

    // A field value of "undefined" is a statement by the writer that it did not know how
    // to interpret the data samples; for example, if it were copying an existing image. A
    // reader would typically treat an image with "undefined" data as if the field were
    // not present (i.e. as unsigned integer data)
    var Undefined = 4; // undefined data format
}
