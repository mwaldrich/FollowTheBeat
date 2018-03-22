package;

// Base game object class (something that responds to rhythm and can render).
//
// This class really should be abstract (Java style), but Haxe does not support
// abstract classes in this sense. Therefore, subclasses must override:
//
// - AGameObject.beat():Void
// - AGameObject.getPieces():Array<AGameSprite>
//
// The constructor for this class is private. This was done intentionally
// to prevent instantiation by classes other than subclasses (this is how
// "private" visibility works in Haxe
// [https://haxe.org/manual/class-field-visibility.html]).
class AGameObject {
	private var lastBeatActivated:Int;

	private function new() {
		this.lastBeatActivated = -1;
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