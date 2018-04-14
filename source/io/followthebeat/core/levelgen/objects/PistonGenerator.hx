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

class PistonGenerator implements HazardGenerator {
	public function new() {}

	public function generate(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):Hazard {
		// We are currently only generating Pistons that explode either
		// every 4 beats or every 2 beats. This means the inherent lower
		// and upper bounds are 1.25 and 1.5, respectively.

		if (minDifficulty <= 1.25 && maxDifficulty > 1.5
		&& !mapSegment.isOccupied(location)) {
			for (direction in Type.allEnums(Direction)) {
				if (mapSegment.isWithinBounds(location.manipulate(direction), BeatUtils.minimumBeat(mapSegment.offsetY))
				&& !mapSegment.isOccupied(location.manipulate(direction))) {
					return new Piston(location, direction);
				}
			}
		}

		// A Piston cannot be generated in this location
		// within the given difficulty bounds.
		return null;
	}
}