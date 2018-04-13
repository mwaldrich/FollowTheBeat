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

class RhythmBomb implements IHazard {
	// The location of this rhythm bomb
	private var location:Coordinate;

	// The bomb will explode every "timing" beats. If set to
	// 1, this bomb will always be exploding. If set to 2,
	// this bomb will explode every other beat. If set to
	// 4, this will explode on every fourth beat. This value
	// CANNOT be 0.
	private var timing:Int;

	// How many beats should this Rhythm Bomb be offset from its
	// natural rhythm? Must be less than timing.
	private var offset:Int;

	public function new(location:Coordinate, timing:Int, ?offset:Int = 0) {
		this.location = location;
		this.timing = timing;
		this.offset = offset;
	}

	public function getLocation():Coordinate {
		return this.location;
	}

	public function isDamaging(location:Coordinate, beat:Int):Bool {
		return this.isExploding(beat)
			&& this.location.equals(location);
	}

	public function isOccupying(location:Coordinate):Bool {
		return this.location.equals(location);
	}

	public function isValid(segment:MapSegment, beat:Int):Bool {
		return segment.isWithinBounds(this.location, beat);
	}

	public function isExploding(beat:Int):Bool {
		return (beat % this.timing) == this.offset;
	}

	public function getDifficulty():Float {
		return 1 / timing;
	}

	public function getDifficultyBetweenRows(minY:Int, maxY:Int):Float {
		if (this.location.y >= minY && this.location.y < maxY) {
			return this.getDifficulty();
		} else {
			return 0.0;
		}
	}

	public function generateGameHazard():AGameHazard {
		return new GameRhythmBomb(this);
	}

	public function toString():String {
		return "RhythmBomb(location: " + this.location + ", timing: " + this.timing + ")";
	}
}