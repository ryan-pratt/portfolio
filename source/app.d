import vibe.vibe;
import pages;

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
