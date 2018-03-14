package;

import flixel.FlxState;

class SingleplayerState extends FlxState {
	private var segments:List<GameMapSegment>;

	override public function create():Void {
		super.create();

		segments = new List<GameMapSegment>();
		segments.add(new GameMapSegment(Main.exampleSegment1));
	}
}