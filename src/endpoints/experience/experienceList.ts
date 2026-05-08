import { contentJson, OpenAPIRoute } from "chanfana";
import { z } from "zod";
import { AppContext } from "../../types";
import { experience, RawExperience, RawExperienceItem } from "./base";

export class ExperienceList extends OpenAPIRoute {
	schema = {
		tags: ["Experience"],
		summary: "Get all experience roles with their items",
		responses: {
			"200": {
				description: "Returns all experience roles with nested items",
				...contentJson({
					success: z.boolean(),
					result: z.array(experience),
				}),
			},
		},
	};

	async handle(c: AppContext) {
		const db = c.env.DB;

		const [expResult, itemsResult] = await db.batch([
			db.prepare("SELECT * FROM experience ORDER BY display_order ASC"),
			db.prepare("SELECT * FROM experience_items ORDER BY display_order ASC"),
		]);

		const experiences = expResult.results as RawExperience[];
		const items = itemsResult.results as RawExperienceItem[];

		return {
			success: true,
			result: experiences.map(exp => ({
				...exp,
				items: items
					.filter(item => item.experience_id === exp.id)
					.map(item => ({ ...item, is_pinned: Boolean(item.is_pinned) })),
			})),
		};
	}
}
