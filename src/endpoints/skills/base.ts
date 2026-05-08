import { z } from "zod";

export const skill = z.object({
	id: z.number().int(),
	skill_group_id: z.number().int(),
	name: z.string(),
	proficiency: z.enum(["familiar", "proficient", "expert"]).nullable(),
	display_order: z.number().int(),
});

export const skillGroup = z.object({
	id: z.number().int(),
	name: z.string(),
	display_order: z.number().int(),
	skills: z.array(skill),
});
