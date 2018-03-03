package;

class RhythmBomb implements Hazard {
	// The location of this rhythm bomb
	private var location:Coordinate;

	// The bomb will explode every timing beats. If set to
	// 1, this bomb will always be exploding. If set to 2,
	// this bomb will explode every other beat. If set to
	// 4, this will explode on every fourth beat.
	private var timing:Int;

	public function getLocation():Coordinate {
		return this.location;
	}

	public function isDamaging(location:Coordinate, beat:Int):Bool {
		return ((beat % this.timing) == (this.timing - 1))
			&& this.location.equals(location);
	}

	public function isValid(segment:MapSegment):Bool {
		return segment.isWithinBounds(this.location);
	}
}