package luxe.importers.obj;

typedef Data = {
    var vertices : Array<luxe.importers.obj.Vertex>;
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
    var w : Float;
}

typedef Vector = {
    var x : Float;
    var y : Float;
    var z : Float;
    var w : Float;
}

typedef UV = {
    var u : Float;
    var v : Float;
}
