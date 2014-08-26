package luxe;

/** A simple event emitter, used as a base class for systems that want to handle direct connections to named events */
class Emitter {

    public var handlers : Map<String, Array<Dynamic->Void> >;

    public function new() {

        handlers = new Map();

    } //new

        /** Emit a named event */
    public function emit<T>(event:String, data:T) {

        if(handlers.exists(event)) {
            var list = handlers.get(event);
            if(list.length > 0) {
                for(handler in list) {
                    handler(data);
                }
            }
        }

    } //emit

        /** connect a named event to a handler */
    public function on<T>(event:String, handler: T->Void ) {

        var list : Array< Dynamic->Void >;

        if(!handlers.exists(event)) {
            list = [];
            handlers.set(event, list);
        } else {
            list = handlers.get(event);
        }

        list.push(handler);

    } //on

        /** disconnect a named event and handler. returns true on success, or false if event or handler not found */
    public function off<T>(event:String, handler: T->Void ) : Bool {

        var success = false;

        if(handlers.exists(event)) {

            var list = handlers.get(event);
            success = list.remove( handler );
                //clear the event list if there are no handlers
            if(list.length == 0) {
                handlers.remove(event);
            }

        } //if exists

        return success;

    } //off

} //Emitter
