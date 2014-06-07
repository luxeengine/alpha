package lime;

import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
		
	public static var library = new Map <String,LibraryType> ();
	public static var path = new Map <String,String> ();
	public static var type = new Map <String,AssetType> ();
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			::if (assets != null)::::foreach assets::path.set ("::id::", "::resourceName::");
			type.set ("::id::", Reflect.field (AssetType, "::type::".toUpperCase ()));
			::end::::end::
			::if (libraries != null)::::foreach libraries::library.set ("::name::", Reflect.field (LibraryType, "::type::".toUpperCase ()));
			::end::::end::
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
} //AssetData
