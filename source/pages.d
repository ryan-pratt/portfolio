module pages;

import vibe.vibe;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "index";
	res.render!("pages/index.dt", req, navKey);
}

void work(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "work";
	res.render!("pages/work.dt", req, navKey);
}

void info(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "info";
	res.render!("pages/info.dt", req, navKey);
}

void blog(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "blog";
	res.render!("pages/blog.dt", req, navKey);
}