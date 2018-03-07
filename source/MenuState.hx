package;

import flixel.FlxState;
import flixel.math.FlxRandom;

class MenuState extends FlxState {
	override public function create():Void {
		super.create();

		/*var rhythmBomb1 = new RhythmBomb(new Coordinate(0, 1), 4);
		var rhythmBomb2 = new RhythmBomb(new Coordinate(1, 1), 4);
		var rhythmBomb3 = new RhythmBomb(new Coordinate(2, 1), 4);
		var exampleMap = new MapSegment(0, 3, 8);
		exampleMap.addHazard(rhythmBomb1);
		exampleMap.addHazard(rhythmBomb2);
		exampleMap.addHazard(rhythmBomb3);

		var beforeTime:Float = Sys.time();
		var result = MapSegmentUtils.breadthFirstSearch(exampleMap).join("; ");
		var afterTime:Float = Sys.time();

		trace(result);
		trace("Time taken: " + (afterTime - beforeTime));

		var beforeTime:Float = Sys.time();
		var randomSegment:MapSegment = MapSegmentGenerator.generateMapSegment(0, 3, 8, 4, new FlxRandom(0));

		var afterTime:Float = Sys.time();

		trace(randomSegment);

		trace("Time taken: " + (afterTime - beforeTime));*/
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
