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
import io.followthebeat.core.map.Direction;
import io.followthebeat.core.rhythm.BeatUtils;

import io.followthebeat.core.objects.Piston;

class PistonGenerator implements IHazardGenerator {
	public function new() {}

	public function generate(start:Int, end:Int, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, path:List<Coordinate>, random:FlxRandom):IHazard {
		var validLocations:Array<Coordinate> = Coordinate.allCoordinatesWithin(0, start, 3, end)
			.filter(function(c:Coordinate) {
				return !mapSegment.isOccupied(c);
			});

		// If there isn't a location that isn't occupied, abort now.
		if (validLocations.length < 1) {
			trace("aborting piston generation because no valid location exists");
			return null;
		}

		random.shuffle(validLocations);

		var validTimings:Array<Int> = [1, 2, 4].filter(function(i:Int) {
			return maxDifficulty >= (1 / i);
		});

		// If there isn't a timing that fits the difficulty requirement,
		// abort now.
		if (validTimings.length < 1) {
			trace("aborting piston generation because no valid timing exists");
			return null;
		}

		random.shuffle(validTimings);

		var allOffsets:Array<Int> = [0, 1, 2, 3];
		random.shuffle(allOffsets);

		var allDirections:Array<Direction> = Type.allEnums(Direction);
		random.shuffle(allDirections);

		for (location in validLocations) {
			for (direction in allDirections) {
				for (timing in validTimings) {
					for (offset in allOffsets) {
						// If these 4 nested for-loops scare you, know that
						// they scare me, too.
						var piston:Piston = new Piston(location, direction, timing);
						if (HazardGeneratorUtils.isHazardValid(piston, mapSegment, path)) {
							return piston;
						}
					}
				}
			}
		}

		// A Piston cannot be generated in this location
		// within the given difficulty bounds.
		return null;
	}
}