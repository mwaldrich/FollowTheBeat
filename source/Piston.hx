// This file is part of FollowTheBeat.
//
// FollowTheBeat is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// FollowTheBeat is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with FollowTheBeat. If not, see <http://www.gnu.org/licenses/>.

package;

class Piston implements IHazard {
	// The location of this Piston
	private var location:Coordinate;

	// What direction does this piston shoot?
	private var direction:Direction;

	private var timing:Int;

	private var offset:Int;

	// What location does the head of this piston extend into?
	private var extendedLocation:Coordinate;

	public function new(location:Coordinate, direction:Direction, timing:Int, ?offset:Int = 0) {
		this.location = location;
		this.direction = direction;
		this.timing = timing;
		this.offset = offset;
		this.extendedLocation = this.location.manipulate(this.direction);
	}

	public function getLocation():Coordinate {
		return this.location;
	}

	public function getExtendedLocation():Coordinate {
		return this.extendedLocation;
	}

	public function getDirection():Direction {
		return this.direction;
	}

	public function getTiming():Int {
		return this.timing;
	}

	public function isDamaging(location:Coordinate, beat:Int):Bool {
		return (this.location.equals(location))
			|| (this.isExtended(beat) && extendedLocation.equals(location));
	}

	public function isValid(segment:MapSegment, beat:Int):Bool {
		return segment.isWithinBounds(this.location, beat)
			&& (this.isExtended(beat)
			? segment.isWithinBounds(this.location.manipulate(this.direction), beat)
			: true);
	}

	public function getDifficulty():Float {
		return 1 + (1 / timing);
	}

	public function getDifficultyBetweenRows(minY:Int, maxY:Int):Float {
		var accumulatedDifficulty:Float = 0.0;

		// Which parts of this Piston fall between the given rows?

		// Piston base
		if (this.location.isBetweenRows(minY, maxY)) {
			accumulatedDifficulty += 1.0;
		}

		// Extended piston head
		if (this.extendedLocation.isBetweenRows(minY, maxY)) {
			accumulatedDifficulty += (1 / timing);
		}

		return accumulatedDifficulty;
	}

	public function isOccupying(location:Coordinate):Bool {
		return location.equals(this.location)
			|| location.equals(this.extendedLocation);
	}

	public function isExtended(beat:Int):Bool {
		return (beat % this.timing) == this.offset;
	}

	public function generateGameHazard():AGameHazard {
		return new GamePiston(this);
	}
}