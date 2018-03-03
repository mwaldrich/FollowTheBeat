package;

class Coordinate {
	public var x:Int;
	public var y:Int;

	public function isWithinBounds(width:Int, height:Int) {
		return (this.x >= 0)
			&& (this.y >= 0)
			&& (this.x < width)
			&& (this.x < height);
	}

	public function manipulate(direction:Direction) {
		return new Coordinate(Directions.manipulateX(this.x, direction), Directions.manipulateY(this.y, direction));
	}
}