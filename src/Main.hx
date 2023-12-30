package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		
		addChild(new FlxGame(PlayState, true));

		FlxG.autoPause = false;
		FlxG.cameras.bgColor = 0xFFFFFFFF;
	}
}
