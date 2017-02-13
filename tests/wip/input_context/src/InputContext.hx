package ;

interface InputContext {
    function listen():Void;
    function unlisten():Void;

    function on<T>(event:InteractType, handler: T->Void):Void;
    function off<T>(event:InteractType, handler: T->Void):Bool;
}

@:enum
abstract InteractType(Int) from Int to Int { //:todo: rename
    var down = 0;
    var up = 1;
    var change = 2;
    var none = 3;
}