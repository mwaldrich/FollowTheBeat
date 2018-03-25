package;

import flixel.FlxSprite;

class AGameSprite extends FlxSprite {
	// x and y are in game tiles. Scaling will be handled automatically.
	private function new(coordinate:Coordinate) {
		super();

		this.initializeSprite(coordinate);
	}

	public function setLocation(coordinate:Coordinate):Void {
		var x = coordinate.x;
		var y = coordinate.y;

		// TODO: fix this please
		var halfScale:Int = Std.int(Main.tileScale / 2);
		var eighthScale:Int = Std.int(Main.tileScale / 8) + 1;
		this.x = (x * Main.tileScale + halfScale - eighthScale);
		this.y = -(y * Main.tileScale + halfScale + eighthScale);

		trace("this.x = " + this.x + "; this.y = " + this.y);
	}

	public function activate(beat:Int):Void {
		throw "AGameSprite's implementation of activate() was called!"
			+ "\nThis should be overriden by subclasses.";
	}

	public function deactivate(beat:Int):Void {
		throw "AGameSprite's implementation of activate() was called!"
			+ "\nThis should be overriden by subclasses.";
	}

	private function initializeSprite(coordinate:Coordinate):Void {
		this.setLocation(coordinate);

		this.setSpriteProperties();
	}

	private function setSpriteProperties():Void {
		this.scale.set(Main.tileScale / 32, Main.tileScale / 32);
		this.width *= this.scale.x;
		this.height *= this.scale.y;
		this.origin.set(Main.tileScale / 32 / 2, Main.tileScale / 32 / 2);
		
		// Update hitbox after scaling to correct size
		this.updateHitbox();

		this.centerOffsets();
	}
}