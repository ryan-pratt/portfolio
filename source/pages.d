module pages;

import vibe.vibe;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "index";
	res.render!("pages/index.dt", req, navKey);
}

void blog(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "blog";
	res.render!("pages/blog.dt", req, navKey);
}

void work(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "work";
	res.render!("pages/work.dt", req, navKey);
}

void about(HTTPServerRequest req, HTTPServerResponse res)
{
	const string navKey = "about";
	res.render!("pages/about.dt", req, navKey);
}
