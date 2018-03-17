package;

class GamePistonHeadSprite extends AGameSprite {
	private var pixelX:Float;
	private var pixelY:Float;

	public function new(x:Int, y:Int, angle:Float) {
		super(x, y);
		trace("x: " + x);
		trace("y: " + y);

		this.pixelX = this.x;
		this.pixelY = this.y;

		this.angle = angle;

		loadGraphic(AssetPaths.piston__png, true, 32, 32);

		// Set up animations
		this.animation.add("head_fire", [2, 4, 2, 5], Main.animationFPS, false);

		this.kill();
	}

	public override function activate(beat:Int):Void {
		trace("activating piston head!");
		this.reset(this.pixelX, this.pixelY);
		this.animation.play("head_fire");
	}

	public override function deactivate(beat:Int):Void {
		trace("deactivating piston head!");
		this.kill();
	}
}