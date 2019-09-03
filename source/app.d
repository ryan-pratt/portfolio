import vibe.vibe;

void main()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto router = new URLRouter;
	router.get("/", &index);

	listenHTTP(settings, router);

	runApplication();
}

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	res.writeBody("Hello, World!");
}
