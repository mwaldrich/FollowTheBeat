package;

class MapSegment {
	private var hazardList:List<Hazard>;

	public var offsetY:Int;
	public var width:Int;
	public var height:Int;

	public function new(offsetY:Int, width:Int, height:Int) {
		this.offsetY = offsetY;
		this.width = width;
		this.height = height;
		this.hazardList = new List<Hazard>();
	}

	public function addHazard(hazard:Hazard):Void {
		hazardList.add(hazard);
	}

	// Is the given coordinate within the bounds of this 
	public function isWithinBounds(coordinate:Coordinate) {
		return coordinate.isWithinBounds(0, this.offsetY, this.width, this.height);
	}

	public function isDamaging(location:Coordinate, beat:Int):Bool {
		for (hazard in this.hazardList) {
			if (hazard.isDamaging(location, beat)) {
				return true;
			}
		}

		return false;
	}

	public function isAtTop(location:Coordinate):Bool {
		return (this.offsetY + this.height - 1)
			== location.y;
	}

	public function amountOfHazardsOnRow(row:Int) {
		var accumulated:Int;
		accumulated = 0;
		
		for (hazard in this.hazardList) {
			if (hazard.getLocation().x == row) {
				accumulated++;
			}
		}

		return accumulated;
	}
}