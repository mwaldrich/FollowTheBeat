package;

import flixel.FlxGame;
import flixel.FlxG;
import flixel.math.FlxRandom;
import openfl.display.Sprite;

class Main extends Sprite {
	public static inline var tileScale:Int = Std.int(360 / 3);
	public static inline var segmentWidth:Int = 3;
	public static inline var segmentHeight:Int = 8;
	public static inline var beatTime:Int = 500;
	public static inline var songLength:Int = 32;
	public static inline var animationFPS:Int = 7;

	public static var random:FlxRandom;
	public static var exampleSegment1:MapSegment;

	public function new() {
		super();

		// Initialize FlxRandom
		random = new FlxRandom(1);

		// Initialize exampleSegment1
		exampleSegment1 = new MapSegment(0, segmentWidth, segmentHeight);
		// exampleSegment1.addHazard(new Piston(new Coordinate(1, 1), Direction.Right, 2));
		exampleSegment1.addHazard(new RhythmBomb(new Coordinate(2, 2), 1));
		exampleSegment1.addHazard(new RhythmBomb(new Coordinate(1, 2), 2));
		exampleSegment1.addHazard(new RhythmBomb(new Coordinate(1, 1), 4));
		exampleSegment1.addHazard(new RhythmBomb(new Coordinate(2, 1), 8));
		exampleSegment1.addHazard(new Piston(new Coordinate(0, 0), Direction.Right, 1));
		// exampleSegment1.addHazard(new RhythmBomb(new Coordinate(2, 1), 4));
		addChild(new FlxGame(0, 0, MenuState, true));
	}
}
