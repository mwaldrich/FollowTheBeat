package;

class GameRhythmBomb extends GameHazard {
	
	private var rhythmBomb:RhythmBomb;

	public function new(rhythmBomb:RhythmBomb, conductor:Conductor) {
		this.rhythmBomb = rhythmBomb;
		this.conductor = conductor;

		super(rhythmBomb.getLocation().x, rhythmBomb.getLocation().y, conductor);

		// Load rhythm bomb spritesheet
		loadGraphic(AssetPaths.bomb__png, true, 32, 32);

		trace("" + this.x + ", " + this.y);
		trace("" + this.width + ", " + this.height);
		trace("" + this.origin.toString());

		// Set up animations
		animation.add("normal", [0], 1, false);
		animation.add("explode", [1, 2, 0], Main.animationFPS, false);

		animation.play("normal");
	}

	public override function getHazard():Hazard {
		return this.rhythmBomb;
	}

	public override function activate(newBeat:Int):Void {
		if (this.rhythmBomb.isExploding(newBeat)) {
			animation.play("explode", true);
		} else {
			animation.play("normal", true);
		}
	}
}