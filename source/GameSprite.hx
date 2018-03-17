package;

import flixel.FlxSprite;

class GameSprite extends FlxSprite {
	// x and y are in game tiles. Scaling will be handled automatically.
	private function new(x:Int, y:Int) {
		// TODO: fix this please
		var halfScale:Int = Std.int(Main.tileScale / 2);
		var eighthScale:Int = Std.int(Main.tileScale / 8) + 1;
		super(x * Main.tileScale + halfScale - eighthScale,
		y * Main.tileScale + halfScale - eighthScale);

		// this.scale.x = Main.tileScale / 32;
		// this.scale.y = Main.tileScale / 32;

		this.scale.set(Main.tileScale / 32, Main.tileScale / 32);
		this.width *= this.scale.x;
		this.height *= this.scale.y;
		this.origin.set(Main.tileScale / 32 / 2, Main.tileScale / 32 / 2);

		// this.width = Main.tileScale;
		// this.height = Main.tileScale;

		// this.setGraphicSize(Main.tileScale, Main.tileScale);

		// Update hitbox after scaling to correct size
		this.updateHitbox();

		this.centerOffsets();
	}
}