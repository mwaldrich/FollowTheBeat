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

package;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;

class SingleplayerState extends FlxState implements IContinuousMap implements IConductor {
	private var segments:List<GameMapSegment>;
	private var segmentsToRender:FlxTypedGroup<GameMapSegment>;
	private var player:GamePlayer;
	private var playerController:GamePlayerController;

	private var currentBeat:Int;
	private var beatProgress:Float;

	private var song:FlxSound;

	override public function create():Void {
		super.create();

		segments = new List<GameMapSegment>();

		// TODO: don't do this
		segments.add(new GameMapSegment(Main.exampleSegment1));
		segments.add(new GameMapSegment(Main.exampleSegment2));

		segmentsToRender = new FlxTypedGroup<GameMapSegment>();
		add(segmentsToRender);

		// TODO: don't do this either
		this.player = new GamePlayer(new Player(new Coordinate(1, 0), Direction.Up), this);
		this.playerController = new GamePlayerController(1, this.player, this);
		for (sprite in player.getPieces()) {
			add(sprite);
		}

		this.currentBeat = 0;
		this.beatProgress = 0.0;

		// Initially update the segments to render and adjust
		// the initial camera position
		updateSegmentsToRender();
		updateCameraPosition();

		FlxG.camera.setSize(Main.tileScale * 3, Main.tileScale * 4);
		FlxG.camera.setPosition(0, Main.tileScale / 3);

		song = new FlxSound();
		song.loadEmbedded(AssetPaths.song3__ogg);
		add(song);
		song.play();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		playerController.update();

		this.updateBeatProgress();
	}

	public function getBeatProgress():Float {
		return this.beatProgress;
	}

	public function getBeat():Int {
		return this.currentBeat;
	}

	public function getMapSegment(coordinate:Coordinate):MapSegment {
		var segmentOffset:Int = BeatUtils.segmentOffsetFromCoordinate(coordinate);

		for (gameSegment in segments) {
			var segment:MapSegment = gameSegment.getMapSegment();

			if (segment.getOffset() == segmentOffset) {
				return segment;
			}
		}

		return null;
	}

	public function addMapSegment(mapSegment:GameMapSegment):Void {
		this.segments.add(mapSegment);
	}

	// Updates `segmentsToRender` to only include segments that
	// are visible on the screen.
	private function updateSegmentsToRender():Void {
		// Naive approach just to get things going
		segmentsToRender.clear();

		var currentSegmentOffset:Int =
			BeatUtils.segmentOffset(this.currentBeat);
		var previousSegmentOffset:Int =
			BeatUtils.segmentOffset(this.currentBeat) - Main.segmentHeight;
		var nextSegmentOffset:Int =
			BeatUtils.segmentOffset(this.currentBeat) + Main.segmentHeight;

		for (segment in segments) {
			// Also naive, just render the current segment, plus the one
			// above and below it
			var segmentOffset:Int = segment.getMapSegment().offsetY;

			if (segmentOffset == currentSegmentOffset
			|| segmentOffset == previousSegmentOffset
			|| segmentOffset == nextSegmentOffset) {
				segmentsToRender.add(segment);
			}
		}
	}

	// Updates the progress for this beat, restarts music if
	// necessary, and processes a new beat if necessary. Updates
	// `this.currentBeatProgress`.
	private function updateBeatProgress():Void {
		// Get song progress in ms
		var songProgress:Int = Std.int(song.time);

		// Update the current beatProgress
		this.beatProgress = (songProgress / Main.beatTime) % 1;

		// TODO: fix HTML5 unfocus music bug

		// Has the song ended?
		if (songProgress / Main.beatTime >= Main.songLength) {
			song.time = 0;
			this.currentBeat++;
			trace("restarted song");

			this.processNewBeat();
		} else {
			var songBeat:Int = Std.int(songProgress / Main.beatTime);
			if (songBeat > (currentBeat % 32)) {
				trace("currentBeat: " + currentBeat);
				trace("new currentBeat: " + songBeat);
				this.currentBeat = (currentBeat - (currentBeat % 32))
					+ songBeat;

				this.processNewBeat();
			}
		}
	}

	// Processes a beat for the entire game
	private function processNewBeat():Void {
		// Process the beat in all segments
		for (segment in segments) {
			segment.beat(this.currentBeat);
		}

		// Process the beat for the player
		player.beat(this.currentBeat);

		updateSegmentsToRender();
		updateCameraPosition();
	}

	private function updateCameraPosition():Void {
		// TODO: document the coordinate system in the readme
		// and the source code:
		// y starts at 0 for beat 0, then grows NEGATIVELY
		// in Main.tileScale increments.

		FlxG.camera.focusOn(new FlxPoint(Main.tileScale * 1.5, -Main.tileScale * (BeatUtils.minimumY(this.currentBeat) + 2)));


		for (segment in segmentsToRender) {
			segment.updateBuffers();
		}
	}
}
