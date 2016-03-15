package luxe.macros;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

@:noCompletion class ComponentRules {

#if macro

    static var init_field : Field;
    static var ondestroy_field : Field;
    static var onremoved_field : Field;

    macro public static function apply() : Array<Field> {

        init_field = null;
        ondestroy_field = null;
        onremoved_field = null;

        var _fields = Context.getBuildFields();

            //do this first to ensure the values are set
        for(_field in _fields) {
            switch(_field.name) {
                case 'init': init_field = _field;
                case 'ondestroy': ondestroy_field = _field;
                case 'onremoved': onremoved_field = _field;
            }
        }

            //if no init field, insert one
        if(init_field == null) {
            init_field = {
                name: 'init',
                doc: null, meta: [],
                access: [AOverride],
                kind: FFun({ params:[], args:[], ret:null, expr: macro { super.init(); } }),
                pos: Context.currentPos()
            };
            _fields.push(init_field);
        }

            //if no ondestroy field, insert one
        if(ondestroy_field == null) {
            ondestroy_field = {
                name: 'ondestroy',
                doc: null, meta: [],
                access: [AOverride],
                kind: FFun({ params:[], args:[], ret:null, expr:macro { super.ondestroy(); } }),
                pos: Context.currentPos()
            };
            _fields.push(ondestroy_field);
        }

            //if no onremoved field, insert one
        if(onremoved_field == null) {
            onremoved_field = {
                name: 'onremoved',
                doc: null, meta: [],
                access: [AOverride],
                kind: FFun({ params:[], args:[], ret:null, expr:macro { super.onremoved(); } }),
                pos: Context.currentPos()
            };
            _fields.push(onremoved_field);
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

        init_field = null;
        ondestroy_field = null;
        onremoved_field = null;

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
                            exprs.push( Context.parse('entity._listen( luxe.Ev.${_event_name}, ${_field.name} )', _field.pos) );
                    } //switch exp
            } //switch kind

                //and inject the ondestroy connection
            switch(ondestroy_field.kind) {
                default:
                case FFun(f):
                    switch(f.expr.expr) {
                        default:
                        case EBlock(exprs):
                            exprs.push( Context.parse('entity._unlisten( luxe.Ev.${_event_name}, ${_field.name} )', _field.pos) );
                    } //switch exp
            } //switch kind

                //and inject the onremoved connection
            switch(onremoved_field.kind) {
                default:
                case FFun(f):
                    switch(f.expr.expr) {
                        default:
                        case EBlock(exprs):
                            exprs.push( Context.parse('entity._unlisten( luxe.Ev.${_event_name}, ${_field.name} )', _field.pos) );
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

#end //macro

} //ComponentRules
