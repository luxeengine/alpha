package luxe.options;

    /** Options for a luxe.Component instance */
typedef ComponentOptions = {

        /** The component name. This is extremely important,
            as it is the named under which this component will be attached,
            and referenced in functions like `get`.
            Think of the name like the attachment slot for a component. */
    @:optional var name : String;

} //ComponentOptions
