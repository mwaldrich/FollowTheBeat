package;

import flixel.FlxGame;
import flixel.math.FlxRandom;
import openfl.display.Sprite;

class Main extends Sprite {
	public static inline var tileScale = 360 / 3;
	public static inline var segmentWidth = 3;
	public static inline var segmentHeight = 8;

	public var random:FlxRandom;
	public var exampleSegment1:MapSegment;

	public function new() {
		super();
		// Initialize FlxRandom
		random = new FlxRandom(1);

		// Initialize exampleSegment1
		exampleSegment1 = new MapSegment(0, segmentWidth, segmentHeight);
		exampleSegment1.addHazard(new Piston(new Coordinate(1, 2), Direction.Right));
		// exampleSegment1.addHazard(new RhythmBomb(new Coordinate(2, 1), 4));
		addChild(new FlxGame(0, 0, MenuState));
	}
}
