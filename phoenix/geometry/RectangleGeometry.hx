package phoenix.geometry;


import luxe.Log.*;
import luxe.Vector;
import phoenix.Batcher;
import phoenix.geometry.Geometry;

import luxe.options.GeometryOptions.RectangleGeometryOptions;

class RectangleGeometry extends Geometry {

        /** Create a new Rectangle goemetry with given options */
    public function new(_options:RectangleGeometryOptions) {

        _options.primitive_type = PrimitiveType.lines;

        super(_options);

        var _x = _options.x;
        var _y = _options.y;
        var _w = _options.w;
        var _h = _options.h;

        if(_options.rect != null) {
            _x = _options.rect.x;
            _y = _options.rect.y;
            _w = _options.rect.w;
            _h = _options.rect.h;
        }

            //tl
        add(new Vertex( new Vector( 0, 0 ), color ));
            //tr
        add(new Vertex( new Vector( _w, 0 ), color ));

            //tr
        add(new Vertex( new Vector( _w, 0 ), color ));
            //br
        add(new Vertex( new Vector( _w, _h ), color ));

            //br
        add(new Vertex( new Vector( _w, _h ), color ));
            //bl
        add(new Vertex( new Vector( 0, _h ), color ));

            //bl
        add(new Vertex( new Vector( 0, _h ), color ));
            //tl
        add(new Vertex( new Vector( 0, 0 ), color ));

        transform.pos = transform.pos.set_xy( _x, _y );

    } //new

        /** Set the vertices from values */
    public function set_xywh( _x:Float, _y:Float, _w:Float, _h:Float ) {

        if(vertices.length == 0) return;

        vertices[0].pos.set_xy( 0, 0 );
            //tr
        vertices[1].pos.set_xy( _w, 0 );

            //tr
        vertices[2].pos.set_xy( _w, 0 );
            //br
        vertices[3].pos.set_xy( _w, _h );

            //br
        vertices[4].pos.set_xy( _w, _h );
            //bl
        vertices[5].pos.set_xy( 0, _h );

            //bl
        vertices[6].pos.set_xy( 0, _h );
            //tl
        vertices[7].pos.set_xy( 0, 0 );

            //
        transform.pos = transform.pos.set_xy( _x, _y );

    } //set_xywh

        /** Set the vertices based on a rectangle instance */
    public inline function set( _rect:luxe.Rectangle ) {

        set_xywh(_rect.x, _rect.y, _rect.w, _rect.h);

    } //set


} //RectangleGeometry
