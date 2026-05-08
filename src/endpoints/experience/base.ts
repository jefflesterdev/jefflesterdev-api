import { z } from "zod";

export const experienceItem = z.object({
	id: z.number().int(),
	experience_id: z.number().int(),
	type: z.enum(["responsibility", "achievement"]),
	content: z.string(),
	is_pinned: z.boolean(),
	pin_order: z.number().int().nullable(),
	display_order: z.number().int(),
	created_at: z.string(),
});

export const experience = z.object({
	id: z.number().int(),
	company: z.string(),
	title: z.string(),
	location: z.string().nullable(),
	employment_type: z.enum(["permanent", "contract", "casual", "volunteer"]).nullable(),
	start_date: z.string(),
	end_date: z.string().nullable(),
	summary: z.string().nullable(),
	display_order: z.number().int(),
	created_at: z.string(),
	items: z.array(experienceItem),
});

// Raw shapes from D1 before serialization
export type RawExperience = {
	id: number;
	company: string;
	title: string;
	location: string | null;
	employment_type: string | null;
	start_date: string;
	end_date: string | null;
	summary: string | null;
	display_order: number;
	created_at: string;
};

export type RawExperienceItem = {
	id: number;
	experience_id: number;
	type: string;
	content: string;
	is_pinned: number;
	pin_order: number | null;
	display_order: number;
	created_at: string;
};
