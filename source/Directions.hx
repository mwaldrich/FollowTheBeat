package;

/**
 * Utility class for working with Directions.
 */
class Directions {
	public static function flip(direction:Direction) {
		return switch (direction) {
			case Up: Direction.Down;
			case Down: Direction.Up;
			case Left: Direction.Right;
			case Right: Direction.Left;
		}
	}

	public static function manipulateX(x:Int, direction:Direction):Int {
		return switch(direction) {
			case Left: x - 1;
			case Right: x + 1;
			default: x;
		};
	}

	public static function manipulateY(y:Int, direction:Direction):Int {
		return switch(direction) {
			case Up: y - 1;
			case Down: y + 1;
			default: y;
		}
	}
}