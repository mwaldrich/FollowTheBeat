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
import io.followthebeat.core.rhythm.BeatUtils;

class HazardGeneratorUtils {

	private static var generators = [new RhythmBombGenerator() , new PistonGenerator()];

	// Generates a random hazard within the given range of difficulties
	// and the given range of y-values (start to end).
	// As always, the lower bounds are inclusive and the upper bounds
	// exclusive. This may return null.
	public static function generateRandomHazard(start:Int, end:Int, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, path:List<Coordinate>, random:FlxRandom):IHazard {
		var shuffledGenerators:Array<IHazardGenerator> = generators.copy();
		random.shuffle(shuffledGenerators);

		for (generator in shuffledGenerators) {
			var hazard:IHazard = generator.generate(start, end, minDifficulty, maxDifficulty, mapSegment, path, random);

			if (hazard != null) {
				return hazard;
			}
		}

		return null;
	}

	// Ensures that:
	//   - the given hazard does not block any location on the path when the
	//     player is traveling there
	//   - the given hazard does not occupy any location that other hazards are
	//     occupying
	public static function isHazardValid(hazard:IHazard, mapSegment:MapSegment,
	    path:List<Coordinate>):Bool {

		// Check to make sure the player path is unobstructed by this hazard
		var beat:Int = 0;

		for (coordinate in path) {
			if (hazard.isDamaging(coordinate, beat)
			|| hazard.isBlocking(coordinate, beat)) {
				trace("isHazardValid: no way jose (blocking the player)!");
				return false;
			}

			beat++;
		}

		// Make sure the given hazard does not occupy any spaces occupied by
		// other hazards, as well as make sure the occupied locations are
		// in bounds.
		for (coordinate in hazard.getOccupiedLocations()) {
			if (!mapSegment.isWithinBounds(coordinate,
				    BeatUtils.minimumBeat(mapSegment.offsetY))
			|| mapSegment.isOccupied(coordinate)) {
				return false;
			}
		}

		return true;
	}
}
