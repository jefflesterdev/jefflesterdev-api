import { fromHono } from "chanfana";
import { Hono } from "hono";
import { ExperienceList } from "./experienceList";
import { ExperienceRead } from "./experienceRead";

export const experienceRouter = fromHono(new Hono());

experienceRouter.get("/", ExperienceList);
experienceRouter.get("/:id", ExperienceRead);
