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

package io.followthebeat.core.levelgen.map;

import flixel.math.FlxRandom;

import io.followthebeat.core.map.Coordinate;
import io.followthebeat.core.map.MapSegment;
import io.followthebeat.core.map.PlayerDirection;
import io.followthebeat.core.objects.IHazard;

import io.followthebeat.core.levelgen.objects.HazardGeneratorUtils;

class MapSegmentGeneratorBeta {

	private static inline var consistency = 2;

	private static inline var threshold = 0.25;

	// Generates a random map segment with the given properties
	// and random number generator.
	public static function generateMapSegment(offsetY:Int, width:Int,
	    height:Int, difficulty:Float, random:FlxRandom):MapSegment {

		var mapSegment:MapSegment = new MapSegment(offsetY, width, height);

		var path:List<Coordinate> =
			generatePlayerPath(offsetY, width, height, random);

		generate(mapSegment, offsetY, offsetY + height, difficulty, consistency,
		    path, random);

		return mapSegment;
	}

	private static function generate(mapSegment:MapSegment, start:Int, end:Int,
		difficulty:Float, consistency:Int, path:List<Coordinate>,
		random:FlxRandom):Void {

		trace("start: " + start + "; end = " + end + "; difficulty: " + difficulty + "; consistency = " + consistency);

		if ((end - start) <= consistency) {
			trace("hit base case in MSGb#generate; start: " + start + "; end = " + end + "; difficulty: " + difficulty + "; consistency = " + consistency);
			while (true) {
				trace("adding a hazard in base case");
				var currentDifficulty:Float = mapSegment.getDifficultyBetweenRows(start, end);
				var difference:Float = Math.abs(difficulty - currentDifficulty);

				if (difference <= threshold) {
					trace("finished base case");
					break;
				} else {
					addRandomHazard(mapSegment, start, end, difficulty, path, random);
				}
			}
		} else {
			var halfSize:Int = Std.int((end - start) / 2);

			// Split into two, generate for smaller parts
			generate(mapSegment, start, end - halfSize, difficulty / 2,
				consistency, path, random);

			generate(mapSegment, start + halfSize, end, difficulty / 2,
				consistency, path, random);
		}
	}

	private static function addRandomHazard(segment:MapSegment, start:Int,
		end:Int, maxDifficulty:Float, path:List<Coordinate>,
		random:FlxRandom):Void {

		while (true) {
			var newCoordinate = Coordinate.generateRandomCoordinate(0, start, segment.width, end, random);

			// TODO: don't make this 0.25
			var newHazard = HazardGeneratorUtils.generateRandomHazard(newCoordinate, 0.25, maxDifficulty, segment, random);

			trace(newHazard);

			if (newHazard != null
			&& isHazardValid(newHazard, segment, path)) {
				segment.hazardList.push(newHazard);
				break;
			} else {
				trace("regenerating random hazard MSGb:72");
			}

		}
	}

	// Ensures that:
	//   - the given hazard does not block any location on the path when the
	//     player is traveling there
	//   - the given hazard does not occupy any location that other hazards are
	//     occupying
	private static function isHazardValid(hazard:IHazard, mapSegment:MapSegment, path:List<Coordinate>)
		:Bool {

		// Check to make sure the player path is unobstructed by this hazard
		var beat:Int = 0;

		for (coordinate in path) {
			if (hazard.isDamaging(coordinate, beat)
			|| hazard.isBlocking(coordinate, beat)) {
				trace("isHazardValid: no way jose (blocking the player)!");
				return false;
			}

			beat++;
		}

		// Make sure the given hazard does not occupy any spaces occupied by
		// other hazards

		for (coordinate in hazard.getOccupiedLocations()) {
			if (mapSegment.isOccupied(coordinate)) {
				trace("isHazardValid: no way jose (ocupado)!");
				return false;
			}
		}

		trace("isHazardValid: you betcha!");
		return true;
	}

	private static function generatePlayerPath(offsetY:Int, width:Int,
	    height:Int, random:FlxRandom):List<Coordinate> {
		// TODO: don't rely on the beat being the minimum, because
		// this will cause problems.

		// This is the accumulated path
		var path = new List<Coordinate>();

		// TODO: also don't rely on the start always being (1, offsetY)
		path.add(new Coordinate(1, offsetY));

		var topOfSegment = offsetY + height;

		while (path.last().y < topOfSegment) {
			path.add(getRandomPlayerNeighbor(path.last(), offsetY, width,
			    height, path.length - 1, random));

			trace(path.join("; "));
		}

		return path;
	}

	private static function getRandomPlayerNeighbor(coordinate:Coordinate,
	    offsetY:Int, width:Int, height:Int, beat:Int, random:FlxRandom)
		:Coordinate {

		var neighbors:Array<Coordinate> = playerNeighbors(coordinate, offsetY,
		    width, height, beat);

		// List doesn't support the `get` operation...

		var index:Int = random.int(0, neighbors.length - 1);
		// TODO: make sure HaxeFlixel docs are right and the upper bound is in
		// fact inclusive

		return neighbors[index];
	}

	// Generate the possible next steps a player can take on the given beat 
	private static function playerNeighbors(coordinate:Coordinate, offsetY:Int,
	    width:Int, height:Int, beat:Int):Array<Coordinate> {

		var result:Array<Coordinate> = new Array<Coordinate>();

		// trace("current coordinate: " + coordinate);
		// trace("neighbors:");

		for (direction in Type.allEnums(PlayerDirection)) {
			var newCoordinate:Coordinate =
				coordinate.manipulatePlayer(direction);

			// trace("\t- " + newCoordinate);

			// Maybe remove the first check; it's probably useless
			if (newCoordinate.x >= 0 && newCoordinate.x < 3
			 && newCoordinate.isOnScreen(beat + 1)) {
				// trace("\t\taccepted!");
				result.push(newCoordinate);
			}
		}

		return result;
	}
}
