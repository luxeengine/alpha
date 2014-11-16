package luxe.options;

import phoenix.BitmapFont;
import phoenix.Batcher;
import phoenix.geometry.CompositeGeometry;

typedef TextOptions = {


    /** WIP STUFF this doesn't belong here but is added
        for compliance with existing api while refactoring for alpha-1.0*/

            /** The name of this text default:`''` */
        @:optional var name : String;
            /** Don't add to any scene */
        @:optional var no_scene : Bool;
            /** Parent of this text */
        @:optional var parent : Entity;
            /** The font to use for drawing */
        @:optional var font : BitmapFont;

    //


        /** The text string. default:`''` */
    @:optional var text : String;
        /** The text point size. default: font point size */
    @:optional var point_size : Float;
        /** The text point size. WIP:see #98.
            This is falling away in favor of point_size for clarity and future options. default: font point size */
    @:optional var size : Float;
        /** The text color. default: white */
    @:optional var color : Color;

        /** The position of the text.
            If pos and bounds are specified, overrides the bounds x and y position. default:0,0 */
    @:optional var pos : Vector;
        /** The bounding box for the text to align to.
            If pos and bounds are specified, the bounds size will be used
            but the position will override the bounds x and y. default:ignored */
    @:optional var bounds : Rectangle;
        /** The horizontal alignment to use.
            If bounds are specified, relative to the bounds, otherwise to the pos. default: left */
    @:optional var align : TextAlign;
        /** The vertical alignment to use when bounds are specified. default: top */
    @:optional var align_vertical : TextAlign;

        /** The geometry depth. default: 0.0 */
    @:optional var depth : Float;
        /** The geometry group id. default: 0 */
    @:optional var group : Int;
        /** Whether or not the geometry is locked or not. default: false */
    @:optional var locked : Bool;
        /** Whether or not the geometry is visible or not. default: true */
    @:optional var visible : Bool;
        /** Whether or not the geometry is immediate or not. default: false */
    @:optional var immediate : Bool;
        /** The batcher to put the geometry in. default:Luxe.renderer.batcher */
    @:optional var batcher : Batcher;

        /** The geometry to append the text geometry to. WIP:see #98 */
    @:optional var geometry : CompositeGeometry;

} //TextOptions