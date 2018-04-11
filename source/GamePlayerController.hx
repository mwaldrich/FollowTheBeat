package;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class GamePlayerController {

	private var playerNumber:Int;
	private var player:IControllablePlayer;
	private var conductor:IConductor;

	private var lastBeatMoved:Int;

	private static var keyboardControls:Map<Array<FlxKey>, PlayerDirection>;
	// APPARENTLY THIS DOESN'T WORK ON JS TARGET????
	/*= [
		[UP, W]    => PlayerDirection.Up,
		[LEFT, A]  => PlayerDirection.Left,
		[RIGHT, D] => PlayerDirection.Right
		];*/

	public function new(playerNumber:Int, player:IControllablePlayer, conductor:IConductor) {
		GamePlayerController.keyboardControls = new Map<Array<FlxKey>, PlayerDirection>();
		GamePlayerController.keyboardControls.set([UP, W], PlayerDirection.Up);
		GamePlayerController.keyboardControls.set([LEFT, A], PlayerDirection.Left);
		GamePlayerController.keyboardControls.set([RIGHT, D], PlayerDirection.Right);
		this.playerNumber = playerNumber;
		this.player = player;
		this.conductor = conductor;

		// Prevents the player from moving on the first beat,
		// which is intended
		this.lastBeatMoved = 0;
	}

	// Updates this `GamePlayerController` and moves the player
	// appropriately.
	public function update():Void {
		var beatProgress:Float = conductor.getBeatProgress();

		// If we were to process input at this time, what beat
		// would we move on?
		var moveBeat:Int =
			GamePlayerController.getMoveBeat(
				conductor.getBeat(), beatProgress);

		if (this.shouldProcessInput(moveBeat, beatProgress)) {
			this.processInput(moveBeat);
		}
	}

	// Should we be processing input right now? Essentially,
	// is the current beat progress within the rhythm tolerance?
	private function shouldProcessInput(moveBeat:Int, beatProgress:Float):Bool {
		return (moveBeat > this.lastBeatMoved)
			&& GamePlayerController.isWithinTolerance(beatProgress,
				Main.tolerance);
	}

	// Process the given input and move the player accordingly.
	// Will modify `this.lastBeatMoved` if we actually move.
	private function processInput(newBeat:Int):Void {

		for (control in keyboardControls.keys()) {
			if (FlxG.keys.anyJustPressed(control)) {
				trace("moving player!");

				this.lastBeatMoved = newBeat;
				this.player.move(keyboardControls[control], newBeat);
				break;
			}
		}
	}

	// Is the given progress within the given tolerance?
	// The result is true if
	//
	//     (progress % (1 - tolerance/2)) <= (tolerance / 2).
	//
	// To see why this is, let's look at what it means to
	// be in a tolerance:
	// 
	// tolerance/2                 tolerance/2
	// |---|                             |---|
	// [-------------------------------------]
	// 0              progress               1
	// 
	// For this progress to be within a tolerance, it must be within
	// the zones on the top row. If we mod progress by
	// (1 - tolerance/2), we get
	// 
	// tolerance/2
	// |---|
	// [-------------------------------------]
	// 0              progress   (1 - tolerance/2)
	// 
	// where the first and only region captured represents both
	// the high and the low regions from the first diagram.
	private static function isWithinTolerance(progress:Float, tolerance:Float):Bool {
		return (progress % (1 - (tolerance / 2)))
			<= (tolerance / 2);
	}

	// If we were to move right now, what beat would this move be
	// associated with?
	private static function getMoveBeat(currentBeat:Int, progress:Float):Int {
		if (GamePlayerController.isEarlyHit(progress)) {
			return currentBeat + 1;
		} else {
			return currentBeat;
		}
	}

	// If we are processing input at the given progress, is this
	// input early (before the beat actually happened) or late
	// (after the beat actually happened).
    private static function isEarlyHit(progress:Float):Bool {
		return progress >= 0.5;
	}
}