package luxe;

class ID {

    public var id : String;
    public var name : String = '';

    @:noCompletion public function new(?_name:String='', _id:String='') {

        name = _name;
        id = _id == '' ? Luxe.utils.uniqueid() : _id;

    } //new

}


/** A simple base object, event emitter, and ID. */
class Objects extends Emitter {

    public var id : String = '';
    public var name : String = '';

    @:noCompletion public function new(?_name:String='', _id:String='') {

        super();
        name = _name;
        id = _id == '' ? Luxe.utils.uniqueid() : _id;

    } //new

} //Objects