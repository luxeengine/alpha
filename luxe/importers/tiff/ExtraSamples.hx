package luxe.importers.tiff;

@:enum
abstract ExtraSamples(Int) {
    var Unspecified = 0;
    var AssociatedAlpha = 1;
    var UnassociatedAlpha = 2;
}
