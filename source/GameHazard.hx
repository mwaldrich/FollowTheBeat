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
class GameHazard extends GameSprite {

	private var lastBeatActivated:Int;
	private var conductor:Conductor;

	private function new(x:Int, y:Int, conductor:Conductor) {
		super(x, y);

		this.conductor = conductor;
		this.lastBeatActivated = -1;
	}

	public override function update(elapsed:Float):Void {
		super.update(elapsed);

		var currentBeat:Int = conductor.getCurrentBeat();

		if (this.lastBeatActivated < currentBeat) {
			this.lastBeatActivated = currentBeat;
			this.activate(currentBeat);
		}
	}

	// Get the Hazard associated with this GameHazard.
	// This should be overriden in subclasses.
	public function getHazard():Hazard {
		throw "GameHazard's implementation of getHazard() was called!"
			+ "\nThis should be overriden by subclasses.";
	}

	// This is called when a new beat occurs.
	// This should be overriden in subclasses.
	public function activate(newBeat:Int):Void {
		throw "GameHazard's implementation of activate() was called!"
			+ "\nThis should be overriden by subclasses.";
	}
}