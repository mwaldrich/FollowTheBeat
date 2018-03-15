package;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.system.FlxSound;

class SingleplayerState extends FlxState implements Conductor {
	private var segments:List<GameMapSegment>;
	private var segmentsToRender:FlxTypedGroup<GameMapSegment>;
	private var currentBeat:Int;

	private var song:FlxSound;

	override public function create():Void {
		super.create();

		segments = new List<GameMapSegment>();
		segments.add(new GameMapSegment(Main.exampleSegment1, this));

		segmentsToRender = new FlxTypedGroup<GameMapSegment>();
		add(segmentsToRender);

		// TODO: don't do this
		segmentsToRender.add(segments.first());

		this.currentBeat = 0;

		song = new FlxSound();
		song.loadEmbedded(AssetPaths.song1__ogg);
		add(song);
		song.play();
	}

	override public function update(elapsed:Float):Void {
		var songProgress:Int = Std.int(song.time);

		//trace("songProgress: " + songProgress);

		// TODO: fix HTML5 unfocus music bug

		// Has the song ended?
		if (songProgress / Main.beatTime >= Main.songLength) {
			song.time = 0;
			this.currentBeat++;
			trace("restarted song");
		} else {
			var songBeat:Int = Std.int(songProgress / Main.beatTime);
			if (songBeat > (currentBeat % 32)) {
				trace("currentBeat: " + currentBeat);
				trace("new currentBeat: " + songBeat);
				this.currentBeat = (currentBeat - (currentBeat % 32))
					+ songBeat;
			}
		}

		super.update(elapsed);
	}

	public function getCurrentBeat():Int {
		return this.currentBeat;
	}
}
