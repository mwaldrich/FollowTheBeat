package;

import flixel.FlxState;

class MenuState extends FlxState {
	override public function create():Void {
		super.create();

		var rhythmBomb1 = new RhythmBomb(new Coordinate(0, 1), 4);
		var rhythmBomb2 = new RhythmBomb(new Coordinate(1, 1), 4);
		var rhythmBomb3 = new RhythmBomb(new Coordinate(2, 1), 4);
		var exampleMap = new MapSegment(0, 3, 8);
		exampleMap.addHazard(rhythmBomb1);
		exampleMap.addHazard(rhythmBomb2);
		exampleMap.addHazard(rhythmBomb3);

		trace(MapSegmentGenerator.isValid(exampleMap));
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
