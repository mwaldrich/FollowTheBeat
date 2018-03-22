package;

// Represents an abstract Player
class Player {
	// TODO: don't do this (make this private)
	public var location:Coordinate;
	private var direction:Direction;

	public function new(location:Coordinate, ?direction:Direction = null) {
		this.location = location;

		// Apparently Haxe doesn't consider enums to be constant values
		// so I have to default it to null.
		if (direction != null) {
			this.direction = direction;
		} else {
			this.direction = Direction.Up;
		}
	}

	public function getLocation():Coordinate {
		return this.location;
	}

	public function getDirection():Direction {
		return this.direction;
	}

	public function isBeingHurt(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isDamaging(this.location, beat);
	}

	public function isWithinBounds(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location, beat);
	}

	public function isAtTopOfSegment(mapSegment:MapSegment):Bool {
		return mapSegment.isAtTop(this.location);
	}

	public function newMovedPlayer(direction:Direction):Player {
		return new Player(location.manipulate(direction));
	}

	// Returns a new Player that is moved up
	public function moveUp():Player {
		return new Player(this.location.manipulate(Direction.Up), Direction.Up);
	}

	// Returns a new Player that is moved left
	public function moveLeft():Player {
		return new Player(this.location.manipulate(Direction.Left), Direction.Left);
	}

	// Returns a new Player that is moved right
	public function moveRight():Player {
		return new Player(this.location.manipulate(Direction.Right), Direction.Right);
	}

	// Can this player move up?
	public function canMoveUp(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Up), beat);
	}

	// Can this player move left?
	public function canMoveLeft(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Left), beat);

	}

	// Can this player move right?
	public function canMoveRight(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Right), beat);
	}
}