package luxe.options;

typedef StateOptions = {

        /** The name of this state. Used for setting,enabling and disabling and fetching a state from a state machine. highly recommended you set this. */
    @:optional var name : String;

} //StateOptions

typedef StatesOptions = {

        /** The name of this state machine. highly recommended you set this. */
    @:optional var name : String;

} //StatesOptions