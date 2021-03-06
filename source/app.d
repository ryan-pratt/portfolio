import vibe.vibe;
import pages;
import api;

void main()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto staticFileSettings = new HTTPFileServerSettings;
	staticFileSettings.serverPathPrefix = "/public/";

	auto router = (new URLRouter)
		.get("/", &index)
		.get("/blog", &blogs)
		// .get("/blog/:id", &blog)
		.get("/work", &work)
		.get("/about", &about)
		.get("/api/resume", &resume)
		.get("/api/blogs", &blogPosts)
		// .get("/api/blog/:id", &blogPost)
		.get("*", serveStaticFiles("public/", staticFileSettings));

	listenHTTP(settings, router);

	runApplication();
}
