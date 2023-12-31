package burst.frontend;

import haxe.xml.Access;
import sys.FileSystem;
import sys.io.File;

class Home
{
    public var root:Access;

    public var head:Access;
    public var hasHead(get, never):Bool;

    @:noCompletion
    function get_hasHead():Bool
        return head != null;

    public var body:Access;
    public var hasBody(get, never):Bool;

    @:noCompletion
    function get_hasBody():Bool
        return head != null;

    public function new(path:String)
    {
        read(path);

        #if debug
        for(element in body.elements)
        {
            switch(element.name)
            {
                case H1:
                    trace(element.innerData);

                case IMG:
                    trace(element.att.src + ", " + element.att.alt);
            }
        }
        #end
    }
    
    public function read(path:String):Void
    {
        var key = 'tools/${path}/index.html';
        if(!FileSystem.exists(key))
            throw 'Tool lacks a "home" file';

        var xml = Xml.parse(File.getContent(key));
        var data = new Access(xml);

        if(!data.hasNode.html)
            throw 'Home does not contain root "html" node';

        this.root = data.node.html;

        readHead();
        readBody();
    }

    function readHead():Void
    {
        if(!root.hasNode.head)
            throw 'Home does not contain a "head" node';

        this.head = root.node.head;
    }

    function readBody():Void
    {
        if(!root.hasNode.body)
            throw 'Home does not contain a "body" node';

        this.body = root.node.body;
    }
}

/**
 * Used for comparing at render time to reduce String build-up
 */
@:enum abstract ElementType(String) to String
{
    var HEAD = "head";
    
    var DIV = "div";
    var SPAN = "span";

    /*
     * Bold title text
     */
    var H1 = "h1"; // 2.00em
    var H2 = "h2"; // 1.50em
    var H3 = "h3"; // 1.17em
    var H4 = "h4"; // 1.00em
    var H5 = "h5"; // 0.83em
    var H6 = "h6"; // 0.67em

    var P = "p";

    var IMG = "img";
}