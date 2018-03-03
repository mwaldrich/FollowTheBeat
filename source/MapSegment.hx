package;

class MapSegment {
	private var hazardMatrix:Vector<Hazard>;

	public var width:Int;
	public var height:Int;

	public function isWithinBounds(coordinate:Coordinate) {
		return coordinate.isWithinBounds(this.width, this.height);
	}
}