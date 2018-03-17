package;

import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;

class GameMapSegment extends FlxGroup {
	private var mapSegment:MapSegment;
	private var conductor:IConductor;
	private var tilemap:FlxTilemap;

	private var gameHazardList:List<AGameHazard>;

	public function new(mapSegment:MapSegment, conductor:IConductor) {
		super();

		this.mapSegment = mapSegment;
		this.conductor = conductor;
		// this.tilemap = new FlxTilemap();

		// tilemap.loadMapFromCSV("0,0,0,\n0,0,0,\n0,0,0,\n0,0,0\n"
		// + "0,0,0,\n0,0,0,\n0,0,0,\n0,0,0", AssetPaths.tile__png, 32, 32);

		// tilemap.scale.x = Main.tileScale / 32;
		// tilemap.scale.y = Main.tileScale / 32;

		// tilemap.x = 360 / 2;
		// tilemap.y = 640 / 2;
		// tilemap.follow();

		// add(this.tilemap);

		// trace("height in tiles: " + tilemap.heightInTiles);
		// trace("width in tiles: " + tilemap.widthInTiles);
		// trace("y: " + tilemap.y);
		// trace("x: " + tilemap.x);
		// trace("height: " + tilemap.height);
		// trace("width: " + tilemap.width);

		tilemap = new FlxTilemap();

		tilemap.loadMapFromCSV("1,1,1,\n1,1,1,\n1,1,1,\n1,1,1\n"
		+ "1,1,1,\n1,1,1,\n1,1,1,\n1,1,1", AssetPaths.tile__png, 32, 32);

		tilemap.scale.x = Main.tileScale / 32;
		tilemap.scale.y = Main.tileScale / 32;

		tilemap.y = Main.tileEndY - tilemap.height;

		// tilemap.x = 360 / 2;
		// tilemap.y = 640 / 2;
		// tilemap.follow();

		add(tilemap);

		this.gameHazardList = new List<AGameHazard>();

		populateGroup();
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
			var hazard = hazard.generateGameHazard(this.conductor);

			gameHazardList.add(hazard);

			for (piece in hazard.getPieces()) {
				add(piece);
			}
		}
	}
}