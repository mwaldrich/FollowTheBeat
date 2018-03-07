package;

import flixel.math.FlxRandom;

class Coordinate {
	public var x:Int;
	public var y:Int;

	public function new(x:Int, y:Int) {
		this.x = x;
		this.y = y;
	}

	public function equals(coordinate:Coordinate):Bool {
		return (this.x == coordinate.x)
			&& (this.y == coordinate.y);
	}

	// Is this coordinate within the given bounds?
	// Lower bounds are inclusive.
	public function isWithinBounds(minX:Int, minY:Int, maxX:Int, maxY:Int) {
		return (this.x >= minX)
			&& (this.y >= minY)
			&& (this.x < maxX)
			&& (this.x < maxY);
	}

	// Return a new coordinate that is the result of
	// "moving" the given direction.
	public function manipulate(direction:Direction) {
		return new Coordinate(DirectionUtils.manipulateX(this.x, direction), DirectionUtils.manipulateY(this.y, direction));
	}

	public function toString():String {
		return "(" + this.x + ", " + this.y + ")";
	}

	public static function generateRandomCoordinate(minX:Int, minY:Int, maxX:Int, maxY:Int, random:FlxRandom):Coordinate {
		var x = random.int(minX, maxX);
		var y = random.int(minY, maxY);

		return new Coordinate(x, y);
	}
}