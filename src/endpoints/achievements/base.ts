import { z } from "zod";

export const achievement = z.object({
	id: z.number().int(),
	title: z.string(),
	description: z.string().nullable(),
	year: z.string().nullable(),
	display_order: z.number().int(),
	created_at: z.string(),
});

export const AchievementModel = {
	tableName: "achievements",
	primaryKeys: ["id"],
	schema: achievement,
};
