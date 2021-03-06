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
import io.followthebeat.core.objects.RhythmBomb;

class GameRhythmBomb extends AGameHazard {
	
	private var rhythmBomb:RhythmBomb;
	private var rhythmBombSprite:GameRhythmBombSprite;

	public function new(rhythmBomb:RhythmBomb) {
		super();

		this.rhythmBomb = rhythmBomb;
		this.rhythmBombSprite = new GameRhythmBombSprite(rhythmBomb.getLocation());
	}

	public override function getHazard():IHazard {
		return this.rhythmBomb;
	}

	public override function beat(newBeat:Int):Void {
		if (this.rhythmBomb.isExploding(newBeat)) {
			rhythmBombSprite.activate(newBeat);
		} else {
			rhythmBombSprite.deactivate(newBeat);
		}
	}

	public override function getPieces():Array<AGameSprite> {
		return [rhythmBombSprite];
	}
}