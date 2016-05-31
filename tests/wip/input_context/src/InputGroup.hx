package ;
import InputContext.InteractType;

class InputGroup implements InputContext {
    var contexts: Array<InputContext>; //:todo: maybe make public? Not much access possible if private

    public function new(?_contexts:Array<InputContext>) {
        contexts = _contexts == null ? [] : _contexts;
    }

    public function add(_context:InputContext) {
        contexts.push(_context);
    }

    public function remove(_context:InputContext):Bool {
        return contexts.remove(_context);
    }

    public function listen():Void {
        for(context in contexts) {
            context.listen();
        }
    }

    public function unlisten():Void {
        for(context in contexts) {
            context.unlisten();
        }
    }

    public function on<T>(event:InteractType, handler:T->Void) {
        for(context in contexts) {
            context.on(event, handler);
        }
    }

    public function off<T>(event:InteractType, handler:T->Void) {
        for(context in contexts) {
            context.off(event, handler);
        }
        return true; //:todo: Not sure what should be returned here. Maybe aggregate remove?
    }
}