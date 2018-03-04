package;

// Represents an abstract Player
class Player {
	// TODO: don't do this (make this private)
	public var location:Coordinate;

	public function new(location:Coordinate) {
		this.location = location;
	}

	public function isBeingHurt(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isDamaging(this.location, beat);
	}

	public function isWithinBounds(mapSegment:MapSegment):Bool {
		return mapSegment.isWithinBounds(this.location);
	}

	public function isAtTopOfSegment(mapSegment:MapSegment):Bool {
		return mapSegment.isAtTop(this.location);
	}

	public function newMovedPlayer(direction:Direction):Player {
		return new Player(location.manipulate(direction));
	}

	// Returns a new Player that is moved up
	public function moveUp():Player {
		return new Player(this.location.manipulate(Direction.Up));
	}

	// Returns a new Player that is moved left
	public function moveLeft():Player {
		return new Player(this.location.manipulate(Direction.Left));
	}

	// Returns a new Player that is moved right
	public function moveRight():Player {
		return new Player(this.location.manipulate(Direction.Right));
	}

	// Can this player move up?
	public function canMoveUp(mapSegment:MapSegment):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Up));
	}

	// Can this player move left?
	public function canMoveLeft(mapSegment:MapSegment):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Left));

	}

	// Can this player move Right?
	public function canMoveRight(mapSegment:MapSegment):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Right));
	}
}