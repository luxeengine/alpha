package luxe.macros;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

class ComponentRules {

    static var init_field : Field;
    static var ondestroy_field : Field;

	macro public static function apply() : Array<Field> {

		var _fields = Context.getBuildFields();

            //do this first to ensure the values are set
        for(_field in _fields) {
            switch(_field.name) {
                case 'init': init_field = _field;
                case 'ondestroy': ondestroy_field = _field;
            }
        }

		for(_field in _fields) {

            switch(_field.name) {

                case 'new': {
    				check_entity_touch(_field);
    			} //new

                case
                    'ontouchmove',
                    'ontouchdown',
                    'ontouchup',
                    'onmousemove',
                    'onmousedown',
                    'onmouseup',
                    'onmousewheel',
                    'ongamepadaxis',
                    'ongamepadup',
                    'ongamepaddown',
                    'ongamepaddevice',
                    'onkeydown',
                    'onkeyup',
                    'ontextinput',
                    'oninputdown',
                    'oninputup' :
                {
                    connect_event(_field);
                }

            } //switch _field.name

		} //for field in fields

		return _fields;

	} //apply


    static function connect_event( _field:haxe.macro.Field ) {

        if(_field.access.indexOf(AOverride) != -1) {

            var _event_name : String = _field.name.substr(2);

                //inject the init connection
            switch(init_field.kind) {
                default:
                case FFun(f):
                    switch(f.expr.expr) {
                        default:
                        case EBlock(exprs):
                            exprs.unshift( Context.parse('entity._listen( "$_event_name", ${_field.name} )', _field.pos) );
                    } //switch exp
            } //switch kind

                //and inject the ondestroy connection
            switch(ondestroy_field.kind) {
                default:
                case FFun(f):
                    switch(f.expr.expr) {
                        default:
                        case EBlock(exprs):
                            exprs.unshift( Context.parse('entity._unlisten( "$_event_name", ${_field.name} )', _field.pos) );
                    } //switch exp
            } //switch kind

        } //if override

    } //connect_event

    static function check_entity_touch( _field:haxe.macro.Field ) {
        switch(_field.kind) {
            default:
            case FFun(f):
                switch(f.expr.expr) {
                    default:
                    case EBlock(b):
                        for(node in b) {
                            ExprTools.iter(node, function(expr:Expr){
                                check_entity_field_access(expr.expr);
                            });
                        } //for node in b
                } //switch f.expr.expr
        } //switch _field.kind
    } //check_entity_touch

    static function check_entity_field_access( expr:ExprDef ) {
        switch(expr) {
            default:
            case EField(e, field): {
                switch(e.expr) {
                    default:
                    case EConst(c):
                        switch(c) {
                            default:
                            case CIdent(s):
                                if(s == 'entity') {
                                    Context.fatalError("You can't touch the entity field inside the constructor of a component, it hasn't been set! Do that code inside of `added` or `init` functions instead.", e.pos);
                                }
                        } //switch c
                } //switch e.expr
            } //case EField
        }
    } //check_entity_field_access

} //ComponentRules