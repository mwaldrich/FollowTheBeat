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

import flixel.FlxSprite;

import io.followthebeat.core.objects.IHazard;

// Base game hazard class
//
// This class really should be abstract (Java style), but Haxe does not support
// abstract classes in this sense. Therefore, subclasses must override:
//
// - AGameHazard.getHazard():IHazard
// - AGameHazard.beat():Void
// - AGameHazard.getPieces():Array<AGameSprite>
//
// The constructor for this class is private. This was done intentionally
// to prevent instantiation by classes other than subclasses (this is how
// "private" visibility works in Haxe
// [https://haxe.org/manual/class-field-visibility.html]).
class AGameHazard extends AGameObject {

	private function new() {
		super();
	}

	// Get the Hazard associated with this AGameHazard.
	// This should be overriden in subclasses.
	public function getHazard():IHazard {
		throw "AGameHazard's implementation of getHazard() was called!"
			+ "\nThis should be overriden by subclasses.";
	}
}