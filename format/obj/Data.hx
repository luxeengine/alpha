package format.obj;

typedef Data = {
    var vertices : Array<format.obj.Vertex>;    
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
