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

// Base game object class (something that responds to rhythm and can render).
//
// This class really should be abstract (Java style), but Haxe does not support
// abstract classes in this sense. Therefore, subclasses must override:
//
// - AGameObject.beat():Void
// - AGameObject.getPieces():Array<AGameSprite>
//
// The constructor for this class is private. This was done intentionally
// to prevent instantiation by classes other than subclasses (this is how
// "private" visibility works in Haxe
// [https://haxe.org/manual/class-field-visibility.html]).
class AGameObject {
	private var lastBeatActivated:Int;

	private function new() {
		this.lastBeatActivated = -1;
	}

	// This is called when a new beat occurs.
	// This should be overriden in subclasses.
	public function beat(newBeat:Int):Void {
		throw "AGameHazard's implementation of beat() was called!"
			+ "\nThis should be overriden by subclasses.";
	}

	public function getPieces():Array<AGameSprite> {
		throw "AGameHazard's implementation of getPieces() was called!"
			+ "\nThis should be overriden by subclasses.";
	}
}