import vibe.vibe;

void main()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto staticFileSettings = new HTTPFileServerSettings;
	staticFileSettings.serverPathPrefix = "/public/";

	auto router = (new URLRouter)
		.get("/", &index)
		.get("/blog", &blog)
		.get("/work", &work)
		.get("/info", &info)
		.get("*", serveStaticFiles("public/", staticFileSettings));

	listenHTTP(settings, router);

	runApplication();
}

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
