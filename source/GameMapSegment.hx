package;

import flixel.group.FlxGroup;

class GameMapSegment extends GameHazard {
	private var mapSegment:MapSegment;

	public function new(mapSegment:MapSegment) {
		this.mapSegment = mapSegment;

		populateGroup();
	}

	// Returns the underlying MapSegment
	public function getMapSegment():MapSegment {
		return this.mapSegment;
	}

	// Creates Flixel objects to represent the hazards
	// in this segment and adds them to this group.
	private function populateGroup():Void {
		for (hazard in this.mapSegment.hazardList) {
			add(hazard.generateGameHazard());
		}
	}
}