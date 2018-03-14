package;

class GamePiston extends AGameHazard implements IGameHazard {
	private var piston:Piston;

	public function new(piston:Piston) {
		this.piston = piston;

		super(piston.location.x * Main.tileScale, piston.location.y * Main.tileScale);
	}
}