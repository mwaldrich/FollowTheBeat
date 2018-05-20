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

import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;

import io.followthebeat.core.map.MapSegment;

import io.followthebeat.game.objects.AGameHazard;

class GameMapSegment extends FlxGroup {
	private var mapSegment:MapSegment;
	private var tilemap:FlxTilemap;

	private var gameHazardList:List<AGameHazard>;

	private var tileset:Int;

	public function new(mapSegment:MapSegment, tileset:Int) {
		super();

		this.mapSegment = mapSegment;

		this.tileset = tileset;

		tilemap = new FlxTilemap();

		tilemap.loadMapFromCSV(this.generateMapDataString(), AssetPaths.tile__png, 32, 32);

		tilemap.scale.x = Main.tileScale / 32;
		tilemap.scale.y = Main.tileScale / 32;

		tilemap.y = -(tilemap.height + (mapSegment.offsetY * Main.tileScale));

		add(tilemap);

		this.gameHazardList = new List<AGameHazard>();

		populateGroup();
	}

	public function updateBuffers():Void {
		this.tilemap.updateBuffers();
	}

	public function beat(newBeat:Int):Void {
		for (hazard in gameHazardList) {
			hazard.beat(newBeat);
		}
	}

	// Returns the underlying MapSegment
	public function getMapSegment():MapSegment {
		return this.mapSegment;
	}

	// Creates Flixel objects to represent the hazards
	// in this segment and adds them to this group.
	private function populateGroup():Void {
		for (hazard in this.mapSegment.hazardList) {
			var hazard = hazard.generateGameHazard();

			gameHazardList.add(hazard);

			for (piece in hazard.getPieces()) {
				add(piece);
			}
		}
	}

	private function generateMapDataString():String {
		var accumulator:String = "";

		for (y in 0...8) {
			for (x in 0...3) {
				accumulator += "" + tileset + ",";
			}

			accumulator += "\n";
		}

		return accumulator;
	}
}
