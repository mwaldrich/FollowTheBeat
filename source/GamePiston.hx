package;

class GamePiston extends GameHazard {
	private var piston:Piston;
	private var conductor:Conductor;

	private var isExtending:Bool;

	public function new(piston:Piston, conductor:Conductor) {
		this.piston = piston;
		this.conductor = conductor;
		this.isExtending = false;

		super(cast(piston.getLocation().x * Main.tileScale, Int), cast(piston.getLocation().y * Main.tileScale, Int));

		loadGraphic(AssetPaths.piston__png, true, 32, 32);

		this.facing = DirectionUtils.toFlxDirection(this.piston.getDirection());

		// Set up animations
		animation.add("base_normal", [0], 1, false);
		animation.add("base_extend", [1, 1, 0], Main.animationFPS, false);

		animation.play("base_normal");

		// TODO: add sprite for extended piston head
		// TODO: make this rotate
	}

	public override function update(elapsed:Float):Void {
		var currentBeat:Int = conductor.getCurrentBeat();

		if (this.piston.isExtended(currentBeat)) {
			if (!this.isExtending) {
				animation.play("base_extend");
				this.isExtending = true;
			}
		} else {
			animation.play("base_normal");
			this.isExtending = false;
		}

		super.update(elapsed);
	}

	public override function getHazard():Hazard {
		return this.piston;
	}
}