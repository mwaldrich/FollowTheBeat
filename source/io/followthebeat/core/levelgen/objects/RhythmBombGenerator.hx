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
	public function generate(start:Int, end:Int, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, path:List<Coordinate>, random:FlxRandom):IHazard {
		var validLocations:Array<Coordinate> = Coordinate.allCoordinatesWithin(0, start, 3, end)
			.filter(function(c:Coordinate) {
				return !mapSegment.isOccupied(c);
			});

		// If there isn't a location that isn't occupied, abort now.
		if (validLocations.length < 1) {
			trace("aborting rhythm bomb generation because no valid location exists");
			return null;
		}

		random.shuffle(validLocations);

		var validTimings:Array<Int> = [1, 2, 4].filter(function(i:Int) {
			return maxDifficulty >= (1 / i);
		});
		trace("valid timings: " + validTimings.join(";"));

		// If there isn't a timing that fits the difficulty requirement,
		// abort now.
		if (validTimings.length < 1) {
			trace("aborting rhythm bomb generation because no valid timing exists");
			return null;
		}

		random.shuffle(validTimings);

		var allOffsets:Array<Int> = [0, 1, 2, 3];
		random.shuffle(allOffsets);

		for (location in validLocations) {
			for (timing in validTimings) {
				for (offset in allOffsets) {
					var rhythmBomb:RhythmBomb = new RhythmBomb(location, timing,
					    offset);

					if (HazardGeneratorUtils
						.isHazardValid(rhythmBomb, mapSegment, path)) {
						return rhythmBomb;
					}
				}
			}
		}

		// No rhythm bomb can be generated with the given constraints.
		return null;
	}
}