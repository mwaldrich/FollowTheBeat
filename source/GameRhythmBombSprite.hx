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

class GameRhythmBombSprite extends AGameSprite {
	public function new(coordinate:Coordinate) {
		super(coordinate);

		// Load rhythm bomb spritesheet
		loadGraphic(AssetPaths.bomb__png, true, 32, 32);

		// Set up animations
		animation.add("normal", [0], 1, false);
		animation.add("explode", [1, 2, 0], Main.animationFPS, false);

		animation.play("normal");
	}

	public override function activate(beat:Int):Void {
		animation.play("explode", true);
	}

	public override function deactivate(beat:Int):Void {
		animation.play("normal", true);
	}

}