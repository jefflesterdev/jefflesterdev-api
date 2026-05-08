import { fromHono } from "chanfana";
import { Hono } from "hono";
import { ProfileRead } from "./profileRead";

export const profileRouter = fromHono(new Hono());

profileRouter.get("/", ProfileRead);
