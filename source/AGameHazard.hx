package;

import flixel.FlxSprite;

// Base game hazard class
class GameHazard extends FlxSprite {
	public function new() {
		super();
	}

	// Get the Hazard associated with this GameHazard.
	// This should be actually implemented in subclasses.
	public function getHazard():Hazard {
		throw "GameHazard's implementation of getHazard() was called!";
	}
}