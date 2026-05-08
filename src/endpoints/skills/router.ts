import { fromHono } from "chanfana";
import { Hono } from "hono";
import { SkillList } from "./skillList";

export const skillsRouter = fromHono(new Hono());

skillsRouter.get("/", SkillList);
