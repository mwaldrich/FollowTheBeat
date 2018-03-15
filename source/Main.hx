package;

import flixel.FlxGame;
import flixel.FlxG;
import flixel.math.FlxRandom;
import openfl.display.Sprite;

class Main extends Sprite {
	public static inline var tileScale = 360 / 3;
	public static inline var segmentWidth = 3;
	public static inline var segmentHeight = 8;
	public static inline var beatTime = 500;
	public static inline var songLength = 32;
	public static inline var animationFPS = 6;

	public static var random:FlxRandom;
	public static var exampleSegment1:MapSegment;

	public function new() {
		super();

		// Initialize FlxRandom
		random = new FlxRandom(1);

		// Initialize exampleSegment1
		exampleSegment1 = new MapSegment(0, segmentWidth, segmentHeight);
		// exampleSegment1.addHazard(new Piston(new Coordinate(1, 2), Direction.Right, 2));
		exampleSegment1.addHazard(new RhythmBomb(new Coordinate(1, 2), 2));
		exampleSegment1.addHazard(new RhythmBomb(new Coordinate(1, 1), 2));
		exampleSegment1.addHazard(new RhythmBomb(new Coordinate(2, 1), 2));
		exampleSegment1.addHazard(new Piston(new Coordinate(0, 0), Direction.Right, 2));
		// exampleSegment1.addHazard(new RhythmBomb(new Coordinate(2, 1), 4));
		addChild(new FlxGame(0, 0, MenuState, true));
	}
}
