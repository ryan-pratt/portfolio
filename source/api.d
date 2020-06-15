module api;

import std.algorithm;
import std.array;
import std.file;
import std.json;
import std.math;
import std.path;
import vibe.vibe;
import utilities;

void resume(HTTPServerRequest req, HTTPServerResponse res)
{
    string json = readWholeFile("data\\resume.json");
    JSONValue obj = parseJSON(json); // this makes sure the json is valid before it gets returned
	res.writeJsonBody(obj);
}

void blogPosts(HTTPServerRequest req, HTTPServerResponse res)
{
    auto entries = dirEntries("data\\blogs", SpanMode.shallow)
        .map!(e => e.name)
        .array;

    // only get the 10 most recent posts
    auto toShow = entries.schwartzSort!(hashBlogFileName, "a > b")[0..min(entries.length, 10)];

    JSONValue[] response = [];
    foreach (string entry; toShow)
    {
        string json = readWholeFile(entry);
        auto obj = parseJSON(json);

        // only get the first paragraph
        string firstParagraph = obj["paragraphs"].array[0].str;
        obj["paragraphs"].array = [JSONValue(firstParagraph)];

        response ~= obj;
    }

    res.writeJsonBody(response);
}

// void blogPost(HTTPServerRequest req, HTTPServerResponse res)
// {
//     auto id = req.params["id"];
// }
