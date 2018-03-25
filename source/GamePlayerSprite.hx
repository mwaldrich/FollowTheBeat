package;

class GamePlayerSprite extends AGameSprite {
	public function new(coordinate:Coordinate, angle:Float) {
		super(coordinate);

		this.angle = angle;

		// Load player spritesheet
		loadGraphic(AssetPaths.character__png, true, 32, 32);

		// Set up animations
		this.animation.add("normal", [0], 1, false);
		this.animation.add("walk", [0, 2], Std.int(Main.animationFPS / 3), true);

		this.animation.play("walk");
	}

	public function move(coordinate:Coordinate, beat:Int):Void {
		this.setLocation(coordinate);
	}

	public override function activate(beat:Int):Void {

	}

	public override function deactivate(beat:Int):Void {
		
	}
}