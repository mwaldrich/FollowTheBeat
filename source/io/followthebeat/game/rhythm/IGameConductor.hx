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

package io.followthebeat.game.rhythm;

// Represents an object that is keeping a beat.
interface IGameConductor {
	// What is the progress of going through the current beat?
	// Should return a float between 0 and 1 (inclusive, exclusive),
	// with 0 representing the beat just starting and 0.999...
	// representing the beat just ending.
	public function getBeatProgress():Float;

	// What is the current beat of the game?
	public function getBeat():Int;
}