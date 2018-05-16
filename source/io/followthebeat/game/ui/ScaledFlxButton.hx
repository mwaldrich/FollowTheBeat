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

package io.followthebeat.game.ui;

import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class ScaledFlxButton extends FlxSpriteGroup {
	public function new(x:Float, y:Float, width:Float, height:Float, text:String, fontSize:Int, onClick:Void->Void) {
		super();
		var button:FlxButton = new FlxButton(0, 0, onClick);
		var oldWidth:Float = button.width;
		var oldHeight:Float = button.height;
		button.scale.set(width / oldWidth, height / oldHeight);
		button.x = x;
		button.y = y;
		button.updateHitbox();
		var labelHeight:Float = fontSize + 20;
		var labelY:Float = y + height / 2 - labelHeight / 2;
		var label:FlxText = new FlxText(0, labelY, width, text, fontSize);
		label.alignment = FlxTextAlign.CENTER;
		add(button);
		add(label);
	}
}
