package;

import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;

class GameMapSegment extends FlxGroup {
	private var mapSegment:MapSegment;
	private var tilemap:FlxTilemap;

	private var gameHazardList:List<AGameHazard>;

	public function new(mapSegment:MapSegment) {
		super();

		this.mapSegment = mapSegment;

		tilemap = new FlxTilemap();

		tilemap.loadMapFromCSV("1,1,1,\n1,1,1,\n1,1,1,\n1,1,1\n"
		+ "1,1,1,\n1,1,1,\n1,1,1,\n1,1,1", AssetPaths.tile__png, 32, 32);

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
}