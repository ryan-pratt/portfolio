module utilities;

import std.conv : to;
import std.file;
import std.stdio;
import std.string;

uint hashBlogFileName(string name)
{
    auto i = lastIndexOf(name, '\\');
    return name[++i..i+8].to!int;
}

string readWholeFile(string filePath)
{
    auto file = File(filePath, "r");
    string lines = "";
    while (!file.eof()) {
        lines ~= strip(file.readln());
    }
    return lines;
}
