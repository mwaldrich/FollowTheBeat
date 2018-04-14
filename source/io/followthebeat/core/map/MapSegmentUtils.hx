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

class MapSegmentUtils {
	// TODO: make sure all *Utils classes have private constructors,
	// as well as classes like Directions and PlayerDirections

	private function new() {}

	// Is this MapSegment passable by a player?
	public static function isPassableSegment(mapSegment:MapSegment):Bool {
		return (breadthFirstSearch(mapSegment) != null);
	}

	// Returns the first path found of a player solving the level.
	// Returns null if no path was found.
	// Obviously uses breadth first search.
	// TODO: make this private
	public static function
		breadthFirstSearch(mapSegment:MapSegment):List<Coordinate> {
		var offsetY:Int = mapSegment.offsetY;
		var offsetBeat:Int = BeatUtils.minimumY(offsetY);
		var frontier:List<List<Coordinate>> = new List<List<Coordinate>>();

		// TODO: fix this (make sure goal is accessible from
		// all three starting locations)
		var initialList:List<Coordinate> = new List<Coordinate>();
        initialList.add(new Coordinate(1, offsetY));
		frontier.add(initialList);

		while (frontier.length > 0) {
			// The current path to evaluate
			var path:List<Coordinate> = frontier.pop();

			// The last coordinate in this path
			var lastVertex:Coordinate = path.last();

			if (mapSegment.isAtTop(lastVertex)) {
				return path;
			}

			var currentBeat:Int = offsetBeat + path.length - 1;

			trace("frontier length: " + frontier.length);
			trace("current path: " + path.join("; "));
			trace("last vertex: " + Std.string(lastVertex));
			trace("current beat: " + currentBeat);
			trace("neighbors of last vertex: " + neighbors(lastVertex, mapSegment, currentBeat).join("; "));
			trace("");

			for (nextVertex in neighbors(lastVertex, mapSegment, currentBeat)) {
				var newPath:List<Coordinate> = copyPath(path);
				newPath.add(nextVertex);

				frontier.add(newPath);
			}
		}

		return null;
	}

	// TODO: try some other searches, such as DFS with multiple path pruning

	private static function neighbors(coordinate:Coordinate, mapSegment:MapSegment, beat:Int):List<Coordinate> {
		var result:List<Coordinate> = new List<Coordinate>();

		for (direction in Type.allEnums(PlayerDirection)) {
			var newCoordinate:Coordinate = coordinate.manipulate(PlayerDirections.toDirection(direction));

			if (mapSegment.isWithinBounds(coordinate, beat + 1)
			&& !mapSegment.isDamaging(coordinate, beat + 1)) {
				result.add(newCoordinate);
			}
		}

		return result;
	}

	// Returns a copy of this path (List<Coordinate>).
	private static function copyPath(path:List<Coordinate>):List<Coordinate> {
		var result:List<Coordinate> = new List<Coordinate>();

		for (coordinate in path) {
			result.add(coordinate);
		}

		return result;
	}
}