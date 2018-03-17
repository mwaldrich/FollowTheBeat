package;

import flixel.FlxSprite;

// Base game hazard class
// This class really should be abstract (Java style), but Haxe does not support
// abstract classes in this sense. Therefore, subclasses must override:
//
// - GameHazard.getHazard():Hazard
// - GameHazard.activate():Hazard
//
// The constructor for this class is private. This was done intentionally
// to prevent instantiation by classes other than subclasses (this is how
// "private" visibility works in Haxe
// [https://haxe.org/manual/class-field-visibility.html]).
class AGameHazard {

	private var lastBeatActivated:Int;
	private var conductor:IConductor;

	private function new(conductor:IConductor) {
		this.conductor = conductor;
		this.lastBeatActivated = -1;
	}

	// Get the Hazard associated with this AGameHazard.
	// This should be overriden in subclasses.
	public function getHazard():IHazard {
		throw "AGameHazard's implementation of getHazard() was called!"
			+ "\nThis should be overriden by subclasses.";
	}

	// This is called when a new beat occurs.
	// This should be overriden in subclasses.
	public function beat(newBeat:Int):Void {
		throw "AGameHazard's implementation of beat() was called!"
			+ "\nThis should be overriden by subclasses.";
	}

	public function getPieces():Array<AGameSprite> {
		throw "AGameHazard's implementation of getPieces() was called!"
			+ "\nThis should be overriden by subclasses.";
	}
}