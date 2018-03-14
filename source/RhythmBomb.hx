package;

class RhythmBomb implements Hazard {
	// The location of this rhythm bomb
	private var location:Coordinate;

	// The bomb will explode every "timing" beats. If set to
	// 1, this bomb will always be exploding. If set to 2,
	// this bomb will explode every other beat. If set to
	// 4, this will explode on every fourth beat. This value
	// CANNOT be 0.
	private var timing:Int;

	public function new(location:Coordinate, timing:Int) {
		this.location = location;
		this.timing = timing;
	}

	public function getLocation():Coordinate {
		return this.location;
	}

	public function isDamaging(location:Coordinate, beat:Int):Bool {
		return this.isExploding()
			&& this.location.equals(location);
	}

	public function isOccupying(location:Coordinate):Bool {
		return this.location.equals(location);
	}

	public function isValid(segment:MapSegment, beat:Int):Bool {
		return segment.isWithinBounds(this.location, beat);
	}

	public function isExploding(beat:Int):Bool {
		return ((beat % this.timing) == (this.timing - 1));
	}

	public function getDifficulty():Float {
		return 1 / timing;
	}

	public function getDifficultyBetweenRows(minY:Int, maxY:Int):Float {
		if (this.location.y >= minY && this.location.y < maxY) {
			return this.getDifficulty();
		} else {
			return 0.0;
		}
	}

	public function toString():String {
		return "RhythmBomb(location: " + this.location + ", timing: " + this.timing + ")";
	}
}