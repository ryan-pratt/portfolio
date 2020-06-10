import vibe.vibe;

void main()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto staticFileSettings = new HTTPFileServerSettings;
	staticFileSettings.serverPathPrefix = "/public/";

	auto router = new URLRouter;
	router
		.get("/", &index)
		.get("*", serveStaticFiles("public/", staticFileSettings));

	listenHTTP(settings, router);

	runApplication();
}

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	res.render!("pages/index.dt", req);
}
