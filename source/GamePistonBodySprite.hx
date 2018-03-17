package;

class GamePistonBodySprite extends AGameSprite {
	public function new(x:Int, y:Int, angle:Float) {
		super(x, y);

		this.angle = angle;

		loadGraphic(AssetPaths.piston__png, true, 32, 32);

		// Set up animations
		this.animation.add("base_normal", [0], 1, false);
		this.animation.add("base_extend", [1, 1, 1, 0], Main.animationFPS, false);

		this.animation.play("base_normal");
	}

	public override function activate(beat:Int):Void {
		this.animation.play("base_extend", true);
	}

	public override function deactivate(beat:Int):Void {
		this.animation.play("base_normal", true);
	}
}
