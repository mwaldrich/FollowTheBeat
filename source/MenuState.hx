package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class MenuState extends FlxState {
	private var background:FlxSprite;

	private var text1:FlxText;
	private var text2:FlxText;
	private var text3:FlxText;

	private var playButton:FlxButton;
	private var quitButton:FlxButton;

	override public function create():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);

		super.create();

		background = new FlxSprite();
		background.loadGraphic(AssetPaths.title__png, false);
		background.setGraphicSize(FlxG.width, FlxG.height);
		background.screenCenter();
		add(background);

		// text1.setBorderStyle(FlxTextBorderStyle.NONE, new FlxColor(0xFF00FFED));

		text1 = new FlxText(0, (1 * (FlxG.height / 4)) - FlxG.height / 8 - FlxG.height / 16, 0, "FOLLOW", Std.int(FlxG.height / 10)); //, true);
		text1.screenCenter(FlxAxes.X);
		add(text1);

		text2 = new FlxText(0, (2 * (FlxG.height / 4)) - FlxG.height / 8 - FlxG.height / 16, 0, "THE", Std.int(FlxG.height / 10));
		text2.screenCenter(FlxAxes.X);
		add(text2);

		text3 = new FlxText(0, (3 * (FlxG.height / 4)) - FlxG.height / 8 - FlxG.height / 16, 0, "BEAT", Std.int(FlxG.height / 10));
		text3.screenCenter(FlxAxes.X);
		add(text3);

		playButton = new FlxButton(0, 0, "Play", playSingleplayer);
		// playButton.setGraphicSize(100, Std.int(FlxG.height / 8));
		/*playButton.scale.x = 3;
		  playButton.scale.y = 3;*/
		playButton.x = (FlxG.width / 3) - playButton.width;
		playButton.y = FlxG.height - playButton.height - 40;
		/* var lastWidth:Float = playButton.width;
		   var lastHeight:Float = playButton.height;
		   playButton.updateHitbox();
		   playButton.x -= (playButton.width - lastWidth) / 2;
		   playButton.y -= (playButton.height - lastHeight) / 2;

		   playButton.label.scale.x = 3;
		   playButton.label.scale.y = 3;
		   // playButton.updateHitbox();
		   /*playButton.x = (FlxG.width / 3) - (playButton.width / 2);
		   playButton.y = (FlxG.height - playButton.y - 10);*/

		/*playButton.label = new FlxText(0, 0, "Singleplayer", 50);
		  playButton.x = (FlxG.width / 3) - playButton.width;
		  playButton.y = FlxG.height - playButton.height - 40;
		  playButton.updateHitbox();*/
		add(playButton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	public function playSingleplayer():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(new SingleplayerState());
	}
}
