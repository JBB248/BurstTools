package burst.frontend;

import haxe.DynamicAccess;
import haxe.Json;
import sys.FileSystem;
import sys.io.File;

class Styles
{
    public var styleData:DynamicAccess<String>;

    public function new(path:String)
    {
        read(path);
    }

    function read(path:String):Void
    {
        var key = 'tools/${path}/styles.css';
        if(!FileSystem.exists(key))
            throw 'Tool lacks a "styles" file';

        // to-do: implement css-parsing
        // styleData = Json.parse(File.getContent(key));
    }
}