package burst.ui;

import burst.frontend.Home;
import burst.frontend.Styles;

class Application extends flixel.group.FlxSpriteGroup
{
    public var home:Home;
    public var styles:Styles;

    public function new(path:String)
    {
        super();

		home = new Home(path);
		styles = new Styles(path);
    }
}