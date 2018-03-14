package;

class GameRhythmBomb extends GameHazard {
	
	private var segment:GameMapSegment;
	private var rhythmBomb:RhythmBomb;

	public function new(rhythmBomb:RhythmBomb, segment:GameMapSegment) {
		this.rhythmBomb = rhythmBomb;
		this.segment = segment;

		super(rhythmBomb.location.x * Main.tileScale, rhythmBomb.location.y * Main.tileScale);

		// Load rhythm bomb spritesheet
		loadGraphic(AssetPaths.bomb__png, true, 32, 32);

		// Set up animations
		animation.add("explode", [1, 2, 0], 6, false);
	}

	// public override function update(???):Void {
	// 	if (segment.getMapSegment().)
	// }
}