#if (!macro || !haxe3)
#if (nme || openfl)

import Main;
import flash.display.DisplayObject;
import openfl.Assets;
import flash.events.Event;

class ApplicationMain {

	static var mPreloader:NMEPreloader;

	public static function main() {
		
		
		
		var call_real = true;
		
		//nme.Lib.setPackage("underscorediscovery", "Main", "com.underscorediscovery.luxe.collision", "1.0.0");
		
		
		var loaded:Int = flash.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = flash.Lib.current.loaderInfo.bytesTotal;
		
		flash.Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		flash.Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		
		if (loaded < total || true) /* Always wait for event */ {
			call_real = false;
			mPreloader = new NMEPreloader();
			flash.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			flash.Lib.current.addEventListener(flash.events.Event.ENTER_FRAME, onEnter);
		}
		
		
		if (call_real)
			begin();
	}

	private static function begin() {
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod(Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(DocumentClass, []);
			if (Std.is(instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
	}

	static function onEnter(_) {
		var loaded = flash.Lib.current.loaderInfo.bytesLoaded;
		var total = flash.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			flash.Lib.current.removeEventListener(flash.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
		}
	}

	private static function preloader_onComplete(event:Event):Void {
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		flash.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		begin();
	}
}

#else

import Main;

class ApplicationMain {
	
	public static function main() {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod(Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			var instance = Type.createInstance(DocumentClass, []);
			if (Std.is(instance, flash.display.DisplayObject)) {
				flash.Lib.current.addChild(cast instance);
			}
		}
	}
}

#end

#if haxe3 @:build(DocumentClass.build()) #end
class DocumentClass extends Main { }

#else

import haxe.macro.Context;
import haxe.macro.Expr;

class DocumentClass {
	
	macro public static function build ():Array<Field> {
		var classType = Context.getLocalClass().get();
		var searchTypes = classType;
		while (searchTypes.superClass != null) {
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				var fields = Context.getBuildFields();
				var method = macro {
					return flash.Lib.current.stage;
				}
				fields.push ({ name: "get_stage", access: [ APrivate ], meta: [ { name: ":getter", params: [ macro stage ], pos: Context.currentPos() } ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos() });
				return fields;
			}
			searchTypes = searchTypes.superClass.t.get();
		}
		return null;
	}
	
}
#end