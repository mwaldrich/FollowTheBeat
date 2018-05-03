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

class HazardGeneratorUtils {

	private static var generators = [new RhythmBombGenerator() , new PistonGenerator()];

	// Generates a random hazard within the given range of difficulties.
	// As always, the lower bound is inclusive and the upper bound
	// exclusive. This may return null.
	public static function generateRandomHazard(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):IHazard {
		var currentGenerator:IHazardGenerator = generators[random.int(0, generators.length - 1)];

		var generatedHazard = currentGenerator.generate(location, minDifficulty, maxDifficulty, mapSegment, random);

		return generatedHazard;
	}
}
