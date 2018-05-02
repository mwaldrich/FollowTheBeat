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

class PlayerDirectionUtils {
	public static function manipulateX(x:Int, direction:PlayerDirection):Int {
		return switch(direction) {
			case Left: x - 1;
			case Right: x + 1;
			default: x;
		};
	}

	public static function manipulateY(y:Int, direction:PlayerDirection):Int {
		return switch(direction) {
			case Up: y + 1;
			default: y;
		}
	}
}