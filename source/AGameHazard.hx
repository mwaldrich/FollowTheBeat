package;

import flixel.FlxSprite;

// Base game hazard class
//
// This class really should be abstract (Java style), but Haxe does not support
// abstract classes in this sense. Therefore, subclasses must override:
//
// - AGameHazard.getHazard():IHazard
// - AGameHazard.beat():Void
// - AGameHazard.getPieces():Array<AGameSprite>
//
// The constructor for this class is private. This was done intentionally
// to prevent instantiation by classes other than subclasses (this is how
// "private" visibility works in Haxe
// [https://haxe.org/manual/class-field-visibility.html]).
class AGameHazard extends AGameObject {

	private function new() {
		super();
	}

	// Get the Hazard associated with this AGameHazard.
	// This should be overriden in subclasses.
	public function getHazard():IHazard {
		throw "AGameHazard's implementation of getHazard() was called!"
			+ "\nThis should be overriden by subclasses.";
	}
}