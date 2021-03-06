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

package io.followthebeat.game.map;

import io.followthebeat.core.map.MapSegment;
import io.followthebeat.core.map.Coordinate;

// Represents a continuous stream of map segments to be used
// in the game.
interface IContinuousGameMap {
	// Gets the map segment that contains the given coordinate.
	// If there is no corresponding MapSegment or if the coordinate
	// is invalid, this will return null.
	public function getMapSegment(coordinate:Coordinate):MapSegment;
}