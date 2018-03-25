package;

// Represents an object that is keeping a beat.
interface IConductor {
	// What is the progress of going through the current beat?
	// Should return a float between 0 and 1 (inclusive, exclusive),
	// with 0 representing the beat just starting and 0.999...
	// representing the beat just ending.
	public function getBeatProgress():Float;

	// What is the current beat of the game?
	public function getBeat():Int;
}