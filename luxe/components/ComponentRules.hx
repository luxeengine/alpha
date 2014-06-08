package luxe.components;

import haxe.macro.Context;
import haxe.macro.Expr;

class ComponentRules {
	macro public static function apply() : Array<Field> {
		var fields = Context.getBuildFields();

		for(_field in fields) {
			if(_field.name == 'new') {
				Context.error('Component classes do not have a constructor. Use init() or create().', _field.pos);
			}
		}

		return fields;
	}
}