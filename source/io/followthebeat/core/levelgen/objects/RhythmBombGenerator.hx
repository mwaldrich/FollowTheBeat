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

package io.followthebeat.core.levelgen.objects;

import flixel.math.FlxRandom;

import io.followthebeat.core.objects.IHazard;
import io.followthebeat.core.map.Coordinate;
import io.followthebeat.core.map.MapSegment;

import io.followthebeat.core.objects.RhythmBomb;

class RhythmBombGenerator implements IHazardGenerator {
	public function new() {}

	// TODO: update to take advantage of the offset feature
	public function generate(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):IHazard {
		// We are currently only generating Rhythm Bombs that explode
		// either every 4 beats or every 2 beats. This means the
		// inherent lower and upper bounds are 0.25 and 0.5,
		// respectively.

		if (minDifficulty <= 0.25 && !mapSegment.isOccupied(location)) {
			var validTimings:Array<Int> = [1, 2, 4].filter(function(i:Int) {
				return maxDifficulty >= (1 / i);
			});

			// If there isn't a timing that fits the difficulty requirement,
			// abort now.
			if (validTimings.length < 1) {
				trace("aborting piston generation because no valid timing exists");
				return null;
			}

			var timing:Int = validTimings[random.int(0, validTimings.length - 1)];

			return new RhythmBomb(location, timing);
		} else {
			// A Rhythm Bomb cannot be generated in this location
			// within the given difficulty bounds.
			return null;
		}
	}
}