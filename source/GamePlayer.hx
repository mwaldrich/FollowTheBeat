package;

class GamePlayer extends AGameObject {

	private var player:Player;
	private var playerSprite:GamePlayerSprite;
	private var angle:Float;

	private var sprites:Array<AGameSprite>;

	public function new(player:Player) {
		super();

		this.player = player;

		this.angle = DirectionUtils.toAngle(player.getDirection());

		this.playerSprite = new GamePlayerSprite(
			player.getLocation().x,
			player.getLocation().y,
			this.angle);

		sprites = [playerSprite];
	}

	public override function beat(newBeat:Int):Void {
		
	}

	public override function getPieces():Array<AGameSprite> {
		return sprites;
	}
}