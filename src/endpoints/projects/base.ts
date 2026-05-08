import { z } from "zod";

// Raw shape from D1 — tech_stack is a JSON string, is_featured is 0/1
const projectRaw = z.object({
	id: z.number().int(),
	name: z.string(),
	description: z.string().nullable(),
	tech_stack: z.string().nullable(),
	github_url: z.string().nullable(),
	live_url: z.string().nullable(),
	is_featured: z.number().int(),
	display_order: z.number().int(),
	start_date: z.string().nullable(),
	end_date: z.string().nullable(),
	created_at: z.string(),
});

// Serialized shape returned by the API
export const project = z.object({
	id: z.number().int(),
	name: z.string(),
	description: z.string().nullable(),
	tech_stack: z.array(z.string()).nullable(),
	github_url: z.string().nullable(),
	live_url: z.string().nullable(),
	is_featured: z.boolean(),
	display_order: z.number().int(),
	start_date: z.string().nullable(),
	end_date: z.string().nullable(),
	created_at: z.string(),
});

export const ProjectModel = {
	tableName: "projects",
	primaryKeys: ["id"],
	schema: projectRaw,
	serializer: (obj: object) => {
		const row = obj as Record<string, unknown>;
		return {
			...row,
			is_featured: Boolean(row.is_featured),
			tech_stack: row.tech_stack ? JSON.parse(row.tech_stack as string) : null,
		};
	},
	serializerObject: project,
};
