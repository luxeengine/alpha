package luxe.importers.tiled;

import luxe.importers.tiled.TiledMapData;
import luxe.importers.tiled.TiledUtil.valid_element;

import luxe.Vector;

class TiledImageLayer {

        /** The name of the image layer */
    public var name:String = '';
        /** The x position of the image layer in pixels */
    public var x:Int = 0;
        /** The y position of the image layer in pixels */
    public var y:Int = 0;
        /** opacity: The opacity of the layer as a value from 0 to 1. */
    public var opacity:Float = 1.0;
        /** if it's visible */
    public var visible:Bool = true;
        /** Contains all properties from this image layer */
    public var properties:Map<String, String>;
        /** The image information for this image layer */
    public var image:TiledImage;
        /** The tiledmap this belongs to */
    public var map : TiledMapData;

    public function new( _map:TiledMapData ) {
        map = _map;
        properties = new Map();
    }


    public function from_xml( xml:Xml ) {

        name = xml.get("name");
        x = Std.parseInt(xml.get("offsetx"));
        y = Std.parseInt(xml.get("offsety"));

        var _opacity = xml.get("opacity");
        var _visible = xml.get("visible");

        opacity = (_opacity == null) ? 1.0 : Std.parseFloat(_opacity);
        visible = (_visible == "0") ? false : true;

        for( child in xml ) {
            if( valid_element(child) ) {

                if( child.nodeName == "properties" ) {
                    for( property in child)  {
                        if( valid_element(property) ) {
                            properties.set(property.get("name"), property.get("value"));
                        } //is valid property node
                    } //for each property
                } //if it's a property node

                if (child.nodeName == "image") {

                    var _source:String = child.get("source");
                    var _format:String = child.get("format");

                    var _transparent_col = child.get("trans");
                    if(_transparent_col == null) _transparent_col = '';
                    _transparent_col = StringTools.replace(_transparent_col, '#','');

                    image = new TiledImage(this, _format, _source, Std.parseInt(_transparent_col));

                }
            }
        } //for each child
    } //from_xml

    public function from_json( json:Dynamic ) {

        name = Reflect.field(json, "name");
        x = cast Reflect.field(json, "offsetx");
        y = cast Reflect.field(json, "offsety");
        opacity = Reflect.field(json, "opacity");
        visible = Reflect.field(json, "visible");

        var _image:String = Reflect.field(json, "image");
        var _transparent_col:String = Reflect.field(json, "transparentcolor");
        var _w:Int = Reflect.field(json, "width");
        var _h:Int = Reflect.field(json, "height");
        var _format:String = Reflect.field(json, "format");

        if(_transparent_col == null) _transparent_col = '';
        _transparent_col = StringTools.replace(_transparent_col, '#','');

        image = new TiledImage(this, _format, _image, Std.parseInt(_transparent_col), _w, _h);

        var _properties = Reflect.field(json, "properties");
        if(_properties != null) {

            var _props = Reflect.fields(_properties);
            for (property_name in _props) {
                properties.set(property_name, Reflect.field(_properties, property_name));
            } //for each property

        } //properties exists

    } //from_json

} //TiledImageLayer

class TiledImage {

        /** The image layer this belongs to */
    public var image_layer:TiledImageLayer;
        /** Used for embedded images with the data child element */
    public var format:String;
        /** The reference to the tileset image file */
    public var source:String;
        /** Defines a specific color that is treated as transparent e.g FF00FF */
    public var transparent_color:Int;
        /** The image width in pixels (optional, used for tile index correction when the image changes) */
    public var width:Int = 0;
        /** The image height in pixels (optional) */
    public var height:Int = 0;

    public function new(_image_layer:TiledImageLayer, _format:String, _source:String, _transparent_color:Int, ?_width:Int, ?_height:Int) {
        image_layer = _image_layer;
        format = _format == null ? '' : _format;
        source = _source;
        transparent_color = _transparent_color;
        width = _width;
        height = _height;
    }
}