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

import io.followthebeat.core.objects.IHazard;
import io.followthebeat.core.objects.Piston;
import io.followthebeat.core.map.DirectionUtils;

class GamePiston extends AGameHazard {
	private var piston:Piston;
	private var pistonHead:GamePistonHeadSprite;
	private var pistonBody:GamePistonBodySprite;
	private var angle:Float;

	private var sprites:Array<AGameSprite>;

	public function new(piston:Piston) {
		super();

		this.piston = piston;

		this.angle = DirectionUtils.toAngle(piston.getDirection());

		this.pistonBody = new GamePistonBodySprite(
			piston.getLocation(),
			this.angle);
		this.pistonHead = new GamePistonHeadSprite(
			piston.getExtendedLocation(),
			this.angle);

		sprites = [pistonBody, pistonHead];
	}

	public override function beat(newBeat:Int):Void {
		if (this.piston.isExtended(newBeat)) {
			pistonBody.activate(newBeat);
			pistonHead.activate(newBeat);
		} else {
			pistonBody.deactivate(newBeat);
			pistonHead.deactivate(newBeat);
		}
	}

	public override function getHazard():IHazard {
		return this.piston;
	}

	public override function getPieces():Array<AGameSprite> {
		return sprites;
	}
}