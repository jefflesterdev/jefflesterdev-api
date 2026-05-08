import { contentJson, OpenAPIRoute } from "chanfana";
import { z } from "zod";
import { AppContext } from "../../types";
import { experience, RawExperience, RawExperienceItem } from "./base";

export class ExperienceRead extends OpenAPIRoute {
	schema = {
		tags: ["Experience"],
		summary: "Get a single experience role with its items",
		request: {
			params: z.object({
				id: z.coerce.number().int(),
			}),
		},
		responses: {
			"200": {
				description: "Returns the experience role with nested items",
				...contentJson({
					success: z.boolean(),
					result: experience,
				}),
			},
			"404": {
				description: "Experience not found",
				...contentJson({
					success: z.boolean(),
					errors: z.array(z.object({ message: z.string() })),
				}),
			},
		},
	};

	async handle(c: AppContext) {
		const data = await this.getValidatedData<typeof this.schema>();
		const { id } = data.params;
		const db = c.env.DB;

		const [expResult, itemsResult] = await db.batch([
			db.prepare("SELECT * FROM experience WHERE id = ?").bind(id),
			db.prepare("SELECT * FROM experience_items WHERE experience_id = ? ORDER BY display_order ASC").bind(id),
		]);

		const exp = expResult.results[0] as RawExperience | undefined;

		if (!exp) {
			return c.json(
				{ success: false, errors: [{ message: "Experience not found" }] },
				404
			);
		}

		const items = itemsResult.results as RawExperienceItem[];

		return {
			success: true,
			result: {
				...exp,
				items: items.map(item => ({ ...item, is_pinned: Boolean(item.is_pinned) })),
			},
		};
	}
}
