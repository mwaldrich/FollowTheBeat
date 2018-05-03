
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

class SingleplayerGameOverState extends FlxState {

	private var beatsSurvived:Int;

	private var background:FlxSprite;

	private var textYouLost:FlxText;
	private var textBeatsSurvived:FlxText;

	private var restartButton:FlxButton;
	private var quitButton:FlxButton;

	public function new(beatsSurvived:Int) {
		super();

		this.beatsSurvived = beatsSurvived;
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

		restartButton = new FlxButton(0, 0, "Restart", restartSingleplayer);
		restartButton.x = (FlxG.width / 2) - restartButton.width;
		restartButton.y = FlxG.height - restartButton.height - 40;
		add(restartButton);
	}

	public override function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	public function restartSingleplayer():Void {
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(new SingleplayerState());
	}
}
