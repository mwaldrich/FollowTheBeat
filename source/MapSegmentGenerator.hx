package;

class MapSegmentGenerator {
	// Should be given some measure of difficulty
	public static function generateMapSegment():MapSegment {
		return null;
	}

	public static function isValid(mapSegment:MapSegment):Bool {
		return isValidAcc(mapSegment, new Player(new Coordinate(1, 0)), 0);
	}

	private static function isValidAcc(mapSegment:MapSegment, player:Player, beat:Int):Bool {
		trace("" + player.location.x + ", " + player.location.y);

		if (player.isBeingHurt(mapSegment, beat)) {
			return false;
		}

		if (player.isAtTopOfSegment(mapSegment)) {
			return true;
		}

		return /*(player.canMoveLeft(mapSegment) && isValidAcc(mapSegment, player.moveLeft(), beat + 1))
			|| (player.canMoveRight(mapSegment) && isValidAcc(mapSegment, player.moveRight(), beat + 1))
			||*/ (player.canMoveUp(mapSegment) && isValidAcc(mapSegment, player.moveUp(), beat + 1));
	}
}