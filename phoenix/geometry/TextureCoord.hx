package phoenix.geometry;


class TextureCoordSet {
	
	public var uv0 : TextureCoord;
	public var uv1 : TextureCoord;
	public var uv2 : TextureCoord;
	public var uv3 : TextureCoord;
	public var uv4 : TextureCoord;
	public var uv5 : TextureCoord;
	public var uv6 : TextureCoord;
	public var uv7 : TextureCoord;

	public function new() {
		uv0 = new TextureCoord();
		uv1 = new TextureCoord();
		uv2 = new TextureCoord();
		uv3 = new TextureCoord();
		uv4 = new TextureCoord();
		uv5 = new TextureCoord();
		uv6 = new TextureCoord();
		uv7 = new TextureCoord();
	} //new

} //TextureCoordSet

class TextureCoord {

	public var u : Float = 0.0;
	public var v : Float = 0.0;
	public var w : Float = 0.0;

	public function new(_u:Float = 0.0, _v:Float = 0.0, _w:Float = 0.0) {
		u = _u;
		v = _v;
		w = _w;
	}

	public function set( ?_u : Float, ?_v : Float, ?_w : Float ) : TextureCoord {

		var _setu = u;
		var _setv = v;
		var _setw = w;
			
			//assign new values
		if(_u != null) _setu = _u;
		if(_v != null) _setv = _v;
		if(_w != null) _setw = _w;

		u = _setu;
		v = _setv;
		w = _setw;

		return this;
	}

	public function toString() {
		return  "{ u:"+u + ", v:" + v +" }" ;
	}
}