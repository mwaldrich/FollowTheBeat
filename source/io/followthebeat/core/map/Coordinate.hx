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

package io.followthebeat.core.map;

import flixel.math.FlxRandom;

class Coordinate {
	public var x:Int;
	public var y:Int;

	public function new(x:Int, y:Int) {
		this.x = x;
		this.y = y;
	}

	public function equals(coordinate:Coordinate):Bool {
		return (this.x == coordinate.x)
			&& (this.y == coordinate.y);
	}

	// Is this coordinate within the given bounds?
	// Lower bounds are inclusive.
	public function isWithinBounds(minX:Int, minY:Int, maxX:Int, maxY:Int) {
		return (this.x >= minX)
			&& (this.y >= minY)
			&& (this.x < maxX)
			&& (this.x < maxY);
	}

	// Return a new coordinate that is the result of
	// "moving" the given direction.
	public function manipulate(direction:Direction) {
		return new Coordinate(DirectionUtils.manipulateX(this.x, direction), DirectionUtils.manipulateY(this.y, direction));
	}

	public function toString():String {
		return "(" + this.x + ", " + this.y + ")";
	}

	public function isBetweenRows(minY:Int, maxY:Int):Bool {
		return this.y >= minY && this.y < maxY;
	}

	public static function generateRandomCoordinate(minX:Int, minY:Int, maxX:Int, maxY:Int, random:FlxRandom):Coordinate {
		var x = random.int(minX, maxX);
		var y = random.int(minY, maxY);

		return new Coordinate(x, y);
	}
}