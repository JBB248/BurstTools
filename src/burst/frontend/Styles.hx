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
        var key = 'tools/${path}/styles.json';
        if(!FileSystem.exists(key))
            throw 'Tool lacks a "styles" file';

        styleData = Json.parse(File.getContent(key));
    }
}