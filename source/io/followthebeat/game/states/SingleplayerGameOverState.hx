
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

class SingleplayerGameOverState extends FlxState {

	private var beatsSurvived:Int;

	private var background:FlxSprite;

	private var textYouLost:FlxText;
	private var textBeatsSurvived:FlxText;

	private var restartButton:ScaledFlxButton;
	private var menuButton:ScaledFlxButton;

	private var replayConstructor:Void->FlxState;

	public function new(beatsSurvived:Int, replayConstructor:Void->FlxState) {
		super();

		this.beatsSurvived = beatsSurvived;
		this.replayConstructor = replayConstructor;
	}

	public override function create():Void {
		super.create();

		background = new FlxSprite();
		background.loadGraphic(AssetPaths.title__png, false);
		background.setGraphicSize(FlxG.width, FlxG.height);
		background.screenCenter();
		add(background);

		textYouLost = new FlxText(0, (1 * (FlxG.height / 4)) - FlxG.height / 8 - FlxG.height / 16, 0, "YOU LOST", Std.int(FlxG.height / 20)); //, true);
		textYouLost.screenCenter(FlxAxes.X);
		add(textYouLost);

		textBeatsSurvived = new FlxText(0, (2 * (FlxG.height / 4)) - FlxG.height / 8 - FlxG.height / 16, 0, "SURVIVED\n" + this.beatsSurvived + "\nBEATS", Std.int(FlxG.height / 20));
		textBeatsSurvived.alignment = FlxTextAlign.CENTER;
		textBeatsSurvived.screenCenter(FlxAxes.X);
		add(textBeatsSurvived);

		restartButton = new ScaledFlxButton(0, FlxG.height * 3 / 4 + FlxG.height / 16, FlxG.width / 2, FlxG.height / 4 / 2, "Restart", 30, restartSingleplayer);
		add(restartButton);

		menuButton = new ScaledFlxButton(FlxG.width / 2, FlxG.height * 3 / 4 + FlxG.height / 16, FlxG.width / 2, FlxG.height / 4 / 2, "Menu", 30, goToMenu);
		add(menuButton);
	}

	public override function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	public function restartSingleplayer():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(this.replayConstructor());
	}

	public function goToMenu():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(new MenuState());
	}
}
