package phoenix;

import phoenix.Resource;

import nmegl.gl.GL;
import nmegl.gl.GLTexture;

import nmegl.utils.UInt8Array;
import nmegl.utils.ArrayBuffer;

enum FilterType {
    nearest;
    linear;    
}
enum ClampType {
    edge;
    repeat;    
    mirror;    
}

class Texture extends Resource {

    public var texture : GLTexture;
    public var data : UInt8Array;
    public var _data : nmegl.utils.ArrayBufferView;

    public var width : Int = -1;
    public var height : Int = -1;   

    public function new( _manager : ResourceManager, _size : Dynamic ) {
        
        super( _manager, ResourceType.texture );

        id = 'Untitled';
        build( _size, null );
    }

    public function build(_size : Dynamic, _color: Dynamic) {

        if(_color == null) _color = {r:1,g:1,b:1,a:1};
        if(_size.x > 0 && _size.y > 0) {

            width = Std.int(_size.x);
            height = Std.int(_size.y);

                //clear up old data in case
            data = null;
                //create a new set of pixels data
            data = new UInt8Array(new ArrayBuffer( width * height * 4));
                //fill it up!
            for(x in 0 ... width) {
                for(y in 0 ... height) {
                    setPixel({x:x, y:y}, _color);
                }
            }

            texture = GL.createTexture();
        }
    }

    public function set_clamp( _clamp : ClampType ) {
        bind();
        switch (_clamp) {
            case ClampType.edge:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.CLAMP_TO_EDGE );
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.CLAMP_TO_EDGE );
            case ClampType.repeat:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.REPEAT );
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.REPEAT );
           case ClampType.mirror:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.MIRRORED_REPEAT );
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.MIRRORED_REPEAT );
        }
    }

    public function set_filtering( _filter : FilterType ) {

        bind();

        switch(_filter) {
            case FilterType.linear:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR);

            case FilterType.nearest:
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
                GL.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);            
        }

    }

    public function bind() {
        GL.bindTexture(GL.TEXTURE_2D, texture);
    }

    public function getPixel(_pos) {
        if(data == null) return null;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        return {
            r: data[ (((y*width)+x)*4)  ],
            g: data[ (((y*width)+x)*4)+1],
            b: data[ (((y*width)+x)*4)+2],
            a: data[ (((y*width)+x)*4)+3]
        };
    }

    public function setPixel(_pos, _color) {
        
        if(data == null) return;

        var x : Int = Std.int(_pos.x);
        var y : Int = Std.int(_pos.y);

        data[ (((y*width)+x)*4)  ] = _color.r;
        data[ (((y*width)+x)*4)+1] = _color.g;
        data[ (((y*width)+x)*4)+2] = _color.b;
        data[ (((y*width)+x)*4)+3] = _color.a;

    }

    public function lock() {
        
        //todo sven
        // glGetTexImage is missing from nme GL

        // data = new UInt8Array(new ArrayBuffer( width * height * 4));
        
        // glBindTexture(GL_TEXTURE_2D, texture);
        // glGetTexImage( GL_TEXTURE_2D , 0 , GL_RGBA , GL_UNSIGNED_BYTE, data );

        return true;
    }

    public function unlock() {
        
        if (data != null) {

            GL.bindTexture(GL.TEXTURE_2D, texture);            
            GL.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, width, height, 0, GL.RGBA, GL.UNSIGNED_BYTE, data);

            data = null;
        }

    }

    public function destroy() {
        GL.deleteTexture(texture);
        data = null;
    }
}