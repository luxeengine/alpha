package luxe.importers.tiled;

import luxe.tilemaps.Tilemap;

class TiledUtil {

    public static function valid_element(element:Xml) {

         #if (haxe_ver < 3.2)
            return Std.string( element.nodeType ) == "element";
        #else
            return element.nodeType == Xml.XmlType.Element;
        #end

    } //valid_element


    public static function orientation_from_string( _orientation_string:String ) : TilemapOrientation {

        return switch(_orientation_string) {
            case "orthogonal":  TilemapOrientation.ortho;
            case "isometric":   TilemapOrientation.isometric;
            default:            TilemapOrientation.none;
        }

    } //orientation_from_string


}