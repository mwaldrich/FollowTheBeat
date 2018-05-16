// This file is part of FollowTheBeat.
//
// FollowTheBeat is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// FollowTheBeat is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with FollowTheBeat. If not, see <http://www.gnu.org/licenses/>.

package io.followthebeat.game.states;

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

	public override function create():Void {
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

		playButton = new FlxButton(0, 0, playSingleplayer);
		var oldButtonWidth:Float = playButton.width;
		var oldButtonHeight:Float = playButton.height;
		var newButtonWidth:Float = FlxG.width;
		var newButtonHeight:Float = FlxG.height / 4;
		playButton.scale.set(newButtonWidth / oldButtonWidth, newButtonHeight / oldButtonHeight);
		playButton.x = 0;
		playButton.y = FlxG.height * 3 / 4;
		playButton.updateHitbox();
		var playButtonFontSize:Int = 60;
		var labelPadding:Float = 20;
		var labelHeight:Float = playButtonFontSize + labelPadding;
		var labelY:Float = playButton.y + playButton.height / 2 - labelHeight / 2;
		var label:FlxText = new FlxText(0, labelY, playButton.width, "Play", playButtonFontSize);
		label.alignment = FlxTextAlign.CENTER;
		add(playButton);
		add(label);
	}

	public override function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	public function playSingleplayer():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(new SingleplayerState());
	}
}
