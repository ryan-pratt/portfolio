module utilities;

import std.conv : to;
import std.string;

uint hashBlogFileName(string name)
{
    auto i = lastIndexOf(name, '\\');
    return name[++i..i+8].to!int;
}