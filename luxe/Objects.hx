package luxe;

class ID {

        /** the id */
    public var id : String;
        /** the name */
    public var name : String = '';

    @:noCompletion public function new(?_name:String='', _id:String='') {

        name = _name;
        id = _id == '' ? Luxe.utils.uniqueid() : _id;

    } //new

} //ID


/** A simple base object, event emitter, and ID. */
class Objects extends Emitter<Int> {

        /** the id */
    @:isVar public var id (get,set) : String = '';
        /** the name */
    @:isVar public var name (get,set) : String = '';

    @:noCompletion public function new(?_name:String='', _id:String='') {

        super();
        name = _name;
        id = _id == '' ? Luxe.utils.uniqueid() : _id;

    } //new

//These can't be inlined because they are intended to be overridden in subclasses

    function set_name(_name:String) : String    return name = _name;
    function set_id(_id:String) : String        return id = _id;
    function get_name() : String                return name;
    function get_id() : String                  return id;


} //Objects