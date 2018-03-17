package;

class MapSegment {
	// TODO: all of these should be private
	public var hazardList:List<IHazard>;

	public var offsetY:Int;
	public var width:Int;
	public var height:Int;

	public function new(offsetY:Int, width:Int, height:Int) {
		this.offsetY = offsetY;
		this.width = width;
		this.height = height;
		this.hazardList = new List<IHazard>();
	}

	public function addHazard(hazard:IHazard):Void {
		hazardList.add(hazard);
	}

	// Is the given coordinate within the bounds of this 
	public function isWithinBounds(coordinate:Coordinate, beat:Int) {
		return coordinate.isWithinBounds(0, BeatUtils.minimumY(beat), this.width, this.height);
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

	// Is the given coordinate occupied by any hazard?
	public function isOccupied(location:Coordinate):Bool {
		for (hazard in this.hazardList) {
			if (hazard.isOccupying(location)) {
				return true;
			}
		}

		return false;
	}

	// What is the overall difficulty of this level?
	public function getDifficulty():Float {
		var accumulatedDifficulty:Float = 0.0;

		for (hazard in this.hazardList) {
			accumulatedDifficulty += hazard.getDifficulty();
		}

		return accumulatedDifficulty;
	}

	public function getDifficultyBetweenRows(minY:Int, maxY:Int):Float {
		var accumulatedDifficulty:Float = 0.0;

		for (hazard in this.hazardList) {
			accumulatedDifficulty += hazard.getDifficultyBetweenRows(minY, maxY);
		}

		return accumulatedDifficulty;
	}

	public function toString():String {
		var result:String = "";

		result += "{offsetY: " + this.offsetY + "\nwidth: " + this.width + "\nheight: " + this.height + "\nhazardList: " + this.hazardList + "\n}";

		return result;
	}
}