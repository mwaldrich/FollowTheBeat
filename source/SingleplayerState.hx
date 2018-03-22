package;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.system.FlxSound;

import flixel.tile.FlxTilemap;

class SingleplayerState extends FlxState implements IConductor {
	private var segments:List<GameMapSegment>;
	private var segmentsToRender:FlxTypedGroup<GameMapSegment>;
	private var player:GamePlayer;

	private var currentBeat:Int;

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
		this.player = new GamePlayer(new Player(new Coordinate(1, 0), Direction.Up));
		for (sprite in player.getPieces()) {
			add(sprite);
		}

		this.currentBeat = 0;

		song = new FlxSound();
		song.loadEmbedded(AssetPaths.song3__ogg);
		add(song);
		song.play();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		var songProgress:Int = Std.int(song.time);

		//trace("songProgress: " + songProgress);

		// TODO: fix HTML5 unfocus music bug

		// Has the song ended?
		if (songProgress / Main.beatTime >= Main.songLength) {
			song.time = 0;
			this.currentBeat++;
			trace("restarted song");

			for (segment in segments) {
				segment.beat(this.currentBeat);
			}
		} else {
			var songBeat:Int = Std.int(songProgress / Main.beatTime);
			if (songBeat > (currentBeat % 32)) {
				trace("currentBeat: " + currentBeat);
				trace("new currentBeat: " + songBeat);
				this.currentBeat = (currentBeat - (currentBeat % 32))
					+ songBeat;

				for (segment in segments) {
					segment.beat(this.currentBeat);
				}

				updateCameraPosition();
			}
		}

		updateSegmentsToRender();

		// updateCameraPosition();
	}

	public function addMapSegment(mapSegment:GameMapSegment):Void {
		this.segments.add(mapSegment);
	}

	public function getCurrentBeat():Int {
		return this.currentBeat;
	}

	// Updates `segmentsToRender` to only include segments that
	// are visible on the screen.
	private function updateSegmentsToRender():Void {
		// Naive approach just to get things going
		segmentsToRender.clear();

		var currentSegmentOffset:Int = BeatUtils.segmentOffset(this.currentBeat);
		var previousSegmentOffset:Int = BeatUtils.segmentOffset(this.currentBeat) - Main.segmentHeight;
		var nextSegmentOffset:Int = BeatUtils.segmentOffset(this.currentBeat) + Main.segmentHeight;

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

		// trace("segmentsToRender.length = " + segmentsToRender.length);
	}

	private function updateCameraPosition():Void {
		FlxG.camera.setPosition(0, Main.tileScale * BeatUtils.minimumY(this.currentBeat));


		for (segment in segmentsToRender) {
			segment.updateBuffers();
		}
	}
}
