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

import io.followthebeat.core.objects.IHazard;

import io.followthebeat.core.rhythm.BeatUtils;

class MapSegment {
	// TODO: all of these should be private
	public var hazardList:List<IHazard>;

	public var offsetY:Int;
	public var width:Int;
	public var height:Int;

	public function new(offsetY:Int, width:Int, height:Int) {
		this.offsetY = offsetY;
		this.width = width;
		this.height = height;
		this.hazardList = new List<IHazard>();
	}

	public function getOffset():Int {
		return this.offsetY;
	}

	public function addHazard(hazard:IHazard):Void {
		hazardList.add(hazard);
	}

	// Is the given coordinate within the bounds of this 
	public function isWithinBounds(coordinate:Coordinate, beat:Int) {
		return coordinate.isWithinBounds(0, BeatUtils.minimumY(beat), this.width, this.height);
	}

	// Is the given coordinate damaged by any hazard?
	public function isDamaging(location:Coordinate, beat:Int):Bool {
		for (hazard in this.hazardList) {
			if (hazard.isDamaging(location, beat)) {
				return true;
			}
		}

		return false;
	}

	public function isAtTop(location:Coordinate):Bool {
		return (this.offsetY + this.height - 1)
			== location.y;
	}

	// Is the given coordinate occupied by any hazard?
	public function isOccupied(location:Coordinate):Bool {
		for (hazard in this.hazardList) {
			if (hazard.isOccupying(location)) {
				return true;
			}
		}

		return false;
	}

	// Is the given coordinate blocked by any hazard?
	public function isBlocked(location:Coordinate, beat:Int):Bool {
		for (hazard in this.hazardList) {
			if (hazard.isBlocking(location, beat)) {
				return true;
			}
		}

		return false;
	}

	// What is the overall difficulty of this level?
	public function getDifficulty():Float {
		var accumulatedDifficulty:Float = 0.0;

		for (hazard in this.hazardList) {
			accumulatedDifficulty += hazard.getDifficulty();
		}

		return accumulatedDifficulty;
	}

	public function getDifficultyBetweenRows(minY:Int, maxY:Int):Float {
		var accumulatedDifficulty:Float = 0.0;

		for (hazard in this.hazardList) {
			accumulatedDifficulty += hazard.getDifficultyBetweenRows(minY, maxY);
		}

		return accumulatedDifficulty;
	}

	public function toString():String {
		var result:String = "MapSegment";

		result += "(offsetY: " + this.offsetY + "\nwidth: " + this.width + "\nheight: " + this.height + "\nhazardList: " + this.hazardList + " visual:\n";

		for (y in this.offsetY...(this.offsetY + this.height)) {
			for (x in 0...this.width) {
				var hazardFound:Bool = false;
				for (hazard in this.hazardList) {
					if (hazard.isOccupying(new Coordinate(x, y))) {
						result += hazard.toString().charAt(0);
						hazardFound = true;
						break;
					}
				}

				if (!hazardFound) {
					result += ".";
				}
			}

			result += "\n";
		}

		return result + ")";
	}
}