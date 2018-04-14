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

class HazardGeneratorUtils {

	private static var generators = [new RhythmBombGenerator()]; // , new PistonGenerator()];

	// Generates a random hazard within the given range of difficulties.
	// As always, the lower bound is inclusive and the upper bound
	// exclusive.
	public static function generateRandomHazard(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):Hazard {
		while (true) {
			var currentGenerator:HazardGenerator = new RhythmBombGenerator(); // generators[random.int(generators.length)];

			var generatedHazard = currentGenerator.generate(location, minDifficulty, maxDifficulty, mapSegment, random);

			if (generatedHazard != null) {
				return generatedHazard;
			}

			trace("regenerating random hazard");
			trace("location: " + location);
			trace("minDifficulty: " + minDifficulty);
			trace("maxDifficulty: " + maxDifficulty);
			trace("mapSegment: " + mapSegment);
		}
	}
}
