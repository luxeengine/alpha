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
class Objects extends Emitter {

        /** the id */
    public var id : String = '';
        /** the name */
    public var name : String = '';

    @:noCompletion public function new(?_name:String='', _id:String='') {

        super();
        name = _name;
        id = _id == '' ? Luxe.utils.uniqueid() : _id;

    } //new

} //Objects