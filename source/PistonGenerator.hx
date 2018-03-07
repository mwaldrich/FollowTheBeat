package;

import flixel.math.FlxRandom;

class PistonGenerator implements HazardGenerator {
	public function new() {}

	public function generate(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):Hazard {
		// We are currently only generating Pistons that explode either
		// every 4 beats or every 2 beats. This means the inherent lower
		// and upper bounds are 1.25 and 1.5, respectively.

		if (minDifficulty <= 1.25 && maxDifficulty > 1.5
		&& !mapSegment.isOccupied(location)) {
			for (direction in Type.allEnums(Direction)) {
				if (mapSegment.isWithinBounds(location.manipulate(direction), BeatUtils.minimumBeat(mapSegment.offsetY))
				&& !mapSegment.isOccupied(location.manipulate(direction))) {
					return new Piston(location, direction);
				}
			}
		}

		// A Piston cannot be generated in this location
		// within the given difficulty bounds.
		return null;
	}
}