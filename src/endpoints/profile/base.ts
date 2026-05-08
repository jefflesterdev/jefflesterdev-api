import { z } from "zod";

export const profile = z.object({
	id: z.number().int(),
	name: z.string(),
	tagline: z.string().nullable(),
	bio: z.string().nullable(),
	email: z.string().nullable(),
	linkedin_url: z.string().nullable(),
	github_url: z.string().nullable(),
	location: z.string().nullable(),
	available: z.boolean(),
	photo_url: z.string().nullable(),
	updated_at: z.string(),
});
