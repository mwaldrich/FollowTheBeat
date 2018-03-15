package;

class GameRhythmBomb extends GameHazard {
	
	private var rhythmBomb:RhythmBomb;
	private var conductor:Conductor;

	private var isExploding:Bool;

	public function new(rhythmBomb:RhythmBomb, conductor:Conductor) {
		this.rhythmBomb = rhythmBomb;
		this.conductor = conductor;
		this.isExploding = false;

		super(rhythmBomb.getLocation().x, rhythmBomb.getLocation().y);

		trace("" + this.x + ", " + this.y);
		// Load rhythm bomb spritesheet
		loadGraphic(AssetPaths.bomb__png, true, 32, 32);

		// Set up animations
		animation.add("normal", [0], 1, false);
		animation.add("explode", [1, 2, 0], Main.animationFPS, false);

		animation.play("normal");
	}

	public override function update(elapsed:Float):Void {
		var currentBeat:Int = conductor.getCurrentBeat();

		if (this.rhythmBomb.isExploding(currentBeat)) {
			if (!this.isExploding) {
				animation.play("explode");
				this.isExploding = true;
			}
		} else {
			animation.play("normal");
			this.isExploding = false;
		}

		super.update(elapsed);
	}

	public override function getHazard():Hazard {
		return this.rhythmBomb;
	}
}