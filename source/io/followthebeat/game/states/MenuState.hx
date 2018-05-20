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
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

import io.followthebeat.game.ui.ScaledFlxButton;

class MenuState extends FlxState {
	private var background:FlxSprite;

	private var text1:FlxText;
	private var text2:FlxText;
	private var text3:FlxText;

	private var playButton:ScaledFlxButton;
	private var debugButton:ScaledFlxButton;

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

		playButton = new ScaledFlxButton(0, FlxG.height * 3 / 4 + FlxG.height / 16, FlxG.width / 2, FlxG.height / 8, "Play", Std.int(FlxG.height / 20), playSingleplayer);
		add(playButton);

		debugButton = new ScaledFlxButton(FlxG.width / 2, FlxG.height * 3 / 4 + FlxG.height / 16, FlxG.width / 2, FlxG.height / 8, "Debug", Std.int(FlxG.height / 20), openDebugMenu);
		add(debugButton);
	}

	public override function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	public function playSingleplayer():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(new SingleplayerState(Main.defaultSingleplayerDifficultyOffset, Main.defaultSongAsset, Main.defaultTileset));
	}

	public function openDebugMenu():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(new DebugMenuState());
	}
}
