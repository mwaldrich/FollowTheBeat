package;

interface Hazard {
	// What is the main location of this hazard? This is measured
	// as an absolute coordinate.
	public function getLocation():Coordinate;

	// Is this hazard damaging the given location
	// on a particular beat?
	public function isDamaging(location:Coordinate, beat:Int):Bool;

	// Is the given coordinate occupied by this hazard?
	public function isOccupying(location:Coordinate):Bool;

	// Is this hazard in a valid location? Will it only be
	// affecting tiles that are in the map? This answer
	// depends on the width and height of the segment
	public function isValid(segment:MapSegment, beat:Int):Bool;

	// What is the difficulty of this hazard? This is determined
	// by the following formula:
	//
	// sum_i=0^n chance-of-blocking_i
	//
	// Essentially, this is the sum (for all tiles this hazard will
	// block) of the percentage of the time that tile is blocked.
	// For example, a rhythm bomb that explodes on every fourth beat
	// will have a difficulty of 1/4, or 0.25. A piston that extends
	// every other beat will have a difficulty of a 1.5, as it is
	// always blocking one tile, and is blocking an additional tile
	// 1/2 of the time. 1 + 1/2 = 1.5.
	public function getDifficulty():Float;

	// What is the difficulty of this hazard between minY and maxY?
	// In other words, what is the difficulty of this tile when only
	// considering tiles within minY and maxY? As always, the origin
	// of the y-axis is at the bottom. minY is inclusive and maxY is
	// exclusive.
	public function getDifficultyBetweenRows(minY:Int, maxY:Int):Float;

	// Generates a GameHazard that corresponds with this Hazard.
	public function generateGameHazard(conductor:Conductor):GameHazard;
}