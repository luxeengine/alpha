package phoenix.formats.obj;

typedef Data = {
    var vertices : Array<phoenix.formats.obj.Vertex>;    
}

typedef Vertex = {
    var pos : Vector;
    var normal : Normal;
    var uv : UV;
}

typedef Normal = {
    var x : Float;   
    var y : Float;   
    var z : Float;
}

typedef Vector = {
    var x : Float;   
    var y : Float;   
    var z : Float;
}

typedef UV = {
    var u : Float;
    var v : Float;
}
