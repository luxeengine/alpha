package luxe.components;

import haxe.macro.Context;
import haxe.macro.Expr;

class ComponentRules {
	macro public static function apply() : Array<Field> {
		var fields = Context.getBuildFields();

		for(_field in fields) {
			if(_field.name == 'new') {
				switch(_field.kind) {
                    default:
                    case FFun(f):
                        switch(f.expr.expr) {
                            default:
                            case EBlock(b):
                                for(node in b) {
                                    switch(node.expr) {
                                        default:
                                        case EField(e, field):
                                            switch(e.expr) {
                                                default:
                                                case EConst(c):
                                                    switch(c) {
                                                        default:
                                                        case CIdent(s):
                                                            if(s == 'entity') {
                                                                Context.fatalError("You can't touch the entity field inside the constructor of a component, it hasn't been set! Do that code inside of `added` or `init` functions instead.", e.pos);
                                                            }
                                                    }
                                            }
                                    }
                                }
                        }
                }
			}
		}

		return fields;
	}
}