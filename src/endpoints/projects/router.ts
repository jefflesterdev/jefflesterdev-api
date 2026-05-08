import { fromHono } from "chanfana";
import { Hono } from "hono";
import { ProjectList } from "./projectList";
import { ProjectRead } from "./projectRead";

export const projectsRouter = fromHono(new Hono());

projectsRouter.get("/", ProjectList);
projectsRouter.get("/:id", ProjectRead);
