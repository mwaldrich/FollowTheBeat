package;

class Piston implements Hazard {
	// The location of this Piston
	private var location:Coordinate;

	// What direction does this piston shoot?
	private var direction:Direction;

	public function new(location:Coordinate, direction:Direction) {
		super();
		this.location = location;
		this.direction = direction;
	}

	public function getLocation():Coordinate {
		return this.location;
	}

	public function isDamaging(location:Coordinate, beat:Int):Bool {
		return (this.location.equals(location))
			|| (this.location.manipulate(this.direction)
			        .equals(location)
			&& this.isExtended(beat));
	}

	public function isValid(segment:MapSegment):Bool {
		return segment.isWithinBounds(this.location)
			&& segment.isWithinBounds(this.location.manipulate(this.direction));
	}

	public function isExtended(beat:Int):Bool {
		return ((beat % this.timing) == (this.timing - 1));
	}

	public function generateGameHazard():AGameHazard {
		return new GamePiston(this);
	}
}