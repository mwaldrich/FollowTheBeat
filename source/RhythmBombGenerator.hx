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

import flixel.math.FlxRandom;

class RhythmBombGenerator implements HazardGenerator {
	public function new() {}

	// TODO: update to take advantage of the offset feature
	public function generate(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):Hazard {
		// We are currently only generating Rhythm Bombs that explode
		// either every 4 beats or every 2 beats. This means the
		// inherent lower and upper bounds are 0.25 and 0.5,
		// respectively.

		if (minDifficulty <= 0.25 && maxDifficulty > 0.25 && !mapSegment.isOccupied(location)) {
			var timing:Int;

			if (maxDifficulty > 0.5) {
				timing = (random.bool()) ? 2 : 4;
			} else {
				timing = 2;
			}

			return new RhythmBomb(location, timing);
		} else {
			// A Rhythm Bomb cannot be generated in this location
			// within the given difficulty bounds.
			return null;
		}
	}
}