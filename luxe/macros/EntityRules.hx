package luxe.macros;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

@:noCompletion class EntityRules {

#if macro

    static var init_field : Field;
    static var ondestroy_field : Field;

    macro public static function apply() : Array<Field> {

        init_field = null;
        ondestroy_field = null;

        var _fields = Context.getBuildFields();

            //do this first to ensure the values are set
        for(_field in _fields) {
            switch(_field.name) {
                case 'init': init_field = _field;
                case 'ondestroy': ondestroy_field = _field;
            }
        }

            //if no init field, insert one
        if(init_field == null) {
            init_field = {
                name: 'init',
                doc: null, meta: [],
                access: [AOverride,APublic],
                kind: FFun({ params:[], args:[], ret:null, expr:macro { super.init(); } }),
                pos: Context.currentPos()
            };
            _fields.push(init_field);
        }

            //if no ondestroy field, insert one
        if(ondestroy_field == null) {
            ondestroy_field = {
                name: 'ondestroy',
                doc: null, meta: [],
                access: [AOverride,APublic],
                kind: FFun({ params:[], args:[], ret:null, expr:macro { super.ondestroy(); } }),
                pos: Context.currentPos()
            };
            _fields.push(ondestroy_field);
        }

        for(_field in _fields) {

            switch(_field.name) {

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
                    'oninputup',
                    'onwindowmoved',
                    'onwindowresized',
                    'onwindowsized',
                    'onwindowminimized',
                    'onwindowrestored' :
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
                            exprs.push( Context.parse('_listen( Luxe.Ev.${_event_name}, ${_field.name}, true )', _field.pos) );
                    } //switch exp
            } //switch kind

                //and inject the ondestroy connection
            switch(ondestroy_field.kind) {
                default:
                case FFun(f):
                    switch(f.expr.expr) {
                        default:
                        case EBlock(exprs):
                            exprs.push( Context.parse('_unlisten( Luxe.Ev.${_event_name}, ${_field.name}, true )', _field.pos) );
                    } //switch exp
            } //switch kind

        } //if override

    } //connect_event

#end //macro

} //EntityRules
