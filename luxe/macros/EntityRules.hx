package luxe.macros;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

class EntityRules {

    static var init_field : Field;

    macro public static function apply() : Array<Field> {

        var fields = Context.getBuildFields();

        for(_field in fields) {

            switch(_field.name) {

                case 'init': {
                    init_field = _field;
                }

                case 'onmousedown': {
                    connect_event(_field);
                }

            } //switch _field.name

        } //for field in fields

        return fields;

    } //apply

    static function connect_event( _field:haxe.macro.Field ) {

        if(_field.access.indexOf(AOverride) != -1) {

            switch(init_field.kind) {

                case FFun(f):
                    switch(f.expr.expr) {
                        case EBlock(exprs):
                            var _event_name : String = _field.name.substr(2);
                            //exprs.unshift( Context.parse('_listen( "$_event_name", ${_field.name} )', _field.pos) );
                        default:
                    } //switch exp
                default: {}

            } //switch kind

        } //if override

    } //connect_event

} //EntityRules
