package;

class PlayerDirections {
	public static function toDirection(playerDirection:PlayerDirection):Direction {
		return switch (playerDirection) {
			case Up: Direction.Up;
			case Left: Direction.Left;
			case Right: Direction.Right;
		}
	}
}