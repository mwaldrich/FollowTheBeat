package;

import flixel.math.FlxRandom;

class RhythmBombGenerator implements HazardGenerator {
	public function new() {}

	// TODO: update to take advantage of the offset feature
	public function generate(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):Hazard {
		// We are currently only generating Rhythm Bombs that explode
		// either every 4 beats or every 2 beats. This means the
		// inherent lower and upper bounds are 0.25 and 0.5,
		// respectively.

		if (minDifficulty <= 0.25 && maxDifficulty > 0.25 && !mapSegment.isOccupied(location)) {
			var timing:Int;

			if (maxDifficulty > 0.5) {
				timing = (random.bool()) ? 2 : 4;
			} else {
				timing = 2;
			}

			return new RhythmBomb(location, timing);
		} else {
			// A Rhythm Bomb cannot be generated in this location
			// within the given difficulty bounds.
			return null;
		}
	}
}