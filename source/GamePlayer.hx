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

class GamePlayer extends AGameObject implements IControllablePlayer {

	private var player:Player;
	private var continuousMap:IContinuousMap;

	private var playerController:GamePlayerController;

	private var playerSprite:GamePlayerSprite;
	private var angle:Float;

	private var sprites:Array<AGameSprite>;

	public function new(player:Player, continuousMap:IContinuousMap) {
		super();

		this.player = player;
		this.continuousMap = continuousMap;

		this.angle = DirectionUtils.toAngle(player.getDirection());

		this.playerSprite = new GamePlayerSprite(
			player.getLocation(),
			this.angle);

		sprites = [playerSprite];
	}

	public override function beat(newBeat:Int):Void {

	}

	public override function getPieces():Array<AGameSprite> {
		return sprites;
	}

	// Moves player
	public function move(direction:PlayerDirection, newBeat:Int):Void {
		var mapSegment:MapSegment = continuousMap.getMapSegment(player.getLocation());

		if (this.player.canMove(direction, mapSegment, newBeat)) {
			this.player = this.player.move(direction);
			this.playerSprite.move(this.player.getLocation(), newBeat);
		}
	}
}