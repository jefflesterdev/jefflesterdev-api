import { fromHono } from "chanfana";
import { Hono } from "hono";
import { AchievementList } from "./achievementList";

export const achievementsRouter = fromHono(new Hono());

achievementsRouter.get("/", AchievementList);
