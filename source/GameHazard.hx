package;

import flixel.FlxSprite;

// Base game hazard class
// This class really should be abstract (Java style), but Haxe does not support
// abstract classes in this sense. Therefore, subclasses must override:
//
// - GameHazard.getHazard():Hazard
//
// The constructor for this class is private. This was done intentionally
// to prevent instantiation by classes other than subclasses (this is how
// "private" visibility works in Haxe
// [https://haxe.org/manual/class-field-visibility.html]).
class GameHazard extends FlxSprite {
	// x and y are in game tiles. Scaling will be handled automatically.
	private function new(x:Int, y:Int) {
		super(cast(x * Main.tileScale + (Main.tileScale / 2), Int),
		cast(y * Main.tileScale + (Main.tileScale / 2), Int));

		this.scale.x = Main.tileScale / 32;
		this.scale.y = Main.tileScale / 32;
	}

	// Get the Hazard associated with this GameHazard.
	// This should be actually implemented in subclasses.
	public function getHazard():Hazard {
		throw "GameHazard's implementation of getHazard() was called!"
			+ "\nThis should be overriden by subclasses.";
	}
}