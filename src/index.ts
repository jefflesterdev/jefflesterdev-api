import { ApiException, fromHono } from "chanfana";
import { Hono } from "hono";
import { cors } from "hono/cors";
import { profileRouter } from "./endpoints/profile/router";
import { achievementsRouter } from "./endpoints/achievements/router";
import { projectsRouter } from "./endpoints/projects/router";
import { skillsRouter } from "./endpoints/skills/router";
import { experienceRouter } from "./endpoints/experience/router";
import { ContentfulStatusCode } from "hono/utils/http-status";

// Start a Hono app
const app = new Hono<{ Bindings: Env }>();

app.use("*", cors({
	origin: "*",
	allowMethods: ["GET", "OPTIONS"],
	allowHeaders: ["Content-Type"],
}));

app.onError((err, c) => {
	if (err instanceof ApiException) {
		// If it's a Chanfana ApiException, let Chanfana handle the response
		return c.json(
			{ success: false, errors: err.buildResponse() },
			err.status as ContentfulStatusCode,
		);
	}

	console.error("Global error handler caught:", err); // Log the error if it's not known

	// For other errors, return a generic 500 response
	return c.json(
		{
			success: false,
			errors: [{ code: 7000, message: "Internal Server Error" }],
		},
		500,
	);
});

// Setup OpenAPI registry
const openapi = fromHono(app, {
	docs_url: "/",
	schema: {
		info: {
			title: "Jeff Lester — Resume API",
			version: "1.0.0",
			description: "Public API powering jefflester.dev.",
		},
	},
});

openapi.route("/profile", profileRouter);
openapi.route("/achievements", achievementsRouter);
openapi.route("/projects", projectsRouter);
openapi.route("/skills", skillsRouter);
openapi.route("/experience", experienceRouter);

// Export the Hono app
export default app;
