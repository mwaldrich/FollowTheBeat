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

class GamePistonHeadSprite extends AGameSprite {
	private var pixelX:Float;
	private var pixelY:Float;

	public function new(coordinate:Coordinate, angle:Float) {
		super(coordinate);

		this.pixelX = this.x;
		this.pixelY = this.y;

		this.angle = angle;

		loadGraphic(AssetPaths.piston__png, true, 32, 32);

		// Set up animations
		this.animation.add("head_fire", [2, 4, 2, 5], Main.animationFPS, false);

		this.kill();
	}

	public override function activate(beat:Int):Void {
		this.reset(this.pixelX, this.pixelY);
		this.animation.play("head_fire");
	}

	public override function deactivate(beat:Int):Void {
		this.kill();
	}
}