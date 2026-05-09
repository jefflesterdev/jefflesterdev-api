import { z } from "zod";

export const achievement = z.object({
	id: z.number().int(),
	title: z.string(),
	description: z.string().nullable(),
	company: z.string(),
	start_date: z.string(),
	end_date: z.string().nullable(),
});
