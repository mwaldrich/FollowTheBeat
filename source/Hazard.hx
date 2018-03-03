package;

interface Hazard {
	// What is the location of this hazard?
	public function getLocation():Coordinate;

	// Is this hazard damaging the given location
	// on a particular beat?
	public function isDamaging(location:Coordinate, beat:Int):Bool;

	// Is this hazard in a valid location? Will it only be
	// affecting tiles that are in the map? This answer
	// depends on the width and height of the segment
	public function isValid(segment:MapSegment):Bool;
}