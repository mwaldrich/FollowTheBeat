package;

// Represents a continuous stream of map segments.
interface IContinuousMap {
	// Gets the map segment that contains the given coordinate.
	// If there is no corresponding MapSegment or if the coordinate
	// is invalid, this will return null.
	public function getMapSegment(coordinate:Coordinate):MapSegment;
}