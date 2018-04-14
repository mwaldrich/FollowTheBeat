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

package io.followthebeat.game.objects;

import io.followthebeat.core.map.Coordinate;

class GamePlayerSprite extends AGameSprite {
	public function new(coordinate:Coordinate, angle:Float) {
		super(coordinate);

		this.angle = angle;

		// Load player spritesheet
		loadGraphic(AssetPaths.character__png, true, 32, 32);

		// Set up animations
		this.animation.add("normal", [0], 1, false);
		this.animation.add("walk", [0, 2], Std.int(Main.animationFPS / 3), true);

		this.animation.play("walk");
	}

	public function move(coordinate:Coordinate, beat:Int):Void {
		this.setLocation(coordinate);
	}

	public override function activate(beat:Int):Void {

	}

	public override function deactivate(beat:Int):Void {
		
	}
}