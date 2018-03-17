package;

class GamePiston extends GameHazard {
	private var piston:Piston;

	public function new(piston:Piston, conductor:Conductor) {
		this.piston = piston;

		super(cast(piston.getLocation().x * Main.tileScale, Int), cast(piston.getLocation().y * Main.tileScale, Int), conductor);

		loadGraphic(AssetPaths.piston__png, true, 32, 32);

		this.facing = DirectionUtils.toFlxDirection(this.piston.getDirection());

		// Set up animations
		animation.add("base_normal", [0], 1, false);
		animation.add("base_extend", [1, 1, 0], Main.animationFPS, false);

		animation.play("base_normal");

		// TODO: add sprite for extended piston head
		// TODO: make this rotate
	}
	public override function getHazard():Hazard {
		return this.piston;
	}

	public override function activate(newBeat:Int):Void {
		if (this.piston.isExtended(newBeat)) {
			animation.play("base_extend", true);
		} else {
			animation.play("base_normal", true);
		}
	}
}