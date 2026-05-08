import { contentJson, OpenAPIRoute } from "chanfana";
import { z } from "zod";
import { AppContext } from "../../types";
import { profile } from "./base";

export class ProfileRead extends OpenAPIRoute {
	schema = {
		tags: ["Profile"],
		summary: "Get profile",
		responses: {
			"200": {
				description: "Returns the profile",
				...contentJson({
					success: z.boolean(),
					result: profile,
				}),
			},
			"404": {
				description: "Profile not found",
				...contentJson({
					success: z.boolean(),
					errors: z.array(z.object({ message: z.string() })),
				}),
			},
		},
	};

	async handle(c: AppContext) {
		const row = await c.env.DB.prepare(
			"SELECT * FROM profile WHERE id = 1"
		).first();

		if (!row) {
			return c.json(
				{ success: false, errors: [{ message: "Profile not found" }] },
				404
			);
		}

		return {
			success: true,
			result: { ...row, available: Boolean(row.available) },
		};
	}
}
