package;

// Represents a player that can be controlled
interface IControllablePlayer {
	public function move(direction:PlayerDirection, newBeat:Int):Void;
}