package;

import flixel.FlxGame;
import flixel.math.FlxRandom;
import openfl.display.Sprite;

class Main extends Sprite {
	public var random:FlxRandom;

	public function new() {
		super();
		random = new FlxRandom(1);
		addChild(new FlxGame(0, 0, MenuState));
	}
}
