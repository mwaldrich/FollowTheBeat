package;

class BeatUtils {
	private function new() {}

	// What is the minimum y coordinate the player can be
	// at for this beat? (This is because the screen scrolls
	// up.)
	public static function minimumY(beat:Int):Int {
		return Math.floor(beat / 4);
	}

	// What is the minimum beat the game can be on if this
	// y-coordinate is the minimumY?
	public static function minimumBeat(y:Int) {
		return y * 4;
	}
}