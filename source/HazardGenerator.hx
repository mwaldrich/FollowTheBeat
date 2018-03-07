package;

import flixel.math.FlxRandom;

interface HazardGenerator {
	// Generates a random instance of this hazard within the given range of
	// difficulties. As always the lower bound is inclusive and the upper
	// bound exclusive. If a hazard of this type cannot be generated within
	// the given difficulty bounds, this WILL return null.
	public function generate(location:Coordinate, minDifficulty:Float, maxDifficulty:Float, mapSegment:MapSegment, random:FlxRandom):Hazard;
}