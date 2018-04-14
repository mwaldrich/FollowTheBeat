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

class GamePistonBodySprite extends AGameSprite {
	public function new(coordinate:Coordinate, angle:Float) {
		super(coordinate);

		this.angle = angle;

		loadGraphic(AssetPaths.piston__png, true, 32, 32);

		// Set up animations
		this.animation.add("base_normal", [0], 1, false);
		this.animation.add("base_extend", [1, 1, 1, 0], Main.animationFPS, false);

		this.animation.play("base_normal");
	}

	public override function activate(beat:Int):Void {
		this.animation.play("base_extend", true);
	}

	public override function deactivate(beat:Int):Void {
		this.animation.play("base_normal", true);
	}
}
