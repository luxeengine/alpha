package luxe.importers.tiff;

@:enum
abstract PhotometricInterpretation(Int) {
    var WhiteIsZero = 0;
    var BlackIsZero = 1;
    var RGB = 2;
    var RGB_Palette = 3;
    var Tranparency_Mask = 4;
    var CMYK = 5;
    var YCbCr = 6;
    var CIELab = 8;
}
