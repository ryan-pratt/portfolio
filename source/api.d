module api;

import std.conv : to;
import std.file;
import std.json;
import std.stdio;
import vibe.vibe;

void resume(HTTPServerRequest req, HTTPServerResponse res)
{
    auto file = File("data\\resume.json", "r");
    string json = "";
    while (!file.eof()) {
        json ~= strip(file.readln());
    }
    JSONValue obj = parseJSON(json); // this makes sure the json is valid before it gets returned
	res.writeJsonBody(obj);
}