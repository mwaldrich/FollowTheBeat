package;

class GameRhythmBombSprite extends AGameSprite {
	public function new(coordinate:Coordinate) {
		super(coordinate);

		// Load rhythm bomb spritesheet
		loadGraphic(AssetPaths.bomb__png, true, 32, 32);

		// Set up animations
		animation.add("normal", [0], 1, false);
		animation.add("explode", [1, 2, 0], Main.animationFPS, false);

		animation.play("normal");
	}

	public override function activate(beat:Int):Void {
		animation.play("explode", true);
	}

	public override function deactivate(beat:Int):Void {
		animation.play("normal", true);
	}

}