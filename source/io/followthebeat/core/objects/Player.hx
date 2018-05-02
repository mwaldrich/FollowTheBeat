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

package io.followthebeat.core.objects;

import io.followthebeat.core.map.Coordinate;
import io.followthebeat.core.map.Direction;
import io.followthebeat.core.map.PlayerDirection;
import io.followthebeat.core.map.PlayerDirectionUtils;
import io.followthebeat.core.map.MapSegment;

// Represents an abstract Player
class Player {
	// TODO: don't do this (make this private)
	public var location:Coordinate;
	private var direction:Direction;

	public function new(location:Coordinate, ?direction:Direction = null) {
		this.location = location;

		// Apparently Haxe doesn't consider enums to be constant values
		// so I have to default it to null.
		if (direction != null) {
			this.direction = direction;
		} else {
			this.direction = Direction.Up;
		}
	}

	public function getLocation():Coordinate {
		return this.location;
	}

	public function getDirection():Direction {
		return this.direction;
	}

	public function isBeingHurt(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isDamaging(this.location, beat);
	}

	public function isWithinBounds(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location, beat);
	}

	public function isAtTopOfSegment(mapSegment:MapSegment):Bool {
		return mapSegment.isAtTop(this.location);
	}

	public function newMovedPlayer(direction:Direction):Player {
		return new Player(location.manipulate(direction));
	}

	public function move(playerDirection:PlayerDirection):Player {
		return new Player(this.location.manipulatePlayer(playerDirection), direction);
	}

	// Returns a new Player that is moved up
	public function moveUp():Player {
		return new Player(this.location.manipulate(Direction.Up), Direction.Up);
	}

	// Returns a new Player that is moved left
	public function moveLeft():Player {
		return new Player(this.location.manipulate(Direction.Left), Direction.Left);
	}

	// Returns a new Player that is moved right
	public function moveRight():Player {
		return new Player(this.location.manipulate(Direction.Right), Direction.Right);
	}

	public function canMove(playerDirection:PlayerDirection, mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location.manipulatePlayer(playerDirection), beat);
	}

	// Can this player move up?
	public function canMoveUp(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Up), beat);
	}

	// Can this player move left?
	public function canMoveLeft(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Left), beat);

	}

	// Can this player move right?
	public function canMoveRight(mapSegment:MapSegment, beat:Int):Bool {
		return mapSegment.isWithinBounds(this.location.manipulate(Direction.Right), beat);
	}
}