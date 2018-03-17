package;

class GamePiston extends AGameHazard {
	private var piston:Piston;
	private var pistonHead:GamePistonHeadSprite;
	private var pistonBody:GamePistonBodySprite;
	private var angle:Float;

	private var sprites:Array<AGameSprite>;

	public function new(piston:Piston, conductor:IConductor) {
		super(conductor);

		this.piston = piston;

		this.angle = DirectionUtils.toAngle(piston.getDirection());

		this.pistonBody = new GamePistonBodySprite(
			piston.getLocation().x,
			piston.getLocation().y,
			this.angle);
		this.pistonHead = new GamePistonHeadSprite(
			piston.getExtendedLocation().x,
			piston.getExtendedLocation().y,
			this.angle);

		sprites = [pistonBody, pistonHead];
	}

	public override function beat(newBeat:Int):Void {
		if (this.piston.isExtended(newBeat)) {
			pistonBody.activate(newBeat);
			pistonHead.activate(newBeat);
		} else {
			pistonBody.deactivate(newBeat);
			pistonHead.deactivate(newBeat);
		}
	}

	public override function getHazard():IHazard {
		return this.piston;
	}

	public override function getPieces():Array<AGameSprite> {
		return sprites;
	}
}