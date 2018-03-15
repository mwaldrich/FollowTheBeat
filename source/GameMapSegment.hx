package;

import flixel.group.FlxGroup;

class GameMapSegment extends FlxTypedGroup<GameHazard> {
	private var mapSegment:MapSegment;
	private var conductor:Conductor;

	public function new(mapSegment:MapSegment, conductor:Conductor) {
		super();

		this.mapSegment = mapSegment;
		this.conductor = conductor;

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
			add(hazard.generateGameHazard(this.conductor));
		}
	}
}