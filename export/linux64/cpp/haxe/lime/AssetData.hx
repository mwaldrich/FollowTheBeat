package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/images/character.png", "assets/images/character.png");
			type.set ("assets/images/character.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/piston.png", "assets/images/piston.png");
			type.set ("assets/images/piston.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/arrow.png", "assets/images/arrow.png");
			type.set ("assets/images/arrow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile.png", "assets/images/tile.png");
			type.set ("assets/images/tile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bomb.png", "assets/images/bomb.png");
			type.set ("assets/images/bomb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/title.png", "assets/images/title.png");
			type.set ("assets/images/title.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/EIGHTBITWONDER.ttf", "assets/data/EIGHTBITWONDER.ttf");
			type.set ("assets/data/EIGHTBITWONDER.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/EIGHTBITWONDER.txt", "assets/data/EIGHTBITWONDER.txt");
			type.set ("assets/data/EIGHTBITWONDER.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/README.TXT", "assets/data/README.TXT");
			type.set ("assets/data/README.TXT", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
