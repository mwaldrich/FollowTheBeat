package;

import flixel.math.FlxRandom;

class HazardGeneratorUtils {

	private static var generators = [new RhythmBombGenerator()]; // , new PistonGenerator()];

	// Generates a random hazard within the given range of difficulties.
	// As always, the lower bound is inclusive and the upper bound
	// exclusive.
	public static function generateRandomHazard(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):Hazard {
		while (true) {
			var currentGenerator:HazardGenerator = new RhythmBombGenerator(); // generators[random.int(generators.length)];

			var generatedHazard = currentGenerator.generate(location, minDifficulty, maxDifficulty, mapSegment, random);

			if (generatedHazard != null) {
				return generatedHazard;
			}

			trace("regenerating random hazard HazardGeneratorUtils:22");
			trace("location: " + location);
			trace("minDifficulty: " + minDifficulty);
			trace("maxDifficulty: " + maxDifficulty);
			trace("mapSegment: " + mapSegment);
		}
	}
}
