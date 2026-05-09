import { contentJson, OpenAPIRoute } from "chanfana";
import { z } from "zod";
import { AppContext } from "../../types";
import { achievement } from "./base";

export class AchievementList extends OpenAPIRoute {
	schema = {
		tags: ["Achievements"],
		summary: "Get all achievements derived from experience items",
		responses: {
			"200": {
				description: "Returns all achievement experience items with company context, most recent first",
				...contentJson({
					success: z.boolean(),
					result: z.array(achievement),
				}),
			},
		},
	};

	async handle(c: AppContext) {
		const db = c.env.DB;

		const result = await db.prepare(`
			SELECT
				ei.id,
				ei.title,
				ei.content AS description,
				e.company,
				e.start_date,
				e.end_date
			FROM experience_items ei
			JOIN experience e ON e.id = ei.experience_id
			WHERE ei.type = 'achievement'
			  AND ei.title IS NOT NULL
			ORDER BY COALESCE(e.end_date, '9999-99') DESC, ei.display_order ASC
		`).all();

		return {
			success: true,
			result: result.results,
		};
	}
}
