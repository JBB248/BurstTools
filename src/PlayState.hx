package;

import burst.ui.Application;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		#if debug
		add(new Application("debug"));
		#end
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
