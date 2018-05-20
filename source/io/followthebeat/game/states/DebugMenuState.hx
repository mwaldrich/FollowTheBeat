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
import flixel.system.FlxAssets;

import io.followthebeat.game.ui.ScaledFlxButton;

class DebugMenuState extends FlxState {
	// UI objects
	private var debugMenuTitle:FlxText;
	private var debugConfig:FlxText;
	private var playButton:ScaledFlxButton;

	// Game settings
	private var difficultyOffset:Int;
	private var song:Int;
	private var tileset:Int;
	
	public override function create():Void {
		// Set default game settings
		difficultyOffset = Main.defaultSingleplayerDifficultyOffset;
		song = 1;
		tileset = 1;

	    debugMenuTitle = new FlxText(0, (1 * FlxG.height / 4) - FlxG.height / 8 - FlxG.height / 16, 0, "Debug Menu", 12);
		debugMenuTitle.color = FlxColor.RED;
		debugMenuTitle.screenCenter(FlxAxes.X);
		add(debugMenuTitle);

		debugConfig = new FlxText(0, (1.25 * FlxG.height / 4) - FlxG.height / 8 - FlxG.height / 16, 0, "", 12);
		updateDebugConfigText();
		add(debugConfig);

		// Tileset selectors
		for (n in 1...8) {
			add(new ScaledFlxButton(
				0,
				(1 * FlxG.height / 4) + (n * 40),
			    FlxG.width / 4,
			    30,
			    "tileset: " + n,
			    12,
			    function() {
					tileset = n;
					updateDebugConfigText();
				}));
		}

		// Song selectors
		for (n in 0...6) {
			add(new ScaledFlxButton(
				FlxG.width / 2 - FlxG.width / 8,
				(1 * FlxG.height / 4) + (n * 40),
			    FlxG.width / 4,
			    30,
			    "song" + n,
			    12,
			    function() {
					song = n;
					updateDebugConfigText();
				}));
		}

		// Difficulty offset selectors
		for (n in 0...6) {
			add(new ScaledFlxButton(
				3 * FlxG.width / 4,
				(1 * FlxG.height / 4) + (n * 40),
			    FlxG.width / 4,
			    30,
			    "offset: " + n,
			    12,
			    function() {
					difficultyOffset = n;
					updateDebugConfigText();
				}));
		}

		playButton = new ScaledFlxButton(FlxG.width / 2, FlxG.height * 3 / 4 + FlxG.height / 16, FlxG.width / 2, FlxG.height / 8, "Play", Std.int(FlxG.height / 20), playSingleplayer);
		add(playButton);
	}

	private function updateDebugConfigText():Void {
		debugConfig.text = "Difficulty offset: " + difficultyOffset + "\nSong: " + song + "\nTileset: " + tileset;
	}

	private function playSingleplayer():Void {
		// Get real song asset from songName
		var songAsset:FlxSoundAsset =
			switch (song) {
				case 1: AssetPaths.song1__ogg;
				case 2: AssetPaths.song2__ogg;
				case 3: AssetPaths.song3__ogg;
				case 4: AssetPaths.song4__ogg;
				case 5: AssetPaths.song5__ogg;
				case 6: AssetPaths.song6__ogg;
				default: AssetPaths.song1__ogg; // <-- no
			};

		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		FlxG.switchState(new SingleplayerState(difficultyOffset, songAsset, tileset));
	}
}
