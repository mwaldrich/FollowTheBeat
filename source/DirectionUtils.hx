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

import flixel.FlxObject;

/**
 * Utility class for working with Directions.
 */
class DirectionUtils {
	public static function flip(direction:Direction) {
		return switch (direction) {
			case Up: Direction.Down;
			case Down: Direction.Up;
			case Left: Direction.Right;
			case Right: Direction.Left;
		}
	}

	public static function manipulateX(x:Int, direction:Direction):Int {
		return switch(direction) {
			case Left: x - 1;
			case Right: x + 1;
			default: x;
		};
	}

	public static function manipulateY(y:Int, direction:Direction):Int {
		return switch(direction) {
			case Up: y + 1;
			case Down: y - 1;
			default: y;
		}
	}

	public static function toFlxDirection(direction:Direction):Int {
		return switch(direction) {
			case Up: FlxObject.UP;
			case Down: FlxObject.DOWN;
			case Left: FlxObject.LEFT;
			case Right: FlxObject.RIGHT;
		}
	}

	public static function toAngle(direction:Direction):Int {
		return switch (direction) {
			case Down: 0;
			case Right: 270;
			case Up: 180;
			case Left: 90;
		}
	}
}