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

interface IHazardGenerator {
	// Generates a random instance of this hazard within the given range of
	// difficulties and given range of y-coordinates (start to end). As always
	// the lower bounds are inclusive and the upper bounds exclusive. If a
	// hazard of this type cannot be generated within the given difficulty
	// bounds, this WILL return null.
	public function generate(start:Int, end:Int, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, path:List<Coordinate>, random:FlxRandom):IHazard;
}