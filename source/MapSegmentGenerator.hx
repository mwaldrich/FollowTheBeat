package;

import flixel.math.FlxRandom;

class MapSegmentGenerator {

	// How many parts should the map be split into to ensure consistency?
	// This should be either a common factor of the segment length.
	// (for 8, it can be either 1, 2, 4, or 8)
	private static inline var consistency = 2;

	// How close should a map segment's difficulty be to the target
	// in order to be considered "ready"?
	private static inline var threshold = 0.25;

	// TODO: should this have an empty private constructor?

	// Should be given some measure of difficulty
	// I need a random hazard generator. Because the paths affect many
	// tiles other than their "center" tile, a way to measure "affected"
	// tiles must be used to ensure somewhat equal difficulty throughout
	// the segment. This method will then be given some level of difficulty
	// so that different segments can be generated with different
	// difficulties.
	public static function generateMapSegment(offsetY:Int, width:Int, height:Int, difficulty:Float, random:FlxRandom):MapSegment {
		var mapSegment:MapSegment = new MapSegment(offsetY, width, height);

		while (true) {
			var currentDifficulty:Float = mapSegment.getDifficulty();
			var difference:Float = Math.abs(difficulty - currentDifficulty);

			if (difference <= threshold) {
				return mapSegment;
			} else {
				addRandomHazard(0.25, difference / 2, mapSegment, random);
			}
		}
	}

	private static function getSegmentedDifficulty(mapSegment:MapSegment):Array<Float> {
		var segments:Array<Float> = new Array<Float>();

		for (i in 0...consistency) {
			var minY:Int = i * consistency;
			var maxY:Int = (i + 1) * consistency;

			segments.push(mapSegment.getDifficultyBetweenRows(minY, maxY));
		}

		// TODO: instead of reversing here, should I just insert(0) each
		// item?
		segments.reverse();

		return segments;
	}

	private static function addRandomHazard(minDifficulty:Float, maxDifficulty:Float, segment:MapSegment, random:FlxRandom):Void {
		var segmentedDifficulty:Array<Float> = getSegmentedDifficulty(segment);
		var minimumDifficultyIndex:Int = getMinimumSegmentIndex(segmentedDifficulty);

		while (true) {
			var newCoordinate = Coordinate.generateRandomCoordinate(0, segment.offsetY, segment.width, segment.offsetY + segment.height, random);

			var newHazard = HazardGeneratorUtils.generateRandomHazard(newCoordinate, minDifficulty, maxDifficulty, segment, random);

			segment.hazardList.push(newHazard);

			if (MapSegmentUtils.isPassableSegment(segment)) {
				return;
			} else {
				segment.hazardList.pop();
				trace("regenerating random hazard MSG:72");
			}
		}
	}

	private static function getMinimumSegmentIndex(segmentedDifficulty:Array<Float>):Int {
		var accumulatedMinimumIndex:Int = 0;
		var accumulatedMinimumValue:Float = 0.0;

		for (i in 0...segmentedDifficulty.length) {
			var value = segmentedDifficulty[i];

			if (value < accumulatedMinimumValue) {
				accumulatedMinimumValue = value;
				accumulatedMinimumIndex = i;
			}
		}

		return accumulatedMinimumIndex;
	}
}