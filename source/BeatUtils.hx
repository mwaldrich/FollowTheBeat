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

class BeatUtils {
	private function new() {}

	// What is the minimum y coordinate the player can be
	// at for this beat? (This is because the screen scrolls
	// up.)
	public static function minimumY(beat:Int):Int {
		return Math.floor(beat / 4);
	}

	// What is the minimum beat the game can be on if this
	// y-coordinate is the minimumY?
	public static function minimumBeat(y:Int) {
		return y * 4;
	}

	// What is the y offset of the MapSegment that this beat is on?
	public static function segmentOffset(beat:Int):Int {
		var minimumY:Int = BeatUtils.minimumY(beat);

		return minimumY - (minimumY % Main.segmentHeight);
	}

	public static function segmentOffsetFromCoordinate(coordinate:Coordinate):Int {
		return coordinate.y - (coordinate.y % Main.segmentHeight);
	}
}